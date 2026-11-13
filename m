Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=glzUqu3qmFLo+/wCozUSUCaJXAYwLWHL2KPE0lenPfzl4X19Voc31v4ZqcCWMnQHvDY1
	 cVW+l4NpdDZ+atYfACJu7+htp4U3iB4C7NkRDiJTUKcjdMwHvyAG0ydJg7AJ5pJ2XqX7b
	 C0MTV9uV5et/qeH0KSE+PMBETYTEC5FumiFYrbBCJ63xbTHUEGcCvryuILQ4GBxFXISh8
	 jaejj6gxqkWRGE8koCydxH/bR7f42EZyylUq1EBBv/orVMFfRfX1+0PQd2zNCBR97Fe7l
	 ahiyVPAAeOx4D2tBq7Fmq6GX0MQ4Nvl121Iyp6QxRykKQkI3iSk4OHPkfUF20qcajPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ojl/cw/dowOK0qKRCZeiKJaRwVJ1sk02/jN+oDFnW/0=;
	b=PyPObl+4TmE3DS3G+sUu0t4ReKTl12AYjexLa0IDJOxwYz+63VDq2EmzOVwwOsxUKYCV
	 v2xpDHzJEuLMwZDJSViYOZogc4eX//5LXWKLrwZOcgiMRIdirf5+rdbyiktWV7s/lNnxl
	 f9daLaHNzKCd3qKc16gx7VBslPoUJonKxfFADVGdaLUnpgDXG7P0UiPxuecO/0mNMpCPD
	 8uS4QB0z4DgMK0UhRj8ju7zOtBAFgz4w5hf1MvA0Stsh8Nbb9hJx3usDvWw3fBtuQlnDk
	 0r/q93QwR9qlVUTNItluSnsIu1icR6tEHGP7N4N/7o/X/hFq17Xl5TB3ga7B1O4k9SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jr6uG1Gz;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FEC6077DA1
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 18:39:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37FEC6077DA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jr6uG1Gz
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e3b22e971so640441f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 10:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595141; x=1795199941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojl/cw/dowOK0qKRCZeiKJaRwVJ1sk02/jN+oDFnW/0=;
        b=Jr6uG1GzcRu4KzDsGdEZkaUqHJrojddpRKzQKqqqcRDH8z8WDuwCbyjlx54CwpdO5x
         CcAbOeD6FxIss83KsHnZ4br5/qOFC3mMt0WDi545jYfygY3KFnbNf0jBhgPogS1eVSD9
         bawaTwxh7boTpxh0FqP8JjUuts1rWfHRY53LFnUNhJIPdfKkuWFQfPqeXvpSYc61hRLw
         d4lNOh8jZA41YYhXsYRgS/+0GnHZmmstDIvL63TOEisSXkZccqr6t/ZsXmg+QAwKF6Yo
         Ejqq0RxnxtdSZ+JNHuQkDLTbvhFonCb24leoknssa8gvRADCQL+EjHWg+3Usn2uN9W0J
         nAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595141; x=1795199941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ojl/cw/dowOK0qKRCZeiKJaRwVJ1sk02/jN+oDFnW/0=;
        b=uL7PCF5OAb3Nsq5DdSCp4Te3Ebf2s7OwAk2FAU+2cpcYkD9aiVKayhmCiWTZi7BdQU
         bS7UHSnKso4WQQ6ffBRf4buWupXsOZv9e2/VUBnS3z7pbqtce4vToD+eWNuwBs2R/ZyS
         kMdgXva8yxIw1J67vTpsPWMptShiuDtdMoZDVKjBLtKhE+gQmdJ5nQpWp0o1kQPu/MAH
         4TeEoXz8ISmt7W7lSc3Hd8KxtHWzjEk9Zq5ChCo3a4yGrIOrQntyqe/y5RzXYVgwpGH7
         /O+r/jihCl7m8J9gpMAGLyV9iq7gMvCSPKgitzl5ineODNdyuRW33VpbbwHryPl9CbXQ
         pNwA==
X-Forwarded-Encrypted: i=1; AL+hErEI0543OLPDMWJi2pOdtTJOo/s+PjnuiNWfnZRpVvRvjmaaZFAZB0uTa2R5rhmP0QtzugEhJdYSC4iBFw==@vger.kernel.org
X-Gm-Message-State: APuU4Z88t0aNniA0vKPkvugYIQqMPu+DtuFACpq+WgKXTQTl+bNFWdcj
	LcQ7aq8YBF9GSYQ1ZIGdcf4jRTOze0uhAlcreBZVFk6mJHOisq7HyOjg9rAw9ZQMwXs=
X-Gm-Gg: AYBFou0YrHnKqKzlEvbQ2V2uwzyxAnDeUd4m3RDdMBeVq3Rfl/Pr3XAVasOa5U5HZhw
	SuI+IL01Q6wBAW+h3yws2/uTGf0R/d9WxGQpToWKEXCnrHXKs6cJU2YD++tYZTQdWsCi3Bfs9BH
	Jl9MUDfFXCmWa/S1GFdB8MdEX6kE27de9Tad7OK+VStNsvt09VGhB9tMYebk5HP4awC9qd2HbhQ
	QsaHg86Alp+ISAHAZHG2T0Q/S3IuBimO2/u+jIfvQAen8ET2pvdquwrS/a1+kkb0WKjul4BC0aW
	y6tjGtkdNrBLj5FFVZbX5kAkGnZd+wstGAkilcYVi2Q9tYP4EmcbDK477iKALrQCFfJt7Tesjqh
	FgNIvaQm+v4bBZqiUE7P9o0GqEEvgnmJw1HQe2qzxeoXNUCxU4g5QTiUi8SQCTS8Tf2D8X3HKH1
	x/TPWNYzY9OnQLGfxvMzHIIW2oSBjmQIPEsgvbRT+Uatb5CmB6UyCe7+8BZqn8rERGRzjut2bOi
	iYGrfKn5+AM5utjwEbTEjYtRsK8OnIfOoQvru3e2hN2T/EO/VNrkkKmyak5cjzmmNnuWXy47irF
	1ep1slcKcNb1Ihoz6KomizrMO3A5fpKzcqqZWVcHR9g=
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr8478786f8f.43.1794595140541;
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:35 +0100
Subject: [PATCH RFC 21/23] arm64: dts: qcom: add SM8650 LPASS CPU dtsi
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
Message-Id: <20261113-topic-sm8650-el2-v1-21-5183f6aab9fc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7934;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=3kjZaVqJSyCEesNU0H/+AmXUsTyHtkf+decNnu3GiPE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91korEVY0HK0b6kmL+fpgIqlGWV1Dj1bLChkSm1b
 u5jdI0GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKAAKCRB33NvayMhJ0XG+D/
 46gGGSC/jvBNh4B0Ilk03vkLY2x33GvoF/4pfSnRaCXyJqomwfMdK2ORERCZ9qYR3oIfqOPACfl2EN
 /0XZpvmcDt+bQYr+uAFtGal8rZ4h1cg7Ogpu1I2r0ZJI+vRXhvT/IeObzFdQy4GJAdTk7aDpdasRqW
 EaLypIl7jVJqZBDSw5Xz1M9cLqvk05yhwdkoPAGTdqSTFqtlKE3DJqh2vA1xamutL6ebGN6tZbzrQX
 QJt/TeYBU8pmO5BxHHO6JexIFicIFdbCP3hgIFlkblo/liu+D9PgLdHi3EJcNpr165nj6D5StP5uGY
 rU/ZgmLXSm5NTcehoXXhB+0z59wobSZ4V3MOIeRLj7JUPPE+c8q0nUmbeh7AqJQkbOb9T5lujxExOU
 yfJxWNuEVmejkBtQvCQULPNlqzq2hzRwZVUWmOjn/+n3PJzKVMerD2vdc4GnbR5cSRyCgOc5U7QPPc
 kYZdifbIipBU7BQ5I3zL7IZLbWmkjHionXhhMPePFrTTaFcZ9OZdvCMGyXD7Zf+IkfKHUtkdIXFfPT
 b1NnNNpjF+9tcossNXvUVPdjXIAFJbtWVqYTvu/yI05BcEFg/Fpnl6wAWMoTVS0cdk9mdfIv+CwRGj
 9w8jMVOYfn++noWxHj4h69oq8oJ8sbjLdtdMxY3239zSiooQLnOrdEtg/3NQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Boards booting at EL2 without the ADSP audio firmware need the LPASS clock
controllers and lpass-cpu nodes to drive audio directly.

Add sm8650-lpass-cpu.dtsi with these nodes and the LPASS macros clocks,
and the I2S2 pinctrl state.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi | 222 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi           |  25 +++
 2 files changed, 247 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
new file mode 100644
index 000000000000..43d0d8daa4fe
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Linaro Limited
+ */
+
+#include <dt-bindings/clock/qcom,lpasscorecc-sm8650.h>
+#include <dt-bindings/clock/qcom,lpassaudiocc-sm8650.h>
+#include <dt-bindings/sound/qcom,lpass.h>
+
+&lpass_rxmacro {
+	clocks = <&lpass_audiocc LPASS_AUDIO_CC_RX_MCLK_CLK>,
+		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_RX_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "macro",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_tlmm {
+	clocks = <&lpass_core LPASS_CORE_CC_CORE_CLK>;
+	clock-names = "core";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "core",
+			     "audio";
+
+	status = "okay";
+};
+
+&lpass_txmacro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_vamacro {
+	clocks = <&lpass_aon LPASS_AON_CC_TX_MCLK_CLK>;
+	clock-names = "mclk";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_wsa2macro {
+	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA2_MCLK_CLK>,
+		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA2_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "macro",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&lpass_wsamacro {
+	clocks = <&lpass_audiocc LPASS_AUDIO_CC_WSA_MCLK_CLK>,
+		 <&lpass_audiocc LPASS_AUDIO_CC_TX_MCLK_WSA_CLK>,
+		 <&lpass_vamacro>;
+	clock-names = "mclk",
+		      "macro",
+		      "fsgen";
+
+	power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>,
+			<&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+	power-domain-names = "macro",
+			     "dcodec";
+};
+
+&soc {
+	lpass_audiocc: clock-controller@6bc0000 {
+		reg = <0 0x06bc0000 0 0x38000>;
+		compatible = "qcom,sm8650-lpassaudiocc";
+
+		clocks = <&bi_tcxo_div2>,
+			 <&lpass_aon LPASS_AON_CC_MAIN_RCG_CLK_SRC>;
+		clock-names = "bi_tcxo",
+			      "iface";
+
+		power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+
+		#clock-cells = <1>;
+	};
+
+	lpass_aon: clock-controller@6e00000 {
+		reg = <0 0x06e00000 0 0x30000>;
+		compatible = "qcom,sm8650-lpassaoncc";
+
+		clocks = <&bi_tcxo_div2>,
+			 <&lpass_core LPASS_CORE_CC_CORE_CLK>;
+		clock-names = "bi_tcxo",
+			      "iface";
+
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	lpass_core: clock-controller@7b00000 {
+		compatible = "qcom,sm8650-lpasscorecc";
+		reg = <0 0x07b00000 0 0x58000>;
+
+		clocks = <&bi_tcxo_div2>;
+		clock-names = "bi_tcxo";
+
+		power-domains = <&lpass_hm LPASS_CORE_HM_GDSC>;
+
+		#clock-cells = <1>;
+	};
+
+	lpass_hm: clock-controller@7e00000 {
+		compatible = "qcom,sm8650-lpasshm";
+		reg = <0 0x07e00000 0 0xa000>;
+
+		clocks = <&bi_tcxo_div2>;
+		clock-names = "bi_tcxo";
+
+		power-domains = <&rpmhpd RPMHPD_LCX>;
+
+		required-opps = <&rpmhpd_opp_nom>;
+
+		#clock-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	lpass_cpu: audio@7b87000 {
+		compatible = "qcom,sm8650-lpass-cpu";
+
+		reg = <0 0x07b87000 0 0x68000>,
+		      <0 0x07d00000 0 0x2b000>,
+		      <0 0x06c80000 0 0x10000>,
+		      <0 0x06b40000 0 0x2b000>,
+		      <0 0x06d00000 0 0x2b000>,
+		      <0 0x06d40000 0 0x3000>,
+		      <0 0x06b80000 0 0x2b000>,
+		      <0 0x06a40000 0 0x2b000>;
+		reg-names = "lpass-hdmiif",
+			    "lpass-lpaif",
+			    "lpass-rxtx-cdc-dma-lpm",
+			    "lpass-rxtx-lpaif",
+			    "lpass-va-lpaif",
+			    "lpass-va-cdc-dma-lpm",
+			    "lpass-wsa-lpaif",
+			    "lpass-aud-lpaif";
+
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+		interrupt-names = "lpass-irq-lpaif",
+				  "lpass-irq-hdmi",
+				  "lpass-irq-vaif",
+				  "lpass-irq-rxtxif",
+				  "lpass-irq-wsaif",
+				  "lpass-irq-audif";
+
+		clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
+			 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
+			 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
+			 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
+			 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
+			 <&lpass_aon LPASS_AON_CC_EXT_IF1_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF1_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF2_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF4_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_EXT_IF5_IBIT_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
+			 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM3_CLK>,
+			 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
+		clock-names = "aon_cc_audio_hm_h",
+			      "core_cc_sysnoc_mport_core",
+			      "core_cc_ext_mclk0",
+			      "core_cc_ext_if0_ibit",
+			      "core_cc_ext_if1_ibit",
+			      "aon_cc_ext_if1_ibit",
+			      "audio_cc_ext_if1_ibit",
+			      "audio_cc_ext_if2_ibit",
+			      "audio_cc_ext_if4_ibit",
+			      "audio_cc_ext_if5_ibit",
+			      "audio_cc_codec_mem",
+			      "audio_cc_codec_mem0",
+			      "audio_cc_codec_mem1",
+			      "audio_cc_codec_mem2",
+			      "audio_cc_codec_mem3",
+			      "aon_cc_va_mem0";
+
+		iommus = <&apps_smmu 0x1100 0>,
+			 <&apps_smmu 0x1101 0>,
+			 <&apps_smmu 0x1102 0>;
+
+		power-domains = <&lpass_aon LPASS_AON_CC_LPASS_AUDIO_HM_GDSC>;
+
+		dma-coherent;
+
+		#sound-dai-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index d88acdb8c775..298e4ca33b4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4427,6 +4427,31 @@ data-pins {
 					bias-bus-hold;
 				};
 			};
+
+			i2s2_active: i2s2-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "i2s2_clk";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				ws-pins {
+					pins = "gpio11";
+					function = "i2s2_ws";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio15", "gpio16";
+					function = "i2s2_data";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_lpiaon_noc: interconnect@7400000 {

-- 
2.34.1

