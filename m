Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B740155C96
	for <linux-sound@vger.kernel.org>; Sun,  2 Mar 2025 02:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740883810; cv=none; b=qH+NwlSS9K6HXF2mDySQQB0jPXkendujTURdDNrNLZ6pAQIYo1uY/vn+Afyt8CXhHpLJ28AsO97LbcIGplctE86JBWMEEV6sZ1rT9+0Y2YfpqFfbvFG2CFTOtvoR3/NYJWz/Z1JewMHI0WK6bxGpu/Y41v6xHTBc8F6EJBNc0uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740883810; c=relaxed/simple;
	bh=wQ01J6D4oNUO/j4ZKHOnBEmLwf4ywfjNUsETE7Q7ofw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HRxFkxq5oqETwVTXULmrcVyhNNTHbAJIxk0A+gpD6RrksiiugMsZg7fkujiPvCpkGguCRPfg+rsCViBnpyeIx40BhG/i6zKfK/orDY5vP9UCeLYDFNC9ZUO5KPODsYU4vXGhoSKehaa91V/7x0RWlmyC160U33i9SL4Ao7iFWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHCHVrwG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHCHVrwG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-439a2780b44so20959885e9.1
        for <linux-sound@vger.kernel.org>; Sat, 01 Mar 2025 18:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740883806; x=1741488606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmdfEHpxLSmQg+isrOnjjS1H9iCmEJAPxMrM+k2a/mo=;
        b=aHCHVrwGzq/xLs8/ZsdMpBXuegrMAzW0NZOTw0LnJemTY6u86lP+j2BeUlYMuDw6Zq
         qksz+XvWevxDjgZAf4PFvlwCeaJD4bgdpBm09UWYCRBmCEkYGVgHmvzowPkwZXLdEap3
         ymyxbMn3HFYKw35yYL2dbo8/1peo0UXhkLPZWNGb9YAIIfjaavM3od7INV1MVpgu9H/g
         vKzQ7wSRIi5mHNdt0oBeHqxg52wsvT9wF7ShkmXKmdJO9//BwwsNh346m/Uyu5icPlta
         8jJD+FPhKSHyoRynv87v9k/v2YmjVTCrr1EyNjtq5C64Cnh1ohw9xD1IF9uhPL53rKfL
         JpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740883806; x=1741488606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nmdfEHpxLSmQg+isrOnjjS1H9iCmEJAPxMrM+k2a/mo=;
        b=nkopaQbuwH0ccy6d+4nhg2qgEb8rOxxNptzFt5Rvo6AyfbRk+Rw8jct9ghUt6LlKfh
         FrjMiHZVnrPoig/xELWYNlboCyWN0XbWwGZpnEQeGRUuSJ3nM0qQlRuaQ40y25ZZKQdL
         vL0TMPm5nP6i7CURIPRY56I+Li4/7Gch/X3459Wl6OY+ZvLw4D+HnZ9LeIAGg/MP8/I3
         QhhxzrHljm+kLwCjaBuMAYHaJCiSitjW15b64ExNSfkRAjZ9dPZz+Sh3Db3tF5TA+BDq
         k31gl0sKwOEc034yDl3d6C0Uf1iVvi2/O+eTmviV0n9h3fbr/I5qIrDxi8+b/0zHbgCF
         VC1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoY8PPJTd1PBAKKoZI8oWCPfxfNO7xPOam79Rt1R80RptSg3Tpao167EJQ9hXTJnwm7eXAHps+0dXh1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwosH8ek1MKJ+D7SNPb5oXpgVYys7rZvwQ0aX8oKUyGOMxAGDSm
	xmRIsTn+larJAudPcXYpCJCFFoDm4Fj+AukpkaORPlP7bpIePr5jhRgBZTrEkWE=
X-Gm-Gg: ASbGnctm5WiuhGwUfXw3PztFjeYrLgDYG6m/Z48gnVhtp7nc7AiPh3AJlbGFxkWoORo
	xAnn3ew3813TStjJqnCOpZZh4Pc+BKF+iEH7VPmSphI5TTgVfwl04NLOI/c6fVbkk34LR0gEvHI
	KaCzAOLtAAEOTDNZr6qZRx6csN5hHE2FFqbAQzwbDd3yo+pfpeM7zyDwganlaEmIZCa7KUt8c+W
	sb25unpQNdvNlgMOERjA9OpDc/ioduhTEN/8ClpKGW9L2HPTFirowbln7J8yTjCTZOsHPNry0i3
	l5X4r1kWkmcvNZSrITWO8Xw0yCTBVQpF/cnhYUCs974pUAZAqe1vKQ==
X-Google-Smtp-Source: AGHT+IGpybvE45hfiU4SR8oSm9r2kkh3ze0e3IKrTgUQU7lkfSzFWQu/64T/KmNdqENi7cRLhMWZaw==
X-Received: by 2002:a05:600c:4f16:b0:439:88bb:d024 with SMTP id 5b1f17b1804b1-43ba675a8a9mr59723415e9.25.1740883806571;
        Sat, 01 Mar 2025 18:50:06 -0800 (PST)
Received: from [127.0.1.1] ([2a02:c7c:7213:c700:e992:6869:474c:a63f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba532b0dsm137845975e9.13.2025.03.01.18.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 18:50:05 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Sun, 02 Mar 2025 02:49:53 +0000
Subject: [PATCH 3/5] arm64: dts: qcom: qcm2290: add apr and its services
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250302-rb1_hdmi_sound_first-v1-3-81a87ae1503c@linaro.org>
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

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB2210 RB1 board.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594d5ce5cc314c956eaca11556a9211..2c90047f7dd867580836284721c60ed5983f3f34 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -16,6 +16,8 @@
 #include <dt-bindings/interconnect/qcom,qcm2290.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -1868,6 +1870,76 @@ glink-edge {
 				label = "lpass";
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
+
+				apr {
+					compatible = "qcom,apr-v2";
+					qcom,glink-channels = "apr_audio_svc";
+					qcom,domain = <APR_DOMAIN_ADSP>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					service@3 {
+						reg = <APR_SVC_ADSP_CORE>;
+						compatible = "qcom,q6core";
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+					};
+
+					q6afe: service@4 {
+						compatible = "qcom,q6afe";
+						reg = <APR_SVC_AFE>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6afedai: dais {
+							compatible = "qcom,q6afe-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+						};
+
+						q6afecc: clock-controller {
+							compatible = "qcom,q6afe-clocks";
+							#clock-cells = <2>;
+						};
+					};
+
+					q6asm: service@7 {
+						compatible = "qcom,q6asm";
+						reg = <APR_SVC_ASM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6asmdai: dais {
+							compatible = "qcom,q6asm-dais";
+							#address-cells = <1>;
+							#size-cells = <0>;
+							#sound-dai-cells = <1>;
+							iommus = <&apps_smmu 0x1c1 0x0>;
+
+							dai@0 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+							};
+
+							dai@1 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+							};
+
+							dai@2 {
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+							};
+						};
+					};
+
+					q6adm: service@8 {
+						compatible = "qcom,q6adm";
+						reg = <APR_SVC_ADM>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+						q6routing: routing {
+							compatible = "qcom,q6adm-routing";
+							#sound-dai-cells = <0>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.47.2

