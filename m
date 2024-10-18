Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846F917B4FE
	for <linux-sound@vger.kernel.org>; Fri, 18 Oct 2024 02:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220107; cv=none; b=ALYoNs4w0GJ35Ma7XlJTBAJyjkSkiaZ3HG4UGljSquubjpy4fF3OUugTKmAHpCaRbwlC4FB08mW3NKiueqV63v1fOmcAfgQotD4kcmcGGxcCUS3MO08KnldkutR5Y4XniLvLjxFrEd+6FUGf8TZ6WKkWzHgRgXNFqL4VZ5qTFN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220107; c=relaxed/simple;
	bh=ZVT6El7iz922hDOLpUqchub2X741fAdkUYp69UrPaoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJYWGKeKJ78/HRHrJer64BASPfT78kDTt8jcnIkfukC3bSAy939q4raPfImojtu1KoSfCHNS7F4QY3qb0KipVbT50eUYJs/GB92En5tTe/hszaUOL7UlyncUjVTdrtguLCVLJaYCNqCBxaQXiRf08uDjR8OqT+r5yyQJzEQ1qwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8Y+azj+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8Y+azj+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d47eff9acso1002191f8f.3
        for <linux-sound@vger.kernel.org>; Thu, 17 Oct 2024 19:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729220104; x=1729824904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TkCC3xeL5jRNwjkZxx9c+emYe/54fbSEayFnAD+hbQ=;
        b=n8Y+azj+bK59AnxF5y5+swCXdpRZ61pXM1XTY0WIzXRlMNy44lMS2VyabSFUsSVE7G
         E2tJNrfMSkDvPY5MXuiwqegeQxOYPBXnQvuJW2dpgqS8lmtbnAzq6qJopQ3WvV20XVTA
         Zlhs2mQNnd8L7fu3hFJD/82LXX9VxtAe24r7oOGQOVZKQSi7odhVXJj7mtLybevUOWYa
         pcw9gp2sIjRpMS/15QTQdTZbzcWlO7B4/4CGM/C09T5Fan7xVIfejygu9KLil8uw0ID4
         FEGm6jtnApOHEziLVxwpIzBQEdK0/mAQvyIT4Pkuirht2hLjSA3OMLGo1iz1XZFvf3TT
         20TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729220104; x=1729824904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4TkCC3xeL5jRNwjkZxx9c+emYe/54fbSEayFnAD+hbQ=;
        b=jaCzs3XLk8ZNiRbumSOzBAd67ZMCilSxTuKibZidOW8VqWsZbIScPy5MC0yMeoSOxv
         Vnj1oOxRIEX8Zm9axiR39zV9RVT0ucyrvasWLYdg5w7AMv9kh/9ueFzLipji9pUJng4T
         RZqB+O4x/98rqmDT83MD1z3Yk+AuOtzx0T0V2WQf/8ZlmsU9mb04igjKincCDWSH1NgC
         oBkArVO+I8JdfOJOHhA0BhBecaCwZ9ebVs97mFZYgRlVF0eIMyLES0agALFS9WpPq8ks
         T5bS4zmGSHr3HW2+YeOb+myDSoZYd7r+6jDqW39BewDRBceT4ic4nBMervSmncIhNXh1
         1GeA==
X-Gm-Message-State: AOJu0YxivHqBagVcOVu1nfERUBIkpFyH+JSgceSRO7qzEaLB32EgTu6v
	RCWgld0+QdFlcvUau5wWTvoFkYEdHVjCyERFyZB2rfpSIibAtmFaR/Y1inTBg/DqHcGJ3CmmAY4
	uit4=
X-Google-Smtp-Source: AGHT+IHDV7pFYa3NXkQh4aK6DpE6INTXZK6209FUOzYSDD9ZHBdPaCJK6U8wzGyi6zE3YqCtg5L0eg==
X-Received: by 2002:a05:6000:120e:b0:37d:5046:571 with SMTP id ffacd0b85a97d-37ea21918c9mr519548f8f.22.1729220103586;
        Thu, 17 Oct 2024 19:55:03 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed599sm596135f8f.69.2024.10.17.19.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 19:55:02 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com
Subject: [PATCH v3 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
Date: Fri, 18 Oct 2024 03:54:51 +0100
Message-ID: <20241018025452.1362293-6-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241018025452.1362293-1-alexey.klimov@linaro.org>
References: <20241018025452.1362293-1-alexey.klimov@linaro.org>
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

The audio playback is verified using the following commands:

amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 1888d99d398b..5f671b9c8fb9 100644
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
 
+/* SECONDARY I2S uses 1 I2S SD Line for audio on LT9611UXC HDMI Bridge */
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

