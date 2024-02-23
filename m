Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03D012839B
	for <linux-sound@vger.kernel.org>; Fri, 23 Feb 2024 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.241.18.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708706543; cv=none; b=TfYeR1sFYt4ri1FsyYN/RMnjZjUsMhmsPiqH5Ldwb3RmYRhFcgtTRaCdIhc3hr09WeLJ3okj7md4yhSNZEGriIkJ5OVqGvKGiXVb1gDulwlb6fqbhSKLiOdQXSsRRuRNXocNNzg9L+OJEyGk78QLn4zhRcvq+pvFspntU2MRJLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708706543; c=relaxed/simple;
	bh=hpx+0xkdNJ+QyIWWbZyIDpvRcNEED+/AANsFP6fJDfU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=al5eYIFbzm0LqDefKBpjQKpH0HiF5LY7LHRXbBmCyC2XmCAl6c+iIlPCkrvnqc8aJ4unOtknb7Oj5uXTkLE8pyOihcjLRKLczpRVxuV+HTKRaJZejsedogZbWmPlgJOn1tzky2d7r7qziA+Gqroyou8V6hEvKP4u2/rrUuhIBf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com; spf=pass smtp.mailfrom=de.adit-jv.com; arc=none smtp.client-ip=93.241.18.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.adit-jv.com
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 6DD34520480;
	Fri, 23 Feb 2024 17:35:49 +0100 (CET)
Received: from localhost.localdomain (10.72.94.1) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 23 Feb
 2024 17:35:49 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, <linux-sound@vger.kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Vincenzo De Michele
	<vincenzo.michele@davinci.de>
CC: Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca
	<eugeniu.rosca@bosch.com>, Andreas Pape <Andreas.Pape4@bosch.com>, Yeswanth
 Rayapati <yeswanth.rayapati@in.bosch.com>
Subject: [PATCH] ASoC: rcar: adg: correct TIMSEL setting for SSI9
Date: Fri, 23 Feb 2024 17:35:02 +0100
Message-ID: <20240223163502.11619-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

From: Andreas Pape <Andreas.Pape4@bosch.com>

Timing select register for SRC and CMD is by default
referring to the corresponding SSI word select.
The calculation rule from HW spec skips SSI8, which has
no clock connection.

0110: ssi_ws0
0111: ssi_ws1
1000: ssi_ws2
1001: ssi_ws3
1010: ssi_ws4
1011: ssi_ws5
1100: ssi_ws6
1101: ssi_ws7
<GAP>
1110: ssi_ws9
1111: Setting prohibited

The driver does not currently reflect that GAP, leading to
prohibited timsel value 1111 (0xf) for SSI9:

[21.695055] rcar_sound ec500000.sound: b adg[0]-CMDOUT_TIMSEL (32):00000f00/00000f1f

Correct the timsel assignment.

Fixes: 629509c5bc478c ("ASoC: rsnd: add Gen2 SRC and DMAEngine support")
Signed-off-by: Andreas Pape <Andreas.Pape4@bosch.com>
Signed-off-by: Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
[erosca: minor improvements in commit description]
Signed-off-by: Eugeniu Rosca <eugeniu.rosca@bosch.com>
---
 sound/soc/sh/rcar/adg.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 230c48648af359..137db9feab495e 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -95,25 +95,40 @@ static u32 rsnd_adg_ssi_ws_timing_gen2(struct rsnd_dai_stream *io)
 {
 	struct rsnd_mod *ssi_mod = rsnd_io_to_mod_ssi(io);
 	int id = rsnd_mod_id(ssi_mod);
-	int ws = id;
+
+	u8 ssi_ws[] = {
+		0x6, /* ssi0 */
+		0x7, /* ssi1 */
+		0x8, /* ssi2 */
+		0x9, /* ssi3 */
+		0xa, /* ssi4 */
+		0xb, /* ssi5 */
+		0xc, /* ssi6 */
+		0xd, /* ssi7 */
+		0xf, /* INVALID */
+		0xe, /* ssi9 */
+	};
 
 	if (rsnd_ssi_is_pin_sharing(io)) {
 		switch (id) {
 		case 1:
 		case 2:
 		case 9:
-			ws = 0;
+			id = 0;
 			break;
 		case 4:
-			ws = 3;
+			id = 3;
 			break;
 		case 8:
-			ws = 7;
+			id = 7;
 			break;
 		}
 	}
 
-	return (0x6 + ws) << 8;
+	if (id > 9)
+		return 0xf << 8;
+	else
+		return ssi_ws[id] << 8;
 }
 
 static void __rsnd_adg_get_timesel_ratio(struct rsnd_priv *priv,
-- 
2.43.2

