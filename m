Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E197938CFE4
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208166; cv=none; b=TPPktCKy43G9y8HiUZb+HxKZzw4OuRsZJl6VeNOZbiSxS+Rump9eqTU4vK/gU5Shgk3nvJD+eNRHyfNE4PB/b+4+2dEP9Laatfl+N0+EygH+EDJZRSKHZBaMeM7bX2ryzQD4tJOLi5Ux1vctpl/L9inpSM0bgAkKG3sawE4vw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208166; c=relaxed/simple;
	bh=35NRinGXb52iCPrtyjsSPlrLE+bxy13mnSTtzNDSBMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hUUmDrzyt2IGzsJZhyrd3dziawSEa8fskJSjwWxgPArGsrT+hFm4FHwTD0iIfa813WF4/pIUjv1xbVhkI8vJDOCbkFAzki1mO1WPxUq+7DOYfJ4RorFDFHZ/1r1KWxWjJ7nPyhKJpFc+RalN3quPmiDyC9qvFqMe0jS6s9EP6XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKqO31FC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKqO31FC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC09F1F000E9;
	Mon, 31 Aug 2026 20:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208164;
	bh=X+diNMstTBgwaifBztuiSVw2PcEIGlDuEpvQaRSE/fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YKqO31FCg03oLMByWqDlasEiCHvvYPBS2qkr2+eQoeASeFgBHL6coo8sIC9xiL95G
	 yBD0z4wxSCM5TdjCVmHdWxdwRzow081K8IiB68B0uXWyaOBy411PIYCzXgwtmR4joK
	 Wqjwrvlwn6ULOG3Lj8uPkuyAUC0DgP+lnZuOp3a37Vmpw275SOufJpwdXCwYMMpDrg
	 oscwmEPJijFdSdPC5ZL++fz3nsA0ex9PaMXAnT5Zj2/vQyLBRPISoq79yUaQKhuoHX
	 TP/aqRHEq9lNDqsXxnIkPIuCmlJIod8DMLoPhvXInQnstA+EUeCFqN2t9VxzFQs4cw
	 XyGxOZIeS0vLA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 31 Aug 2026 22:29:11 +0200
Subject: [PATCH 6/6] ASoC: ab8500: Skip missing DMIC GPIOs on AB8505
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-ab8500-codec-fixes-v1-6-f85024e717e3@kernel.org>
References: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
In-Reply-To: <20260831-ab8500-codec-fixes-v1-0-f85024e717e3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

GPIO27, GPIO29 and GPIO31 provide the digital microphone clock
outputs on AB8500, but these GPIOs do not exist on AB8505. The shared
codec driver nevertheless accesses their direction register while
setting up every AB8505 codec.

Identify the parent MFD device and leave the nonexistent GPIOs
untouched on AB8505.

Fixes: 679d7abdc754 ("ASoC: codecs: Add AB8500 codec-driver")
Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 sound/soc/codecs/ab8500-codec.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 11142d15df45..e1a0e35836e6 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1540,6 +1540,8 @@ static int ab8500_audio_init_audioblock(struct snd_soc_component *component)
 static int ab8500_audio_setup_mics(struct snd_soc_component *component,
 			struct amic_settings *amics)
 {
+	struct device *dev = component->dev;
+	struct ab8500 *ab8500 = dev_get_drvdata(dev->parent);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	u8 value8;
 	unsigned int value;
@@ -1548,20 +1550,21 @@ static int ab8500_audio_setup_mics(struct snd_soc_component *component,
 
 	dev_dbg(component->dev, "%s: Enter.\n", __func__);
 
-	/* Set DMic-clocks to outputs */
-	status = abx500_get_register_interruptible(component->dev, AB8500_MISC,
-						AB8500_GPIO_DIR4_REG,
-						&value8);
-	if (status < 0)
-		return status;
-	value = value8 | GPIO27_DIR_OUTPUT | GPIO29_DIR_OUTPUT |
-		GPIO31_DIR_OUTPUT;
-	status = abx500_set_register_interruptible(component->dev,
-						AB8500_MISC,
-						AB8500_GPIO_DIR4_REG,
-						value);
-	if (status < 0)
-		return status;
+	/* Set DMic-clocks to outputs; these GPIOs do not exist on AB8505. */
+	if (!is_ab8505(ab8500)) {
+		status = abx500_get_register_interruptible(dev, AB8500_MISC,
+							   AB8500_GPIO_DIR4_REG,
+							   &value8);
+		if (status < 0)
+			return status;
+		value = value8 | GPIO27_DIR_OUTPUT | GPIO29_DIR_OUTPUT |
+			GPIO31_DIR_OUTPUT;
+		status = abx500_set_register_interruptible(dev, AB8500_MISC,
+							   AB8500_GPIO_DIR4_REG,
+							   value);
+		if (status < 0)
+			return status;
+	}
 
 	/* Attach regulators to AMic DAPM-paths */
 	dev_dbg(component->dev, "%s: Mic 1a regulator: %s\n", __func__,

-- 
2.55.0

