Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657322080C8
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802623; cv=none; b=u9X0VfI18I39YC2pcXxF4IGpdraSSoU0HUeidZwHWNzeUGaq/RaLpqftcbhMjz5at4ChQkmTTR+bnBcNmNf2edFztVN+/GTU1MLQeT2os7LtUafbwuCWllM607FAde8vycOTLFvp6Eu0srf/d36tbSZihWrg6hstlrmMfcERkmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802623; c=relaxed/simple;
	bh=VXDNFmwIX3pmm1RNqu8UxbDnHVOaIoAOH+SdXHl9U1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rseXurHpgh7zyo4dtVA8BTaswm1uNSkdUg8yiSoJMZQXuv/MBRs/nKiw2NW/oPmROTKKByvN7cThUIMG4aIe31GIvPdpvSjwLHM/Fo2ep5TudeNwulitce6D41xI2nFp4niDV+AKD99F3r1vOkjTnVkZ3s3lQqKIlWAblwnhqGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dTrVQHHi; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dTrVQHHi"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3635bd94f3eso48505031fa.0
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 19:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802620; x=1760407420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvT/TglfcrWJfggrZckfEyOiFactKbMJClmt0smjuQk=;
        b=dTrVQHHiskmU1+WanWHVh0yrdEMpONRRJqppy9QgL+HHJ2c7GbPffxHtKcpVyir89u
         jUVgH07ehuiCGxHsp4prwU+Qpdrp8SRiJHcXYSSfJ4N4YgeOsbKvQV/0q8oTRpM8Qsdn
         9IAKEvFLWVZFcBbcd3YQ7QqZ5/xGzBryVbdBo+AUAkZ61TYDt1nbBT0Y+pdvlORCWfX/
         hkFShCUSvasyWZW3aFR/jYV1kw2p5DbRLT9wl/ZfiCbvlMj404mVWPSOG2hFlDoDy3vg
         Je6IL6wEv11fzvBph9ia1QM3WduLo1XibdeYXSd9ZbXklRFu1JfPflqHnjFnEQSi0qQ3
         r1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802620; x=1760407420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvT/TglfcrWJfggrZckfEyOiFactKbMJClmt0smjuQk=;
        b=GiE52c+9i6k4xoGmjASSF5RnFwj5SCyFsWptYC8n0CAItCxGq3OplT57bxS0PsJj9S
         78WNut7dYBPAWwVjS6kFyZnFCHGUhNSJ/ZIvNeDw+VZB9bP/tmhoO+yEb8/jGW9HfI/t
         2NAXJbIHxjv9tizY1cB9Uo2Jx3fAUGqdh5L8BzO7WQHe83sBQ+TA1BgO30WF31qxhsuK
         eM1LsuYCnzCPqIGIbSEOSJcjgLxuScbA0wUByuy+bbDhQoNwjl8uJS2C02Y7W/a2/OMo
         LD5VUUA3cY+wl+bafMxP0yxi8Zomdiapmn4YHi98GB4MOpCEBvP8gIrPAsHz5AQ1t0+c
         sPEg==
X-Forwarded-Encrypted: i=1; AJvYcCVblnKfD3W0LDuXhauxN6yoWPCcg7NzIDDZJJXGe9RKjtxl/1P5fFPk9WGIIRGMTLhH3BcDRjwfnQNbnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXwxAmSGz3+zn6avoAd0leqhPsbJkRejFH8704kLO3ZLiNTxOq
	B5ZwUPWI0SIsM80Z3vzAqc6rDcsUK6jWM2dFaawud2euxkdp7yKwIVn9EdqNoTbXVyk=
X-Gm-Gg: ASbGncvSHSyfCG1VLvR4rikevxRlUOiYbckPvOZTi/Elyfl0M1px4sHLA4NR/0KT5az
	zqHe69mfh3hobGcVfvPLFCNRxn0nyWaOsav+nMSGiaeCRS9v/Jc8QDiivuvxp2XPNqBv58tQM1n
	HdDTmWzgzAf+XpBnzkSfv0yF3KMY7pQjaPzw5vreqp8IKOTPhWnRGT0Nji0PpkspHWOXmAXalya
	J4eNs3y/Ax0gR0M5gaokb1xK70tsksuIOIAwHQ5nHMBqWqXcl5GG5oMIIFU/UWovaCMFlChTVAG
	u1VVX1KYVtH8fP0Wk8wEm4BJzRvHL6Fw5cPCKLFnTFtepivc0uLDaBVar/2v2yYXhVBL4vpJZTk
	Iazm1b69XVPiaQomzW3LYLiwKuhRd0C5lBi8HMzDmjZ7kSoznwn/x3YknG+sHL7WYs7M=
X-Google-Smtp-Source: AGHT+IE6kE+08lGifMlbSFxL63V0GVp/y1UlrRZI3ChDCaIR4Mc4TOIHRtBHsz2zClThQzzpsuDRMQ==
X-Received: by 2002:a05:651c:1992:b0:372:9992:1b0 with SMTP id 38308e7fff4ca-374c3823058mr35559001fa.31.1759802619600;
        Mon, 06 Oct 2025 19:03:39 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:38 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:29 +0100
Subject: [PATCH v2 1/4] dt-bindings: pinctrl: qcom,sm6115-lpass-lpi: add
 QCM2290 compatible
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-1-821b6a705e4c@linaro.org>
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
In-Reply-To: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.2

Add a compatible for the LPASS LPI pin controller on QCM2290. It seems
to be compatible with sm6115 LPASS pinctrl.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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
2.47.3

