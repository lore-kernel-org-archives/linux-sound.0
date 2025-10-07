Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D0218ADD
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 02:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802629; cv=none; b=r0BajqXRlheG2hU8UGlgjL3boSfFc8kJZdNsqglW0CGP09pC4LI+m7djpuZCChXdrCdvsEqhsDde6UWwypaxh+8QCoAIXBoPobASIQ97ZeIrtr9zxmqj1q9j9G38KvgrWFNQYK4J/fQpi0q/ayKYmJa+33exT8wPqBz5Ne4Q29c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802629; c=relaxed/simple;
	bh=dinlYOq4GNp8S92cG3IIG6xQe9bDgEHO1mWnzU7Enuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gv6HYJ/aog0DGs+wMwy2vtaMFybs3ZaLKFZtkhS0OmhNS/QqEMxg9syW/jijEXE3yhmJRiB79RmrDMlKfRnit//M+rpNznEwZ/mgP1Do6N8IfKVKKkqZvFmJ9Zn5ubgpf7uvAkfBm0K0VlWPE4pmaUpBwL5gX1ADQAxee5iYZdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=osb74vfy; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osb74vfy"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-36453927ffaso55153161fa.2
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 19:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802626; x=1760407426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dh2P+1S/rGMae00So34IFmR5edBimGYszi1sGivuL68=;
        b=osb74vfyTFtNpbUrt6ea8gZn4J+VeuJAo7XMmuAdTmvgaNN/zeedIWkisYRjkRCUx1
         Vn5qPyUN8rzlUpEM8s95QHkChU9nfmHQBmTmiQGoBDiHBTlwr8DCb5QxAQ5loQ2RcROD
         NWtOwtX6wetJxP/izoKPGntwXuAFEhZdQJE4NHMXc3iTMyGPO9WgGg3znbapNGYxxLtg
         IFJ3/fIsQiypP2KpfB6xmxmjuimLQtQZez+CK54Y2/XGhNj/qjrzihTvk1IwfPamWDDn
         sGcaxUAEwaC1QUn37TJWa+8zcfWaMkfQL9pLcRAM7y9RntHmcIA9PQE8Z8tw7sXBJkOf
         eQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802626; x=1760407426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dh2P+1S/rGMae00So34IFmR5edBimGYszi1sGivuL68=;
        b=ZXGmtXwQjHcLYQdbw0NY/BklEwaweoGXHgfR1WakWK0FSbzcDj8Z2sQI6kzMiwwHzZ
         C3hWhOBAekWUy5+n9buUqTP0rqP574XOnexAkZYz8mIF4epEU1uH41oD8c1aHzOC5lWK
         pEh7m35pgxRdXXu4pvfxMEfy/A98Z80b3ags6pWy/PovK4ljGwiQU0Mlr3RjeqIa9ZOO
         NVOGgAasOlXFlThU3cPVfdOpWy7ebpZxJpI5M6Xacf1RnwBhySnsNZkUuA3UaDg78KKi
         6hxJLRKpOMVt+gicPuZ1zzVLcxIM20Efk+ET468o/mDptQsMdt6YLQ9F1doAJeVgtahb
         ddsw==
X-Forwarded-Encrypted: i=1; AJvYcCUD4NRY2tExYALe0M4Qfjq5sKpLRyjFNcxSIU7tVxTorniKvZ1nGto1nQFjarWCNhAsmSCVY8RdEDXuXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx10H23wM/K29cl454nJS4kmNuQOhKAPqxXNxP0JLqYY0s3+0kY
	XJbhs1Y4CqSVlmrQRAZz27UbqWFZajqW+JChTWsMEftmlF65FwHXuoor/wb9KSyhNG0=
X-Gm-Gg: ASbGncsIV65iE/uOuPKIxhrcKV5WgjMg1wjfFr5aQylHOokVwQUVhBMYWeSVTgTrKCS
	YSvjrM8FollscehK7FJdlq46GvNNnT6cHwwtcYFmf43AwwS4O4aVLWLiWMbFsBFIpPV0A0LddHX
	OlGzsZ3XlhKxLtJiLQSAOKKOKkVXf87xyz3Yg0X3zXXOC3X4uZNffGl0tVg2lDVh/NBt/6Ty3hA
	jXU2fpDm6zRw3Vmr8cY3HRVscCgTgeCtWUXOgsOlcDwuRsv7+0zSvQys7BdXOX48ngHcC1QwLG7
	00HsY+2/KW/DLwjc+fgT5arzRMVoLT/a1kbexSnnW4TbVBY9UoHnWLtzaDuatp96L231IjoVN4g
	0tCb4NDVKYDWMa0lteofp3L5B1CTErlNhvbshVLgFfgXsOX8Z9tmc7qZ2
X-Google-Smtp-Source: AGHT+IFI9nX6DVmCAMZ3FKDjnGx6oV0QSc0nIDHxs6ctW8TRx/vmNB5maIOBRka6gVB6NnvAv1QDrg==
X-Received: by 2002:a05:651c:25c7:20b0:372:8f03:b73f with SMTP id 38308e7fff4ca-374c384e19cmr36666571fa.36.1759802626183;
        Mon, 06 Oct 2025 19:03:46 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:44 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:31 +0100
Subject: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
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

Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
controller device node required for audio subsystem on Qualcomm
QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.

While at this, also add description of lpi_i2s2 pins (active state)
required for audio playback via HDMI/I2S.

Cc: Srinivas Kandagatla <srini@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 7303aff33814f256a2ea09a71a640db466370eff..02eee364e618358e5ead78c2b97fde12a57ede0a 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -673,6 +674,46 @@ data-pins {
 			};
 		};
 
+		lpass_tlmm: pinctrl@a7c0000 {
+			compatible = "qcom,qcm2290-lpass-lpi-pinctrl",
+				     "qcom,sm6115-lpass-lpi-pinctrl";
+			reg = <0x0 0x0a7c0000 0x0 0x20000>,
+			      <0x0 0x0a950000 0x0 0x10000>;
+
+			clocks = <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 19>;
+
+			lpi_i2s2_active: lpi-i2s2-active-state {
+				data-pins {
+					pins = "gpio12";
+					function = "i2s2_data";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				sck-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					bias-disable;
+					drive-strength = <8>;
+					output-high;
+				};
+			};
+		};
+
 		gcc: clock-controller@1400000 {
 			compatible = "qcom,gcc-qcm2290";
 			reg = <0x0 0x01400000 0x0 0x1f0000>;

-- 
2.47.3

