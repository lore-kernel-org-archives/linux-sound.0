From: Ivan Kalvatchev <iive@yahoo.com>
Date: Wed, 14 Mar 2001 17:26:38 +0000
Subject: Yamaha 719B 48kHz bug
Message-Id: <marc-linux-sound-98459149230967@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I am owner of a very old Yamaha719 ISA sound card. I
found a very annoing bug, when playing wave with 48kHz
(samples per second) the sample sounds as been playing
faster. I thought that this is software bug, but after

digging in linux sound drivers it seems to be
hardware.

in kernel 2.4.1
//ad1848.c
...
static int ad1848_set_speed(int dev, int arg)
{
...
	/*
	 * The sampling speed is encoded in the least
significant nibble of I8. The
	 * LSB selects the clock source (0$.576 MHz,
1.9344 MHz) and other
	 * three bits select the divisor (indirectly):
...
	 */
	typedef struct	{
		int             speed;
		unsigned char   bits;
	}speed_struct;

	static speed_struct speed_table[] 	{
		{5510, (0 << 1) | 1},
		{5510, (0 << 1) | 1},
		{6620, (7 << 1) | 1},
		{8000, (0 << 1) | 0},
		{9600, (7 << 1) | 0},
		{11025, (1 << 1) | 1},
		{16000, (1 << 1) | 0},
		{18900, (2 << 1) | 1},
		{22050, (3 << 1) | 1},
		{27420, (2 << 1) | 0},
		{32000, (3 << 1) | 0},
		{33075, (6 << 1) | 1},
		{37800, (4 << 1) | 1},
		{44100, (5 << 1) | 1},
		{48000, (6 << 1) | 0}
	};
...
// All modes that use Clock #0 are playing faster.
After look at sound card i sow only one 33Mhz
oscilator. I belive that clock #0 is 33Mhz and clock#1
is half of clock#0, so when trying to play at 48000,
and actualy get about 66150 (2*33075)
The chip is detected as MD_4231. With hope that the
chip is missdetected i forced it to be detected as
MD_1845, then as MD4231A and some other, but it didn't
work. 
So the chip seems to be detected correctly. If You
Could help me, give me some more specific
instructions, and manuals.
The "opl3sa2" detects card as "OPL3-SA3 (YMF715)", and
version=3; 
I am with kernel 2.4.1. I downloaded kernel 2.4.2 and
read opl3sa2 txt in Doc. I am affraid that Ymh719 is
WORSE than Ymh715. I still hope that there is fix for
this, some hidden option ....

P.S. in kernel 2.4.2 bass, treble and main volume are
gone...


__________________________________________________
Do You Yahoo!?
Yahoo! Auctions - Buy the things you want at great prices.
http://auctions.yahoo.com/
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
