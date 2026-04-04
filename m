Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C550433ADA2;
	Sat,  4 Apr 2026 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775327759; cv=none; b=T8uNpF6SITWEXy46PZWFd+BsC4Hz1bU6U7pCtXrztkX0s0hmd2vRJsQVoxSg/LTyUzNxng7LdSeCWzKcpOwgkQ7FrPSK5bQb19AD3AvNV10WZR0Q5YaEn7Tr9X+/r+fwmsfFwan7DTmQiuXWZV4OkNEdGq9M432yeSzNTzxlWGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775327759; c=relaxed/simple;
	bh=4euix1xHKSe5lEGUddBFauSyainydWuV70IIYfBNFXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mC3TR3qSDfOFP63Cb1rSIntkTo+X9H1Qy3OBaeoXnR2wKcO0heUY70rD0y8cAjg+JHY4CRpow4WtuwhiIy9RVyadQycHNyOhWw4tX/ct4TJoT4z39H0U2TzAQesg32mZgCunZMv/WHeryaysYZloKlt2Owt+kAtl9+cI2JFDDfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cgCWUasD; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cgCWUasD"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B4B4A10D7E3;
	Sat,  4 Apr 2026 20:35:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775327755; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=URBiisKpj/4VMst9ixL/iGdh8JIZ79ieZDT72gpFozg=;
	b=cgCWUasDQ68qUJFqRIMhHNay3iSRHeThhK5wB5F+Yu0gW1+hMlnFBaDThvyqJqBX3bl23k
	rCF3I1ZFCIlZlWYMRnryBW9/XqFiY8ZaT3lZdOUOLrUvm7+bbBdkwvwj+diePw8HUdIArk
	1tVhnWnExWVDjSH63hX2BkVERZxDPQwTIeYxM/fI5snh7iZjXLHNpnjCrW2ZOgSyTsc671
	wpTI9Gi3iHUvUXHB3ySpR1FiuiLR7zmO2qd5MVP/KSiQ8EmzsFNurujJjVR7yeANr9zTI3
	QQfbojaWIAvmmAdgXGayEceLytHAtp5uyEHYCDc/G0I8afSY8nX6/EcsuF38Fw==
From: Marek Vasut <marex@nabladev.com>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK swap support
Date: Sat,  4 Apr 2026 20:35:00 +0200
Message-ID: <20260404183547.46509-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document support for setting the Bit Clock Swap bit in CR2 register
via new "fsl,sai-bit-clock-swap" DT property. This bit swaps the
bit clock used by the transmitter or receiver in asynchronous mode,
i.e. makes transmitter use RX_BCLK and TX_SYNC, and vice versa,
makes receiver use TX_BCLK and RX_SYNC.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
---
V2: - Drop | from description
    - Update email, rebase on next
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index 83b5ea5f3d70e..ba65b3f3d0662 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -162,6 +162,13 @@ properties:
       of transmitter.
     type: boolean
 
+  fsl,sai-bit-clock-swap:
+    description:
+      Enable Bit Clock Swap, which swaps the bit clock used by the transmitter
+      or receiver in asynchronous mode, i.e. makes transmitter use RX_BCLK and
+      TX_SYNC, and vice versa, makes receiver use TX_BCLK and RX_SYNC.
+    type: boolean
+
   fsl,shared-interrupt:
     description: Interrupt is shared with other modules.
     type: boolean
-- 
2.53.0

