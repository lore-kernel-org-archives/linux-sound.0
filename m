Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2430648D;
	Thu, 16 Oct 2025 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619862; cv=none; b=qKlYbT3O7j1//8L7yR1JbOWGINu4u0xGl5bd4Qr+R87wKPEavqhFWLyk5ztJSiXi5ekdsbOzziuMgey+iTbD0c6/Ce1M1OqZ44EmfmuBsR7T/tvQC8DJFLcXsEGGXy+WYZWiG7LrAOuFmdEcnS2l/EpXe3DSrtInRDKcHjp7UCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619862; c=relaxed/simple;
	bh=pT9rQgKll8jmWS4orI3/Yt4belu5XsXdLKl4a9KPSBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RInaUncP0fNnZ6+o8nCmD+8YUJ94TyXj8PFfURCyMMvUgTP3PPO7+18HXR7HPbkA9UIl0Hi+vbFTqYXqLLPDv8lb+Q4EpxDJ/KWjF5VUALTq78rV2q83gysAQJdCqTMLupe7L7VhsRRDhTBRV1WSfFIW5FfCTpV04MWrWX4gYZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S98R/FuY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S98R/FuY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6D56F4E410FF;
	Thu, 16 Oct 2025 13:04:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 428856062C;
	Thu, 16 Oct 2025 13:04:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1C85102F2309;
	Thu, 16 Oct 2025 15:04:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760619853; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uoDF+HIilfVMcll1NHENrGFL0ZTm+xsdbcPT8m/QM8M=;
	b=S98R/FuYBCgboDW/7GMSIicVwXIUKDKfFZWqNdIRE0xHLTv8Lt08JGGgVpC2odcuUo7N7o
	SnAcNRA4bsuiTcfwLg76rO7wOR0pB0MSTdnyYteQvWHxnsnnKoRwy2AnbI2+nAn8mfqVWp
	5X0Po1AjtC90zJNcHHLs3Leyo1BPXekKaRMe7dGnoU0ts0ojkxq99NxRdgmwQ88V6y40Hp
	WFvQ6M+CZz8etB8CERkLpteLsTihT7IEL5n1AQEFsjk491DU0uN1W44Zjg0bCtYSE63360
	cZcF7tr0LndgMbWOjJyMEpzK1lzPEdFOn/pyvV9pLbhgnQ8Jk/VMMYEVmzQR2g==
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
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH 2/3] ASoC: dt-bindings: cirrus,cs4271: Document mclk clock
Date: Thu, 16 Oct 2025 15:03:38 +0200
Message-ID: <20251016130340.1442090-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016130340.1442090-1-herve.codina@bootlin.com>
References: <20251016130340.1442090-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Cirrus CS4271 codec can use an external clock as an input Master
Clock. When no crystal is used, the CS4271 component considers its MCLK
pin as an input pin and expects the external clock connected to provide
the Master Clock.

This clock is not documented in the binding.

Add the missing clock.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../devicetree/bindings/sound/cirrus,cs4271.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs4271.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs4271.yaml
index 68fbf5cc208f..d286eb169915 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs4271.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs4271.yaml
@@ -25,6 +25,16 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description:
+          Master clock connected to the MCLK pin if MCLK is an input (i.e. no
+          crystal used).
+
+  clock-names:
+    items:
+      - const: mclk
+
   spi-cpha: true
 
   spi-cpol: true
-- 
2.51.0

