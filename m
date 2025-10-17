Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F2A30FC02
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 06:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681600; cv=none; b=cnlRNv6kUeL1tNnuQwGCOf5RJOQQz8yFz9395KNOdgg9SmppOWDBSHw8auqDAJK6Z2I/1ZhtoryPQrJ5+6rj1M531mEmdLkLjner+hLym71npvL8jR3l5bBvSkuntfzqHMe/ZTvkyjIy/ZNeINQxHHqpTBVQ/uFWKB27irEZBTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681600; c=relaxed/simple;
	bh=eF6t9Vq9NRea3XnH1BHglCTN0IeLN7yA62hWb+lXoeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HoQPsa57LUrRhE+L6bKv8Hm7tV1aNyGVc1HShxOstUzKADoTm5fTKVNvBirufmx7Rm6FcFSFSsh70m4r+XhdsEgG7wqoYvYzI7bc7C1AIz5tAQ+qwLKSaTWmUInEmTHq8Boa6E6hr+uvyugVKN3fJmYXcIRotXN6Z3rZXiTim1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gI4ptFeP; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gI4ptFeP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4711f156326so1250365e9.1
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 23:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760681595; x=1761286395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHSNJ2BDwx1sBbfCkuw18NdbM457O5a6eDYxm9b/Apw=;
        b=gI4ptFePjPd23cusxBMiooO9gPjaVXKeuVH16Sq9TrAYSb68PcoIxvuviViJjSARD/
         k+SHjLrGB17S00Zg4tuMgiNDgHHEjjz7ue1ZRQ2FGpD+yKVE4b7mgmemATWoGEdT8Fmc
         DUP1s85K/bsUFBIJNTpNjb9GNHnyg1/MP7qdMibT1hUzCI+VqE5cxpbXdlZcPVlSfTm2
         eEFOPgyzttZuLv3gN18aj2y8aQD2W/GPahATDDgV4yXUe+01hpVY5tPO4SPtvZiFdT0+
         bEdYNCX8lHsTm1ugX/cqKpyk8hoZPpLRPS7WN9YnAcrH7hSiuIkWGxi6SNkIxnDJQtj+
         Q7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760681595; x=1761286395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHSNJ2BDwx1sBbfCkuw18NdbM457O5a6eDYxm9b/Apw=;
        b=uNu8O0KWC0TH66SwL1ljMGoDwaMQFRMfLVq+MZaYAyNBaXkTBAoiJ/pMhtQA3+zIr2
         E15g/ZPJSg/xFT1gaPl/siOeW9VoOTIlqnWxBzOfBWZyoJGbG0smrt6CFQN1bq1sA3CA
         cyxr3WcioEtGiACmpZ/LbTwRxyKPPlayHKneAq4d8zlK12K7PDNYMunPYpfsVg6lEEl1
         ABuSf2EryZQijGdNzDBN0/29srsbXtdJx2soFTdyqTilVkqOdG2R/R4B1TSLUl3fuwmt
         FS+RYnG6oF6Bj0CsqbKwwu1NGL3XFmSR0ru4T7Kzzaz36qsnyt9tNw3FNlZs/pM7oaRm
         nbvw==
X-Forwarded-Encrypted: i=1; AJvYcCUyFPYnStGGJcCUB5l0jY9yzo2u04bl4/HaEx129oyna91TnYymF1xfzfktP1AEgVqKCNgs3zuPsg7D3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0DD16au2BiNo0kKBigYjgShIAYGUnvpNjN+tto7w5JW1zHWkj
	6xsf24ic74gIfkHOXdahKwE+xxQYE2qTF8CNdcPP/NRfsAFz3dlVszh/2gEHT6IJYPg=
X-Gm-Gg: ASbGncvqAnRB9GarwBNBvII7fmHCoIkl/25pwuXxvAeBVgnVhkMN2b7+Ir603qV5VFX
	/5h0nzui/7AQQqMa7GC6fPefJhVfOJPJLqu00tT1LiyFkOXW0wb7afNoeTMqYeSi8SVRBiPUaej
	Vs0Ozr2xPOEdVqV7+HUQbD8s5bHX1oapeXzu5/SJg/jjpxchuOJHTjPnhYlrUS6LrhBX8sxuTnL
	U0KAlC+KXuspcCnrj1gB362JPbYo9PrwzPyPXUTypxMnLONabdDmflAorr2Uvmxnzj3pD/6mAzX
	Z59PvkiuStQMEypTWbIN1HmzAWtN5AmlPFb0Pkb3SS4g2R2k0WXnERC5jMY0CnyVbM+Oo4xgzw5
	Qj1Yh/nL434qXBklG0L0KtaCRQsAQvH6TZMVCaRfMCoFfeFGZ3nn8xmtmIT7PctBBy0xN+7cmEu
	awCQRJR5N5XZDWNAfd
X-Google-Smtp-Source: AGHT+IFi56b/X0lBjC6eoQ5DueToZROug6pRk4AZnyscKkreLGme/V1PG6KxmiRrNewDQ22JeqVkQg==
X-Received: by 2002:a05:600c:34d0:b0:471:1717:409 with SMTP id 5b1f17b1804b1-471179071b4mr16544585e9.23.1760681595439;
        Thu, 16 Oct 2025 23:13:15 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:6426:9b9b:6d3d:1da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47114429679sm61624745e9.8.2025.10.16.23.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 23:13:14 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	srini@kernel.org,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for audio blocks
Date: Fri, 17 Oct 2025 07:13:14 +0100
Message-ID: <20251017061314.644783-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If/when pm4125 audio codec will be added to a device tree file, then dtbs
check will emit messages that pmic audio-codec@f000 doesn't match any
of the regexes: '^pinctrl-[0-9]+$'.

Add the compatibles for two possible audio codecs so the devicetree for
such audio blocks of PMIC can be validated properly while also
removing reference to qcom,pm8916-wcd-analog-codec schema file.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---

v5: implemented Krzysztof's suggestion, completely rewrote commit messasge

Previous version:
https://lore.kernel.org/linux-arm-msm/20250915-pm4125_audio_codec_v1-v4-2-b247b64eec52@linaro.org/

 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 078a6886f8b1..2a7a92371b55 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -137,7 +137,11 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    properties:
+      compatible:
+        enum:
+          - qcom,pm4125-codec
+          - qcom,pm8916-wcd-analog-codec
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.47.3

