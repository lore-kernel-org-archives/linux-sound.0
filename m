Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3DF1AA1EA
	for <linux-sound@vger.kernel.org>; Fri,  8 Nov 2024 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731110122; cv=none; b=ephtVYyqvnnW/a2dX7kJ0qyzY0Iny9soGF4JA+VyvmEt7lteictQohCPjp3TM77N94OPU/vY1UcanzxFSQ81rqP3po+uzN+QoTCdrllYHUxfowg3sbn0FzpmQfZyN6bXPbz6pwMgByL53GSCOIPK2j6LEseY5Iy6FWmQ8k4aYps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731110122; c=relaxed/simple;
	bh=KtLw1EvqYoTZpAota989twBwZEBiJRI+A42y7wfC23s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WsSvMiHzw+PI9wwDt0W/YkA1wiNrDLrW/cQJDfUe9dtaunZTHvvKqTBflEJe/y/9sHJm6mATO56CUt4fijhFCMeJXh3/4WXSDqXVUfdspAFYweX6d1om2d2VP1DGhSj4I04zdfSUMxrKFNIgtzBhRgoN4NzmU3fx2xkLGGrOMAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dYnFP6nd; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dYnFP6nd"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0EC41892E5;
	Sat,  9 Nov 2024 00:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731110112;
	bh=HbLxD88tYQFtSpsHU3OuUWKZfsvlqVEbLxxQ3zMEfu8=;
	h=From:To:Cc:Subject:Date:From;
	b=dYnFP6ndaTAHCDTB0Ns7ZtpJyylImjPQ48OMpnu1Ww716LRN5OMVNH/Bp7KPZ1cbd
	 ZdbPCUpWsYbpxSWi6MBagTqnkpNJcxwkm1Kd2CxvdpgT8B1ZZA9iCgJK9DyRAMPSe6
	 OtrR0Sx0b9oP5rSBbLOXY0sxwAl6uGvDx6tl8VOFyhscxUV9EOrzgKcDVQEYl0inAJ
	 bSLh66/dtw/mOyZ86xaxnEJfr/XnzjXzLKFmDE01B6m/p+wQJR5xCKvjNLi63IEc+X
	 J0qjMI6IV/WuWG4Amn0m9KoGSwF5BQVQATvS72CDZ13S79EP37eRJwnDjbsJZiISg4
	 212PKvcM25f0w==
From: Marek Vasut <marex@denx.de>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Chen Ni <nichen@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: max98088: Remove duplicate DACs
Date: Sat,  9 Nov 2024 00:53:47 +0100
Message-ID: <20241108235453.196289-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

This codec only has one set of left and right DACs, remove the duplicate
DACs with duplicated bits controlling them as the userspace can set those
controls to mismatched value. This most likely does break userspace ABI,
but there seem to be no in-kernel users.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Chen Ni <nichen@iscas.ac.cn>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org
---
 sound/soc/codecs/max98088.c | 80 ++++++++++++-------------------------
 1 file changed, 26 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 8b0645c634620..adb17a458ca3e 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -515,10 +515,8 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
 
 /* Left speaker mixer switch */
 static const struct snd_kcontrol_new max98088_left_speaker_mixer_controls[] = {
-       SOC_DAPM_SINGLE("Left DAC1 Switch", M98088_REG_2B_MIX_SPK_LEFT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC1 Switch", M98088_REG_2B_MIX_SPK_LEFT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Left DAC2 Switch", M98088_REG_2B_MIX_SPK_LEFT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC2 Switch", M98088_REG_2B_MIX_SPK_LEFT, 7, 1, 0),
+       SOC_DAPM_SINGLE("Left DAC Switch", M98088_REG_2B_MIX_SPK_LEFT, 0, 1, 0),
+       SOC_DAPM_SINGLE("Right DAC Switch", M98088_REG_2B_MIX_SPK_LEFT, 7, 1, 0),
        SOC_DAPM_SINGLE("MIC1 Switch", M98088_REG_2B_MIX_SPK_LEFT, 5, 1, 0),
        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_2B_MIX_SPK_LEFT, 6, 1, 0),
        SOC_DAPM_SINGLE("INA1 Switch", M98088_REG_2B_MIX_SPK_LEFT, 1, 1, 0),
@@ -529,10 +527,8 @@ static const struct snd_kcontrol_new max98088_left_speaker_mixer_controls[] = {
 
 /* Right speaker mixer switch */
 static const struct snd_kcontrol_new max98088_right_speaker_mixer_controls[] = {
-       SOC_DAPM_SINGLE("Left DAC1 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC1 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Left DAC2 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC2 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 0, 1, 0),
+       SOC_DAPM_SINGLE("Left DAC Switch", M98088_REG_2C_MIX_SPK_RIGHT, 7, 1, 0),
+       SOC_DAPM_SINGLE("Right DAC Switch", M98088_REG_2C_MIX_SPK_RIGHT, 0, 1, 0),
        SOC_DAPM_SINGLE("MIC1 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 5, 1, 0),
        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 6, 1, 0),
        SOC_DAPM_SINGLE("INA1 Switch", M98088_REG_2C_MIX_SPK_RIGHT, 1, 1, 0),
@@ -543,10 +539,8 @@ static const struct snd_kcontrol_new max98088_right_speaker_mixer_controls[] = {
 
 /* Left headphone mixer switch */
 static const struct snd_kcontrol_new max98088_left_hp_mixer_controls[] = {
-       SOC_DAPM_SINGLE("Left DAC1 Switch", M98088_REG_25_MIX_HP_LEFT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC1 Switch", M98088_REG_25_MIX_HP_LEFT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Left DAC2 Switch", M98088_REG_25_MIX_HP_LEFT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC2 Switch", M98088_REG_25_MIX_HP_LEFT, 7, 1, 0),
+       SOC_DAPM_SINGLE("Left DAC Switch", M98088_REG_25_MIX_HP_LEFT, 0, 1, 0),
+       SOC_DAPM_SINGLE("Right DAC Switch", M98088_REG_25_MIX_HP_LEFT, 7, 1, 0),
        SOC_DAPM_SINGLE("MIC1 Switch", M98088_REG_25_MIX_HP_LEFT, 5, 1, 0),
        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_25_MIX_HP_LEFT, 6, 1, 0),
        SOC_DAPM_SINGLE("INA1 Switch", M98088_REG_25_MIX_HP_LEFT, 1, 1, 0),
@@ -557,10 +551,8 @@ static const struct snd_kcontrol_new max98088_left_hp_mixer_controls[] = {
 
 /* Right headphone mixer switch */
 static const struct snd_kcontrol_new max98088_right_hp_mixer_controls[] = {
-       SOC_DAPM_SINGLE("Left DAC1 Switch", M98088_REG_26_MIX_HP_RIGHT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC1 Switch", M98088_REG_26_MIX_HP_RIGHT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Left DAC2 Switch", M98088_REG_26_MIX_HP_RIGHT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC2 Switch", M98088_REG_26_MIX_HP_RIGHT, 0, 1, 0),
+       SOC_DAPM_SINGLE("Left DAC Switch", M98088_REG_26_MIX_HP_RIGHT, 7, 1, 0),
+       SOC_DAPM_SINGLE("Right DAC Switch", M98088_REG_26_MIX_HP_RIGHT, 0, 1, 0),
        SOC_DAPM_SINGLE("MIC1 Switch", M98088_REG_26_MIX_HP_RIGHT, 5, 1, 0),
        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_26_MIX_HP_RIGHT, 6, 1, 0),
        SOC_DAPM_SINGLE("INA1 Switch", M98088_REG_26_MIX_HP_RIGHT, 1, 1, 0),
@@ -571,10 +563,8 @@ static const struct snd_kcontrol_new max98088_right_hp_mixer_controls[] = {
 
 /* Left earpiece/receiver mixer switch */
 static const struct snd_kcontrol_new max98088_left_rec_mixer_controls[] = {
-       SOC_DAPM_SINGLE("Left DAC1 Switch", M98088_REG_28_MIX_REC_LEFT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC1 Switch", M98088_REG_28_MIX_REC_LEFT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Left DAC2 Switch", M98088_REG_28_MIX_REC_LEFT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC2 Switch", M98088_REG_28_MIX_REC_LEFT, 7, 1, 0),
+       SOC_DAPM_SINGLE("Left DAC Switch", M98088_REG_28_MIX_REC_LEFT, 0, 1, 0),
+       SOC_DAPM_SINGLE("Right DAC Switch", M98088_REG_28_MIX_REC_LEFT, 7, 1, 0),
        SOC_DAPM_SINGLE("MIC1 Switch", M98088_REG_28_MIX_REC_LEFT, 5, 1, 0),
        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_28_MIX_REC_LEFT, 6, 1, 0),
        SOC_DAPM_SINGLE("INA1 Switch", M98088_REG_28_MIX_REC_LEFT, 1, 1, 0),
@@ -585,10 +575,8 @@ static const struct snd_kcontrol_new max98088_left_rec_mixer_controls[] = {
 
 /* Right earpiece/receiver mixer switch */
 static const struct snd_kcontrol_new max98088_right_rec_mixer_controls[] = {
-       SOC_DAPM_SINGLE("Left DAC1 Switch", M98088_REG_29_MIX_REC_RIGHT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC1 Switch", M98088_REG_29_MIX_REC_RIGHT, 0, 1, 0),
-       SOC_DAPM_SINGLE("Left DAC2 Switch", M98088_REG_29_MIX_REC_RIGHT, 7, 1, 0),
-       SOC_DAPM_SINGLE("Right DAC2 Switch", M98088_REG_29_MIX_REC_RIGHT, 0, 1, 0),
+       SOC_DAPM_SINGLE("Left DAC Switch", M98088_REG_29_MIX_REC_RIGHT, 7, 1, 0),
+       SOC_DAPM_SINGLE("Right DAC Switch", M98088_REG_29_MIX_REC_RIGHT, 0, 1, 0),
        SOC_DAPM_SINGLE("MIC1 Switch", M98088_REG_29_MIX_REC_RIGHT, 5, 1, 0),
        SOC_DAPM_SINGLE("MIC2 Switch", M98088_REG_29_MIX_REC_RIGHT, 6, 1, 0),
        SOC_DAPM_SINGLE("INA1 Switch", M98088_REG_29_MIX_REC_RIGHT, 1, 1, 0),
@@ -717,13 +705,9 @@ static const struct snd_soc_dapm_widget max98088_dapm_widgets[] = {
        SND_SOC_DAPM_ADC("ADCL", "HiFi Capture", M98088_REG_4C_PWR_EN_IN, 1, 0),
        SND_SOC_DAPM_ADC("ADCR", "HiFi Capture", M98088_REG_4C_PWR_EN_IN, 0, 0),
 
-       SND_SOC_DAPM_DAC("DACL1", "HiFi Playback",
+       SND_SOC_DAPM_DAC("DACL", "HiFi Playback",
                M98088_REG_4D_PWR_EN_OUT, 1, 0),
-       SND_SOC_DAPM_DAC("DACR1", "HiFi Playback",
-               M98088_REG_4D_PWR_EN_OUT, 0, 0),
-       SND_SOC_DAPM_DAC("DACL2", "Aux Playback",
-               M98088_REG_4D_PWR_EN_OUT, 1, 0),
-       SND_SOC_DAPM_DAC("DACR2", "Aux Playback",
+       SND_SOC_DAPM_DAC("DACR", "HiFi Playback",
                M98088_REG_4D_PWR_EN_OUT, 0, 0),
 
        SND_SOC_DAPM_PGA("HP Left Out", M98088_REG_4D_PWR_EN_OUT,
@@ -819,10 +803,8 @@ static const struct snd_soc_dapm_widget max98088_dapm_widgets[] = {
 
 static const struct snd_soc_dapm_route max98088_audio_map[] = {
        /* Left headphone output mixer */
-       {"Left HP Mixer", "Left DAC1 Switch", "DACL1"},
-       {"Left HP Mixer", "Left DAC2 Switch", "DACL2"},
-       {"Left HP Mixer", "Right DAC1 Switch", "DACR1"},
-       {"Left HP Mixer", "Right DAC2 Switch", "DACR2"},
+       {"Left HP Mixer", "Left DAC Switch", "DACL"},
+       {"Left HP Mixer", "Right DAC Switch", "DACR"},
        {"Left HP Mixer", "MIC1 Switch", "MIC1 Input"},
        {"Left HP Mixer", "MIC2 Switch", "MIC2 Input"},
        {"Left HP Mixer", "INA1 Switch", "INA1 Input"},
@@ -831,10 +813,8 @@ static const struct snd_soc_dapm_route max98088_audio_map[] = {
        {"Left HP Mixer", "INB2 Switch", "INB2 Input"},
 
        /* Right headphone output mixer */
-       {"Right HP Mixer", "Left DAC1 Switch", "DACL1"},
-       {"Right HP Mixer", "Left DAC2 Switch", "DACL2"  },
-       {"Right HP Mixer", "Right DAC1 Switch", "DACR1"},
-       {"Right HP Mixer", "Right DAC2 Switch", "DACR2"},
+       {"Right HP Mixer", "Left DAC Switch", "DACL"},
+       {"Right HP Mixer", "Right DAC Switch", "DACR"},
        {"Right HP Mixer", "MIC1 Switch", "MIC1 Input"},
        {"Right HP Mixer", "MIC2 Switch", "MIC2 Input"},
        {"Right HP Mixer", "INA1 Switch", "INA1 Input"},
@@ -843,10 +823,8 @@ static const struct snd_soc_dapm_route max98088_audio_map[] = {
        {"Right HP Mixer", "INB2 Switch", "INB2 Input"},
 
        /* Left speaker output mixer */
-       {"Left SPK Mixer", "Left DAC1 Switch", "DACL1"},
-       {"Left SPK Mixer", "Left DAC2 Switch", "DACL2"},
-       {"Left SPK Mixer", "Right DAC1 Switch", "DACR1"},
-       {"Left SPK Mixer", "Right DAC2 Switch", "DACR2"},
+       {"Left SPK Mixer", "Left DAC Switch", "DACL"},
+       {"Left SPK Mixer", "Right DAC Switch", "DACR"},
        {"Left SPK Mixer", "MIC1 Switch", "MIC1 Input"},
        {"Left SPK Mixer", "MIC2 Switch", "MIC2 Input"},
        {"Left SPK Mixer", "INA1 Switch", "INA1 Input"},
@@ -855,10 +833,8 @@ static const struct snd_soc_dapm_route max98088_audio_map[] = {
        {"Left SPK Mixer", "INB2 Switch", "INB2 Input"},
 
        /* Right speaker output mixer */
-       {"Right SPK Mixer", "Left DAC1 Switch", "DACL1"},
-       {"Right SPK Mixer", "Left DAC2 Switch", "DACL2"},
-       {"Right SPK Mixer", "Right DAC1 Switch", "DACR1"},
-       {"Right SPK Mixer", "Right DAC2 Switch", "DACR2"},
+       {"Right SPK Mixer", "Left DAC Switch", "DACL"},
+       {"Right SPK Mixer", "Right DAC Switch", "DACR"},
        {"Right SPK Mixer", "MIC1 Switch", "MIC1 Input"},
        {"Right SPK Mixer", "MIC2 Switch", "MIC2 Input"},
        {"Right SPK Mixer", "INA1 Switch", "INA1 Input"},
@@ -867,10 +843,8 @@ static const struct snd_soc_dapm_route max98088_audio_map[] = {
        {"Right SPK Mixer", "INB2 Switch", "INB2 Input"},
 
        /* Earpiece/Receiver output mixer */
-       {"Left REC Mixer", "Left DAC1 Switch", "DACL1"},
-       {"Left REC Mixer", "Left DAC2 Switch", "DACL2"},
-       {"Left REC Mixer", "Right DAC1 Switch", "DACR1"},
-       {"Left REC Mixer", "Right DAC2 Switch", "DACR2"},
+       {"Left REC Mixer", "Left DAC Switch", "DACL"},
+       {"Left REC Mixer", "Right DAC Switch", "DACR"},
        {"Left REC Mixer", "MIC1 Switch", "MIC1 Input"},
        {"Left REC Mixer", "MIC2 Switch", "MIC2 Input"},
        {"Left REC Mixer", "INA1 Switch", "INA1 Input"},
@@ -879,10 +853,8 @@ static const struct snd_soc_dapm_route max98088_audio_map[] = {
        {"Left REC Mixer", "INB2 Switch", "INB2 Input"},
 
        /* Earpiece/Receiver output mixer */
-       {"Right REC Mixer", "Left DAC1 Switch", "DACL1"},
-       {"Right REC Mixer", "Left DAC2 Switch", "DACL2"},
-       {"Right REC Mixer", "Right DAC1 Switch", "DACR1"},
-       {"Right REC Mixer", "Right DAC2 Switch", "DACR2"},
+       {"Right REC Mixer", "Left DAC Switch", "DACL"},
+       {"Right REC Mixer", "Right DAC Switch", "DACR"},
        {"Right REC Mixer", "MIC1 Switch", "MIC1 Input"},
        {"Right REC Mixer", "MIC2 Switch", "MIC2 Input"},
        {"Right REC Mixer", "INA1 Switch", "INA1 Input"},
-- 
2.45.2

