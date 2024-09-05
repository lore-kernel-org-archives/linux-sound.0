Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D55F3192B72;
	Thu,  5 Sep 2024 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725520057; cv=none; b=OAK2+hi4jtUQC9IMCz4+gd8N6zVhSg+obVEi9VBp3Po4rL35hrEvWuyaq070NAW4dlAUQo64UafjzSMz0BRPnvQKh1Fk58gst8cVkqUiBMyUV7wnwG66Z5fPnCkbt/U7bizy45NK8IrFME9JVUClLLcrFJ47qiFgnP0UbJkfvUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725520057; c=relaxed/simple;
	bh=kvECuzNV2lAaWFEHINyazo7DSpunYfNvVEjFErJoZuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sr6zKflSYPJP7EIetMzpybw/LQV/HQxqXt9N8n6k/wdtbC2pd3NtV6lUlP7eKK/rLkSg0AsgruBAmVTU9osMx7sL32c/lz48ZTBDernrgPwFbuNKqbhhoPsRWZ7/E8f+ZB9c6Q9hCQXd8X43QMIgUApnjPNoheld9HyEMwxEbFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.71])
	by gateway (Coremail) with SMTP id _____8Dxvpu1WNlmGxsrAA--.57056S3;
	Thu, 05 Sep 2024 15:07:33 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.71])
	by front1 (Coremail) with SMTP id qMiowMAxG9yrWNlmcMQEAA--.5106S3;
	Thu, 05 Sep 2024 15:07:31 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v1 09/10] LoongArch: dts: Add I2S support to Loongson-2K1000
Date: Thu,  5 Sep 2024 15:07:22 +0800
Message-ID: <226f850ad459b44de0d89a7f4a2a4d07ee03b707.1725518229.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1725518229.git.zhoubinbin@loongson.cn>
References: <cover.1725518229.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxG9yrWNlmcMQEAA--.5106S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7ArWrJryDCF1fJrW7tw4rtFc_yoW8tr43p3
	ZFvw4DGrWFqF429as8JFyUJr1rZas5AF97uanxCry7G39Iq3Wjqr48tF93ZF1jgr4fX3y2
	qFs5t347CF1qqwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
	kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
	6Fy26r45twAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0x
	vY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I
	0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAI
	cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUxNeODUUUU

The module is supported, enable it.

Not all Loongson-2K1000 development boards have an i2s interface, here
is an example of adding one:

sound {
	compatible = "loongson,ls-audio-card";
	model = "Loongson-ASoC";
	mclk-fs = <512>;

	cpu {
		sound-dai = <&i2s>;
	};

	codec {
		sound-dai = <&uda1342>;
	};
};

&apbdma2 {
	status = "okay";
};

&apbdma3 {
	status = "okay";
};

&i2c3 {
	status = "okay";

	pinctrl-0 = <&i2c1_pins_default>;
	pinctrl-names = "default";

	#address-cells = <1>;
	#size-cells = <0>;

	uda1342: codec@1a {
		compatible = "nxp,uda1342";
		reg = <0x1a>;
		#sound-dai-cells = <0>;
	};
};

&i2s {
	status = "okay";

	pinctrl-0 = <&hda_pins_default>;
	pinctrl-names = "default";
};

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 arch/loongarch/boot/dts/loongson-2k1000.dtsi | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/boot/dts/loongson-2k1000.dtsi b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
index 92180140eb56..8dff2aa52417 100644
--- a/arch/loongarch/boot/dts/loongson-2k1000.dtsi
+++ b/arch/loongarch/boot/dts/loongson-2k1000.dtsi
@@ -266,7 +266,7 @@ dma-controller@1fe00c10 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe00c20 {
+		apbdma2: dma-controller@1fe00c20 {
 			compatible = "loongson,ls2k1000-apbdma";
 			reg = <0x0 0x1fe00c20 0x0 0x8>;
 			interrupt-parent = <&liointc1>;
@@ -276,7 +276,7 @@ dma-controller@1fe00c20 {
 			status = "disabled";
 		};
 
-		dma-controller@1fe00c30 {
+		apbdma3: dma-controller@1fe00c30 {
 			compatible = "loongson,ls2k1000-apbdma";
 			reg = <0x0 0x1fe00c30 0x0 0x8>;
 			interrupt-parent = <&liointc1>;
@@ -352,6 +352,19 @@ rtc0: rtc@1fe27800 {
 			status = "disabled";
 		};
 
+		i2s: i2s@1fe2d000 {
+			compatible = "loongson,ls2k1000-i2s";
+			reg = <0 0x1fe2d000 0 0x14>,
+			      <0 0x1fe00438 0 0x8>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk LOONGSON2_APB_CLK>;
+			dmas = <&apbdma2 0>, <&apbdma3 0>;
+			dma-names = "tx", "rx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		spi0: spi@1fff0220 {
 			compatible = "loongson,ls2k1000-spi";
 			reg = <0x0 0x1fff0220 0x0 0x10>;
-- 
2.43.5

