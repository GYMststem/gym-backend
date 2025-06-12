<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Http\Controllers\Api\Admin\AttendanceController;

class SyncAttendance extends Command
{
    protected $signature = 'attendance:sync';
    protected $description = 'Fetch attendance data from ZKTeco device';

    public function handle()
    {
        $controller = new AttendanceController();
        $controller->sync();
        $this->info('Attendance synced successfully.');
    }
}
