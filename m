Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373851C3F02
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944984; cv=none; b=JkRn1fKqgnmjRoXgssSqFOB47fYR3QEwYTIR9ly4LlTcK0Eve0XhP+6X9Xybb8CTg5hxYW9V34/sO6zcERmazZZmhOx2pPsA5FQqyDyAviXYzh9y52MXG5aInYCdoMby3B5sdz0zBhp5yzIzr3o61jAUld211//G5P3F5XQFqSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944984; c=relaxed/simple;
	bh=6V65vXM8FQwUV7v0SXbiGpzXztfTEZwxdLqnBCxG6/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkJoUEDvCmRdVMOf7oGIk1r9ObzUACWYaOJj3kfnUSFqyicj538SDUqAokVyVfAUDVfBC7CSs8KDH7AVTYvkqBRQKYP28NaB+Opy6XF0rWPD+dlQezcHmgZ4OzKn2C76lmAOP2Gi+2TU3whhCtd3QT6HiuUspgcrGCidUtaIUlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wSNBgM19; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wSNBgM19"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso3720825e9.0
        for <linux-sound@vger.kernel.org>; Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944979; x=1723549779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcyvcwsgz2iQmtLQWjshVBEVrR/YiNBp3RnZXLsmNgk=;
        b=wSNBgM19l1rWghz/Y+iV07S+3KyuVFlPOmmltuNp1SW28LhGJgTUoWFpUpIvcvh1S6
         0KbiDtj1TbK/UVaZqOmk+k7ZGnSRyFvDTw02mboKPHnQKOFFcQl+BJj+dgN5jWdI+s3o
         9scMRHPYWFx0y8oyC8S64vVgwhi8DWUvBp0Ov9JNGEPsFPoUW6NSXZmRtPBA6df5Rb9S
         kf8vEqr4OxQuwdTCB60I01fVWLVktzZkLsoDrfXPIGkLQOfvjyUndxxslmFrN8pN5Jl2
         cG9pfHMqIABHhh+o1Ov/rkS4RhjFHGKzIkch2ks7gzlJO52YaDJYdK3EQJOqYUtFcBbd
         cWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944979; x=1723549779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zcyvcwsgz2iQmtLQWjshVBEVrR/YiNBp3RnZXLsmNgk=;
        b=Wmu3By2nIdtw1C9QN1pjtGPdvFYWllfXfHxrHIKD3HJC+LKvoWOMg/BTjad0Gop8CI
         OB39g7mNO0Jz1Yyxp8Kkj2HCU5C5S+ExPjJstkJlq6BoCO9+K+/MIwtUg/j9qDXdZJkC
         rjwp3Ex4PxD7kls9NGbRVtjY5xwLEscF00YbV8H9A0REwtMbkee02MEqItzkWbpLpBSJ
         xFi49wJMYg3z/3yqlt9XpFl/F7pUcg4vzpJoHCxOTER9L9AOwXQ1RqvvURbLxfSXNqW/
         Jr6HSWfIaGMHa62qYOCjwDR7lf9kTmv7WWRBpjAbTFFtdEId5O18tMaFrpsdNJj5iTSc
         s4eg==
X-Forwarded-Encrypted: i=1; AJvYcCVHs4Yc1p7+KO4sRXx8r3qxVdGy3b0bmvr6ldrOJ+tVQpy3444KGxwm56PSiTymm61dk4rMpNHCnsJ5E4AZ1gN1oXIho+t5ya0GIvE=
X-Gm-Message-State: AOJu0YyBq4g8QCJB49s/fCgO4pCziT1S/sTGtsfFEVO2lL/3MNDTc5pJ
	p280eOfuxt1zQnawJaseHIsJ34kSXJiIMH4suLJ3nByY41fJELpDZvNJRoHgpRQ=
X-Google-Smtp-Source: AGHT+IHdNQyl3G6YqRv/AULLacN9IkO3UKdGEkDTc1z/CSIyS1focn/fP6c1AdbO/8YkYsQAvDZDYA==
X-Received: by 2002:a05:600c:4513:b0:426:63b4:73b0 with SMTP id 5b1f17b1804b1-428e6b96e50mr97378085e9.34.1722944979504;
        Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,wcd934x: Correct reset GPIO polarity in example
Date: Tue,  6 Aug 2024 13:49:29 +0200
Message-ID: <20240806114931.40090-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reset GPIO of WCD9340/WCD9341 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index beb0ff0245b0..a65b1d1d5fdd 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -199,10 +199,11 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     codec@1,0{
         compatible = "slim217,250";
         reg = <1 0>;
-        reset-gpios = <&tlmm 64 0>;
+        reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
         slim-ifc-dev = <&wcd9340_ifd>;
         #sound-dai-cells = <1>;
         interrupt-parent = <&tlmm>;
-- 
2.43.0

