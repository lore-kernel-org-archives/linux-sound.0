Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7BB3594E
	for <linux-sound@vger.kernel.org>; Sun,  2 Mar 2025 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883806; cv=none; b=rnsRx+HeNwWNVHv570xCeSVvx3cXrXcp6vmnpzFvjuFHMoepIBus5DTMAeGVzQ7pxYWh9Gk4u9demTOHn+w4etroSwFh4FjUCe7+23lS+uigOmSX0BstUN0ZV5h6/WJ5LG+all/PABprP9iXSGGxfJfBVT05Fe9nJhqb2+OBkWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883806; c=relaxed/simple;
	bh=6ScO6d/vD41aSSHc3m/TNsRC6O9XMMje0w18/CgtKz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zgw+diJDRPhVVmqHF33HlkK/OyLD7yub0Rglo/pz3skAXpfKTetmYCFgpbI51oaCaA65gt/GzbB2yCZ0XTYHN8mBl95fPHumb11Q6ShwRcWA9a4f2X4vGXXr2K3id7a2hcqqYoVMoCpqbRkd54NW326tp222yLJ+B1xnTZw+dQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ij8evwgD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ij8evwgD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso21713765e9.0
        for <linux-sound@vger.kernel.org>; Sat, 01 Mar 2025 18:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740883803; x=1741488603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2dsCl7aelSQACC2hAibA/NG78Rv8OzFHgcMb4grt70=;
        b=Ij8evwgDClxjlp7aRRkY0MPflAHB4vWSlNW6KEJgh+0topDBtTtfND5BKOS/cllZuQ
         KqdfebTv8GJGJsXGuJjTSfXVmOGejOIWBi8hyFd3fZGhPLR+3pwIhX/KpOQ+N9N6FS65
         WD7HBXC7TjOczgrFLhc07tPQWAiveJSUGihDDqxSTE/JejV4jmqx4fR0J8JFXYaIFVR0
         KR3imcQpDZAkxoUkYXXLChoBRKcdqjjlNSfSKa5JwbHsvwbeXALC6ulNqnWtJF83rngA
         BtrCtsAbofZZUBSr3ObVd8gNVWmz8wbDDQQ0JqzfkpsNNDme5TX5S8GRYL4VSwkXz3bF
         BwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740883803; x=1741488603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2dsCl7aelSQACC2hAibA/NG78Rv8OzFHgcMb4grt70=;
        b=Uvjhv2x+2zDR94GMgSEXs9/I5J3XJv30xsvwSZvqrbrBClkRLCJu7KUAuBSJea9IiP
         F8q9OXcghUKFcdZuDe+0MLKXoQwH/poL2/Ef3e0YWb4q3XanQGLPGdjzE7cZfDSSK3jM
         R9rTXcnxz29GGI4V6/S/MloPklf4BkZsTdlmZUMbBl3i7bGcd5CqggxMmLXWym53lIwV
         T8AqZGAit+v3Hom5z1ayxgnB9eLkGmtiZQyXUbNf36S0il3NcSdM2bXoCOWptwqeylVL
         1qmbDVJcZxdGyrsIZNl6FTZpCksPxqCaAmtSPLxur4ZtXq9gq7t/w8yLTsBwttXwIFDX
         sYFw==
X-Forwarded-Encrypted: i=1; AJvYcCW4vL4pMw58u8H8C08Ou7J7jQ6cl37et2wk1r8+ki6ugKQs2gcdkOFkcd4AvnhKoElFwJPCtGc2B4A6VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzcq6394KpJkh5Q+gPPl8BYADLe4IXegdrHQRtHikkIlTbp/BD
	4QrMV9GcU6HT2QOfri2DJE9/igMxnC7u5x7Kl+sxpmkZpVmIK9T0Jjt7tNjhPyU=
X-Gm-Gg: ASbGncvuPMC2pOKgAtOmCBPTFNL3HmGwO8f9vQNP04C3uKhMn0r6juDmZA7rGljYUYj
	+YC0qFmI61dFr/2a+8aje2xFhCI2v0qPB9/EZgI99xLZl8xtqjTz+uNtAxH+d7x5eyh+q0mbXEO
	GFET5eoV89P6l2hoNLZiBj8A0PDX8UhvMjBTam+FtYhlQ2G4RbxiS3n2UDK730yxbnKHUIpICRZ
	nmU5219EfRCZQnT2b9/yJAXt5/H7a42IIh9zvKHh+hBE5GWbMcjau0NvXPGn/f2ZXeHfnUmQdw2
	tIUfFLCA2PmlerHHCcm02U3Gbf3cj55c0AYKSD0YvMEIuCZ4SMK45A==
X-Google-Smtp-Source: AGHT+IFxHCKQFyUj24+tuV6wSHKQy4LhNfQvVRey7/Nm7Du1PU4gaJP8VBFQeZCerX6w7bwI5hKemg==
X-Received: by 2002:a05:6000:4022:b0:390:ffd0:4138 with SMTP id ffacd0b85a97d-390ffd04350mr1322985f8f.24.1740883803448;
        Sat, 01 Mar 2025 18:50:03 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b0dsm137845975e9.13.2025.03.01.18.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:50:02 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Sun, 02 Mar 2025 02:49:51 +0000
Subject: [PATCH 1/5] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-rb1_hdmi_sound_first-v1-1-81a87ae1503c@linaro.org>
References: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
In-Reply-To: <20250302-rb1_hdmi_sound_first-v1-0-81a87ae1503c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
to be compatible with sm6115 LPASS pinctrl.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 .../bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml           | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
index f4cf2ce86fcd425b7522918442de25c836bf24f0..ec1cd684753ad22050ae349a2e7acbb2545a9070 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-lpass-lpi-pinctrl.yaml
@@ -16,7 +16,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm6115-lpass-lpi-pinctrl
+    oneOf:
+      - enum:
+          - qcom,sm6115-lpass-lpi-pinctrl
+      - items:
+          - enum:
+              - qcom,qcm2290-lpass-lpi-pinctrl
+          - const: qcom,sm6115-lpass-lpi-pinctrl
 
   reg:
     items:

-- 
2.47.2

