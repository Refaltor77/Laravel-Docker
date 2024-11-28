<?php

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;




# Public route
Route::get("/", [HomeController::class, "index"])->name("home");






require __DIR__.'/auth.php';
