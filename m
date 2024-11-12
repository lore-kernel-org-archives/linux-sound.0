Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A55819FA93
	for <linux-sound@vger.kernel.org>; Tue, 12 Nov 2024 02:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731379994; cv=none; b=fN0tzjBu0CkDj5wWTm0qKUwDt4Kvnyn1RFph1pNrTjigOw1aTTpoTdsDpZoj8P8j/YOSekrhngLv6V+uI84Qlv2Ej8w8j4w3JuGGcIuUW/UrICMAj2ZPi3hmgyR73iPM9rgHWnRKUiCGnS+4EkDIBk6L5smpF+4HqEsoXfYzoFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731379994; c=relaxed/simple;
	bh=Y88dxKTEB84Sy5sor9WVb8Lb3Eunx49GPWiCvst3MDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfEB1wbZCjkT1zCL8y1YMXDZFlo196hn9bJEvNzbfU/wJS7EYkC/E+9HsdtF72gf8fsw30qK3cBq1tDBnb35oQ3nAOExZMUgdisei7BpvnIWYFXyvlCzjSBAdSl4FlgkX5wtP99PEnHfyc68mWkUpt/cvWSfqn9iwr1QspHSnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMAeRI6u; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMAeRI6u"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d50fad249so3841604f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 11 Nov 2024 18:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731379991; x=1731984791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNkMnvZSHVbHckJCKRyiqgolyEylIkwRfPR/FWi1wBE=;
        b=rMAeRI6uYErGM1DC4oYv3h7pn89xehhoeyG1jiy2LFh7wwRPHLQbhzu1qK+P3O0dhu
         yJy2BwCUAMPrmz8hxCF85SHbbjJcek1KKbpljD3v7P9bTNdXFZL4kaP9QlTKzXxyBmmn
         PkR2MKnJlsf8ZoHDyFZzOkRMM/lvadjpVCzoQJilK3avcTjMrNgwfqRX8d+kyCVskgLM
         8Ia6UgXPWhV2U03XM5TTgHV5c7n+4aH7kwjusEzYk6F0IWGzADcjrw/rh/Sc6V6tTrR3
         4z7VtlKjSwtjcRCWEf8+1FeIiU/7NIFeocuXO+7cGyMQwhMEsVL+P+2CH+kfMEYoJMzF
         Lekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731379991; x=1731984791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNkMnvZSHVbHckJCKRyiqgolyEylIkwRfPR/FWi1wBE=;
        b=k3F44HqQgfxUdJDB/Octw2XozrLTjzPJFvz2oGXHwTKgiirRx/auAtiZFIhFvEqPON
         H49CIExJD0qkLrccax3x+qZi2Gtkaqkg3io/G3HKHaKMSUIT/GvIdgLCuZFj8lbNCPqg
         IKpz3Yc8RFfjpM08aQ89tRQubE9aNxsJSr4Vjhwzev4ZCrPxuiE3DPrvy+b9AkWN83iD
         vMUEHKS2qJ/IIP6JyEFRkJHmiFZT56QeWZ/WvulNsVc/TE57nbEgiVg9Kq63t/n7kYdP
         u3FJM9QZbcdvtjehz0mFJiOUu1hfmJwzIa1RSoZ/1uEWCrEfBBTPaQ36MugJn/EV6QSz
         NBMA==
X-Gm-Message-State: AOJu0Yz4eoiNtHnIwOqhWnAAM/QXJ6LZFbvNigqKfyvQDmfL3RMhXBYl
	yCjcDqylhyS3cFseBH8gFbCatWkSqH6a8c+bcZ1doCbP3sHE08Klow5RaIjbLio=
X-Google-Smtp-Source: AGHT+IEfD+tJcD7cA0hU7+ropJkve1bk3ekvCpds1lfwTN/idzFvWLSQGdQvvyAOVZWbpqb4QDytcg==
X-Received: by 2002:a05:6000:20c3:b0:382:51f:60a7 with SMTP id ffacd0b85a97d-382051f616cmr2188794f8f.33.1731379991419;
        Mon, 11 Nov 2024 18:53:11 -0800 (PST)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed999e0csm14056380f8f.59.2024.11.11.18.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 18:53:10 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	a39.skl@gmail.com,
	konrad.dybcio@oss.qualcomm.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] arm64: dts: qcom: sm6115: add apr and its services
Date: Tue, 12 Nov 2024 02:53:03 +0000
Message-ID: <20241112025306.712122-2-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112025306.712122-1-alexey.klimov@linaro.org>
References: <20241112025306.712122-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add apr (asynchronous packet router) node and its associated services
required to enable audio on QRB4210 RB2 platform.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 9b23534c456b..816b8331933d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -14,6 +14,8 @@
 #include <dt-bindings/interconnect/qcom,sm6115.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,apr.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -2701,6 +2703,76 @@ glink-edge {
 				qcom,remote-pid = <2>;
 				mboxes = <&apcs_glb 8>;
 
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
+
 				fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
-- 
2.45.2

