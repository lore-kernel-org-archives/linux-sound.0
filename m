From: Zwane Mwaikambo <zwane@holomorphy.com>
Date: Wed, 27 Nov 2002 00:55:57 +0000
Subject: Re: AZT1008 on HP Vectra VL6
Message-Id: <marc-linux-sound-103835842003582@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103825052826476@msgid-missing>
In-Reply-To: <marc-linux-sound-103825052826476@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Could you please try this? Looking at your ioports it certainly does look
like an WSS compatible card. The patch is against 2.4.20-rc1-ac4 but if
you have trouble applying tell me which kernel you'd like it against.

Cheers,
	Zwane

Index: linux-2.4.20-rc1-ac4/drivers/sound/ad1848.c
=================================RCS file: /build/cvsroot/linux-2.4.20-rc1-ac4/drivers/sound/ad1848.c,v
retrieving revision 1.1.1.1
diff -u -r1.1.1.1 ad1848.c
--- linux-2.4.20-rc1-ac4/drivers/sound/ad1848.c	18 Nov 2002 01:39:21 -0000	1.1.1.1
+++ linux-2.4.20-rc1-ac4/drivers/sound/ad1848.c	27 Nov 2002 00:51:51 -0000
@@ -2969,6 +2969,10 @@
         	ISAPNP_ANY_ID, ISAPNP_ANY_ID,
 		ISAPNP_VENDOR('Y','M','H'), ISAPNP_FUNCTION(0x0021),
                 1, 0, 0, 1, 1},
+	{"AZT1008",
+		ISAPNP_ANY_ID, ISAPNP_ANY_ID,
+		ISAPNP_VENDOR('A','Z','T'), ISAPNP_FUNCTION(0x0001),
+		1, 0, 0, 1, 1},
 	{0}
 };

@@ -2981,6 +2985,8 @@
 		ISAPNP_VENDOR('C','S','C'), ISAPNP_FUNCTION(0x0100), 0 },
         {       ISAPNP_ANY_ID, ISAPNP_ANY_ID,
 		ISAPNP_VENDOR('Y','M','H'), ISAPNP_FUNCTION(0x0021), 0 },
+	{	ISAPNP_ANY_ID, ISAPNP_ANY_ID,
+		ISAPNP_VENDOR('A','Z','T'), ISAPNP_FUNCTION(0x0001), 0 },
 	{0}
 };


-- 
function.linuxpower.ca
