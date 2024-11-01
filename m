Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8707208A5
	for <linux-sound@vger.kernel.org>; Fri,  1 Nov 2024 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730422781; cv=none; b=k2LiI6kQ31QrkIgR5m5aWlHWofxNusOsn0dBMK6RAZAa4mjGzz7I52gtz0z5bkQVXVmVSW4nS3C9XhF1QGNkJVDQUD72UONpMu47Lo3ie/70JJU/kumSwzn6jSzgDoXvUAEqBZzQq4cweMAM9R6d74upYVBdMdnG/Xtby8SCn/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730422781; c=relaxed/simple;
	bh=KfozwYSENTNbSyYlouyzU2Yp+8xq6X5Dd42Q5ixj6oI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbYVJsqw1iyLdxiq/o0cAK9iwvAUyHlq0iyEgBEtN82c6tM6kTTgvBdo9hd3MZmtZWMfbI+4OJp8RSFmgM2M0/BR9hKncul8AS8zQttvCqYlCdpfqx5VV9UvIr8B+Hdt7yLvywVLeinBo8O1W6QL/HgC7arL2ipnWXLDXuAXAzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qI/mldjn; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qI/mldjn"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d4ac91d97so1173918f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 31 Oct 2024 17:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730422773; x=1731027573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojB9bhU+3681CPzpjWV9dtVH/cjJFNb4PF/Se+LIZoU=;
        b=qI/mldjnBEpejMlL9TJh0RleAreE11XqwZuKnnlt98iySLQ5kkeUGZk54pwds+q85z
         qFt214a70cmar9TxetU7WZouG3IoEkCiqVnR65auqcgBOtPStGPTBPmf0irOz9ox1VMv
         EQ4VC+4MtG3WjcpdIDh27hrobnHPWEQNitcw0KwzNaU7XCSz1hz/qw2CgVOsK0nQy8mO
         /0AvRYzq8lhlFZ78OG3G5TkdAQFVlh8cc+R8P6cLoK6wVpZDMG4HXGYrPasj4btsPx/x
         m3oXHa8DHLEb+DEkgMMUW0fre3MICHfw6CNGaRDr+JnvO2Lk6VRIi+SVc6X62t/bvFyC
         VN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730422773; x=1731027573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojB9bhU+3681CPzpjWV9dtVH/cjJFNb4PF/Se+LIZoU=;
        b=EIFLroh0ZrSQrXoJnhEdoMXYMugk9dSWtgn3JfH5i2LTTci9O61lEiWJQ+c3ezD3hV
         mKM0DiD4iwqyyJPx+X4g/w7rVKZ9F6CCDjipbknGlSegiSzVmtN2ipKhV8TBbZPDXO3K
         nfevftJarkeSxDnIn2FoOx6hZ+R755q7cFE5p61F8oTJ/Zvh3xtwpJ/nbOCczq6ASf4G
         MpUsKFgdX6FLqqMwYPpdvf5oakOUM17f9HRMyZfEGV61LY7s3d5q2RGoHvkIi51UDTYX
         wNtF/f5zlEeQkVDkneuSQgCSRtf3RPTwkIgrEmiQ4vvM0wSvAAg8m+ze4dDycVm+YhDJ
         wWcQ==
X-Gm-Message-State: AOJu0Yy1VFT62jz/P4tl/saQu6T8KNJnFENqZzB4Z721Db2PYzftT4UJ
	XQ9EN6QA3RTWCvhZVKWMwHKvNV8gAtiOyZ8ZEb37Zw6dzjhmC2a79SqXDOYrdyFCAAJfXvl3bNx
	UAz4=
X-Google-Smtp-Source: AGHT+IF/H+r5eZyru/pYrCB38bqqGwXsoMG4fIeIGAmr6bBcc7GxkmeVlwXh4HEqUn5JsftbPsMpKw==
X-Received: by 2002:a05:6000:1fad:b0:37d:5130:b380 with SMTP id ffacd0b85a97d-381c7a5e114mr1786417f8f.23.1730422772920;
        Thu, 31 Oct 2024 17:59:32 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947a9fsm74208035e9.22.2024.10.31.17.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:59:31 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support
Date: Fri,  1 Nov 2024 00:59:25 +0000
Message-ID: <20241101005925.186696-6-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101005925.186696-1-alexey.klimov@linaro.org>
References: <20241101005925.186696-1-alexey.klimov@linaro.org>
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
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 59 ++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index a9540e92d3e6..283a67d8e71d 100644
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
@@ -103,6 +105,55 @@ led-wlan {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qrb4210-rb2-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB2-WSA8815-Speakers-DMIC0";
+		audio-routing = "MM_DL1", "MultiMedia1 Playback",
+				"MM_DL2", "MultiMedia2 Playback";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hdmi-dai-link {
+			link-name = "HDMI Playback";
+
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
@@ -318,6 +369,14 @@ &pon_resin {
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

