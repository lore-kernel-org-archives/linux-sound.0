Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=jWiOrdEZ7ToEl3KMZH+C5tgVyL3OtOy2t3elDVkEsZ5uYAx0eUhe3PxQLFl+6xoPIstp
	 4ncK8nCzTtIhgQIxul1r92QYB+lC+G/+sdTZYpzxT5MaYv1Fb1+c4j7XRzmzuIR1OMOo/
	 F2nBIINDUhCEEiKWKIwYKf8HbF27KQYM624VJk+ymLcekk8TQLXfOetvzrmSYFjn+Qboc
	 0V3iThEbQYtiGceAsn9DaxreaSJ2I7zHzWquhWPPv/wVZhWT4grKDHUo7gQWBKGXm077n
	 OnYcbmvySvNyXjiQ+UErNuJGsO7V/rP3qiqecJxlE51SbCYbG8i1pq2C7JhktVHww+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
	b=z64tHFrV7i+TcPPKDs5SzaKnKQd9GYnkK7PpuP/CYo1zAiICskjazDZiKtL9kbY94Xk4
	 9DCGeWaMvBYA+SOdhwFCyrB+v237g60nvjPm7cSadSMCwdeWVxszQNOewsMGHpk56u8sw
	 aPBk3FPpRDPPfggZlVbclP1SgzpQZdpETHFwd9JK+HZ2nkjZxl7iDW0QUIZryQLV+mgH3
	 qj1skKLyjBQt53ZjSAg6RB/2Yd7ha2o+G6AG0p3uhIo1NhTD2vLpKyRIECs5oWxqpYCK2
	 hJaoVog+BXKIw4zyQD3BJQ4JZ/JA3wrNhSEmPb66/DagyZuK+E8Jjw/p+akFA3OGY4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4812D6077DBB
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4812D6077DBB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so701130f8f.3
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595142; x=1795199942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=nGXC2mr8jDEFHh8X7rT1WEuyQyAOtyoVaJp5hD24VULt5Dm7tn5F4rQogcz1AKkt8B
         GbsQRDgwSeNRHydCV8O1Hf2dk9YPkq8TTOacvrvqNUcKJhd0pmpYNxAhee9OAn3Q3CBb
         ZrLDMEXjtXAByco6PMvyEc4Xctx+kkdofg5qfcfru3MRhroRs5e8pFa7aQn0UfFZsG5M
         IawcxBBflPCVPeX9BBMQ76gpLVA7LVYCgcNqtEAO7pfK5UbS4qgGZFXxWtBsDRRjMzcE
         xmBeK91uK9gZwr+1rZrafLNgqEXXbHruS92N+aVKjk5Mm+T2BzzvS4ELissMU9eRY1Yp
         90Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595142; x=1795199942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=YjvTDTTwGbirK6RH5M132wCIr+7KXiggMSnGqIHxNLac7f25zf/an935acQrQ6hySV
         IlstCfQbwdt9HoIIyofeBXNNvZvy/RMHg0pcy2zoWrrZqUZdI68fl4cOoTWTEnSe94/u
         Jwa9p+AZc5SVi6jzikC6sCgWLzAbhauV09i0kuNgPQRHCRm/qpeJR6gFUgJZrcGBwJ7W
         Zp99gIG3LlG7tgkLnh7BZxwfi1tbsNowxhM2FdVrSDExfOZ9V+O4x5MhZqF2d5kzXD2C
         EdbhYSdMTxMCi9YQB2+Y6H0aUR1ttFliY+8B6KYUvdUVHqelFaeE1LQUgIwvL7wktB9x
         tDMA==
X-Forwarded-Encrypted: i=1; AL+hErHJm46AuCWC6x8PuspAtZASCCj/x70C3VflupFTmxCWCXsFUDcCAkQE/Ndg7lfdPyTFqM2LCESVDjSFQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ATex12dXeifR4IIJIquo/L5LRmt9SIedBh+3DpKRUAB6phQ9Z
	zIwPiTS6VM1YFSToCAsph0StMoStRCT5BjUwRECZVuX9DXQgdH1e3LkeBU5UFabqy8c=
X-Gm-Gg: AYBFou1GgDJdQ+Ri+CY/pD4VsQMQL1DG2mJAQeBbD0AXP3CKvyErsfHeRVETRyG41zS
	NUyrr9IcIikjmn32v8lD95mfnPqIj0Rx/JG9812dU5F5hkfFC+SDViIGnhlTdAMsjF441F8k1/B
	e3UT4iXOsfhgBxMtVvI0IkNwckt3IUkk/fDpQFegY6XY5f4+kjMox9NSRR8JfkdG/xWoLywVLbr
	CpQ2r7RlGkQX5WPT4enFCStthSxRKsLLh6WkdoFX+H2koAdl6o9W9bIUVKsSZWgQWNcvY4/YmoQ
	khsUadWzkKkAQP664jpiIWQWghQ+0Y2G460+S9GZlmiaIgNP2DTAYzjGuBzoxvRaruOFMm7J9tN
	Ode2e+DySYsE8N+cbokFDlWKfB74Qa7iUH2n9dMyYN1M4j2OcN7fDX+H94ScNMZpRg5UtxylCJl
	54YPb6p/1SgU9Opim0j4MRO2oKImpucRRPt0kBHxHVUtmHqcKtMMNyP7VIVgAbTc1cWFtAjIjbd
	IGELlwvglsy0RDqwi6aG3mZt3rWvvIPztB/jmHfJaWJn8YA4nKhNE/j8LhFuH9OrryiWXy6wPR5
	YMWWu0lZacvmJHIer0By4V0W3wkC4wcr7ILtuXXtrLo=
X-Received: by 2002:a05:6000:4697:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-49c7458620emr5628794f8f.49.1794595141531;
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:36 +0100
Subject: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V5W1xkU5JSLg+slKk1AfIWeDvtlCZVv2u4mE0vZ1GEw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91koLJdzmuJYexHUXqCwf/rguGD0uVlz2GY/nKi3
 xzdtgDCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKAAKCRB33NvayMhJ0bV8EA
 CP6h7TdIv30wzog9Ph/7TaDUOU9Q0KoVpgAYqjAzcf+icYGmJ2kONvsVh8/7PH4note+jLzG4tDvTg
 nzrwuAj4KUDPAlz6PsQ0XHZ29zJ75rEWfDIcEdF7vdhPYIovfSgs6QqLDpS1desaMEODAJoS795EuR
 iEfrJWyLP5ef/bcOxxWzXNzoSsZ8A/Bt5LvYXk1HHAUA+tFPJhz/gcwCBydcEOTB1yo4qRJayeiKVJ
 Rcu1DJoYfimFMS66fRmnsNY6R5eAQZ1B8TESR7wnoyE+HFaY7XEe2rWXyhtMp9D39ig0ofzVxfvBfX
 xClL2KpG9LTBkZ+JVJyZ0ZGlzjrbxZ57KV9KGfbgr/ifMSJ/eBIUb8zKdUnuqKwQG/0xmOgGYXvoaQ
 oUkbQeo4YfP7z7bTQ/6Nx7byp2lGcbrehRCaO08sxRUtNvRMx0txP92TmhKIVG0+kRyH056YcHvSfl
 uFXPOGWBL0r5Hbvb0nq80KI4A0cCyrHZ5L7hEzBaIZY0mL/EEWfx31q7RHb8acgQTvlh+WLJBIuuKi
 SHdv3y0nTLm8aCpLij24hLvJwvowGkLPsz0Nqz3L7r9XD7eBVkTeWrfOzngpRAPTHBq7P3NEAWHkft
 L83kztdj+ctg8j8LHeuyGltN3XftbP1L7HKNTQojJmNX5Zlac2vC7lPbC0rg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Deckard boots Linux at EL2 without the ADSP audio firmware, its speakers
and DMICs need to be driven through lpass-cpu.

Include sm8650-lpass-cpu.dtsi and add the SM8650 sound card with the
speakers amplifiers on Senary MI2S and the DMICs on the VA macro.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a365caa28cee..723f7911fc54 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -16,6 +16,7 @@
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
+#include "sm8650-lpass-cpu.dtsi"
 
 / {
 	model = "Valve Deckard";
@@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
 		};
 	};
 
+	sound: sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "VALVE-DECKARD";
+
+		audio-routing = "VA DMIC0", "vdd-micb";
+
+		speaker-dai-link {
+			link-name = "SPKR Playback";
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SENARY>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -776,6 +808,38 @@ eeprom@50 {
 	};
 };
 
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-0 = <&i2s2_active>;
+	pinctrl-names = "default";
+
+	dai-link@22 {
+		reg = <MI2S_SENARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_VA_TX0>;
+	};
+
+};
+
+&lpass_rxmacro {
+	status = "okay";
+};
+
+&lpass_txmacro {
+	status = "okay";
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;

-- 
2.34.1

