<?php

namespace App\Helpers;

use Rats\Zkteco\Lib\ZKTeco;
use App\Models\Attendance;

class FingerHelper
{
    public function init($ip, $port = 4370): ZKTeco
    {
        return new ZKTeco($ip, $port);
    }

    public function getStatus(ZKTeco $zk): bool
    {
        return $zk->connect();
    }

    public function getStatusFormatted(ZKTeco $zk): string
    {
        return $zk->connect() ? "Active" : "Deactivate";
    }

    public function getSerial(ZKTeco $zk)
    {
        if ($zk->connect()) {
            return substr(strstr($zk->serialNumber(), '='), 1);
        }
        return false;
    }

    public function getAttendance(ZKTeco $zk)
    {
        if ($zk->connect()) {
            return $zk->getAttendance();
        }
        return [];
    }

    public function syncAttendance(ZKTeco $zk)
    {
        if (!$zk->connect()) {
            return false;
        }

        $attendances = $zk->getAttendance();

        foreach ($attendances as $att) {
            Attendance::updateOrCreate(
                ['user_id' => $att['uid'], 'timestamp' => $att['timestamp']],
                ['status' => $att['status']]
            );
        }

        return true;
    }


    public function playVoice(ZKTeco $zk, int $voiceCode = 1): bool
    {
        if ($zk->connect()) {
            return $zk->playVoice($voiceCode);
        }
        return false;
    }
}
