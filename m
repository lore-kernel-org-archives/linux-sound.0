From: "James H. Cloos Jr." <cloos@jhcloos.com>
Date: Thu, 08 Jul 1999 06:14:32 +0000
Subject: Microsoft RIFF, WAVE audio data, 1 bit, mono 8000 Hz
Message-Id: <marc-linux-sound-93141454613681@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I have a (free) voice mail service that provides the messages in a wav
file which file(1) specifies as:

        Microsoft RIFF, WAVE audio data, 1 bit, mono 8000 Hz

sox(1) doesn't recognise this file.  (I currently have
sox-12.15-5.i386.rpm installed, compiled on my box from the RH60 SRPM.)

Based on sox(1)'s wav.c, the fmt chunk size is 0x32, wFormatTag is
0x0022, wChannels is 1, samples per second is 8000, AvgBytesPerSec is
1067, wBlockAlign is 32, wBitsPerSample is 1 leaving 34 more octets of
header info.  They are (as chars):

        0x20,0x00,0x01,0x00,
        0xf0,0x00,0x00,0x00,
        0x00,0x00,0x00,0x00,
        0x00,0x00,0x00,0x00,
        0x00,0x00,0x00,0x00,
        0x00,0x00,0x20,0x00,
        0x00,0x00,0x00,0x00,
        0x00,0x00,0x00,0x00,
        0x00,0x00

So, does anyone have any tips on listening to this?

(And, yes, I have sent a note to the vendor about this; this note is
going out at the same time.)

- -JimC
- -- 
James H. Cloos, Jr.  <http://www.jhcloos.com/cloos/public_key> 1024D/ED7DAEA6 
<cloos@jhcloos.com>     E9E9 F828 61A4 6EA9 0F2B  63E7 997A 9F17 ED7D AEA6
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v0.9.7 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE3hEHCmXqfF+19rqYRAjzzAKC1L0DwupHBnr4M+12ihhc12eQ/CwCgwJ/l
zxE0KxVUn/CveWNOI8S/bXU=oKqX
-----END PGP SIGNATURE-----
