From: =?iso-8859-15?Q?Ga=EBl_Qu=E9ri?= <gqueri@mail.dotcom.fr>
Date: Tue, 28 Mar 2000 01:51:16 +0000
Subject: Re: [Patch] sb_card.c, take 2
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mYCpIKhGyMATD0i+"
Message-Id: <marc-linux-sound-95421007518100@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95420636815936@msgid-missing>
In-Reply-To: <marc-linux-sound-95420636815936@msgid-missing>
To: linux-sound@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii

On Mon, Mar 27, 2000 at 04:11:17PM -0800, Paul Laufer wrote:
> Hello again,
> (...)
> 
> Please send me your feedback. And I don't have any CMI, Diamond, or ALS
> cards to test this with either. So if you have one please test :)

OK so it works with my ALS007 with the diff I include below,
except that the 16 bit dma is set to 0 (there is no such dma on ALS007)
But for now it's harmless...

Also there will be a problem with mpu401 because at least the ALS007
has a separate irq for that.

Anyway thanks for that cleanup...

regards, gael

--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="als.diff"

===================================================================
RCS file: RCS/sb_card.c,v
retrieving revision 1.3
diff -up -r1.3 sb_card.c
--- sb_card.c	2000/03/28 01:28:39	1.3
+++ sb_card.c	2000/03/28 01:32:07
@@ -338,10 +338,22 @@ sb_isapnp_list[] __initdata = {
 		ISAPNP_VENDOR('R','W','B'), ISAPNP_DEVICE(0x1688), 
 		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
 		ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001)},
-	{"ALS 100",
+	{"ALS100",
 	       	ISAPNP_VENDOR('A','L','S'), ISAPNP_DEVICE(0x0001), 
 		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
 		ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001)},
+	{"ALS007",
+		ISAPNP_VENDOR('A','L','S'), ISAPNP_DEVICE(0x0007),
+		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0001),
+		ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0001)},
+	{"ALS110",
+		ISAPNP_VENDOR('A','L','S'), ISAPNP_DEVICE(0x0110),
+		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x1001),
+		ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x1001)},
+	{"ALS200",
+		ISAPNP_VENDOR('A','L','S'), ISAPNP_DEVICE(0x0200),
+		ISAPNP_VENDOR('@','@','@'), ISAPNP_FUNCTION(0x0020),
+		ISAPNP_VENDOR('@','X','@'), ISAPNP_FUNCTION(0x0020)},
 	{0}
 };
 

--mYCpIKhGyMATD0i+--
