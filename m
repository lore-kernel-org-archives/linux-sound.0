Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03099204F71
	for <linux-sound@vger.kernel.org>; Tue,  4 Mar 2025 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741084696; cv=none; b=Z7R/vpUV+IiZ8QHN9dy9TMmIfRW8BAMoYyvtg+c+VztUF6zezMIdkalcvCKr2sRqsxsI9MZYaJd0KlGrG3gAXJoBvmhmRysaMEpbAyaMjT3OSnHK98NWdCrVheJV2D3n4JnuF3ic68NV2qxi2WBNLLzEPo2acV5H1auvexUT8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741084696; c=relaxed/simple;
	bh=Wam1Dxy8Bbgc/5NwEFi/OZRhWrfo5AHEYP0wl2UfjTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrlUdK1agR8zxXswLN+B1u6Dh4zBr8na3SWvmwlGP5wF5YyTukEA2lX5Cpkumzt96hKa/SUCcGEMufStl1d63ENXdrJhpWEwn1NS9nig7bSVDnZXIGFD0OFKl1tMA5uosUcEX0qt9w6oDz3Ym2cEgw3ptf+Y0s+g8kP3ZjghNP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jANpfjcJ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jANpfjcJ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a7d9a87bso4650705e9.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Mar 2025 02:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741084692; x=1741689492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DRT6zOAR06y6e5a1u/1hudMd12hMY8AMBwvepK3I88Q=;
        b=jANpfjcJ+9klFJP5zxDmYByJUCIKEF4rTDHsq1rEVZ0D26cDjPi/ABatWZDqSwZ4j5
         EPhH94D8M4PVKHYdrkMuiOyowRezCwbns0KhmJyWJ7TDMAng78lAoolnaRS5zoEt5wT6
         F29WQW27Z05V/8LgBDGP8GF0mqxF7xbbdNBODknzTaC0/XwsVaFBWs8FCQZJLepLQdBP
         JpFGZBxa8R/SFLW3QZeql1dmVabNgMOzJZUDenJAI9yawJK3YnTDXbseVGZWlUzUzhKU
         A2VJO8AAje4AfyEnJMS/QJEvCUEWya6uWiiQaB/ylE3HZ0HUWx8o5ClY2Z4n9ig8CsnF
         TdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741084692; x=1741689492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRT6zOAR06y6e5a1u/1hudMd12hMY8AMBwvepK3I88Q=;
        b=fiFrqiAsV3S9lENh0I7TU4lEkQdH7WFiXOZKlmUHo7oNKIqDMqeoxgbfcXmsWUCIxq
         XDeazbushtho+GYqgQEDqEL5WtIQpg7AbtbR1qtXHl+vz3IpwKRJc32DzRl1z3fSUDmX
         Ijx4ji86aSxwFs6uzX7k/SZfhpJwpiIjmT03s+WSUHBM05pz6cFlbCt11kY39RijInur
         112KX/9KDmJSrIcIP0zcZbp3DdvjQdGLBvMGVM/gouSPRYI6ws5P/ptR2E/nxmQj1TwI
         lp9MS+emb0asI8o0myA7qSiOgepB4JPo9noZTn46ZYz6g6upWFkOqF08+AnrVTJHXhuU
         qk3w==
X-Forwarded-Encrypted: i=1; AJvYcCWIU5KPkla++Pj+i/mmdRDHFxijdGAaqE38vaLZJW1Diz017DkpQJ59E3kBEMbcN0zygx4IbdHhhuGDGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCivujEUfyQtTphoG+m4+ZtYG9/xhWbVwi2T2nBlzEY4WnkjI8
	HsyGBgMeqVwfkcuXgpAoqLrQdEuo93BXXcghpYLSlpecyePfT7w6PmIhc9t0Pkw=
X-Gm-Gg: ASbGncvCMpRPKjIdiwsJxGAdGu/nqZ2K7M485vxX4KOSbmaoc4m5V9EA9wWKBKCuAJQ
	8VF3tPJLuCwV9TO+X1UB22pf7Niny/CVLz9hn7VM8Amz5GNDmD8NF6Z+xCRDVAgg+C2Db6six7e
	p86JDVhlmItmFOC3bTM3tPa6zJ0cwj2DxSnKMtaWWKbkHgOSJQuGfHqfJbPCE1PK9QLVuR6AUFr
	snqowp89j8e56gi7ZdsUGNoh9+SZ+Lz9gAiWWExb2GvRP3WeV0dehvb9/HXJs41ixnewqPEQlIi
	92D96hQq4Tov4BF795KCWahiVQ6w5l6g7GVBWaGf7Q+ALJ4no0QCdPWR7qo=
X-Google-Smtp-Source: AGHT+IGfNFBtTCkGMjxpoYoMf9mCyMbqZUVYcs5tbE+Zv0fhEqp67tfpgTNytZPPOfLXj9HjjGF61g==
X-Received: by 2002:a05:600c:b96:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-43bcb604fbemr3817175e9.6.1741084692178;
        Tue, 04 Mar 2025 02:38:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b694524c6sm198574825e9.0.2025.03.04.02.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:38:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Yang <yangxiaohua@everest-semi.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: everest,es8328: Mark ES8388 compatible with ES8328
Date: Tue,  4 Mar 2025 11:38:07 +0100
Message-ID: <20250304103808.75236-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on Linux driver, the ES8388 looks fully compatible with ES8328.
One upstream DTS (ARM rk3288-rock2-square.dts) already uses ES8328
fallback, so mark the devices as compatible in the binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

ARM64 Rockchip DTS use only single everest,es8388 compatible, so this
will trigger dtbs_check warnings which I will fix in separate patchset.

No ABI break/impact expected.

Expected dtbs_check warnings:

arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dtb: es8388@11: compatible: 'oneOf' conditional failed, one must be fixed:
  ['everest,es8388'] is too short
  'everest,es8388' is not one of ['everest,es8328']
  from schema $id: http://devicetree.org/schemas/sound/everest,es8328.yaml#
---
 .../devicetree/bindings/sound/everest,es8328.yaml      | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/everest,es8328.yaml b/Documentation/devicetree/bindings/sound/everest,es8328.yaml
index ed18e40dcaac..309c4d01db76 100644
--- a/Documentation/devicetree/bindings/sound/everest,es8328.yaml
+++ b/Documentation/devicetree/bindings/sound/everest,es8328.yaml
@@ -24,9 +24,13 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - everest,es8328
-      - everest,es8388
+    oneOf:
+      - enum:
+          - everest,es8328
+      - items:
+          - enum:
+              - everest,es8388
+          - const: everest,es8328
 
   reg:
     maxItems: 1
-- 
2.43.0

