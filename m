Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B65D3FE31
	for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 11:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515043; cv=none; b=l0Oohvuos9SkikwNHEyTP0N2kH+pjkm5VZv3oaNzsjT5imW9IGtc6EBq+98pihAfmDdxlMMOEwKo86Cta+vnIdVTf93CO/92e0GCVSNwLLx5GSBKBDCEQAsBEaTDmHenm9bjL+5f/AXR1iS+iVIhmNR/HRVTsoY+9DAOyQewCgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515043; c=relaxed/simple;
	bh=QBSDWr0jaVh7zeXBOsel/rJ+6ajgeIvN4uQ8MGcm7Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hU68dqPQPsBNQf4M3vdxuPrTEvxYHlg9gkguC/Fbf2irGewrbRKD4WTfyC+pC16gCmtbgC/h0HF4JvhzCtZlayE/RI7KQzosZWWGvD9UDUcYB1iJ5u9ioeZc0XobWMK4sXtgyw/G4jBqp7WYMrpvdiW2+YMEFmMOzkii7ubm/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IXSRbhzy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXSRbhzy"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3e72ec566aso62356866b.2
        for <linux-sound@vger.kernel.org>; Wed, 21 Feb 2024 03:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708515040; x=1709119840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAQmTehuuu7pDZORVsAvuPr+CnRbLVUq10Y5vLWq90k=;
        b=IXSRbhzyjX0CHBvWAEJajL0BYaVdpQZCNtderlyXQQ8Mm6FUwt9c9gD+mNk2d9Cu3L
         kfVaaIAuIx1Zu4MI7/f8Bds4GJ6qEeTzemF15gotVzt6tcvW9G+BXn0zXge+akOR/8KL
         4RUjzH92k47IqQKVC3sUGLJlP1Rt5IEWC0wKaLnRvNSyHmdFt0GiZHFSpbCBWvAp9nRG
         HRaaSQ7pgtva/bL/dFv9JNqnkn/I5KEuxd6pvCxyUqN8S0Pz7Z1aMp9m1dfPCzKEn6z5
         wojqu0RiKtIPJYnksYOfZm3me450vvEwN9eeQ5EZ5+qkwgtV0U0qTeiDVoZXDt7Sela/
         Oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515040; x=1709119840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAQmTehuuu7pDZORVsAvuPr+CnRbLVUq10Y5vLWq90k=;
        b=UKzcLdObiA7m7Y9si9kNhsaqkHjEyBKXnGiEPDt8FPFvvWjJvm0rErjEyrdmJOEobk
         isxw3QFn8DHhpUY5LFGiEtY/1rqCs3tX0w73o6mvETFUdQkZ4eeJFskpIRFHEFeazJvk
         lGxRDI4Ujg78wW6iy/oQZE7kPq2Amrdj090FS5P+uvPj9Uu909tjzzauguAXpPYOvRDY
         XGDDec2c784VokkqwTlGxyY7gW6rkichT4wAhMmb4ET5KU+ahgRevBWyTGbEnLU0sQCz
         efrOwXVdctVTCbXA5lwILj8/M1V7FeLmDwXvTQQnGbERit7xKjz704GZvsmB4axi6Kux
         z9cg==
X-Forwarded-Encrypted: i=1; AJvYcCUphNqfqYOVnNQrNQnu1IVfTKFPkTro9KnPrUiAA50etU2iz40QLZ+Vr2pWjK9uKWC5tGCpImCKxSsN4IZJDGRMNBfkWBIAok+z07U=
X-Gm-Message-State: AOJu0YwQd3lwJ1wmm9Yhhwazf+12n/xJVfyQfZz/uYXCtssqnlLVs1jK
	tozvS2cfLeVOyZW/n5pz97qxdyuURvkcmACKFQWUL4xWrb/eJsijW8FAimALSvk=
X-Google-Smtp-Source: AGHT+IFMtWAXfF6096VkEiNa5/PKLj4TmtqoNEwWGCceJzPnphZEPIX4fokcFB8EcevGHD4Key3dhw==
X-Received: by 2002:a17:906:368a:b0:a3d:bb68:be30 with SMTP id a10-20020a170906368a00b00a3dbb68be30mr10815533ejc.6.1708515039933;
        Wed, 21 Feb 2024 03:30:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id g1-20020a170906c18100b00a3e278c4a3fsm4393712ejz.53.2024.02.21.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:30:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>,
	Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v6 v6 1/2] ASoC: dt-bindings: qcom,wsa8840: Add reset-gpios for shared line
Date: Wed, 21 Feb 2024 12:30:35 +0100
Message-Id: <20240221113036.23905-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On newer Qualcomm platforms, like X1E80100-CRD, the WSA884x speakers
share SD_N GPIOs between two speakers, thus a coordinated assertion is
needed.  Linux supports handling shared GPIO lines through "reset-gpios"
property, thus allow specifying either powerdown or reset GPIOs (these
are the same).

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Resending because reset part of the patchset was applied, so this can go
independently via ASoC.
https://lore.kernel.org/all/38fda6619769da7240517982adfe734cb653ff5e.camel@pengutronix.de/

Changes in v6
=============
1. Add Rb/Ack tags.

For full changelog, see:
https://lore.kernel.org/all/20240129115216.96479-1-krzysztof.kozlowski@linaro.org/
---
 .../devicetree/bindings/sound/qcom,wsa8840.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index d717017b0fdb..22798d22d981 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -28,6 +28,10 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  reset-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
   '#sound-dai-cells':
     const: 0
 
@@ -37,11 +41,16 @@ properties:
 required:
   - compatible
   - reg
-  - powerdown-gpios
   - '#sound-dai-cells'
   - vdd-1p8-supply
   - vdd-io-supply
 
+oneOf:
+  - required:
+      - powerdown-gpios
+  - required:
+      - reset-gpios
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

