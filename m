Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBA737BE64
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303020; cv=none; b=BXp96WeZOB5nMpGux+9Efkc6HnS95XJwiLDgCZSR7SH9bdfjcrn5ET6S33+zCn07wf4FmTurUw3c5OOMSnvEoDc5OCLjupm6U7RBoslk2QGpI8gSL2jcEAc+Ol+2P3QNQ3t1/P9TZ4ebdEjsRvKfQOo+MWe17MNEIsn/s6F74o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303020; c=relaxed/simple;
	bh=JxN80yGgi8dxQy++Lgr6IUGkCUjCTAVvVbG02jgBSPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BNwqXbATP4bh7AYikl2pO73xtilweI3HfmblwNza1G3IaGUOf25+Fl2ftJcge0RObNXF0nClxm515b5kTgauf7o6rpH3ix8G3HkirEAXp2ONQoAV+mmpWV8vr034ez3X/0hTvy+E5ERJePrSmcsrS5oM0YdD537d8Ev/Fu6zdqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvp1nbVD; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvp1nbVD"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso933099a91.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792303017; x=1792907817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=;
        b=dvp1nbVD+FOrdu7IPkva72SS0JC50Lit/JnxyX5UTp+KKAkDpRKafhrKMzdakyO0Iv
         uE473o/UuvGsvMeeSFEBF9KhZuHlKayUkxDIQHMVH2uEVE3VcaBHgdMuZFOOEAQXvV7B
         zBKee5vEBhX063ha7h82sZZQbpAfToahQWBwtuJKcVlMBOaPSog2A7FAig5h9k+amvgq
         RhBDtPc4aUuFBVHW2rrjgxioPl9sGpD9FHWzAUCa7xmb/Insm99QCnpwEGbMSoQCh0Bu
         8a0a2mqG7njYg7o+aAVZTNyMFOMrw/ZQe0r7APCWswteVVH97GVDObqUkefNG3pX2C8d
         vlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792303017; x=1792907817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bSJXdBfbrIw2IxZWLS1S7ToPjqCUAXDZQMF1IOWmL0k=;
        b=vSWXVEVV+bPpPBd0Vm8I3+OJVOnZBjhyE1eHFATfMwhBaRP5lzTIuLgu9Z/VCBEFLk
         zma/6f8F1MdCB85Ub8WDOuG1ut9aeyvVr61g312wxzxfIrctUUnEo/ZqXiHznldx368N
         JssIz3QMq1IdKycOzRlW2ZCK6I2pQUQC6AggGqB8//kqEv6Erg2WBe8NoP8x2Iw+BloS
         LqV3fVAZKdyjn1QY9ta8GYpJnZgDJpHWDM1EHeyoW24xISJzFiYsfrNVq5dMybOrMVb4
         SwTPDOFL4uo3M+oPJ2R7eLOM84cN0nR+Rd17UeST3vauafZBshbAmHIGfP05btpteRW1
         +wwA==
X-Forwarded-Encrypted: i=1; AKwUvBzS6Fg/rsUEhw52d/ncwrgHvuOTXK5wnIzlDUTIdPoU8/uma+Gwhq2IymJJWq46X1zugmAdboUFFuyDig==@vger.kernel.org
X-Gm-Message-State: AFq9FYKa46hAjCCs5IpoUg3WWM3DZgexhtdJcj8Z8mgR3XP0D13y+PqS
	kKOVOPI4K1WWcm3HDCk6/0SBJjcsQm4WGDW9+m9LUETjr7rlg9+YnFcn
X-Gm-Gg: AYBFou3nUYrcRYbcrRnSX7ypk0rShjpw+cxbzGuhFn3g4O7ElECRxm69B4ZZa5DIP0e
	qG4+eyakMZ9nAe+qAmlBLsi4KT2DDutxwL5HwjJmArvmqrY/m+CtnOwm6RiwmpYLlE4COXU9SvL
	Nl/RrSW/4PyMzC+yF+lmy5HbypFOdqf24SqoQx0cf4jxoHtPksjO95Cgbi5DJlBb2IwnZKw9a8s
	X6LCakxcNXKncgsb/UfJexchcyPCU/Gng/QvUc6D1cyGecSMjcmjbcoXvweyLc1kdYpVSGG2eMi
	y/8BFAzV8kCbn/2Tf8WBtT/x3o1paRH2bIWWNV4bcNTdC6EucjmIyUPc+jjMvWHkasDAa5W1Sv0
	BqK4NSs36QWta8CoyflO4oTuQmA+O0mxvGA/vCh30VHJOakPWqVX38Jvj2VE64NxzYGPfhlyfeM
	Yjv00itw6CCMsaW/kLYm7/5Ep8T0ePN/749feBAPCu9WI6x2FOmWFlJHP9a0gfQW5e8QzLABikA
	efYat2LQ0LNKnQFRlNDvQ3Al3SMDpjXSc9qmAkB7Wcn853A9Q9IrbphQRIJcRAYBhIl/UNWdimM
	9Z2TMksInpwYc7SGiRY4eO3M3s5tUABGsEo2934NIQ8KFQ==
X-Received: by 2002:a17:90b:5643:b0:3ac:95d7:2f9e with SMTP id 98e67ed59e1d1-3acef4e492fmr3875435a91.38.1792303017082;
        Sat, 17 Oct 2026 22:56:57 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:09 +1000
Subject: [PATCH v3 15/21] arm64: dts: apple: t8112-j415: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-15-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=JxN80yGgi8dxQy++Lgr6IUGkCUjCTAVvVbG02jgBSPE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnfSi9caHVep7JTrWylnMyGpTn3vO/Krg32PZdR4
 vzDPut2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqrVRkZesRPF50+GsHhvVho36TPntreW05NzQmeOUPX7smzX8U29xkZbi7UXt/
 /ZcokoRMx9rwJr++cETs7J/I2Q9aDQPmvPatP8AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 132 +++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..099b9837b633 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,136 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof1: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 1";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	speaker_left_tweet: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Tweeter";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_woof2: codec@3a {
+		compatible = "ti,sn012776";
+		reg = <0x3a>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer 2";
+		ti,imon-slot-no = <16>;
+		ti,vmon-slot-no = <18>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof1: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 1";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	speaker_right_tweet: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Tweeter";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_woof2: codec@3d {
+		compatible = "ti,sn012776";
+		reg = <0x3d>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer 2";
+		ti,imon-slot-no = <20>;
+		ti,vmon-slot-no = <22>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j415-macaudio";
+		model = "MacBook Air J415";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-3 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+			dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof1>,
+					    <&speaker_left_tweet>,
+					    <&speaker_left_woof2>,
+					    <&speaker_right_woof1>,
+					    <&speaker_right_tweet>,
+					    <&speaker_right_woof2>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+
+		dai-link@1 {
+			reg = <1>;
+
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

