From: Gerald Teschl <gerald.teschl@univie.ac.at>
Date: Wed, 05 Jun 2002 15:34:33 +0000
Subject: ad1848 driver and opl3sa2 cards
Message-Id: <marc-linux-sound-102329130416241@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

Why does the ad1848 driver try to use the opl3s2 sound card. Is the card 
supposed to
work with this driver as well? Here it does not work since it fails to 
find the card
(isapnp_find_card returns null). Where this is no big deal (one working 
driver is
sufficien;-),  it still causes problems since automatic configuration 
tools like sndconfig
from RedHat will fail, since they use the ad1848 which is the first one 
listed in
modules.isapnpmap:

[gerald@keen gerald]$ cat /lib/modules/2.4.18-4/modules.isapnpmap |grep 
0xa865
ad1848               0xffff     0xffff     0x00000000  0xa865     0x2100
opl3sa2              0xffff     0xffff     0x00000000  0xa865     0x2100

Any ideas? Should the device be removed from ad1848.c?

Gerald

