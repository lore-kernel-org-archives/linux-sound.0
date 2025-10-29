Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6BE328B4E
	for <linux-sound@vger.kernel.org>; Wed, 29 Oct 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761730779; cv=none; b=GqVBIgCtwIoKKmZtQI5tZn5eXECuanXfH2GltU1ekXuGcj2qSXwxTjogzjHVoHmXyk8oPCvCX2OsgmcRcF3VrpCT7vHwYAc5rryQ8JcuxR5xGhAjO5+LNfLOzV4h0Q8vsuWyvF+IkZpuP0apn6O+h0OmLTkehVXfo3iv7cG7BsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761730779; c=relaxed/simple;
	bh=37IiwR/6S6dxfx7lj0RxvC3WsfBd/iSGcmPFwZTHdkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhIzCeIsOBCn/SET37+Hy7a9IqGmBddCHW8kYCkK5FBxNa42n/2Mit06crZRxB5k3oYAbKjWRV2s1nZDpNk5xl/SPInq+T4jiATr9OOEQ5xuY/7SYmq2I3VTlls+1CwV177xnTOAx/YarXUonVLT5LGFVGuhU5oJvLsuzqGwzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HjhPfAve; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HjhPfAve"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C3C6B4E413C6;
	Wed, 29 Oct 2025 09:39:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99750606E8;
	Wed, 29 Oct 2025 09:39:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE804117F19D2;
	Wed, 29 Oct 2025 10:39:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761730774; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=drk5eLb0e0St/3Rsft+R84KPgwf6up5pUeWOlxU8ev4=;
	b=HjhPfAve75wHUi/HamEnJwW4NYxmQErPBi1kEIEo6J3eTd45pTNoO79SbWWd6OhJlGSdiL
	lqf9x4vSJTirEHxaYebtzwgB2+kmSUQKLrGngfSmlMgaXR//IXzGpzCLbvWv1IxcKG6j/v
	U0DGa1wz/ph9iGWie2C1PNPDW5kMu7VjTTwuDz81T1kGyrIBRzo8MZitdWdkM8FiG1fQFZ
	U+xop2CMdP4jg29VIO1K+0Y3JF3NK8Ucdm0B+F7vunaBnRPSj39z8bP9vz/qE1z2d9zh/E
	PwCVeV4BRVb+l2HtEVmNycv1wc5501USF4uc1XlKDUI35V//eeSWJUqxs1DuRg==
From: Herve Codina <herve.codina@bootlin.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	Axel Lin <axel.lin@ingics.com>,
	Brian Austin <brian.austin@cirrus.com>
Cc: linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/4] ASoC: cs4271: Disable regulators in component_probe() error path
Date: Wed, 29 Oct 2025 10:39:18 +0100
Message-ID: <20251029093921.624088-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029093921.624088-1-herve.codina@bootlin.com>
References: <20251029093921.624088-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The commit 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
has introduced regulators in the driver.

Regulators are enabled at the beginning of component_probe() but they
are not disabled on errors. This can lead to unbalanced enable/disable.

Fix the error path to disable regulators on errors.

Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 sound/soc/codecs/cs4271.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index ff9c6628224c..a9d333e6c723 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -572,17 +572,17 @@ static int cs4271_component_probe(struct snd_soc_component *component)
 
 	ret = regcache_sync(cs4271->regmap);
 	if (ret < 0)
-		return ret;
+		goto err_disable_regulators;
 
 	ret = regmap_update_bits(cs4271->regmap, CS4271_MODE2,
 				 CS4271_MODE2_PDN | CS4271_MODE2_CPEN,
 				 CS4271_MODE2_PDN | CS4271_MODE2_CPEN);
 	if (ret < 0)
-		return ret;
+		goto err_disable_regulators;
 	ret = regmap_update_bits(cs4271->regmap, CS4271_MODE2,
 				 CS4271_MODE2_PDN, 0);
 	if (ret < 0)
-		return ret;
+		goto err_disable_regulators;
 	/* Power-up sequence requires 85 uS */
 	udelay(85);
 
@@ -592,6 +592,10 @@ static int cs4271_component_probe(struct snd_soc_component *component)
 				   CS4271_MODE2_MUTECAEQUB);
 
 	return 0;
+
+err_disable_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(cs4271->supplies), cs4271->supplies);
+	return ret;
 }
 
 static void cs4271_component_remove(struct snd_soc_component *component)
-- 
2.51.0

