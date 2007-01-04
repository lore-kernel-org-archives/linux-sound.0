From: "Jon Smirl" <jonsmirl@gmail.com>
Date: Thu, 04 Jan 2007 01:28:35 +0000
Subject: Fwd: snd/core, freeing the device driver when an USB audio device is unplugged
Message-Id: <9e4733910701031728g1ab9e65bxbe82d4f0b0a91493@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

---------- Forwarded message ----------
From: Jon Smirl <jonsmirl@gmail.com>
Date: Jan 2, 2007 9:53 PM
Subject: snd/core, freeing the device driver when an USB audio device
is unplugged
To: alsa-devel@alsa-project.org, lkml <linux-kernel@vger.kernel.org>


There is a basic problem in the way snd/core is handling the removal
of devices. If I unplug a USB audio device snd/core will end up in:
snd_card_free_when_closed. This isn't good because some desktop app
(don't know which one) keeps the sound device open until it exits.
This is not a good state to be in, the hardware is gone but the device
is still around.

Now if I plug the USB audio device back in, I get a sysfs error for
registering duplicate devices. Because snd_card_free_when_closed. is
waiting for the old device to be closed it is never freeing the sysfs
device. More looks to be messed up inside of snd/core when in this
state, but this is the obvious symptom.

Things do work properly if I restart gnome (killing whoever has the
card open) after I unplug the device and before I plug it back in
again.

I added a few printk to snd/core/init.c

-- I unplug my USB sound device
usb 2-1: USB disconnect, address 2
-- Inside sound core, I go into snd_card_free_when_closed
snd_card_free_when_closed

-- If I plug the snd device back in , the kernel will complain about a
device being registered twice. That because gnome (or something in the
desktop) is still holding the device open.

--- Now I restart gnome which closes whatever had the card open
snd_card_file_remove
snd_card_do_free
-- device finishes getting unregistered
unregistering device

using 2.6.20-rc3

[10519.330622] kobject_add failed for card0 with -EEXIST, don't try to
register things with the same name in the same directory.
[10519.330639]  [<c01e672f>] kobject_add+0x10f/0x190
[10519.330670]  [<c023d867>] device_add+0xb7/0x530
[10519.330702]  [<c01e63ff>] kobject_get+0xf/0x20
[10519.330711]  [<c01e680b>] kobject_init+0x2b/0x40
[10519.330729]  [<c023dd78>] device_create+0x88/0xc0
[10519.330749]  [<f8a30b87>] snd_card_register+0x2b7/0x320 [snd]
[10519.330782]  [<f8867c74>] usb_driver_claim_interface+0x84/0xb0 [usbcore]
[10519.330816]  [<f8ae40b0>] usb_audio_probe+0x4b0/0x860 [snd_usb_audio]
[10519.330844]  [<c012c9c7>] try_to_del_timer_sync+0x47/0x50
[10519.330897]  [<f8867b06>] usb_probe_interface+0x96/0xe0 [usbcore]
[10519.330930]  [<c023f9a4>] really_probe+0x54/0x140
[10519.330938]  [<c023fad9>] driver_probe_device+0x49/0xc0
[10519.330944]  [<c02e38a3>] klist_next+0x53/0xa0
[10519.330967]  [<c023edb4>] bus_for_each_drv+0x44/0x70
[10519.330991]  [<c023fbea>] device_attach+0x7a/0x80
[10519.330997]  [<c023fb50>] __device_attach+0x0/0x10
[10519.331009]  [<c023ecf6>] bus_attach_device+0x26/0x60
[10519.331020]  [<c023dc05>] device_add+0x455/0x530
[10519.331061]  [<f8865e71>] usb_set_configuration+0x3f1/0x4d0 [usbcore]
[10519.331124]  [<f886d8a7>] generic_probe+0x157/0x210 [usbcore]
[10519.331181]  [<f8867753>] usb_probe_device+0x33/0x40 [usbcore]
[10519.331201]  [<c023f9a4>] really_probe+0x54/0x140
[10519.331209]  [<c023fad9>] driver_probe_device+0x49/0xc0
[10519.331215]  [<c02e38a3>] klist_next+0x53/0xa0
[10519.331236]  [<c023edb4>] bus_for_each_drv+0x44/0x70
[10519.331259]  [<c023fbea>] device_attach+0x7a/0x80
[10519.331265]  [<c023fb50>] __device_attach+0x0/0x10
[10519.331276]  [<c023ecf6>] bus_attach_device+0x26/0x60
[10519.331288]  [<c023dc05>] device_add+0x455/0x530
[10519.331330]  [<f8861422>] __usb_new_device+0x92/0x120 [usbcore]
[10519.331371]  [<f88627db>] hub_thread+0x74b/0xc10 [usbcore]
[10519.331453]  [<c0136f50>] autoremove_wake_function+0x0/0x50
[10519.331483]  [<f8862090>] hub_thread+0x0/0xc10 [usbcore]
[10519.331502]  [<c0136d9a>] kthread+0xba/0xf0
[10519.331513]  [<c0136ce0>] kthread+0x0/0xf0
[10519.331527]  [<c0103ceb>] kernel_thread_helper+0x7/0x1c
[10519.331547]  ===========

--
Jon Smirl
jonsmirl@gmail.com
