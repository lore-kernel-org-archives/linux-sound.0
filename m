Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17BF273FD
	for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752652210; cv=none; b=mDSTwOR2mYhvCDcBwLCA4lDDn2lrs9Tnv8kpmCNpY8IzP12Jb5AsUOdwK6ax0Pk2Or7h9A3yIOtfC5ymLA0U8rxOPB/Si10hfOkmykHXvfWkah+4fzg9DXdNVzoZRo2jJHSpjMKSqc76SmKc5cZLXr8lkKvwWdNHZadyKRJcl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752652210; c=relaxed/simple;
	bh=1ZRb0G6cYOmLEfHqu50vnKjcHuLohcwEx1xHyXDSWDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FbG4+MwszKwTqHpHEAcxuo2BEWB8aHUAsrtjML7s1UTY7wBBi4/S8cA75i19slxbP3Ir1zn/xmb4HCguWagAdhjx6XnE1YaxMFxfUT0Hg2J1HUdWabihjOpZGNTB6APFxqGKkShqzyG1wCHPYl3YhaguLdQ27w66Y6TbrFJ8Wjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSbui4JH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSbui4JH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso856496f8f.1
        for <linux-sound@vger.kernel.org>; Wed, 16 Jul 2025 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752652207; x=1753257007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=If6iFrnbvf7J8sBEQeb31M79uFX7ow0o3Z1tlhPnI1Q=;
        b=sSbui4JH8MlOmY9u9YHdckm06ySzbU8uUioksY8GS2Tz+//kVARuoYxmuwMQGqXJzq
         eRpDGFH8TuD9VzEWaKtg6o1Cap9703US22CGKboRYBbzSacvRVz2wEk8e3kXMhkIV6A4
         cUBOMNhvXhbtl88WBv+Xpb6Q5fW5pKBTSNAUcsK653ysWAehDfi1RINttsTqmTCM2S+8
         5ANgA38bsYOqmlB/SpMQoXjXWOZ80ej2pRgnsw1Y9kzoTeWtLz5CBLSeCEH3DYM6QZ0C
         qRMSS0hMIv2GREH1/qh03rA6CIO5jBv6A/NKKZSmEbh45W8xbZ9A/+NraXvZCNULCbUL
         roNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752652207; x=1753257007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=If6iFrnbvf7J8sBEQeb31M79uFX7ow0o3Z1tlhPnI1Q=;
        b=Kz9G6reU7Ok0lOvORTUEIruZtWGzgnKjdEOh4c3PDbhKJh8ShFkzFpCFGjhj8bioep
         ChdkAS9wlO8OsqBdPLyc4W3mYrp2kzehjfoNHJb/RBB3pbXwE7bDhlwnaVxA2TB75oPI
         UJQ8GQf1SIvj2ShhzfVx9X3Ops1Hm2INe+XUdaTgvrSmd69k3CZQpMPrvaoP3wQfJWvk
         8ZAabUst8rB1NN5PL7wZqRXBPu428RjhbF0ZR1WqQsy0xd84P8+EDkjlKijqeSxGNjso
         WAKG4JlLQ03ixuVxjorrWHCLnYYmCzBogWUDjS6IqLYyZNtWIKRISmPiKpf/9sm2enjs
         uaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXECj1EJPqhEJv3/vx8KNc1K4FPeajyTLdXAul9F5d7e9pFYfqN2BvzaFf9l2XsIhn5rFl4GbH0XxaFjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBU0WUCGTeqv8ZHVbfrzlvP2JAcDp447NmdaJJzyMMO0uemmiM
	s835WRqXFw9i6iNt1thLwd+NGIBAyG86cb2J+FiTsc36XhahG5m2VI9NAcAtp927CGk=
X-Gm-Gg: ASbGncuFoCicuAdp+TzNGvu318TN82Rqax1gx2bA3QpYCl8lgAQPFDPGrQ9QDR+L+hh
	24IiDNs/NF0TFerzT9uebQLHxTcswXDKsE09VpMHZI2nVz1uSvGREQOqOax+tPF90Nz8RQuj7cp
	sP0UWiKQtobsK7vYKRJPfGizx13GMNwJ5smWmJpL/s/0Yor6WwUU2kQSN0SH9junKhHyf+Hjy5N
	PhQmlTrTecuEmzupmJyNAo8V4Po5GSGi7ESxRg1L5VXhX2FLO4z5hk1s7KiekCMqZDpzlimnSSa
	mVp4+U7oH5WjYFU1DBsiqOg9nYqKYZixOttWURYT4f/Lm5eKi1SLsk7sEr7Fb249GZ1PWaCkWaA
	Yv7Y7qLnAo8ISYeMxM5xCRRcIJHuQ0/HX0tI=
X-Google-Smtp-Source: AGHT+IEUjEk985nnWZZmAjTTpQ5LEJO/pws+gSqB87/tDY1yUfuO7gwUbG4RBQkqZqYe4K2BbRRygA==
X-Received: by 2002:a05:6000:2387:b0:3a4:d0dc:184b with SMTP id ffacd0b85a97d-3b60dd52efdmr606087f8f.6.1752652207043;
        Wed, 16 Jul 2025 00:50:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e2fasm16842269f8f.77.2025.07.16.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 00:50:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: qcom,lpass-va-macro: Define clock-names in top-level
Date: Wed, 16 Jul 2025 09:49:58 +0200
Message-ID: <20250716074957.102402-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2427; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=1ZRb0G6cYOmLEfHqu50vnKjcHuLohcwEx1xHyXDSWDA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBod1mls1BxkwzpHTFJNzDPEYinCzt8GBFEw8y/7
 rmPe1g8IGOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaHdZpQAKCRDBN2bmhouD
 14DEEACVjdwsw5u44zs/5I8/ss8mI6u8MGlbbKxxIOP5ouNZGmAuXUUZ7qu0fN1KLI4jmMpPdfV
 L/7ML2TZYpHDBAa7w1chRYO05GCoYsIBcIXEiabwiaTlRgVCO4cfFlcfSuMPbmOIT8B76nAixp4
 62tz0Hwf+8EtYDcrnjpC1rbVkZHapdN+fKy8wpzIUHAuqqFNJBvRQ3d6Z2q1qrcYfcSb+wU3Hns
 G4+68mMCTM/+RGKiGp+v2jdTXDuqHyGjDjLkxU2PiG7JJmykxaouEfinR8PQHGlTaZ6A+enKbd2
 R2v7Xi2OVwOhyDHyTaFN5NfXHnizpB4CwZsCywvoESX18sr1s8j+vfQJpTmsGXeHt9cx/vDfb8p
 QPgkWQyFZd7o1IW3A5YBRGdPT2jtxPv8IU2oI/DKxJGLV2ft3qm+peSeQrJHisfuX3F4ZElOFpH
 rkrBbWsjV/fUa4J9l3DJmSmfuilpbh2uA47cBqFL6Xde/eITEejS/NoLfz5L5wusTLuXIZoCyoI
 7tW9Eu3d6EK3NiMWjJpkYFRi81uga0ENgDs3fs561HoqH4Y7cMA87mF+4avKpTC9Z/ovq1CdbEi
 hRk5mahclOFOW0VBWC7jxukO4KcLf+poQmUKgJf0NOJ7sXkCFNKPJEtC0nEALqkiUYcECzYiN3N fWCqVyklhP++ivg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Device variants use different amount of clock inputs, but all of them
are in the same order, 'clock-names' in top-level properties can define
the list and each if:then: block can only narrow the number of items.

This is preferred syntax, because it keeps list unified among devices
and encourages adding new entries to the end of the list, instead of
adding them in the middle.  The change has no functional impact, but
partially reverts approach implemented in commit cfad817095e1 ("ASoC:
dt-bindings: qcom,lpass-va-macro: Add missing NPL clock").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index f41deaa6f4df..dd549db6c841 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -40,7 +40,11 @@ properties:
 
   clock-names:
     minItems: 1
-    maxItems: 4
+    items:
+      - const: mclk
+      - const: macro
+      - const: dcodec
+      - const: npl
 
   clock-output-names:
     maxItems: 1
@@ -80,8 +84,7 @@ allOf:
         clocks:
           maxItems: 1
         clock-names:
-          items:
-            - const: mclk
+          maxItems: 1
 
   - if:
       properties:
@@ -94,10 +97,8 @@ allOf:
           minItems: 3
           maxItems: 3
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
+          minItems: 3
+          maxItems: 3
 
   - if:
       properties:
@@ -112,11 +113,8 @@ allOf:
           minItems: 4
           maxItems: 4
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
-            - const: npl
+          minItems: 4
+          maxItems: 4
 
   - if:
       properties:
@@ -130,10 +128,8 @@ allOf:
           minItems: 3
           maxItems: 3
         clock-names:
-          items:
-            - const: mclk
-            - const: macro
-            - const: dcodec
+          minItems: 3
+          maxItems: 3
 
 unevaluatedProperties: false
 
-- 
2.43.0

