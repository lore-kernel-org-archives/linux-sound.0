From: Anders Eriksson <aeriksson@fastmail.fm>
Date: Fri, 02 Sep 2011 11:41:42 +0000
Subject: Aureal issues on resume
Message-Id: <20110902114143.821893BC17F@tippex.mynet.homeunix.org>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org



Hi, upon resuming from hibernation, I see this in my log:

Sep  2 11:15:20 tippex kernel: [72436.287020] vortex_adb_addroutes: unending route! 0x10
Sep  2 11:15:20 tippex kernel: [72436.287127] vortex_adb_addroutes: unending route! 0x838
Sep  2 11:15:20 tippex kernel: [72436.287277] vortex_adb_addroutes: unending route! 0x11
Sep  2 11:15:20 tippex kernel: [72436.287418] vortex_adb_addroutes: unending route! 0x8b9
Sep  2 11:15:20 tippex kernel: [72436.292037] Vortex: vortex_fifo_setadbctrl fail
Sep  2 11:15:55 tippex kernel: [72471.403490] vortex_adb_delroutes: route not found! 0x10
Sep  2 11:15:55 tippex kernel: [72471.403596] vortex_adb_delroutes: route not found! 0x838
Sep  2 11:15:55 tippex kernel: [72471.403710] vortex_adb_delroutes: route not found! 0x11
Sep  2 11:15:55 tippex kernel: [72471.403811] vortex_adb_delroutes: route not found! 0x8b9

And the sound is no more. I need to reboot to get it back.

If memory serves, it's been there since 2.6.30 or so. Any ideas what can be 
triggering it?

lspci says it's an 
00:04.0 Multimedia audio controller: Aureal Semiconductor Vortex 1 (rev 02)
        Subsystem: Diamond Multimedia Systems Sonic Impact A3D
        Flags: bus master, medium devsel, latency 64, IRQ 11
        Memory at 50000000 (32-bit, non-prefetchable) [size8K]
        I/O ports at 10b0 [size=8]
        I/O ports at 10b8 [size=8]
        Capabilities: [dc] Power Management version 1
        Kernel driver in use: snd_au8820
        Kernel modules: snd-au8820



-Anders

