Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9F03C7E17
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865789; cv=none; b=PWD1mCZaEr6vZM7NKkwndSl2FeannPb/opv85MPRPpgCj3sgM1WMyakqTA32zI6syg6PORhE2zLwQoSs93q18n6v1tShRbs4ShNrZ2ZQ9Yh7WDKKW2v+nDc3J1kOnX/x8nB9NTvgQ0klhWdtYui5sp6Vd/8w6eEZgMuOPtD4gdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865789; c=relaxed/simple;
	bh=Jk8KbZlmKq8ZEAXNtnD15PPIxXzpCD4uHwokEAZ/GLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWa+bnDRVWCEsjADU6fM19093KUIQLcPgse1qMEtudNk0Pg5xQmlJwD1tz88R1adBtXv7LuAv0JG/K/S0PfXEtvLdKVka02kfJUQ+F98eBHECs3+mgrXFlvXAggfRVIIE4XpD56agz3nb0cAaFP4+cJUbX6j9fXAqx/LQ7381QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i0FV1/RZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="i0FV1/RZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2E2B34E42869;
	Mon, 30 Mar 2026 10:16:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F35255FFA8;
	Mon, 30 Mar 2026 10:16:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2CA310450EF5;
	Mon, 30 Mar 2026 12:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774865786; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BqD0ex0T8aAZm0wxVLLFoEpGMUaXrtSX0K4TG3luA3Y=;
	b=i0FV1/RZtqg0RZR5cxypfFm/IVAU03WN3LRg3SNU9/MYuAaq+2oCQGwp3+H0UdPf9NKxAJ
	IaIMAGKdQOJ40HX1xkVZG2SfE2uWInSFIdWWRS0/+CWt9lv6/49CH5wMCwaF2RahdptYm3
	/8e/8O48elxwqZHIAGZeItWHvUj4CwLUFoxxMzIgGRP7+9ANSWDc0kKjQYwOLXI5EYvV73
	rkkJnFsDOCViSIHCcPVanC9anZ9Mq6eFVootTozX7L4o16UGaGYrzO02UNTHXUUp4nSlxn
	/EW8xmskQ+YWAmu1USSu62re05X/OjoOOW/XR/LwfnaGwa37rapv7GuTWrvkOA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 4/4] MAINTAINERS: Add the ASoC gpio amplifier entry
Date: Mon, 30 Mar 2026 12:16:08 +0200
Message-ID: <20260330101610.57942-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330101610.57942-1-herve.codina@bootlin.com>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

After contributing the component, add myself as the maintainer for the
ASoC gpio amplifier component.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..2546eb81f233 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24765,6 +24765,13 @@ F:	include/sound/dmaengine_pcm.h
 F:	sound/core/pcm_dmaengine.c
 F:	sound/soc/soc-generic-dmaengine-pcm.c
 
+SOUND - SOC LAYER / AUDIO GPIO AMPLIFIER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/audio-gpio-amp.yaml
+F:	sound/soc/codecs/audio-gpio-amp.c
+
 SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEMENT (ASoC)
 M:	Liam Girdwood <lgirdwood@gmail.com>
 M:	Mark Brown <broonie@kernel.org>
-- 
2.53.0

