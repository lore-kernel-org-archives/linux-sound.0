Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA943AD5
	for <linux-sound@vger.kernel.org>; Wed,  2 Oct 2024 02:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835639; cv=none; b=fRujsYHIThm2FdPY9qoFcdrxNM9PaAvj1AY1qjdAFOFWThqLjGF8q26q1OMVxF0O8SuKSfv29s7fzCOthDxeCemVie9WvaB9Mp/YxPaRBOEA6el5U5Kwu4edpulD06ysvWdAVVxfcIb7dOu/wDmVPiXwZ/JNUsbCXsG7VDitGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835639; c=relaxed/simple;
	bh=ULS7v19diYZOA4yWMObow1IhNGxKdw920LDv9hjWWKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gun9CWNV5jd+7Qhsoja/hzUe1lU2IcUWofzmjlX/XtfhKpeYB4CcyZrKl74bh2KYTCgRWviq1uCjpE9OaM3HXdZZvGKh26k8JQR0wSRsvnNryrAlSbEpc6NJOz3a6Fw19itH1y8LLd1Z+es7aoZuK0wKkvxXUmW4K3H34nNULA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=un5WUHSI; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="un5WUHSI"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5c88e4a7c53so4250015a12.0
        for <linux-sound@vger.kernel.org>; Tue, 01 Oct 2024 19:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835636; x=1728440436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/fecHAusQTSWcNvNWVR1JO2nQmW0cI1ww9wmHUrbrs=;
        b=un5WUHSIolgMTPH+bJzkRk85RdKTr8UsHz5TZ24QOlilgqytvNJC/tpCuRFtO4BkwL
         xCNggz3fzP+2rSEqwSW0Q4nY4C/5ohxTZ45UEi1EyO4/ub9dKVwx3j1KGDzQuYpdUZ3Z
         Dh16NNCEglHUJ+ZVX/+ZtAp82py+xgxpMbvRl2LQujrRH0HkK78jETtKemE0ZU0uI6sd
         KCMvwiCHlQNMSa272TrvmG/fysYkZcqrTdBm2hI0FHBh/AMp2mMdF+kOgZRBdEMYXg6k
         uV68gHyxwBavZOOfcbp8SnjlWxODiO4ASXMkvaerufTI9GqL9TgV6hpmtPBKmXCVwxxL
         ISmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835636; x=1728440436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/fecHAusQTSWcNvNWVR1JO2nQmW0cI1ww9wmHUrbrs=;
        b=AlAX7d46nXQYkts8GLgICGRvK6noRZ7b3bI5k3gNtCCJHpBxC9+G24p9qberSO7prz
         wSqDRwaL75lQeK6ZyndD1WF6vJ3/ULTK74rWz+9FSdd1D+DVwdqWt48fh+hQ/cg3n7r4
         bArsqSUAKJ+TP8NZ0JGMaZ+wrCrZbtqvICo5GhMQ8naf2k4BPzjR3NH+Nw2iVj6Tfrc4
         2xm2tUsPNSFULEBC+xh/iVA8uBKUcVbji8ne+LpADxOltykw/i/bDwcgTHCtEheS2nw7
         xPsExTKz7TH+8vWDXtPC6vETAfYVFRcoWX92wVj/KEGxkwb/9SKna2rol3Kr1Igzm71n
         o6vA==
X-Gm-Message-State: AOJu0YwdDh0wcWCo+dR9D0TYV2JnieQ4k0c/n/zsatTvrz4Pnp+5uMCw
	KD3oF1ypeoQ4UMgJuOuveuFrjvgLWbjjMLxVUQGCRCvR+GMWHhr2RQkoPuxUe5BJUA9lRfPq6Tc
	W2PM=
X-Google-Smtp-Source: AGHT+IGSWbnUX5pepZAtcaQL9h+8bQ2G+ar2GaP4ub1B1kbGdQfmXR5BpalUGXI74HFkbN9vCYhdIQ==
X-Received: by 2002:a17:907:6e92:b0:a86:79a2:ab15 with SMTP id a640c23a62f3a-a98f83d7a73mr142020366b.40.1727835635620;
        Tue, 01 Oct 2024 19:20:35 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:34 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 7/7] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
Date: Wed,  2 Oct 2024 03:20:15 +0100
Message-ID: <20241002022015.867031-8-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sound node and dsp-related piece to enable HDMI audio
playback support on Qualcomm QRB4210 RB2 board. That is the
only sound output supported for now.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 7731681688d5..b8bc4452ca48 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -6,6 +6,8 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/usb/pd.h>
 #include "sm4250.dtsi"
 #include "pm6125.dtsi"
@@ -103,6 +105,51 @@ led-wlan {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qrb4210-rb2-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "MM_DL1",  "MultiMedia1 Playback",
+				"MM_DL2",  "MultiMedia2 Playback";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-dai-link {
+			link-name = "HDMI Playback";
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+		};
+	};
+
 	vreg_hdmi_out_1p2: regulator-hdmi-out-1p2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_HDMI_OUT_1P2";
@@ -318,6 +365,14 @@ &pon_resin {
 	status = "okay";
 };
 
+/* SECONDARY I2S Uses 1 I2S SD Lines for audio on LT9611 HDMI Bridge */
+&q6afedai {
+	dai@20 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.45.2

