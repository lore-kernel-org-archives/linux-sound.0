Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8343E2DF12C
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113231; cv=none; b=R2UxBeJw2Umi4p76EhKGb4IQVz32KWxsxEoS7xrLSACQxjFmqOAxj5fWLWfbjbbPzK9ze/LXo+UUgLbB+l+XP5XeEvMbsKjJ4sCIydCkUmFx6AcbbmMFSyTqDZW8lKTJkxY2ap7K/qQUwuiCoo86uABmK5lxrCCXHDXJvgUPV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113231; c=relaxed/simple;
	bh=PuhNIsXn9gttM7pCatxgdPRfxI8eKFytwCjci5lswhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bQ63Lrz1AMwMIooVdfrsyLdp8BLasRrf6zoGrByhTy8dqiFxrat/ea+rNXuuEBy1WQpzNq9tt5w5p8+8A2eRxtvfIpGOeHB0S1dBOPM3vIxqhe0U2pSHNo/HZXQpfXlwWztXx5FyJR5oW4vdZMJFTg7M737E/z8Aib7PYAKLMEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cevypGaq; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cevypGaq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47103b6058fso3776055e9.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 23:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761113228; x=1761718028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//34rvi82AnqDieMydgJVTZIokdiMPBeG7Fzj9fzlEE=;
        b=cevypGaqq4Yjb7c9GIucHbbdDlu7F7uQaBeZDemrIYBH6XVdDnQrKLqaFzaYLeigE8
         7mLjKDDCaq1RrAcnRTCnS1O6JeRC3efFAcnBjj4QpHGkcTDaVFSiUD8qpMKZJdF5F+eH
         ToEXXmtlvT23SImzLdVH9tcTRRaW6RfWAbxf/LyiztZ8FfBDFYdSYBp3mlGtlmomlTsQ
         G6ay55j1bXazqa//K8VBAJhYvhi6+vODYxD6nP4tjt/+KgfZ5tKOOHOoeGTbSfOStaTY
         0KLy2AEW0llKfsT1BmWdA/9DJkn9DxvYCR4EN3CJfvh8tc68rbORL54iF25b/3jlBj8Z
         2grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761113228; x=1761718028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//34rvi82AnqDieMydgJVTZIokdiMPBeG7Fzj9fzlEE=;
        b=NfTIKnjCrRlMC8MkBAXRXCLykLq2pq49P7Sk+30Uv8VD/L8XXjCfoUjwV6ax/d4rdp
         qzUONXk2JgIpF8AVf39Zuaejm5RKVlBGxPdW3xiw8QRXKEgIatQJYHrbOFswE0wvqYNe
         Czn0RVzc7gImwY5jpS+hNqcJETB8mAePkgUSbuB0945oZ1u4YwMeahg0GjNold/jNj1c
         tkUNRYVF/gF01hl0WqqcxsYdVR2Xm4jZVgVRXLtjd2I6FYyE1ibit8PEMM6f4Ap/YfQC
         Y3thkBXzCYi9fR/ajl4ekTdPBk1/+5vKjQxgx7sRoQa6OgqG4NqHSKjcKaV5MauDpgoC
         dq4g==
X-Forwarded-Encrypted: i=1; AJvYcCWIm63vWlESxyafmgRWgiynGWrdq2y9TtMZC+DfP2x33v2thVfbK/JRK9gVlEY/A/AaXZOyeHKAQZVUdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpdeAQ7p+ruxOPnZwoXmowoFIWbDWTfr7ERsoFglpRX3YL/8Ap
	/P4sVQ9dgZow+wkuJq0WWomspU1L85S1JOTwDU1+ehJIIUjtAMBo0M9CYgFsIbpw0I4=
X-Gm-Gg: ASbGncuy1Kcu0tmPidtFhX9ypj5KnQJbt8/4R9Dtt8EIFavYZmV5U9nkDQQs/rWtw4m
	aNSoGKUKgfTI5je6HdFZmNLStK/095/u6XKpk+B8Zk0KpBbE77q4ye70Hhhp3jEC+kzQAs7lbsx
	ht2NGE9nzdoGKHsEyFIAeqtdWsQwzPf4UWJLXuPqXAr488Mm0tIFzoBtusd7gXJibGUUq9hPkN/
	KZFw4D3ONfx+w3qQFh/NB5vZ3k7ise3c+1TzUbVGtyrxGlTiSn58pY1Bu7hDoizvQcHKMtThPck
	kOBoTTs5Ze0H0aosIKtknAiD+wCd65Zemsy6968yTyPikka/N8nSZBAWLhC3aaZqVDmUPjf5nRb
	rlnx9m5y9KaBMCLBCwD8dKEhGxDGeHsD0s+k6xaVag+G5ZE4310F4Xps9pIUo6+w6VdO97F0Vl3
	e/4nMiH9wolPqrNjpF
X-Google-Smtp-Source: AGHT+IHpMXyFR/tPlDOICiK+dKxQNn4WouM9bvYwnhmK6iquazWF671SAXHrZLEjrQhXYCPWxy5KoA==
X-Received: by 2002:a05:600c:5d5:b0:471:331:8058 with SMTP id 5b1f17b1804b1-475c6f20089mr1241255e9.7.1761113227744;
        Tue, 21 Oct 2025 23:07:07 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:11f4:2b3f:7c5a:5c10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a75bsm23794067f8f.23.2025.10.21.23.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:07:07 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 22 Oct 2025 07:06:43 +0100
Subject: [PATCH v3 3/3] arm64: dts: qcom: qrb2210-rb1: add HDMI/I2S audio
 playback support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-rb1_hdmi_audio-v3-3-0d38f777a547@linaro.org>
References: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
In-Reply-To: <20251022-rb1_hdmi_audio-v3-0-0d38f777a547@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
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
index 67ba508e92ba1f0ef3bcf8b248eae125de059869..43af25d17aa8314354b1ecb8617510cdd6c857a3 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
@@ -188,6 +188,53 @@ vph_pwr: regulator-vph-pwr {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		pinctrl-0 = <&lpi_i2s2_active>;
+		pinctrl-names = "default";
+		model = "Qualcomm-RB1-WSA8815-Speaker-DMIC0";
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

