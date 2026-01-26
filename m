Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3859F3375D5
	for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439394; cv=none; b=j1rgOTP2RExWlimJa3FmTa0uSoZOENaaMxIM3MyH6HkSVFPFbA+9Dw/lZQgHZR29N3fn3c5YCcNRaun2qK1ixQbuaPQxiplFwDkB5zkj43gVHYgiFt8VtoqbmQZe6F9JeaLFuUsW0vwchnyCphkO75qLfAO3LMwNqRBBIfixEq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439394; c=relaxed/simple;
	bh=zoU5K02Bbq7cw3lIuV6NlOALPTjdLVS9TUL2NqjNC4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNm5QHPmvjH0l321qGtKTqsTIffsb7gdUref4Fq00Qp2G8ACnldK0GnzufHoRyEG3YAz2c5iN9R0LDr5jUyocvBp8Zm20MAUbMtMm99HTkO7XyqTsS3nBwScZntbtlVUjDR5XMRYsW9HRV9nGhWmHz8MaWPhvshZzelbobDyCo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JS9YkWnT; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JS9YkWnT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso53304655e9.0
        for <linux-sound@vger.kernel.org>; Mon, 26 Jan 2026 06:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439391; x=1770044191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=;
        b=JS9YkWnT06zRzMmm4GZxHVLDTe7rJmjmHlgd+2vHsQqDvx6GoPiiSYixpX870TN9uA
         9PuuRMdV5ZjD3ktKEEHKTO7gt7w/tSIqHSTaoWOQwmHI5XFzdLoz+ogW4svoUxxCeapm
         t9lIMXMPVMg1JcoLuGVOH5FGhZz5r1PTxcnVRSDaA5enjOUfAH4VVM5FpPcnOpbjLrb2
         5TYcjHnWiwCwyTA/wGG9geEGKP+DUpgQThMGzRX4SJuP6mXugoGg+3B4kfcQJZ2EFNuw
         Jh0z0AAlOYoC/twsKwL4ZnlbrRwosA5l2oCwOcvSrQa97AjheqU56xlOt/CAFbTEqHI/
         5L0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439391; x=1770044191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2a8Ed9B2Mg4RdZUumF2drNSJLLH5FmhhUmHLfuibnFg=;
        b=Wv4J9KPec9RUK9xoWXSJ3UYdZDMtFHLOcWmPbLXGv7T4qGEi57U4IE7m0/YPJ4aAGS
         6/3duPzB+UBIQyjOArrdmNxIRXv7IsbWbwmTmIyPrk7vAEDSbtrEWn9FDETGB8VwOGPM
         0KXcG+GeR/JOnQn1W3HBSsWwF7YTCeJRZpICD/y3tdfCLlnnVlJmLNN2ctio01FfbCQm
         fCnpWng36ngjMn7IBZulnELX8TJvVRzhkyX59bZR9rincxRPluQbXcLts5tvu+7ERSiN
         U3ar/XABfGoMgALdzdEbefhLjWaLlL7zrEKeGeYLy/Amt6eICHQbldq8Im1rSe6AHfN4
         xMmg==
X-Gm-Message-State: AOJu0Yx/FcP355SOEZ7baLZsR1Jzlcgymb062vAb+slN2Owd54J+ZEA+
	srmWMFyIc+IISlx4LMF1/5jdyJLvyElTp3WGV1j0S3GJDHgJEK1ALt1w
X-Gm-Gg: AZuq6aKBNMNzBvCmCa22AcllFaT2KXMoSKqZtqF4gNxCbJZDjM4NUGS3wK61B1AFpN9
	DSMeAHdV7Y2TLb8UavEJKi9MqohyfAVXERZylhiXsf3sw0SOvx3ivAN2S53GDJOjbFF29Uw2RZz
	Zy+97A6r/ycNdKG3YRU0j9MJQ4z20jUEliGWfi+ZWwg28VZyhS2E8TNNl10csL6kebSVfTlit8T
	H+t60mV219VLcZ6EPqdIq/on+GMoJrhZQhwqPvi2xST/lyU9nxc1wp18y3jjQ575mgLBA2L53CR
	NVwLsBisIjX1ftoip1UJBS7jnIYJXVlz3teEonNdbQgp98D8+k3cEvjqzlh2ynIOq7qgBzYjSe3
	s8FVpjbJbrX87Nf7gDYqsKEr9ywALHXb+8wD8aGPcAmbG7hIc0l1d6aWGyve8RxzgBeUOrnBky9
	F/rXH2H9hOLAK1c2hFJUtiFNetT4MGkWYPbZzTNgQhjiwS6OiX
X-Received: by 2002:a05:600c:3113:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-480650f2933mr20236615e9.10.1769439391388;
        Mon, 26 Jan 2026 06:56:31 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:31 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for SM-based SoCs
Date: Mon, 26 Jan 2026 06:55:36 -0800
Message-ID: <20260126145537.2301-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
the SM coprocessor. Thus, GPR is transparent to the software and does not
need to be described in the devicetree. Make it optional.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,mqs.yaml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
index 1415247c92c8..bcc265a742c7 100644
--- a/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,mqs.yaml
@@ -63,6 +63,16 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6sx-mqs
+              - fsl,imx93-mqs
+    then:
+      required:
+        - gpr
   - if:
       properties:
         compatible:
@@ -91,8 +101,6 @@ allOf:
         clock-names:
           items:
             - const: mclk
-      required:
-        - gpr
 
 unevaluatedProperties: false
 
-- 
2.43.0

