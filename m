Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104151C233B
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 11:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944960; cv=none; b=Gj70CrnpoJVXRaKPbnNopxVdCqt3MnkB4SDtW1KUcKZdahS/JYhfjt3vYVWypPMiiCASlhbHlNcwAXdmV/tD1qQpZJMdQB43owiGLC3GjVG1j3DLszN8VHdZUgkPRgqczrBgRXG2RIC3GLKGroTpLmgozb+3Hvc4UCRHti/RxaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944960; c=relaxed/simple;
	bh=HK69OtcF/Vf94b5GhLN5TCYnV2gFptY6A3zc3NCas5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UJ8FJcoK+ZjL7VaEEpD0/NlbQOGGALrgphbUQN5gJHUlNy3EIs00TLiVCnPSXf9VuOGF7mM9dddTbKo8Gb4plALLiGhVKYGK1FskNeHPTbKg0NUmEfIgEY7/Jij3KpBC2D59R2cUZE8biLEwADBWSSmhXLVe4dG4ipzB/7dOXjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHJhtWiB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHJhtWiB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36868fcb919so395448f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 04:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944957; x=1723549757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXVpYau+0lr9R+A94wXB50FKZnvpt0eTOY5VusN/TE0=;
        b=YHJhtWiBMuEBA1sx9mWsKQSG8KgA2U8hzYVTChGZa1GE9v84iSM1j2kLcwJQuHI7KX
         TAbWpKfeTntfrlzjT7IiOoq02UIP8eWJn33ZsWwhhyREqqnqCCgoQiLvzMeaMvDVMotP
         K9qycpyFYPSwaKwidIG1JyqoFk69OuK7efFEqqQuKLHWyzq4/r+Le8FqqBq1+lmCy4zL
         9yLRXV4AI40aqXBZSbelqzjruqTu9I2SIWD2eDMi27BNJNMRpNDTvicj0beZtOiuHcHq
         +ehXASoKwdSRf3xjvyZX/0yxb7fMVM7xYZb/8P7SDhM8LRk+yogFnfVdBouPIQpOGY4e
         jGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944957; x=1723549757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXVpYau+0lr9R+A94wXB50FKZnvpt0eTOY5VusN/TE0=;
        b=NVfxmITDQ0xvrfTDh1WnH4ni1emth1rcZg2ypSY/8rYGRzUGBpeSb7kFT3/nMLsjH6
         OKMgSfr1TQb/oUpPGIyrfyqmt7Ux1+eHaASDHtRGTPCPL9ula0xR2jFeWPxvIrzfKp0j
         L3V/1JSusnCyfwzOr4VcLGdlva/8/+okVQvKHg2fNGLImUZrCynEBHmv2hDxc3zvBXgn
         r+XxLNIrjbqu7jqje/wbxhuYfdLvicITZux8SedPmRveWKOzSxeyasOr3+gkdMMPgI29
         LjaCddOHGy0s2ivUUzr7DU7mAmQCpx7R8ZPpjQ947IH3GT8cUZ5PENEBVjAKnG29/Vey
         g5ww==
X-Forwarded-Encrypted: i=1; AJvYcCXOJMkh2Gu1Hjm0/Zw13mybeLktkXjMzJjIQhRIN09NzMqG0uY8WcowuSJI40OmjhPT5rGmqkEA+h152QXBGT7U28DqFbkOqcgn1dQ=
X-Gm-Message-State: AOJu0Yx1RiEiO2Jo00Qc18bLTBX5uaEm2iq9K89uoTW4UpG8yZzk1Mf4
	WKvCar2cAhZ2S+vxmIHUIYjfFy/DmolVJv9uil/GnaVmq2IFhu/sgn+qLKCP1mI=
X-Google-Smtp-Source: AGHT+IE57sgPG7MXWgWPSR/NBtN6707/MUX7FS0F0l/Q4cnzEb2aq3Uun92NAyWQJVWdu2uJJE8AgQ==
X-Received: by 2002:a5d:51c1:0:b0:367:89fd:1e06 with SMTP id ffacd0b85a97d-36bbc1312c6mr10073817f8f.36.1722944957105;
        Tue, 06 Aug 2024 04:49:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e9d887sm177773605e9.43.2024.08.06.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH] ASoC: codecs: wcd937x: Fix missing de-assert of reset GPIO
Date: Tue,  6 Aug 2024 13:49:13 +0200
Message-ID: <20240806114913.40022-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device never comes online from a reset/shutdown state, because the
driver de-asserts reset GPIO when requesting it but then, at the end of
probe() through wcd937x_reset(), leaves it asserted.

Cc: <stable@vger.kernel.org>
Fixes: 9be3ec196da4 ("ASoC: codecs: wcd937x: add wcd937x codec driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 13926f4b0d9f..af296b77a723 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -242,10 +242,9 @@ static const struct regmap_irq_chip wcd937x_regmap_irq_chip = {
 
 static void wcd937x_reset(struct wcd937x_priv *wcd937x)
 {
-	usleep_range(20, 30);
-
 	gpiod_set_value(wcd937x->reset_gpio, 1);
-
+	usleep_range(20, 30);
+	gpiod_set_value(wcd937x->reset_gpio, 0);
 	usleep_range(20, 30);
 }
 
-- 
2.43.0

