From: "Nguyen, Daniel" <daniel.nguyen.1@ens.etsmtl.ca>
Date: Mon, 19 Jul 2021 14:02:30 +0000
Subject: Advice for creating a MIDI device out of HID reports
Message-Id: <YQBPR0101MB13315503F59B421AD7854908A3E19@YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Good day,
I have a Mad Catz Fender Mustang Pro-Guitar for Nintendo Wii that was sold for the Rock Band 3 game. The guitar controller comes with a wireless USB dongle that is recognized as HID class when connected to a PC. The controller also comes with a MIDI port that requires a MIDI interface to connect to.

Since the controller comes with a way of communicating wirelessly and that have the HID reports figured out, I would like some advice about how to go about the implemention of a MIDI device. 

Would it make sense to create a MIDI driver which would convert the HID reports to MIDI outputs? 
Should this be done in the userspace or in the kernel space?

I have looked for examples in the kernel source but failed.

I appreciate the input. Thanks in advance!

Daniel Nguyen
