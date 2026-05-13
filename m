Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B30385D89
	for <linux-sound@vger.kernel.org>; Wed, 13 May 2026 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660254; cv=none; b=RrEY3KX3+iLF75EVYbh/ZQLAjw5M3Gl9EO//PoMX1aAE3oztfXbHE1H7b6tgEhYu5SqJkz+w10qw1yh4zjeb1nwhwcEPR/NX5y9J+o97POg8iclPKqE31c4fS7R8szkeD4bxhmuCv28cO2E3WiPmFRCJm/GzaZ8x+ThnDMnnnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660254; c=relaxed/simple;
	bh=Lwq3DdX2999OTe9NASug9TPsGMnNPStpw4g9+ZvNMLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXX7/doK1MikyW0hJcJmLb13WGI9NMmcTKGpdt3EYqmpFzViPfig4Z0ELQ63o3rfadn7sa/GnwtdyaCwl1yWdw0R2lco/5ld/eLnZQ4MXCnyzbGna3ZKdn67Q7HMnzJpxSOH1f+mdYC4WMm942jJsWtGyEjE588KrOsOCsquzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=t167YbH6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="t167YbH6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 22D7F4E42C8F;
	Wed, 13 May 2026 08:17:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0D83606CE;
	Wed, 13 May 2026 08:17:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35CA011AF8D81;
	Wed, 13 May 2026 10:17:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660251; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=tPcax1vVmMn+WekSyZVMY/Gpp1bnyfBe+9QFN7TIpB8=;
	b=t167YbH6Og001Ar5pWqH1/eKIN/9tWfa6cPVuCZ7Q9mfbN1I52VvdII8cFQGpiFj2ZMv8D
	XCwUlpBUCZc6avYhk9qjf2UEvNTIor2FhL8dSqE62rc9+acO7SvJvHrJWzagilSX44ivbz
	Ss7hiKzl6TWxnUPLNT2mVQRaE0cd1g26LAH+j5anQhTWAw3QkGiDDMpPyw5MKEDLQdzcZZ
	s2fSoJDAXTF6Q2gxvQA9myQbucxjPdyif7qAKrSUMvp06bElNIgKoMIW9DTT9OaCqrW5sZ
	SQEeclEsjTaELNKm1ZxR82wrXTvyjjGLj0Xi519LdGymTqqJzcuiKIqG0yj75A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 06/17] ASoC: simple-amplifier: Rename drv_event() function
Date: Wed, 13 May 2026 10:16:50 +0200
Message-ID: <20260513081702.317117-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The drv_event() is used to handle power events related to the DRV item.

Later, with the support for gpio-audio-amp, this function will be
also used to handle power events related to the PGA item.

Also, more functions will be added in the driver and it is a common
usage to prefix functions based on the driver name.

Rename the drv_event() function to simple_amp_power_event() to follow
common usage and get rid of the 'drv' term.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/simple-amplifier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/simple-amplifier.c b/sound/soc/codecs/simple-amplifier.c
index 215318ff62fc..8f2daec55134 100644
--- a/sound/soc/codecs/simple-amplifier.c
+++ b/sound/soc/codecs/simple-amplifier.c
@@ -15,8 +15,8 @@ struct simple_amp {
 	struct gpio_desc *gpiod_enable;
 };
 
-static int drv_event(struct snd_soc_dapm_widget *w,
-		     struct snd_kcontrol *control, int event)
+static int simple_amp_power_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *control, int event)
 {
 	struct snd_soc_component *c = snd_soc_dapm_to_component(w->dapm);
 	struct simple_amp *priv = snd_soc_component_get_drvdata(c);
@@ -42,7 +42,7 @@ static int drv_event(struct snd_soc_dapm_widget *w,
 static const struct snd_soc_dapm_widget simple_amp_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("INL"),
 	SND_SOC_DAPM_INPUT("INR"),
-	SND_SOC_DAPM_OUT_DRV_E("DRV", SND_SOC_NOPM, 0, 0, NULL, 0, drv_event,
+	SND_SOC_DAPM_OUT_DRV_E("DRV", SND_SOC_NOPM, 0, 0, NULL, 0, simple_amp_power_event,
 			       (SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD)),
 	SND_SOC_DAPM_OUTPUT("OUTL"),
 	SND_SOC_DAPM_OUTPUT("OUTR"),
-- 
2.54.0

