Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875D256C92
	for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742902872; cv=none; b=uAKOMs0bUrEZyGZ+TvsHEQa1b7G1P683UkBSnZN1Ow2c2+xcltjwe/WZraPZOjhXWgOa08VsguyMFEj/kFn/lPQ6AGOWasSHipo0L6njbTxVEaV8mFFsGsVxkelqd/PFl9nBeh2ZTW+VpFAUic0Cw524+JoLiTTg61p6Hadilwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742902872; c=relaxed/simple;
	bh=SaEurHg9my0SgGDfooWj4uP1HnHehhMQjbSphU85xtU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TXc6i1TrWYLmRJLKhiOSO6VyQP6E20be0y72oumqH79Qh5qypbIaaCgj56auB/d4Mzvvyr62qmnobknPmo5Fg6H7aB961zps0LyqmgEMdwUc9JxupH34Mz+dzKaz6EkfRBSLAQLWrynCQmjvjACe9NHalNuab+Rtm5+PPn9DjTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sNiEq731; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sNiEq731"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so3082935f8f.2
        for <linux-sound@vger.kernel.org>; Tue, 25 Mar 2025 04:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742902869; x=1743507669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=sNiEq731KTmc1jjTcm9F7gE2NNji+grJtIKmNHJ32ZmXJLv/+37Ls9RS2WPCzmPXzz
         rxosFbjIq4Tt3l+HHYcXACz92l76Lc2zYqYZjs1GRYgqb5ubRUnjBkWJsdrAuCHZNN/t
         ItDoHUTRGt+azghgSgnlrabAk2ez4U1eg1CIprAAMlzJdaAo64IPldLV0YDotlUvWn/T
         /kCKnd7Zh2z+rBhmzwIaoy0bHQ4tPoKdTxeAqDM6OEDLLfaMfKQo78VgKrLiaegdWWO0
         yM0sBQn0REvebg6R5befbv3mpjUyC+6aWX6AvrUObxQ3X1cR42tEFVfn4Szz1JEV4YKx
         Jrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742902869; x=1743507669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ6QvHirUebkLT0cLpo0Lkee0nQc81mUaPIyQl+HrrA=;
        b=n6n/giUFHHffezYBnfNJmNhrHyIWjnyXHkuPLG2AJN2bVGgQsdPokFOoHGAabbmEqG
         sHIIJ8kB6J35w00O5Dpf734VlvZquQscGXf5jh0MCMGpvhOl+0hlgR+Om41qcoaDJzC0
         22bH9K51T5tI4+8uirt0fLZuk3KMqq4+K01QV/i6TbXcHXKLqZvpjIHpD5B4yem/yVu6
         gmck9VkqzUGy1B45PjwmAt29VbAcf8RFOcJ6GvaB5EmAO3SuEuFlb2LiuvjOlebHYGq6
         xjYKyZUlZvM0TUG0JxhNYkUx2u1sNBwKdx7VgA739RjxnGaPuqGXO/h718P+L7qsQwn1
         K+MA==
X-Forwarded-Encrypted: i=1; AJvYcCV7HdJ5CJUTpnlV/9G/j8FtjbgWIi4tnvvQqPrvrRAqfqXSV0D94OGTAEbw9BZvkfi1JGBNPRtkzx+UWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRzc+QsjYuQbfXQdL/BREvpkDc6UfwHN0uVIHBpg6LPr3trmhh
	Inopb9UZV5MCi8kQ2E+Noh/UjROd06vpYpMyVi7z2Kck5yk0BbDBTvvBI8OujDE=
X-Gm-Gg: ASbGncsOqVJJrvarQhcDHRHUZub9/Ag0RirqtNz5Vthpw2aSJ7DWzkkejQDn5XRzT7x
	1cv9UzQg/zVM/M5nP2EpNqTjyBUQA7V5FuRukucmpI7aud9ddZhOcV7jShMDPkyjk3YuAq/GMxZ
	W5QcbJEkKoTX7GjttUp8MiuSprD6KGMGlUuhYLPe+jNIOl8nFE0tZq6YNPvQrpfYCDnMOFpPB3B
	EV+I6fP0ltuNTFWJLO01JHk9cU3T//FUkxF1FELA7QgXekYb9HKWUckp+irQsnFW//75R6bfHw0
	gcLhVLkcaloi6WcPNVZBHynnBGkNJITxEMBK/RSkfWprlcTznXtKk7Uz84DKv1qB7fn9dA==
X-Google-Smtp-Source: AGHT+IF1Bqa+5FDwi9MVrJZo7CYKuUtOKzFgzROxuovQWzOm+8iaGpshZQMW9c6GASBDXYEB8yBJ5A==
X-Received: by 2002:a5d:5989:0:b0:390:fbcf:56be with SMTP id ffacd0b85a97d-3997f892973mr13392870f8f.0.1742902868882;
        Tue, 25 Mar 2025 04:41:08 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a6326sm13213330f8f.29.2025.03.25.04.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:41:07 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 4/6] ASoC: dt-bindings: wcd93xx: add bindings for audio mux controlling hp
Date: Tue, 25 Mar 2025 11:40:56 +0000
Message-Id: <20250325114058.12083-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

Move to using mux-controls so that both the gpio and regulators can be
driven correctly, rather than adding regulator handing in the codec.

This patch adds required bindings to add such mux controls.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 10531350c336..ab1c6285dbf8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -23,9 +23,15 @@ properties:
       - qcom,wcd9380-codec
       - qcom,wcd9385-codec
 
+  mux-controls:
+    description: A reference to the audio mux switch for
+      switching CTIA/OMTP Headset types
+    maxItems: 1
+
   us-euro-gpios:
     description: GPIO spec for swapping gnd and mic segments
     maxItems: 1
+    deprecated: true
 
 required:
   - compatible
-- 
2.39.5

