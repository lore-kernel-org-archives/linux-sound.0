Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4732019DF7D
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747935659; cv=none; b=lXYLHH8iqgnsfM4QkfVhWbgY7lGK+JqOEtv9jQmdmoRatg/Sg4PA4nBuyIKDsFKC06NU42GaW3KQAWhkSyURP1Uk559sDm6sDez6T6gv2DVu+fQfobzUjD4SP864OzdsRUspkU42s3YzWzHeYegNtP/9hhWv7YiKTfHBsQUiJMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747935659; c=relaxed/simple;
	bh=BA1jWJVLID2R9S0NjaKb06T2AIwSrYnas/chmrTU1rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IswB6GLD1l70877orEc2FsS9GKKpLZwwOoYk76cyr5iu8PmmJccJ8tU/pQC+ystXtnbi9210m8qrSYOb64LUK2Xnsu/uQhhGA6sBYhBANimPumiEf5sFa2SO4MI6j7zAJWhCINZa0Luy/Fsz2mBiKoAjNeUM0Mx9hMSD0ItBrpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Muqhb8Ad; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Muqhb8Ad"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so67167775e9.1
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 10:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747935655; x=1748540455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=Muqhb8AddjGNLkck7BnH5XbhAgpOCaWKnfp5eRoGrgnqceHhL1k+JhcCTQmY8MXG0G
         5YRqM891x9LpkCoWXv6+4A3FAJtbp38jUxW4oJXsg/o2pn/hg5GHU5fuTJ3Ab5IcSWWR
         kAnBaGPgkDwtBY3nl1+nDstvgH9N9AXs/SMXBrVyQQUW/ABAvlw/g7nAt6B0vjor1Pxv
         hMkHhZdNKzMCb9KOO5IgVOYmuuos30Uhf/cwUHnIhctfqew19UqrfbBAAK1k6CR6w7FA
         pF1zbvmFPYnKfhftZzKDsrRvKCfzYyGcwmMZ+jSSdyI8Cf7XZoLAMvAmXR9eOClRleOb
         64yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747935655; x=1748540455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeVSdZTcESAIY7Aim6YoJ9ax5VRvE2UjSLkzmxKP1NA=;
        b=q8U5JIFR/223thZBmJsIcD+w6843gh8wjICB0UqssSUaGnYULUnln/9PGF1O6kkCdq
         FiLFndP5JMLrdk8kisQrGOkvhTUsxkdh5wtcqOcBY/+eyxwXlI1iPcaUesBeMz4rF2yT
         BTp0QtQcLaacR75A6bUroSr5o9xzBliFcIKW/y5h3Gd1SwVB04E0um7FUpNvz1Dsq7FG
         VgL9/85HwuBB3gscVw0P9Y5nfIAMH2x+Mkcwrwh5q67Dg1Kq4ghGucY3YRfiP6HziG0n
         JVgAHKQIwtjzVfoOJNgtahMWMTbitGnUEx5HnPoN9DXB+gkgQKGlw+nK8moLBrhB7vHP
         5qag==
X-Forwarded-Encrypted: i=1; AJvYcCWmnaXQRnsBAz/n4JSK+GWz9qyCQuoK74FJdqCsVwBlH6fxS1deF3ge7/PyZD7oL3vaOWcg1vLzGNfXIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+L+n16yRFosU55S0uQZwJEzUDJmF8ivM7nP0EuneeMZ6L7oy9
	5UuEsm+HzvPtGAf8uQcSwc+h+SHj8VCqYBgMlMRtEknLFDsfc8tuqtsVD9EcpQSuOdI=
X-Gm-Gg: ASbGncuulVMgQYYOBQU+KwxN4QJ/aGMTFHIFuwku8qBby+RZTR5OxjTSjT6ezF0jRJP
	3tfrPL4HCyzGKlBT6rFE0hYlJcl6Ld++5QRmHoj95Raaecz3qckyNpZO6cB2+GfGV6X1j2yYq5x
	/WZoWhnZDDO+YYHmyIiU07jvJoP3STG1RjqEPlTWFeO5sJ8jWy9lJioQMlf5N7h18G/UN3mFfTw
	fygj6EKOGa9VZSvyeTiUNRsvqxEMsU2lWotzidfpyf2Mxk2AudDcARvlQjVxWXpuHiLvMX2ufrS
	wmpAeWHuNhcGt1Aro52OwJV7kX7npkmL6xWNZFFvrZWP6uch8/AB48fPgiQ=
X-Google-Smtp-Source: AGHT+IHIlbYVvYafpeIO81i57615R3Scfy/N8bbFiofLBN4IPVuaPtS1SroaRCpdNZVnFOjNX4w3Fw==
X-Received: by 2002:a05:600c:34c4:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442fd6752e7mr269251575e9.27.1747935655391;
        Thu, 22 May 2025 10:40:55 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:6c33:c245:91e5:a9f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f7bae847sm109563195e9.36.2025.05.22.10.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:40:54 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 22 May 2025 18:40:51 +0100
Subject: [PATCH v3 01/12] ASoC: dt-bindings: qcom: Add SM6115 LPASS rxmacro
 and vamacro codecs
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rb2_audio_v3-v3-1-9eeb08cab9dc@linaro.org>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
In-Reply-To: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.2

Document compatibles for Qualcomm SM6115 SoC digital RX and
VA (voice activation) macro codecs and their clocks.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml        | 19 +++++++++++++++++++
 .../bindings/sound/qcom,lpass-va-macro.yaml        | 22 ++++++++++++++++------
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index 92f95eb74b1928fde11ad86ab6344f274bdf7790..697c5591ae7cb82633ff0159fb31d08b57c11b97 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-rx-macro
+          - qcom,sm6115-lpass-rx-macro
           - qcom,sm8250-lpass-rx-macro
           - qcom,sm8450-lpass-rx-macro
           - qcom,sm8550-lpass-rx-macro
@@ -80,6 +81,24 @@ allOf:
                 - const: npl
                 - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-lpass-rx-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: npl
+            - const: dcodec
+            - const: fsgen
+
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df57c8186acf4cd7bb99e38dbf89f0..a70c0f36389269756b724889c335c1b0bae157d2 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -14,10 +14,15 @@ properties:
     oneOf:
       - enum:
           - qcom,sc7280-lpass-va-macro
+          - qcom,sm6115-lpass-va-macro
           - qcom,sm8250-lpass-va-macro
           - qcom,sm8450-lpass-va-macro
           - qcom,sm8550-lpass-va-macro
           - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - enum:
+              - qcom,sm6115-lpass-va-macro
+          - const: qcom,sm8450-lpass-va-macro
       - items:
           - enum:
               - qcom,sm8650-lpass-va-macro
@@ -109,14 +114,19 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 3
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: npl
+          oneOf:
+            - items:
+                - const: mclk
+                - const: macro
+                - const: dcodec
+                - const: npl
+            - items:
+                - const: mclk
+                - const: dcodec
+                - const: npl
 
   - if:
       properties:

-- 
2.47.2

