Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944342;
	b=DXSNRY3vLwakB0ocgMifjPJskFMXPPzFiVDYaOILHFmB+oSP82o6vZAYoFNPsciBH2ia
	 dg8s+kAbax/ncFtID8YTL08Cj23XRiosNxcR4L1RsCPS3YgFNeMM0AkS8B0gF2+UYIMLM
	 3WPHdyW81J6QKPLm6qNuS4AdL/DKe+8zeB9kEA1PyYcUz4ZprTG5vzZjDja3S3ypz7lwQ
	 pJmTL0gO6/nJ8GdLgazK5AjBt9Cv/tGjf8/2njXuas8AFGT3RhRPOAiDMtu5vEu9Z35h3
	 BQfJylYKAimqaBT404nvEzc2eE/BuvaDEkxY4WNsv7SWl0dp/Zgq7WhTr7woD90M71w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
	b=W3XccY02NKopIYp7tu893C6i+nbLffFAx2isazd12aGTTH4pt5JAFo/NTe4RA4vSI1+9
	 N5Rv7dc93gkmwwb4A2TnL3FNzNU4pGrLdQzHOA5A7KOHc+5Cs50o1aHEMTADVihLihVlD
	 F0KsFpcM9FABmCD6tAa6Z9Hv8VuTaGVuza74+409lIilUuO+Bjk2FCSIFyvX4+90GfJ3K
	 JuJhmOAIJYlLSoLX2dkJttXIecSEcgyoGLL/Oozx1psAWozYiv04+bZtNYWgaIuR4oO87
	 YdBmNcjPBUIpi2Vtuy6h2irJUn9BhoFXUdbBuTUppOewdfdqznSaQZ1TNYY7MUjSC4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz2r2Ala;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C716F606A33E
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 19:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C716F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hz2r2Ala
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so8968335e9.1
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 11:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944340; x=1795549140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=hz2r2AlaEEMk6elF5K4RjTgSi0OthE+5VYoTEKoWW5La63Cfp6JA+0mePiiVroEdvz
         9w319qm8hnJQkrEHrH3PViesYyv/J2zy+d41MkduU/TKOxRMR2Bj7TDT/Vh5a/x38QZK
         4hFdljsWK0QgYbZFM1L3oq5p3ZlHsii1w4vHA0+KeJ03Emt9JktFKdx5bOsTBUOAgQ4+
         E0DJlAiL6ysSHOo7CnGbvmrTK7eqeNr5A4A2t9Dbt3DY2MqkWWPVtxXwlLDxTAN6DX50
         xiPaVn/Hmv0IwqSToKW9HZoI5WUfWaIwzUXEmdI8w6QUHJHJz5WLffYBlU9vAtVV+aBW
         409g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944340; x=1795549140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qp6mhWPp883ejORG1lCokPuAQSQmWRK0wbW6sXM1LFg=;
        b=Y1ZQmvEDm1LuuG8mxI4OibGaZ6MjI/dHbp0XItxOtCPiHz1/4GuKP9m7m2fNKjjne2
         2a2KAV7Ovae3bR17lJsAFp7SLsdlkxxv2Qsy8Gbnvp58yVjaXFdEiC04975onxLziKaL
         KfqOM60MuMUc6JY4R5JXFLo+5XdIvWLVyCcPhQPzreXl4DYsMo7iArLtTJajTgZ1iVrH
         hbZnoc/D+GnPfbBPo0c+LaptgPUfP/2x91pRfrnQ97e3i4RkPi0iircpuZrh0b7slBlX
         sRJQ2ymEDPC2g+9fK2mcHeTWkkaOARXIANSDriEh3oVx8BiG48KWVFFGof1MikXcpf73
         Swiw==
X-Forwarded-Encrypted: i=1; AL+hErF2i5avqoSFm0K7xCQpL+bmCPddiecwAlX6Oe3bVq2hQdHt5w7OVyt53NrrFiUSOA8tMurFwsxMoEG3LQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+H3kmSn/B75ta6TbWvkun86hSBbI99hAloL+S4SkkyGvDd3ry4
	vXgD3Dbornxjf5kx+c/bWf6PB6a45A8IklHpx7T0EdHGp0ofcW1i/Tvb
X-Gm-Gg: AYBFou3g6uOmaQ6uH7QiKt8qj1xe2+sjHTg6YAq6iAsJ8Euupc+zgE/yY9lDJG0NoZV
	Cpm4xgIqmQuPbGpkXLhbIFGikX32UtXPuCqIGlnUjYIMvbVt48UyQxTgSmRsbJYCGHhxmECS2yD
	qov0NTAyaD9tF+GgZpJsAVbzzxJrGcARTcI7MyK4gyX1VOCN3qCIbsgHPtksRK2vZwOs/f2aCwK
	tevpaZR7YDoqMgs3fQ/45R9Hs2Km+7Hi9qfO0FOSfvdCPlD63LF0biSWaT9FbXU7IBeRmKsQkpq
	Adndd+7ZuVoXjTqJLc4b/4Cx2lR9jvkhVj6r3q5BkYepIblJpcsphPNze/M0H8mOuKkcQjcDLQT
	CBYeM0738J/ImLTSZd2HwaPYoL2117xU9N9tjRjhsATGV2bemNDKwgsaNXDxSyyQ0mN5sjJcfoD
	V5jZudjYJ8PkTFWJ0TiGnaMZizUR/5R0i+zGwKYjnJukbJrBo0NR1e3EB6ndh2xQaocS5fOMBQl
	OF7NsiZO+KZUbgVPNLHRA6reee1os3g4B43DxLho9k3TOGxpffXCFCswvM17R/VSc7ui/pIiz1Q
	CdksGD/F36jKogKJs1wJRW3UfLuU4TNhSDzuBLc1iKY4dezurzxwOr4SQ/AT1b7nsoEMc+mXJge
	mgt4WCV4FXT3xKklXk2E68+wx1yckbdkKfQ==
X-Received: by 2002:a05:600d:82e8:b0:4ba:4928:8aec with SMTP id 5b1f17b1804b1-4bb7da18d83mr3966105e9.9.1794944340157;
        Tue, 17 Nov 2026 11:39:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm509521f8f.0.2026.11.17.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] ASoC: dt-bindings: airoha: Add AN7581 PCM controller
Date: Tue, 17 Nov 2026 20:38:47 +0100
Message-ID: <20261117193851.235272-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117193851.235272-1-ansuelsmth@gmail.com>
References: <20261117193851.235272-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Document the related compatible and required interrupt/reset and provide an
example for it.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/airoha,an7581-pcm.yaml     | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
new file mode 100644
index 000000000000..e73236453b88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha PCM controller for AN7581 SoC
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+properties:
+  compatible:
+    const: airoha,an7581-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: pcm1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - resets
+  - reset-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/reset/airoha,en7581-reset.h>
+
+    pcm@1fbd0000 {
+        compatible = "airoha,an7581-pcm";
+        reg = <0x1fbd0000 0x10000>;
+
+        interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&scuclk EN7581_PCM1_RST>;
+        reset-names = "pcm1";
+    };
+
+...
-- 
2.55.0

