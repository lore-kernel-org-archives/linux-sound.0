From: Yoav Weiss <Yoav@CoreKT.com>
Date: Wed, 11 Aug 1999 17:29:34 +0000
Subject: ALS not recognized ?
Message-Id: <marc-linux-sound-93440430501363@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi.

I recently installed an ISA PNP card called MF-1000A.  ("3D Melody" (?))
There is an ALS chip (Avance Logic) on this card and it is indeed
recognized by pnpprobe(8) as an "ALS0120" sound device.

The manufacturer claims to be "fully compatible with SB16".  When trying
to use as a regular SB, it worked but only as an 8bit card.  However,
patching sb_common.c to force it to recognize it as MDL_SBPRO (4) solved
the problem and the card seems to work now.

Looks like this card is supported as an SB but not recognized as such.

1. Anyone else had this problem and solved it in a more elegant way ?
2. If not, whats the proper way to recognize such cards in the code ?
3. If I add such recognition code, who do I send it to ?

Please answer directly or CC me on the answer, since I am not a member of
this list.

Thanks,
	Yoav

--

Yoav Weiss
Yoav@CoreKT.com

fingerprint = 164C C9FC 6185 5A63 9AC5  932C B5A0 009D 5E6B BC90
