From: "Soulier, Frederic" <Frederic.P.Soulier@British-Airways.com>
Date: Wed, 16 Jun 1999 11:39:48 +0000
Subject: AWE64 ISA - game port
Message-Id: <marc-linux-sound-92953529008788@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

A "pnpdump >/etc/isapnp.conf" reports:
   LD0   audio
   LD1   game
   LD2   wave table

Activating the lines for LD0 & LD2 and doing an
"isapnp /etc/isapnp.conf" works fine.

Activating the lines LD0, LD1 & LD2 and doing an
"isapnp /etc/isapnp.conf" does not work.
Is there anything wrong with activating the line for the game
port?

note: only io=0x200 is given for the game port.

I would like to give a try to the joystick code in Linux so any
help would be much appreciated and welcomed.

Ciao
Fred
