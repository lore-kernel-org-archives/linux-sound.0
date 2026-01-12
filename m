Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F4B275870
	for <linux-sound@vger.kernel.org>; Mon, 12 Jan 2026 03:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768187675; cv=none; b=pi4WgEx/V0s44Top0NFjZPNvFRQ1oqCDKR0kVc3wVUkSCyPexmGZIWqA1MvsOa38LacX9FVkrnt62mUDaio0sLvy30Y0nv9FGvxTrVcrvqYzT4Huw08YW6mm6pH5Zi45X5vb6xfJ2d3gCisMvVahsbJNbYh37zz3Q2IUArUdNtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768187675; c=relaxed/simple;
	bh=bvrVbBrRwr4AjHEn+Uz/s5aodJgxqTMNE1MpBBOwtgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QUti2vRYnSQRYNiI8AjlJQAWZivzSigxncCoSDDlf6P4aL9KKFqquKHXeAsATDQWnV8NWyuLTrwNFaUSOnGklUMagSbGZJTL8TiHT1l+lkmaakV02Orj0YSehM0DXVH630X3P39/E8FGaj8uZJwf4uzACOH/RRn2pM6VPrEm0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	broonie@kernel.org,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH 2/2] ASoC: cs42l43: Fix headphone output by properly disabling HP clamp
Date: Sun, 11 Jan 2026 20:13:43 -0700
Message-ID: <20260112031343.17196-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CS42L43 codec requires proper configuration of the headphone amplifier
clamp circuitry for audio output to work. Two issues were preventing
headphone audio:

1. The STEREO_MIC_CLAMP_CTRL register (0x100c4) requires both bit 0
   (SMIC_HPAMP_CLAMP_DIS_FRC) AND bit 1 (SMIC_HPAMP_CLAMP_DIS_FRC_VAL)
   to be set to properly disable the HP amp clamp. The driver was only
   setting bit 0, which enables force mode but leaves the clamp enabled.

2. When switching to headphone or line-out mode via the Jack Override
   control, the HS_CLAMP_DISABLE bit (bit 28) in the HS2 register must
   be set to disable the headset clamp circuitry.

Without these fixes, the headphone amplifier output is clamped to ground
and no audio is heard despite correct DAPM routing.

Tested on Lenovo ThinkPad P16 Gen 3 with CS42L43 codec.

Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 sound/soc/codecs/cs42l43-jack.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index b719d6263..7d6a93eec 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -698,7 +698,7 @@ void cs42l43_clear_jack(struct cs42l43_codec *priv)
 	regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CTRL,
 			   CS42L43_JACK_STEREO_CONFIG_MASK, 0);
 	regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CLAMP_CTRL,
-			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 			   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
 			   CS42L43_HSDET_MODE_MASK | CS42L43_HSDET_MANUAL_MODE_MASK,
@@ -814,7 +814,7 @@ static const struct cs42l43_jack_override_mode {
 			      CS42L43_HSBIAS_GNDREF_HS3_SEL_MASK |
 			      CS42L43_HSBIAS_OUT_HS4_SEL_MASK |
 			      CS42L43_HSGND_HS3_SEL_MASK,
-		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 		.report = CS42L43_JACK_HEADSET,
 	},
 	[CS42L43_JACK_RAW_OMTP] = {
@@ -823,17 +823,17 @@ static const struct cs42l43_jack_override_mode {
 			       CS42L43_HSBIAS_GNDREF_HS4_SEL_MASK |
 			       CS42L43_HSBIAS_OUT_HS3_SEL_MASK |
 			       CS42L43_HSGND_HS4_SEL_MASK,
-		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 		.report = CS42L43_JACK_HEADSET,
 	},
 	[CS42L43_JACK_RAW_HEADPHONE] = {
 		.hsdet_mode = CS42L43_JACK_3_POLE_SWITCHES,
-		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 		.report = CS42L43_JACK_HEADPHONE,
 	},
 	[CS42L43_JACK_RAW_LINE_OUT] = {
 		.hsdet_mode = CS42L43_JACK_3_POLE_SWITCHES,
-		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 		.report = CS42L43_JACK_LINEOUT,
 	},
 	[CS42L43_JACK_RAW_LINE_IN] = {
@@ -849,7 +849,7 @@ static const struct cs42l43_jack_override_mode {
 	},
 	[CS42L43_JACK_RAW_OPTICAL] = {
 		.hsdet_mode = CS42L43_JACK_3_POLE_SWITCHES,
-		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+		.clamp_ctrl = CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 		.report = CS42L43_JACK_OPTICAL,
 	},
 };
@@ -927,7 +927,7 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				   CS42L43_JACK_STEREO_CONFIG_MASK,
 				   cs42l43_jack_override_modes[override].mic_ctrl);
 		regmap_update_bits(cs42l43->regmap, CS42L43_STEREO_MIC_CLAMP_CTRL,
-				   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK,
+				   CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_MASK | CS42L43_SMIC_HPAMP_CLAMP_DIS_FRC_VAL_MASK,
 				   cs42l43_jack_override_modes[override].clamp_ctrl);
 
 		switch (override) {
@@ -947,6 +947,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 		case CS42L43_JACK_RAW_MICROPHONE:
 			cs42l43_start_hs_bias(priv, false);
 			break;
+		case CS42L43_JACK_RAW_HEADPHONE:
+		case CS42L43_JACK_RAW_LINE_OUT:
+			/* Disable HS clamp for headphone/line-out playback */
+			regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
+					   CS42L43_HS_CLAMP_DISABLE_MASK,
+					   CS42L43_HS_CLAMP_DISABLE_MASK);
+			break;
 		default:
 			break;
 		}
-- 
2.52.0

