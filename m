Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93884AAC74;
	Thu, 17 Sep 2026 22:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789685489; cv=none; b=bj8GEy8TU8+MPv3dgyyhErN+lrRV1bKzYVgf0UhKbsN7625EdbMQHEKwWjwhRKMftYhKGbDPYnGCejp3jAXGbnGrJuznOodUZq4WmCxYcTd5FJyzBpdqR0aVtUH7b9R3T5MouAnIMhOMOLTlXcKVGhc7LQ9hzqACEYqompvjnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789685489; c=relaxed/simple;
	bh=JwXTyLw5sCNyCqZ5qvxbtHfe1WAMNUOOY9W0OetvMeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GEkaJSH6tmHobImhALAQRldryllH48vL9NjQExE5JSVqOpAWhOMYcg9eBOs/aXPFM8S89jvEsWmzUoh4V978l2+eScn9TdWonRQjleI0EG/KlaDIAtl2/nJxMPgBoW5roWDxDawKu4647XUiEl+wQOfgUmU4YaQY3xC/1igOe1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0CGNxfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0CGNxfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D87771F000FF;
	Thu, 17 Sep 2026 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789685486;
	bh=dmRya9yhiPvIfoOl0GP2zW3UEf8x7cWVHaXsUA5cMIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i0CGNxfhaAHhNoWJ4iwJ5HUprXlXrwlek266BsAZX4ez7cy1OJSrHyl+i+exRUPdo
	 XydER9IBomeKxlPPGD+UJCYzPIcW3Phw5GqVorzJuDhz0Eg8YnsI5P2MO4ed+F1MQF
	 02oPwxLa/cUCi8kwsZpW75zgnMjmXQygh25GCwARESPluyTK+P5kcXorRnrWZJKV8O
	 ZTEn3dcYCQdlX8ULG37KXFrv8Ww1758xDn/H4fUUhjQGhk1GeyNTFza6p2ZJmLxN86
	 6UOkUJTZtAKoYYvWJWU8FNGpEbANJEI2+TGSa99yVW25Avx1CHNgAvif/HaDxsOUM6
	 BqAKwUv7lrBiQ==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 18 Sep 2026 00:51:04 +0200
Subject: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
In-Reply-To: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Describe each MSP as a single-DAI provider and the AB8500 codec as a
two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
and select the codec playback or capture interface by port number.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-ab8500.dtsi | 1 +
 arch/arm/boot/dts/st/ste-ab8505.dtsi | 1 +
 arch/arm/boot/dts/st/ste-dbx5x0.dtsi | 4 ++++
 3 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/ste-ab8500.dtsi b/arch/arm/boot/dts/st/ste-ab8500.dtsi
index dd30d08ccb9b..8bf083addd66 100644
--- a/arch/arm/boot/dts/st/ste-ab8500.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8500.dtsi
@@ -272,6 +272,7 @@ pwm@3 {
 
 				codec: codec {
 					compatible = "stericsson,ab8500-codec";
+					#sound-dai-cells = <1>;
 
 					V-AUD-supply = <&ab8500_ldo_audio_reg>;
 					V-AMIC1-supply = <&ab8500_ldo_anamic1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-ab8505.dtsi b/arch/arm/boot/dts/st/ste-ab8505.dtsi
index 131c82508e82..e61beb8b5ac3 100644
--- a/arch/arm/boot/dts/st/ste-ab8505.dtsi
+++ b/arch/arm/boot/dts/st/ste-ab8505.dtsi
@@ -224,6 +224,7 @@ pwm@1 {
 
 				codec: codec {
 					compatible = "stericsson,ab8500-codec";
+					#sound-dai-cells = <1>;
 
 					V-AUD-supply = <&ab8500_ldo_audio_reg>;
 					V-AMIC1-supply = <&ab8500_ldo_anamic1_reg>;
diff --git a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
index 25a20fafc6b9..e6585eeb4553 100644
--- a/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
+++ b/arch/arm/boot/dts/st/ste-dbx5x0.dtsi
@@ -1078,6 +1078,7 @@ sound {
 
 		msp0: msp@80123000 {
 			compatible = "stericsson,ux500-msp-i2s";
+			#sound-dai-cells = <0>;
 			reg = <0x80123000 0x1000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			v-ape-supply = <&db8500_vape_reg>;
@@ -1095,6 +1096,7 @@ msp0: msp@80123000 {
 
 		msp1: msp@80124000 {
 			compatible = "stericsson,ux500-msp-i2s";
+			#sound-dai-cells = <0>;
 			reg = <0x80124000 0x1000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			v-ape-supply = <&db8500_vape_reg>;
@@ -1113,6 +1115,7 @@ msp1: msp@80124000 {
 		// HDMI sound
 		msp2: msp@80117000 {
 			compatible = "stericsson,ux500-msp-i2s";
+			#sound-dai-cells = <0>;
 			reg = <0x80117000 0x1000>;
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
 			v-ape-supply = <&db8500_vape_reg>;
@@ -1131,6 +1134,7 @@ HighPrio - Fixed */
 
 		msp3: msp@80125000 {
 			compatible = "stericsson,ux500-msp-i2s";
+			#sound-dai-cells = <0>;
 			reg = <0x80125000 0x1000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			v-ape-supply = <&db8500_vape_reg>;

-- 
2.55.0

