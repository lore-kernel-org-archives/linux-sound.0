Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D851BA87B
	for <linux-sound@vger.kernel.org>; Thu, 15 Aug 2024 16:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723740810; cv=none; b=haHICT0JSKkPYi4fepWfVQ0v/ivaZZjhQnJflXfXO/OfcagtCLmAfqJz/U5v/0+ehP6UfEMjlZJjSp4v4uIvA8vcaRyuVRygILTy2F0w1kkrJF9CrnDw1f9NZOOxdbx64aNVXegcSlH0YFNWtyG42K7wnyUU+L40g+PUP1m/oDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723740810; c=relaxed/simple;
	bh=8gp1z00XUPBPK/2A5YWOe/yOJ5ggrhQmUd1FrjV9OlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YR29NH8KMVAFpEjT+7BWSABzseM4Yf8ubDIBBd0yTLxRW4kW9URUggZpyFuamEgEAmLqAzxQ9JnSCPljiXvZMJ/m85+TuM1esgB1Zr8M0apNqPqTtMINnibkzk0tRKNHQUaq8m5b/8Vaj8+o0fJ49+GHhcbihjMyMc8PYQo8f3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T5+c2ar5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T5+c2ar5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so163493166b.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Aug 2024 09:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723740807; x=1724345607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iY0vaXx2PRLW4vzBLW/cAdjdL4sP5M2yeIYGKZKArlc=;
        b=T5+c2ar5L2z8Kh86jchBjQ9r1ryBPTHHAFTlj2vCJl9qrQhjBNqkkzopYGZaSJ1RFq
         mA0VBQF8XbWBUtOe9qEiEZ1N3MqN0DGB6fsMGtLXWeHbdTdWtZRJgZT6ElXQAYqgAl3M
         Xx0BX8TyWh7nMb8Ft5gVZ37lQOk7uDQKHVvySobIGeuDcJHxFZ7xe0n19+p7y22vNjNK
         et/9goU1KBPT3qMUaQqQIpdH9IhlFFUC3PtE9p7E+rfreUpR9MLvjtFulxBwVI0q1/Sz
         WWChc4KuPrhqvUfzeWi4Ar/IoWYXbuTT8/kX4FGgZEUKxzjiqKzyZFeEQ/Wx1KYrLSx2
         2oFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723740807; x=1724345607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iY0vaXx2PRLW4vzBLW/cAdjdL4sP5M2yeIYGKZKArlc=;
        b=fsjZbISWr+/Rohzk0IMu4O4fhSY1cqf6j+L40Z3FJWcfbys5uZquFZrsPFAk8Tz0zw
         2Z8nY4XbZpepVg+mvzS4LzotQOuCwBxnBJ5HHZD3JVHT9E7wYfLTE0EsrhyNRrOHtWVG
         HNaBoxi7atW0RO/EhH70c5dEfJIB1xzJz3lbzmJIkbnANqW01v2bo2YUMARr4EJtVvmg
         CRCe0VODRxDlsd5PPVl18ouRbYnKm3G1KKUnGHudESv643Q46r460ounwjD13MbSCHTO
         Bv1yJpN5XkE6LmW9oocFYhAYYpQNG/rsv4AZ443a8t7kGLOI3elWuHtZ51tnppQ39WZV
         HWFg==
X-Forwarded-Encrypted: i=1; AJvYcCWw/QKyQIFlHpC7/CZjkYkjpHnO5IkS5gsWiSqtXIoLPUH5M6Ys2u6oxUuFh4IlFk55PNlmFdTbDuHJXQ1T0q+O4eeVLEwDECn1uVQ=
X-Gm-Message-State: AOJu0Yys5zG7bCWH0H3hQJtb/C2Q8zJw1rcSv6X5jaWfhrERaeC6xao7
	mFzldNMLt6n28yxWIAP/mzyjVueDR4TOqrboQ5Jj6b8TwYChxSaXO/7DXY2m4d8=
X-Google-Smtp-Source: AGHT+IEbjcVOtpHdIaM4cUOULDHg+UWaORWQ5CopRakSABxr3jeAy3+Ctzkl4nqMncrj5XJRSdxb/Q==
X-Received: by 2002:a17:907:3fa4:b0:a83:62c2:6d5e with SMTP id a640c23a62f3a-a8392a15b40mr11146166b.45.1723740806958;
        Thu, 15 Aug 2024 09:53:26 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8383947b86sm126736266b.187.2024.08.15.09.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 09:53:26 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,lpass-wsa-macro: correct clocks on SM8250
Date: Thu, 15 Aug 2024 17:53:20 +0100
Message-Id: <20240815165320.18836-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

we seems to have ended up with duplicate clocks for frame-sync on sm8250,
it has both va and fsgen which are exactly same things. Remove the redundant
va clock and make it align with other SoCs.

Codec driver does not even handle va clock, so remove this from the
bindings and examples to avoid any confusion.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 22 ++-----------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 06b5f7be3608..6f5644a89feb 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -64,6 +64,7 @@ allOf:
         compatible:
           enum:
             - qcom,sc7280-lpass-wsa-macro
+            - qcom,sm8250-lpass-wsa-macro
             - qcom,sm8450-lpass-wsa-macro
             - qcom,sc8280xp-lpass-wsa-macro
     then:
@@ -79,24 +80,6 @@ allOf:
             - const: dcodec
             - const: fsgen
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,sm8250-lpass-wsa-macro
-    then:
-      properties:
-        clocks:
-          minItems: 6
-        clock-names:
-          items:
-            - const: mclk
-            - const: npl
-            - const: macro
-            - const: dcodec
-            - const: va
-            - const: fsgen
-
   - if:
       properties:
         compatible:
@@ -130,8 +113,7 @@ examples:
                <&audiocc 0>,
                <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
                <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
-               <&aoncc LPASS_CDC_VA_MCLK>,
                <&vamacro>;
-      clock-names = "mclk", "npl", "macro", "dcodec", "va", "fsgen";
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
       clock-output-names = "mclk";
     };
-- 
2.25.1

