Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A94219A67
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759802633; cv=none; b=M/9Qv6L7jZX7i9j79/iuOjYj2pKyCWv0emI2uw3xSFG8AooDULmanzcZv45h1Kqn3En4IKr404/yzuq8/XsIpnIPM4yOLDPx49SigGs5uRk/6Y/DXC5O+RN9Q48OlLhfMUXiUzdPJWugXsKa1TQLdJsiIo/flmAbt8Nkc7niuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759802633; c=relaxed/simple;
	bh=ViBe2WMm7kQxPxeRuekDdL8WZHiA1GXGLJT0PDfx7w8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6orCUHDzlRDqgbZ6nIQkCC6HVj73p+yFLoNv/+Jgwf1t6p/yP9VSIwVY4RCas+4Q6jN6OxAUtuOs9i8evUEKhEarl35/swZUOiw8NQ3Ka3W6REfGrYNCqOldFxhDnWCoxKUK6J7xLKkrOL3J7NKsIcRAAe9YCbCiD61mn8pljA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dQba29WX; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dQba29WX"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-579d7104c37so7340750e87.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Oct 2025 19:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759802629; x=1760407429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ysY18u2zKYmywl9mq+ndQhWk6KHVBYX5HfqkCVFIYg=;
        b=dQba29WXjmFucH7DB6LsQxcSWRfLBU4ysxtH8pJ3y3TLKDlOKCq4AiHFjjTs7O+kjd
         lQaROupmoSSA6TrszH5HeQ5MYJZdvRFWIt3kkIr3JmOV5u/5CPN0bRnGCUEcvN83/UlP
         uo7IjvukruYtoGtz8Mp15T+PNFSRabSLI2+rqmUw/7GmLRuqmf/bvNrc4jrUBjZopJHJ
         epPDJOOtJFOIIpjqbyTEW/bFlQeBtPLiZ/O7nxkXe/ooqs4VdruEY8+tz2Ov8CR4mp1p
         cPAFDIOT29DHok2hJE/cpS4lcHmCBUjSd/sF+ro9q51ol5i52g9V+ZvwtWzTuxXyGA1A
         Fgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759802629; x=1760407429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ysY18u2zKYmywl9mq+ndQhWk6KHVBYX5HfqkCVFIYg=;
        b=osA56rMkdjEGUaqfIRPKkyUd2gTg3crtir6A9FW8wSbntPELzypsW7bcZSsyU8CQ43
         Drt0URL3C7DPgCMi0dTqWZQQWZ7sSrLqZDcT958F9AGUHXZTTX67AUoxFT/SS7oPeNBc
         sqmsbZxm7SpqfJznxrvZ0tE2xEdKUYG0QwLymNWqPZnXk+gJHg1ZUDhwKHfhq5m55FHc
         p0I94zdOe3mqFLfO3GixMb3KD5KxUmH/wRLBeEViu7pGNeEuZ+b9Tuxitb1T8lTZXfYW
         /RnacKftuDp3Dq33G9cb5IBsZzgBsTHvb4ZmIlwS2gzz8ZlOlf9LftQlo0v1KWQr/iVY
         ut6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUc8YSr9HSmkBw+CQ9NPq0xHF8DqZVPxnWaMpeTNx5sSgXqLl/9kCHXITlIcPm5pRzntHyGawYwR1YJEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5aGopEs3fTOBZUxqBmiYDTEm8tZ31QwMvjcq0dOi/yDGUJ1YT
	HRpKxgkECy+nxBEKT32ddkmB7peEtkWAvnaq9oLRK3HArokMjKuhq/WoLdTaF39c9og=
X-Gm-Gg: ASbGncv9Cc1C+BYdOzV42xUlz7Yo+IldMjGF1DtNFCLzJR7gUZ0GrmydzJD5y/aEdnj
	lQvyB++JeCEyHYA/ExpDD9KbcoP6s6lFEzTD0MchB+md7hGIC22BmfXkZcr6FMFcf4q32k4dFoz
	c0y9ACmrTPGsH82YYBi/GZbL6uIIIO5nv96HLpkP73qEuFb1PId94rCwP1mMA+UdISx1NZACtH6
	SIxmbtpqEjvDaQ5P24+w9Ljpp2KmdLevCz5MLY8oxM3gS6o8JRVK5jgc3y+QOZpVJVC56/q9KpI
	uTddSWYDSZN5Mtku8ByeOKNiTCbv61j+XMFdYPCcESpxre8+Q2+Pk5QvV6hqaR2mAZOtqe7RiYK
	ZGilJrIvkbhIrX5b+x7TlAz4k3tgwxqMDJGQKi9Etavhpf/aYt6UEp+wR+IjZwNmYri4=
X-Google-Smtp-Source: AGHT+IHIQAFDlaxnS/YPLaaZASPGtjzqUskbAEsgwJPrLjmMvYfFHi4ayVxMDpBzxLLkErDPJhx74Q==
X-Received: by 2002:a2e:a987:0:b0:36d:4996:1c4d with SMTP id 38308e7fff4ca-374c36c4b2amr40767031fa.9.1759802629528;
        Mon, 06 Oct 2025 19:03:49 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:22ae:baa0:7d1a:8c1f])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b81e45sm5150391fa.46.2025.10.06.19.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:03:48 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 07 Oct 2025 03:03:32 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-rb1_hdmi_audio-v2-4-821b6a705e4c@linaro.org>
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
 linux-sound@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add sound node and aDSP-related pieces to enable HDMI+I2S audio playback
support on Qualcomm QR2210 RB1 board. That is the only sound output
supported for now.

The audio playback is verified using the following commands:
amixer -c0 cset iface=MIXER,name='SEC_MI2S_RX Audio Mixer MultiMedia1' 1
aplay -D hw:0,0 /usr/share/sounds/alsa/Front_Center.wav

Cc: Srinivas Kandagatla <srini@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
index 67ba508e92ba1f0ef3bcf8b248eae125de059869..4ab5d3379ed22b43675284af40eb7f9304fbe1ef 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -188,6 +188,53 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "qcom,qrb2210-rb1-sndcard", "qcom,qrb2210-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB1-WSA8815-Speakers-DMIC0";
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
+		hdmi-i2s-dai-link {
+			link-name = "HDMI/I2S Playback";
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6afedai SECONDARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+		};
+	};
 };
 
 &cpu_pd0 {
@@ -323,6 +370,14 @@ &pm4125_vbus {
 	status = "okay";
 };
 
+/* SECONDARY I2S uses 1 I2S SD Line for audio on LT9611UXC HDMI Bridge */
+&q6afedai {
+	dai@18 {
+		reg = <SECONDARY_MI2S_RX>;
+		qcom,sd-lines = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.47.3

