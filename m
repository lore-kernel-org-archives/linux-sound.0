Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0AC38CFE4
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208158; cv=none; b=s59MqpNVfPmSMFyJxYh/i6HuyaMK1w2W1cgcwbIVJ9o0rh69n7/9kXUYpP7KGzXOZfOytwJ+z/htL4FjZs3nm9YZf3Bp44yzBuELZfQpHZrLika74OVZg6ik1mwD8b/ZbJtz9kVxnUbBZHT8r1FKaxYLUwmjMFJq6fX5g1yBufA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208158; c=relaxed/simple;
	bh=IppSye7dGJPPLZHRa0Kt2RFf5M+zc1nm5XjkG9PaTk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NEwYJSZZsCgRqs5wojrjuJAqQIN0h/cRJkg3ut58Y2cPtKRM+Bj8b5+9mafekR3kCfgCq2LEGs8Tg6d6NWwa5RE6a+CYhPO8ubGgL9Nm1S/vjJSq9SZW1q9xrluypTJLTgh9qh88/xwyWiMG+po8mGYbdL48H8kS9rCKrnCGCbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6AwRWHb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6AwRWHb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111011F00A3E;
	Mon, 31 Aug 2026 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208156;
	bh=/WNaiC9Q0vr18o1FBidvOOON2rwYe/dhEhbGA5aKKGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=n6AwRWHbek2wlFZFJStiqcDKhkAPBt1xnr0yNo2YuHQcigwGsoHN6A9Q9W2pbTNsQ
	 1Pzu05xHufzsGdSd++aWGJt57TRbYea/d4PLnvKnsjBD6jgnDNGBIWvHfaM6/oRaDc
	 Gq4V1pw/zyVkM7pEo20z+Chid/MibtJ2Q5OjAQmfKgCcHysmRir7v+BU2aOvyLTKJJ
	 NMFKbSUxf7Vwpu1ciQfZFJJLrymEmaYSBGDG9ew9dEH4oAhr50vX172RC52rkgf4sL
	 FA5hKWT6UFLlW7lzLX8eKzw8NeLYKHrf4/6uW6HirtBeH5M23W2+mVYMiwVNXkCCYD
	 oWF9C5o01zwSQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 22:29:07 +0200
Subject: [PATCH 2/6] ASoC: ab8500: Repair the DAPM capture graph
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ab8500-codec-fixes-v1-2-f85024e717e3@kernel.org>
References: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
In-Reply-To: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

The capture stream routes point away from the stream widget. Digital
microphone mux routes are unconditional and bypass their enable bits,
and several widgets independently own shared AD path enable bits. The
dummy ADC and DAC widgets hide the resulting power graph errors.

Connect each real AIF widget to the stream and main supply, use the mux
item names on digital microphone routes, and model shared AD enables as
supplies. Also make the ANC DAPM switch writable.

Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 120 +++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 714ff0a16f44..5172154f4139 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -259,7 +259,7 @@ static const struct snd_kcontrol_new dapm_anc_in_select[] = {
 /* ANC - Enable/Disable */
 static const struct snd_kcontrol_new dapm_anc_enable[] = {
 	SOC_DAPM_SINGLE("Switch", AB8500_ANCCONF1,
-			AB8500_ANCCONF1_ENANC, 0, 0),
+			AB8500_ANCCONF1_ENANC, 1, 0),
 };
 
 /* ANC to Earpiece - Mute */
@@ -341,12 +341,6 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 
 	/* DA/AD */
 
-	SND_SOC_DAPM_INPUT("ADC Input"),
-	SND_SOC_DAPM_ADC("ADC", "ab8500_0c", SND_SOC_NOPM, 0, 0),
-
-	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_OUTPUT("DAC Output"),
-
 	SND_SOC_DAPM_AIF_IN("DA_IN1", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("DA_IN2", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("DA_IN3", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -538,9 +532,8 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("AD3 Channel Volume",
 			SND_SOC_NOPM, 0, 0,
 			NULL, 0),
-	SND_SOC_DAPM_MIXER("AD3 Enable",
-			AB8500_ADPATHENA, AB8500_ADPATHENA_ENAD34, 0,
-			NULL, 0),
+	SND_SOC_DAPM_SUPPLY("AD34 Enable", AB8500_ADPATHENA,
+			    AB8500_ADPATHENA_ENAD34, 0, NULL, 0),
 
 	/* Mic 2 */
 
@@ -599,9 +592,8 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 			SND_SOC_NOPM, 0, 0,
 			NULL, 0),
 
-	SND_SOC_DAPM_MIXER("AD12 Enable",
-			AB8500_ADPATHENA, AB8500_ADPATHENA_ENAD12, 0,
-			NULL, 0),
+	SND_SOC_DAPM_SUPPLY("AD12 Enable", AB8500_ADPATHENA,
+			    AB8500_ADPATHENA_ENAD12, 0, NULL, 0),
 
 	/* HD Capture path */
 
@@ -615,12 +607,8 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("AD6 Channel Volume",
 			SND_SOC_NOPM, 0, 0,
 			NULL, 0),
-	SND_SOC_DAPM_MIXER("AD57 Enable",
-			AB8500_ADPATHENA, AB8500_ADPATHENA_ENAD5768, 0,
-			NULL, 0),
-	SND_SOC_DAPM_MIXER("AD68 Enable",
-			AB8500_ADPATHENA, AB8500_ADPATHENA_ENAD5768, 0,
-			NULL, 0),
+	SND_SOC_DAPM_SUPPLY("AD5768 Enable", AB8500_ADPATHENA,
+			    AB8500_ADPATHENA_ENAD5768, 0, NULL, 0),
 
 	/* Digital Microphone path */
 
@@ -652,10 +640,6 @@ static const struct snd_soc_dapm_widget ab8500_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("AD4 Channel Volume",
 			SND_SOC_NOPM, 0, 0,
 			NULL, 0),
-	SND_SOC_DAPM_MIXER("AD4 Enable",
-			AB8500_ADPATHENA, AB8500_ADPATHENA_ENAD34,
-			0, NULL, 0),
-
 	/* Acoustical Noise Cancellation path */
 
 	SND_SOC_DAPM_INPUT("ANC Configure Input"),
@@ -703,24 +687,17 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"Main Supply", NULL, "Audio Power"},
 	{"Main Supply", NULL, "Audio Analog Power"},
 
-	{"DAC", NULL, "ab8500_0p"},
-	{"DAC", NULL, "Main Supply"},
-	{"ADC", NULL, "ab8500_0c"},
-	{"ADC", NULL, "Main Supply"},
-
 	/* ANC Configure */
 	{"ANC Configure Input", NULL, "Main Supply"},
 	{"ANC Configure Output", NULL, "ANC Configure Input"},
 
-	/* AD/DA */
-	{"ADC", NULL, "ADC Input"},
-	{"DAC Output", NULL, "DAC"},
-
 	/* Powerup charge pump if DA1/2 is in use */
 
 	{"DA_IN1", NULL, "ab8500_0p"},
+	{"DA_IN1", NULL, "Main Supply"},
 	{"DA_IN1", NULL, "Charge Pump"},
 	{"DA_IN2", NULL, "ab8500_0p"},
+	{"DA_IN2", NULL, "Main Supply"},
 	{"DA_IN2", NULL, "Charge Pump"},
 
 	/* Headset path */
@@ -755,8 +732,10 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	/* HF or LineOut path */
 
 	{"DA_IN3", NULL, "ab8500_0p"},
+	{"DA_IN3", NULL, "Main Supply"},
 	{"DA3 Channel Volume", NULL, "DA_IN3"},
 	{"DA_IN4", NULL, "ab8500_0p"},
+	{"DA_IN4", NULL, "Main Supply"},
 	{"DA4 Channel Volume", NULL, "DA_IN4"},
 
 	{"Speaker Left Source", "Audio Path", "DA3 Channel Volume"},
@@ -814,8 +793,10 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	/* Vibrator path */
 
 	{"DA_IN5", NULL, "ab8500_0p"},
+	{"DA_IN5", NULL, "Main Supply"},
 	{"DA5 Channel Volume", NULL, "DA_IN5"},
 	{"DA_IN6", NULL, "ab8500_0p"},
+	{"DA_IN6", NULL, "Main Supply"},
 	{"DA6 Channel Volume", NULL, "DA_IN6"},
 
 	{"VIB1 DAC", NULL, "DA5 Channel Volume"},
@@ -857,13 +838,15 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"AD1 Channel Volume", NULL, "AD1 Source Select"},
 	{"AD2 Channel Volume", NULL, "AD2 Source Select"},
 
-	{"AD12 Enable", NULL, "AD1 Channel Volume"},
-	{"AD12 Enable", NULL, "AD2 Channel Volume"},
+	{"AD1 Channel Volume", NULL, "AD12 Enable"},
+	{"AD2 Channel Volume", NULL, "AD12 Enable"},
 
-	{"AD_OUT1", NULL, "ab8500_0c"},
-	{"AD_OUT1", NULL, "AD12 Enable"},
-	{"AD_OUT2", NULL, "ab8500_0c"},
-	{"AD_OUT2", NULL, "AD12 Enable"},
+	{"ab8500_0c", NULL, "AD_OUT1"},
+	{"AD_OUT1", NULL, "Main Supply"},
+	{"AD_OUT1", NULL, "AD1 Channel Volume"},
+	{"ab8500_0c", NULL, "AD_OUT2"},
+	{"AD_OUT2", NULL, "Main Supply"},
+	{"AD_OUT2", NULL, "AD2 Channel Volume"},
 
 	/* Mic 1 */
 
@@ -880,11 +863,11 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"AD3 Source Select", "Mic 1", "MIC1 ADC"},
 
 	{"AD3 Channel Volume", NULL, "AD3 Source Select"},
+	{"AD3 Channel Volume", NULL, "AD34 Enable"},
 
-	{"AD3 Enable", NULL, "AD3 Channel Volume"},
-
-	{"AD_OUT3", NULL, "ab8500_0c"},
-	{"AD_OUT3", NULL, "AD3 Enable"},
+	{"ab8500_0c", NULL, "AD_OUT3"},
+	{"AD_OUT3", NULL, "Main Supply"},
+	{"AD_OUT3", NULL, "AD3 Channel Volume"},
 
 	/* HD Capture path */
 
@@ -893,14 +876,15 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 
 	{"AD5 Channel Volume", NULL, "AD5 Source Select"},
 	{"AD6 Channel Volume", NULL, "AD6 Source Select"},
+	{"AD5 Channel Volume", NULL, "AD5768 Enable"},
+	{"AD6 Channel Volume", NULL, "AD5768 Enable"},
 
-	{"AD57 Enable", NULL, "AD5 Channel Volume"},
-	{"AD68 Enable", NULL, "AD6 Channel Volume"},
-
-	{"AD_OUT57", NULL, "ab8500_0c"},
-	{"AD_OUT57", NULL, "AD57 Enable"},
-	{"AD_OUT68", NULL, "ab8500_0c"},
-	{"AD_OUT68", NULL, "AD68 Enable"},
+	{"ab8500_0c", NULL, "AD_OUT57"},
+	{"AD_OUT57", NULL, "Main Supply"},
+	{"AD_OUT57", NULL, "AD5 Channel Volume"},
+	{"ab8500_0c", NULL, "AD_OUT68"},
+	{"AD_OUT68", NULL, "Main Supply"},
+	{"AD_OUT68", NULL, "AD6 Channel Volume"},
 
 	/* Digital Microphone path */
 
@@ -911,17 +895,25 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 	{"DMic 5", NULL, "V-DMIC"},
 	{"DMic 6", NULL, "V-DMIC"},
 
-	{"AD1 Source Select", NULL, "DMic 1"},
-	{"AD2 Source Select", NULL, "DMic 2"},
-	{"AD3 Source Select", NULL, "DMic 3"},
-	{"AD5 Source Select", NULL, "DMic 5"},
-	{"AD6 Source Select", NULL, "DMic 6"},
+	{"DMIC1", NULL, "DMic 1"},
+	{"DMIC2", NULL, "DMic 2"},
+	{"DMIC3", NULL, "DMic 3"},
+	{"DMIC4", NULL, "DMic 4"},
+	{"DMIC5", NULL, "DMic 5"},
+	{"DMIC6", NULL, "DMic 6"},
+
+	{"AD1 Source Select", "DMic 1", "DMIC1"},
+	{"AD2 Source Select", "DMic 2", "DMIC2"},
+	{"AD3 Source Select", "DMic 3", "DMIC3"},
+	{"AD5 Source Select", "DMic 5", "DMIC5"},
+	{"AD6 Source Select", "DMic 6", "DMIC6"},
 
-	{"AD4 Channel Volume", NULL, "DMic 4"},
-	{"AD4 Enable", NULL, "AD4 Channel Volume"},
+	{"AD4 Channel Volume", NULL, "DMIC4"},
+	{"AD4 Channel Volume", NULL, "AD34 Enable"},
 
-	{"AD_OUT4", NULL, "ab8500_0c"},
-	{"AD_OUT4", NULL, "AD4 Enable"},
+	{"ab8500_0c", NULL, "AD_OUT4"},
+	{"AD_OUT4", NULL, "Main Supply"},
+	{"AD_OUT4", NULL, "AD4 Channel Volume"},
 
 	/* LineIn Bypass path */
 
@@ -946,13 +938,13 @@ static const struct snd_soc_dapm_route ab8500_dapm_routes[] = {
 
 	/* Sidetone Filter path */
 
-	{"Sidetone Left Source", "LineIn Left", "AD12 Enable"},
-	{"Sidetone Left Source", "LineIn Right", "AD12 Enable"},
-	{"Sidetone Left Source", "Mic 1", "AD3 Enable"},
+	{"Sidetone Left Source", "LineIn Left", "AD1 Channel Volume"},
+	{"Sidetone Left Source", "LineIn Right", "AD2 Channel Volume"},
+	{"Sidetone Left Source", "Mic 1", "AD3 Channel Volume"},
 	{"Sidetone Left Source", "Headset Left", "DA_IN1"},
-	{"Sidetone Right Source", "LineIn Right", "AD12 Enable"},
-	{"Sidetone Right Source", "Mic 1", "AD3 Enable"},
-	{"Sidetone Right Source", "DMic 4", "AD4 Enable"},
+	{"Sidetone Right Source", "LineIn Right", "AD2 Channel Volume"},
+	{"Sidetone Right Source", "Mic 1", "AD3 Channel Volume"},
+	{"Sidetone Right Source", "DMic 4", "AD4 Channel Volume"},
 	{"Sidetone Right Source", "Headset Right", "DA_IN2"},
 
 	{"STFIR1 Control", NULL, "Sidetone Left Source"},

-- 
2.55.0

