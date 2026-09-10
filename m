Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29999374E59;
	Thu, 10 Sep 2026 23:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789081446; cv=none; b=YSk4oZOz4m7J2F4tPe6zX6DDAJWfRqeHH2B9Wl8YLku4j8zpuzAhrGGhXl3+/Uk1gE2CrzWKaZJNhDAQdKB73VORZiAOuLxSi0it1I9ZAGOpB+4s4mCX78IxYkWt7FqzW9pJneA2p33CsJtwgCnjly+iVPLYSpjbt6+EkM5xJcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789081446; c=relaxed/simple;
	bh=3Tqlq58nnnZ1ljHJpCaztp7sT28l4mkNqkfIm8OBFuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GcSWLpTzH5jPTQntryQkINwQJ2/oEyVpQKWBBhItEToFBosfsvgUHEyEfaqBuflQIxUAnPgt/2/7nf0Oh2BRXDSNW5JNolsgA/a21Stz5jpSpoDBCdyKUeM2XrSqOsCoboFDeZL66Ky2jcmjpzU/R1rz/IIFt/VJk+hz/k0MP6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYE0xgGZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYE0xgGZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740481F000FF;
	Thu, 10 Sep 2026 23:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789081444;
	bh=JE5YpUVOloIunsmmhQAgl4rcTgq8dXGaSKLaJ2rHXRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UYE0xgGZH2KBXAumsV9y9ZjXENW+e63L+7IzfabSm0UZbnlzZEnNCZKdoY7hrq12d
	 fgH5yr6w15jy0tK+gHVc2Bm+K7ciSbzGwbAg9vddcWgvI6ioc5/OA27SJp/PX1V6/v
	 Tj5H8RbTVTR8fuwKqujdZLcjCExDTSJuLdVwYaSXxKP5QZqKCTVeA+CteSnSSNPcon
	 /UUuK51RS1oIjw8DABwmKDQeDUkVEcoxYyyc3JTFjCOnA3Dss3dhdtTbLYV81Auk/0
	 6K9H/JTuSO/3H4xRJA8yP5mOcMaeaf2Qs9StWvFyFodYkz61FR3Y9N8+h4/GokvQBv
	 0NA7W87kBSbLw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 11 Sep 2026 01:03:48 +0200
Subject: [PATCH 5/9] ARM: dts: ux500: Add sound DAI provider cells
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ux500-simple-sound-v1-5-6771ac714e82@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
In-Reply-To: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 mfd@lists.linux.dev, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

Describe each MSP as a single-DAI provider and the AB8500 codec as a
two-DAI provider. This allows generic sound cards to reference the
playback and capture interfaces by phandle.

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

