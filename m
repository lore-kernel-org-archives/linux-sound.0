From: Dennis Wassenberg <dennis.wassenberg@secunet.com>
Date: Tue, 30 Aug 2016 10:02:56 +0000
Subject: Questions about thinkpad_helper
Message-Id: <7a5ce190-5881-588a-2deb-f248adffd26f@secunet.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

I wrote a driver which handles the function / special keys for
ThinKeyboard of Lenovo ThinkPad X1 Tablet 2016 including LED control.
This Keyboard is connected via USB to the Tablet. I added the driver to
hid-lenovo.c file because there are HID drivers included for different
Lenovo devices.

For example this driver is able to handle LED control for mute and mic
mute keys. Now I want to make the other direction working. If someone
sets mute or mic mute at amixer, I want to control the mute and mic mute
LEDs. At other Thinkpad devices this is done by thinkpad_helper.c. The
thinkpad_helper let the thinkpad_apci driver to control the LEDs.

Now I think about how to make this working for Lenovo Thinkpad X1 Tablet
2016. There it is not possible to use the thinkpad_acpi driver. Instead
we have to use the hid-lenovo driver to make this working.

Should I add this to thinkpad_helper because this is a thinkpad device
too or should I make a new helper? Can I use the same API than
thinkpad_acpi (static int (*led_set_func)(int, bool)) or should I make a
new one (e.g. in combination with LED triggers)?

For the first shot I made something at
https://github.com/dwassenberg/linux/tree/development/hid-rmi
(dc05de0add955775434d18d4fe096ea78d1e63bd..5a88c66f2ae8db04147bb75ecf84a4f52e0da1df)
this shot is based on using the thinkpad_helper and the same API. Please
tell me your opinion.

Maybe one additional remark. In case of using the USB connected
ThinKeyboard there is one additional effort to make this working at the
initial state if the Tablet is finished booting and after that the
ThinKeyboard is connected. So either there is an additional trigger
needed which tells the helper to publish the current mute and mic mute
state when the keyboard is connected. Or an other approach is to update
the hid-lenovo driver even when this keyboard is not connected such that
the hid-lenovo driver always knows the current state and is able to set
this if the keyboard is connected. Or is there there an other solution?

Thank you & best regards,

Dennis
