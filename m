Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4A38E8CB
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208156; cv=none; b=HD+cVF55C6Fy/yAIg20SiUb6os6Quyo+Oro1Yf4xchYApf1dHae1zlUxeEpr0KIb11K8hulh0jdp01mns6VsbSI+WhczE0vFm31GQFOT6ESJ/+WX/BvOHrC8ykb+8p/6cW6cggQOVvKim37D93uEQ8R/q+wLqo2xLlvgQ/CK9Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208156; c=relaxed/simple;
	bh=2DxVJ69vxzrgX+jYg6RjmKHPS9z6WVWjTFuaBHQRlZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fb1+mt3OTNzz183S9KA04AuacdKsM+d0OM6v3kJWzd801Ryy1627SPI5Cp6n79PpTJMPiX4qWUKZNTAgtHKMGw8MQzLKdPHpe3MPcWdPR7YUxTvOMeEh7CB58oQ+KwBfUMMZHwlJZElATfXAgwNiObpctCx43C4hg1RHY0EHrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJ3J+hE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJ3J+hE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B371F00A3D;
	Mon, 31 Aug 2026 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208154;
	bh=jAK1TDrCU0TmUF5HfX2PJOOC2urZIUZcxDOl2A2m7cU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LJ3J+hE5EyzzDk8p6vjV9lLOCF7DXoepwe176/k9HivC/HqowXcTlxd+doYQsexpp
	 3OoxpliI9/eo6kXWOZoAdxe6tAdP/rU319DhmJyPhLAxnFLo58UlH4fleZO0stuv1H
	 nSnpvm4PK5T5PL5e3SkF4IXR890J3Z803fK9t+evIA/3g0O9N7Mi4FWhHsi/Q2RYM1
	 tvRVynrwHJQhdpnB/jJKgY3Kgawej0V95qISteLfh1OZoli/Ux+I/8Ho+ttlhxCID7
	 y6RFoa7Q7sBFF6049N0lEt8XaF1VX27qW3zzSAS1o04uJKzWVopDMvBH+C3YgFpowX
	 Vmzi1eCJZKbnw==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 22:29:06 +0200
Subject: [PATCH 1/6] ASoC: ab8500: Reset the audio block before configuring
 it
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ab8500-codec-fixes-v1-1-f85024e717e3@kernel.org>
References: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
In-Reply-To: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

ResetAudn is active low, but the codec probe only deasserts it. It also
clears Clk32kOut2Dis despite claiming to disable that output, and writes
codec registers before releasing reset.

Pulse ResetAudn before the first audio-bank access and leave the unused
32 kHz output disabled.

Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 2cf96cbdd294..714ff0a16f44 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1638,18 +1638,18 @@ static struct snd_kcontrol_new ab8500_ctrls[] = {
 static int ab8500_audio_init_audioblock(struct snd_soc_component *component)
 {
 	int status;
+	u8 mask = AB8500_STW4500CTRL3_CLK32KOUT2DIS |
+		  AB8500_STW4500CTRL3_RESETAUDN;
 
 	dev_dbg(component->dev, "%s: Enter.\n", __func__);
 
-	/* Reset audio-registers and disable 32kHz-clock output 2 */
-	status = ab8500_sysctrl_write(AB8500_STW4500CTRL3,
-				AB8500_STW4500CTRL3_CLK32KOUT2DIS |
-					AB8500_STW4500CTRL3_RESETAUDN,
-				AB8500_STW4500CTRL3_RESETAUDN);
+	/* Reset the audio registers and disable the unused 32 kHz output. */
+	status = ab8500_sysctrl_write(AB8500_STW4500CTRL3, mask,
+				      AB8500_STW4500CTRL3_CLK32KOUT2DIS);
 	if (status < 0)
 		return status;
 
-	return 0;
+	return ab8500_sysctrl_write(AB8500_STW4500CTRL3, mask, mask);
 }
 
 static int ab8500_audio_setup_mics(struct snd_soc_component *component,
@@ -2181,6 +2181,13 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 
 	ab8500_codec_of_probe(dev, np, &codec_pdata);
 
+	status = ab8500_audio_init_audioblock(component);
+	if (status < 0) {
+		dev_err(dev, "%s: failed to init audio-block (%d)!\n",
+			__func__, status);
+		return status;
+	}
+
 	status = ab8500_audio_setup_mics(component, &codec_pdata.amics);
 	if (status < 0) {
 		pr_err("%s: Failed to setup mics (%d)!\n", __func__, status);
@@ -2193,13 +2200,6 @@ static int ab8500_codec_probe(struct snd_soc_component *component)
 		return status;
 	}
 
-	status = ab8500_audio_init_audioblock(component);
-	if (status < 0) {
-		dev_err(dev, "%s: failed to init audio-block (%d)!\n",
-			__func__, status);
-		return status;
-	}
-
 	/* Override HW-defaults */
 	snd_soc_component_write(component, AB8500_ANACONF5,
 		      BIT(AB8500_ANACONF5_HSAUTOEN));

-- 
2.55.0

