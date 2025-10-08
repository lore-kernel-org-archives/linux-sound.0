Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCC22C17B2
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949823; cv=none; b=SRHQz0BBzSKl5OfczzS/4ZdeUdh6Nl5RESY7fbeH7qZXC1og94crtzHm4qXSoJUXQTX4yL1Nn/uy3uwImGgvVLM2PKe7JN8EyLNZLqw3fhzNiBRprYfR++nMLAek9px7EwgC2AF6veMyzrfGFl8zQZDojjl9DTfrHRulTe1uBTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949823; c=relaxed/simple;
	bh=VR6dMtQFlUqyXkTOBw7VzCqTi7iU47yIJOHH/q6KrsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmxtQNvnBFIrWZ8JoAGlMMqrMz8xYR3STRr4TT5S1IVubWEWzaY5asWMXusDqWra9/LbSgk4HW9jxIgj/q8Rz6lrBjzvU9/Vlfnwo4+svvdYdyMToyUXQtpDZp6tJIijuNtWJEM9VQC3tjT/AILzcJpLSF7X7u0X2Pqp1NMh+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ewp6Faod; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ewp6Faod"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so166414f8f.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 11:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759949819; x=1760554619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOOFxG03P7yB1Cqo1iuCOyE1bExy3dGIUFcsRsyL8QM=;
        b=ewp6FaodzZTU1dGRIB6KsDoB3mqOEwTIsVR15SAfzV8nU0C2ftTJ6V5QPSovg2/0F/
         mhdg0EFmE4/CBJpNcT16VSk0HWqRp09W8hRvX13jm19d5VVNBIXyqqut4xDM1wCyA5Z0
         LHPCry0SKZ6YwYsCY+yR5INFzsYmXkZC/opjlJkceWWAVucIadhn/iQeON8GA0xUR3Cs
         9ucfwOtVshvc1b0muCx3YEZevS1RkfH9NttYC2YP8NlU1SlMsU6cl+UpTlvx7ZEja3RC
         KL29GsVFDZns11dP+HTeCY9qVU8/NjgxMNj8wopgJVsT3hl89CTYnoxED2fXAS5pEgkx
         Q1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949819; x=1760554619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOOFxG03P7yB1Cqo1iuCOyE1bExy3dGIUFcsRsyL8QM=;
        b=m/lqNqTxwvEY94lGTYGq/C3MGuf/ZiHP3Van+yT1kHVdLxheNqiDwFCY0qdJhEK2+a
         bKmGJQ1rtms6c1WIWyGxEVpBn524fCXK5INwY6fWaP4H0lNhj1x1j4JQLmp1MSPW/6AB
         Rm3YDflq6w9WmqYcT0wji82iDf8BQyGsh98Dm26FR+y8gE2KyDS5UPaT/EU7YI4wuCvg
         v2CrfXjoK7R70N+tA69Ugb8id5jz1zpbE64WADBk5UH0eRSLVM8H/pKmVoSgQ5x8RVS3
         AVyfhgeTwMsVTqjCSwMsZOsOloySdXPxLgVPJOpwrH6hDbE1CnUH7kn1aDtwqHP7r8o7
         wOiQ==
X-Gm-Message-State: AOJu0YwR2jRmkySjgjTbX7APX5+5w8H5HEnCHS8gON34M4lIdpUiFHGB
	YplsofGDgmvEs7/79xilCd/NXDahb7a2Q0sbUbZxc35CwQ3o5cNU0r0orjuTrzhx4b0=
X-Gm-Gg: ASbGncuOa9wRBXYAaZlIkjYzTqTZh4cNCYpziuM2VJixudeqTWH/7Ej/V729OmPFcB7
	/HAko4agVCeIJd7A46QIoynITxe7F76M7YGw8kscE0Z0I7Oja9Ozrsx49Ognm9uX9M4eVth2UTK
	JenW5kzRQ0CSnjH7UAlI97CJ+W+UALk3nbzwYsCBNZov0pNndsoTLjkuFacK0XxJ7m7yqnOjxxU
	hCPT4YQBQ+SRBGYFthp5G3JekcCJflkyNOnr+fJCVS0q8eTjCQuirIufBNwlEGIpH9G5oP+8Mkk
	6AR7UqK1SJGcMizn/yhh7eQf8LA4q5qPzGAHDgk6wN6UiIOLEjDhbkgL1p8D0+SRlUQd3zGbodg
	URNfmWVfI5bw7vPfqEFmAo8KJ0RhrteITS4yZt6qMdrJaApI2LG/QPOG7XlSBy02VdSu7d0o=
X-Google-Smtp-Source: AGHT+IFOkWhGQGiT0dp4ICTg0TkIvfUECbXMM42t3JWFvFwW+rK+Qaq/PoOe/vkJ/UbLJqvfCqQJhw==
X-Received: by 2002:a05:6000:2891:b0:3ee:1523:2310 with SMTP id ffacd0b85a97d-4266e7c203emr3004379f8f.27.1759949819408;
        Wed, 08 Oct 2025 11:56:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e96e0sm31029735f8f.33.2025.10.08.11.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:56:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 08 Oct 2025 20:56:53 +0200
Subject: [PATCH RFC v2 6/6] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-topic-sm8x50-next-hdk-i2s-v2-6-6b7d38d4ad5e@linaro.org>
References: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
In-Reply-To: <20251008-topic-sm8x50-next-hdk-i2s-v2-0-6b7d38d4ad5e@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3004;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=VR6dMtQFlUqyXkTOBw7VzCqTi7iU47yIJOHH/q6KrsM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBo5rP1+tIgy4FjsDv+XzF0CRGQkmcxZ19RMb4SDpBX
 GYRYgOiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaOaz9QAKCRB33NvayMhJ0ewzD/
 0ejNqlhTL6mP2lJTJALO8t+ttwRC9ygs5IKzlWocOuwtxD3qj26o0S/KLmJ/7vYKuuwzWwDegMog0V
 SwXf/KsNjP97GTbNK0BBwP0toC5HMve61/Vq/W5clhMszjSCZ56G8L+M2/Q2hfOOwCuWOTaDEHit2S
 r15aNEVLiJcyijq3Rl1gNhTrI3l3eLOeZhmshgIf5AaRjy41b2rv7cRTd/dpgNWum62gW6Bs2gDpsJ
 j/GRVecN2XKlapFntnGu9GONhjoRIt4r1B+iiH3RmsRXqn0JfzXkyc5Rz/RxQbLWBcJSxrMuztbxuL
 KbVhDt61kzy9MFlTZPCCx9sAVQdeWNGVC3jzWIR1hhErRGZYDfo2ZQNXGUBwOPXkj4w/MzAKPvEhOf
 Uc2b0zzMnsbLpJIFx0LUgxaX3Sh95UWhhKTWEOJ0Po+21oRaQHuSGfax59wOfkgVcpF5gkwuwSYTjD
 cLKlj8rCklMkFdFfDiYv8imwEWUkRMlvmoG68/UaVyofMzEGqJ5BBcmfVPpoC/7FrU1QPJ1q29yEL+
 WS8y33WiAJC6KJJFimF4ab79rnk3Ghj1EnVp5iJu5TaTdtWFMx8+hviX17i3QRrBckgm7af5qAHGVw
 5EN/W1QZgbaw+i9lx7/UnfvoDgxQnNxZ41f6FNzDqxKpEMamwhSIHe+cczEw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 25 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 87d7190dc991b11f5d1162aabb693dcadd198c51..e15c65a97852f2e27d1c1d282945feeddec20f6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -171,6 +171,14 @@ sound {
 				"TX SWR_INPUT1", "ADC2_OUTPUT",
 				"TX SWR_INPUT3", "ADC4_OUTPUT";
 
+		pinctrl-0 = <&i2s0_default_state>, <&audio_mclk0_default_state>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "primary-mi2s",
+			      "primary-mclk";
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -218,6 +226,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	vph_pwr: regulator-vph-pwr {
@@ -853,6 +877,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index ebf1971b1bfbebf4df5a80247a6682ac8e413e3b..7cf5073a29ed4aaf72662a4e05ba1c6bfb118a3f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6203,6 +6203,46 @@ wake-pins {
 				};
 			};
 
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

