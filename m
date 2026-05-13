Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5939A3D34BC;
	Wed, 13 May 2026 08:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660280; cv=none; b=uv8AbejX0+8VUO2co6QGcDvE+EhFmMiB/u3u/3SaENw/Pq6oVfcImwLLQknvtd50t0ihAg9kBAFAk3+62QfifAeGawyAIk/ckpSmk2qaWLqU7/JqGGDf/AF9VpArmhTIAFmwjsVk7Yj5j/bAXwxwrL97skBYVTlAkS0wOk3lmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660280; c=relaxed/simple;
	bh=Btr4nQmLXXWnsSVlpqZj6eOGRhJwONNf5L78xXaL/CI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aUHuKW+iLJgtrnDR9HpA9y+MJ6yOMXaNREGNc/0pBCmjUqzniYFqXt5Tk9ZV1D1R1hTUxClLwLH848qtNRGBcnwraNb5T7wxyfcocss+IYd/XgWK3faQOmCpkz7IAlLinj1+JcZ8+6PrvunLdcWL8Inp5BHXpVfh/pNiy0LeyBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=keLpunt2; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="keLpunt2"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3540EC5DC43;
	Wed, 13 May 2026 08:18:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3303606CE;
	Wed, 13 May 2026 08:17:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D56A11AF8D79;
	Wed, 13 May 2026 10:17:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660274; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DkunmCE8iFG8EgIMG24p8g3IiipYmtACWmSbuVG/BA=;
	b=keLpunt2nAo+4qdG+waAPwoq30jcXf4oghMW1X2czGpTHHYzhm1WmXHSgsTQP9H58d1Fx/
	MSFjkQKcA/pvxSM3jO7BAzE5UtmqNldsiYXedesaaRTqTkr56neO5KRDhGbrU2k4z3vWci
	IzpltGHttRSAPB5Ac/VdaURqVssw0rGvLzGmPZWeKsZfLLb89OYTF/o6H+43pFTZT0oFZc
	R02HAEM5BuJplXXt+HTn7/JX4eBgxZABDsQLBeqPT6+4im1nq7/o3N2l9QqHfZuLF5op41
	e2OP993LCEX6R2D9PcjC9YhnmXkrsJLKKb0GHJiQI4srE1RcKWYXxl5Y7dqc6w==
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
Subject: [PATCH v3 17/17] MAINTAINERS: Add the ASoC gpio audio amplifier entry
Date: Wed, 13 May 2026 10:17:01 +0200
Message-ID: <20260513081702.317117-18-herve.codina@bootlin.com>
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

After contributing the component, add myself as the maintainer for the
ASoC gpio audio amplifier component.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..4bd360f7aa80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24985,6 +24985,13 @@ F:	include/sound/dmaengine_pcm.h
 F:	sound/core/pcm_dmaengine.c
 F:	sound/soc/soc-generic-dmaengine-pcm.c
 
+SOUND - SOC LAYER / GPIO AUDIO AMPLIFIER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/gpio-audio-amp.yaml
+F:	sound/soc/codecs/simple-amplifier.c
+
 SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
 M:	Liam Girdwood <lgirdwood@gmail.com>
 M:	Mark Brown <broonie@kernel.org>
-- 
2.54.0

