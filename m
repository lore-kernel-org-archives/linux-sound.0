Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DFA4596C
	for <linux-sound@vger.kernel.org>; Fri,  1 Mar 2024 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.241.18.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709283028; cv=none; b=Jx9+1hvvAch34baiIFooxdCYPMr1I8K5adqkrkJQZExrILgscaWT+Zn7x993Gps1/GSdcFYUUFxwNSerg76YLqk9i/w11UuHljcYpZ8uU/PM2lSxRLlLCq9AUUlIFbb0cpluhaO1K1dxq+sZADXHW7gyrSxn3PHJaJmND6lmYz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709283028; c=relaxed/simple;
	bh=OKTCXq1zCOn6lbKruQruGekcM681ziIcMxMATj2D0Vo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I8jeJChRK4WisTQ/t8KckEguCzHYOapjg/Vp8VkoVtqwWyiRH+IEaYEoIimLCpbknDh4M6bUzFKKef18MqhlPzNwskP2KMOZsjEM6A3xYZRybzPaJ7hGZHf8Scr2FhZv0AAgqaTUtPjewW4R7RFoDA5yO4RaoVLTp6BibF2UC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com; spf=pass smtp.mailfrom=de.adit-jv.com; arc=none smtp.client-ip=93.241.18.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=de.adit-jv.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.adit-jv.com
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id DC62E52010B;
	Fri,  1 Mar 2024 09:50:15 +0100 (CET)
Received: from localhost.localdomain (10.72.94.2) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 1 Mar
 2024 09:50:15 +0100
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, <linux-sound@vger.kernel.org>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Charles Keepax
	<ckeepax@opensource.cirrus.com>, Vincenzo De Michele
	<vincenzo.michele@davinci.de>
CC: Dean Jenkins <dean.jenkins@siemens.com>, Eugeniu Rosca
	<erosca@de.adit-jv.com>, Eugeniu Rosca <eugeniu.rosca@bosch.com>, Andreas
 Pape <Andreas.Pape4@bosch.com>, Yeswanth Rayapati
	<yeswanth.rayapati@in.bosch.com>
Subject: [PATCH v2] ASoC: rcar: adg: correct TIMSEL setting for SSI9
Date: Fri, 1 Mar 2024 09:50:03 +0100
Message-ID: <20240301085003.3057-1-erosca@de.adit-jv.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

From: Andreas Pape <Andreas.Pape4@bosch.com>

Timing select registers for SRC and CMD are by default
referring to the corresponding SSI word select.
The calculation rule from HW spec skips SSI8, which has
no clock connection.

From section 43.2.18 CMD Output Timing Select Register (CMDOUT_TIMSEL),
of R-Car Series, 3rd Generation Hardware User’s Manual Rev.2.20:

CMD0_OUT_DIVCLK_	Output Timing
SEL [4:0]		Signal Select
B'0 0110: 		ssi_ws0
B'0 0111: 		ssi_ws1
B'0 1000: 		ssi_ws2
B'0 1001: 		ssi_ws3
B'0 1010: 		ssi_ws4
B'0 1011: 		ssi_ws5
B'0 1100: 		ssi_ws6
B'0 1101: 		ssi_ws7
	<GAP>
B'0 1110: 		ssi_ws9
B'0 1111: 		Setting prohibited

Fix the erroneous prohibited setting of timsel value 1111 (0xf) for SSI9
by using timsel value 1110 (0xe) instead. This is possible because SSI8
is not connected as shown by <GAP> in the table above.

[21.695055] rcar_sound ec500000.sound: b adg[0]-CMDOUT_TIMSEL (32):00000f00/00000f1f

Correct the timsel assignment.

Fixes: 629509c5bc478c ("ASoC: rsnd: add Gen2 SRC and DMAEngine support")
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Andreas Pape <Andreas.Pape4@bosch.com>
Signed-off-by: Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
Tested-by: Yeswanth Rayapati <yeswanth.rayapati@in.bosch.com>
[erosca: massage commit description]
Signed-off-by: Eugeniu Rosca <eugeniu.rosca@bosch.com>
---

Changes v1->v2:
 - Link v1: https://lore.kernel.org/linux-sound/20240223163502.11619-1-erosca@de.adit-jv.com/
 - Employed the proposal from Morimoto-san
 - Kept in mind below mapping/calculation rule:

	W/o pinsharing
	SSI0 -> base+0
	SSI1 -> base+1
	SSI2 -> base+2
	SSI3 -> base+3
	SSI4 -> base+4
	SSI5 -> base+5
	SSI6 -> base+6
	SSI7 -> base+7
	SSI8 ->
	SSI9 -> base+8 =
	--> "SSI8 not connected, so SSI9 uses '8' "

	W/ pinsharing (0,1,2,9 can be combined, 3,4 can be combined, 7,8 can be combined)
	SSI0 -> base+0
	SSI1 -> base+0
	SSI2 -> base+0
	SSI3 -> base+3
	SSI4 -> base+3
	SSI5 -> base+5
	SSI6 -> base+6
	SSI7 -> base+7
	SSI8 -> base+7
	SSI9 -> base+0

 sound/soc/sh/rcar/adg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index 230c48648af359..afd69c6eb6544c 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -111,6 +111,13 @@ static u32 rsnd_adg_ssi_ws_timing_gen2(struct rsnd_dai_stream *io)
 			ws = 7;
 			break;
 		}
+	} else {
+		/*
+		 * SSI8 is not connected to ADG.
+		 * Thus SSI9 is using ws = 8
+		 */
+		if (id == 9)
+			ws = 8;
 	}
 
 	return (0x6 + ws) << 8;
-- 
2.43.2

