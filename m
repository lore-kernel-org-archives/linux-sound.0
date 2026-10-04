Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465A4071D9
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093984; cv=none; b=o7zcVKkRn/Y4osLs/jIzvVkEnfSBwoEYuzxyOvLuZIf6qth1jNtscJ6ghlUinR2tHH1w2cSYd0YTiQJGDTIU5jmTW5BnmQOV0adEMyI2C29EiYX8ycu1i2S4/5E929u/WlQftDw4az1JxmD/oIcXBWUfjTEnAlzW/sXP1AMPh/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093984; c=relaxed/simple;
	bh=vCW3fxOJkBinIg7sVkVmqG3Z3g/7JrWUIeRSo8E+Iow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rutfPbOeRqcinQO1JV6LSJKmtwmU26gorxdvJZVpWkRxUJCGUxP+Fo6IECH4etnTUenZ2UZmp2rqg8RVYg20VZznUc7nfmuHAwbi7S+/VFvgobHhMLc3Mozo8JmMpMFtzHE2Lp+iPJXF8nWF/pnouSOdHZmIbKwmYxwATi9sqww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUrsrtDG; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUrsrtDG"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6df9494e5so179048a91.1
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093983; x=1791698783; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=;
        b=nUrsrtDGSiP1gQAIn0AwZS0pInp7oE5bv+SJ5RWRxuLuPsu6BMcRq/MSXWrvNUhLVe
         M9tgGOA/9gXmrUTix4rKue/MNPlOlVFmp9EhXYMHHiw2/zIzWHZ7vlS2/JZKptFO/pvS
         TmA74Vnj7nGjvZuVbqdhtEb9HL81N1mqRtbg1DEcrKKjT1zETVDUjkQ9UP6tlMp6Alvg
         z8fS45XX+G+VC3RYUNou5PIlqp3C8janpdanIdIzuEyfVEmHbkPI5/4AB50MxnJHgiTI
         juaXrlRFVtDqIT1wcCjcOhnjBOiSgKmN14HCFzF/lnQIamhMtY/KoyimgYZGOqMEECSJ
         9G5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093983; x=1791698783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEEmgDILRhIEA8VUTy7J3z7No/+m/NGeZn0Fr0Kfpew=;
        b=ijiyhYAAHNNFsSW/AKYG15OyaGFrM7ja3Jaem2hGAdkr+Iqtd+xeMUHvTISTPQiR/I
         ndybN2lR2VDJzEEpcYJHYAuNoAENpOG0Uc0VQ5iL77IdfbriCIw0EGwR2xiQZKj7sNrP
         w6jxaxFDc3VLqb1fEGNO2ASoFgIwRIo8ZtwnI9/6DhRqTH1pgiNWuzrnVuGrYcOk3SFa
         HTCZi3fKNjIUBCs5O8BPnEdQzXjhf3rKwXh2LxpJf8eZoPv51EckqzcQvBImauF5Bgym
         PFJPW85o0owYuSzR2J1r4wydoZXj6m2AI/g67iLIOgevcLlZ94FS54i+RucPQ+q3dXE7
         Dqww==
X-Forwarded-Encrypted: i=1; AKwUvByx8bd8obCYvzke9LoIG0R7W5604y0RSqhw/a7n+/OdTSyQzC6QawTFe/4N4lu/wVee6QShzaoo3WCGIQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvZGG8Poj+kdDpBJ11QAtawJ7VkY1MPHMbGA6f3JA68YwbxmSV
	yYJVgLQiXobRLLcxpOguxyY3MOCGH4apqiHtmVRZw6f4UTsfFLgjejzk
X-Gm-Gg: AYBFou3FFTWoLDybrJGUGUIKfVFG0N0MRTtK+ladjW8a103y8LgS6zJznzxROrlPDXx
	2yvAexPTr7UGHNNHCszxADKGeukuM7V0eYzcY+Ab6tj3+pxN6JZmnJ4o4Wf1vBZQU5kjM899cuy
	O4DF44Cyu7cAnUAhFEDNHuv65+KghC6/XfSxPuwRd8TgIMlEHsZMDdBkp/55F5dE0xhPTeoxccB
	nZHQq8NwTtwkkhmEsQ6iukhDTCOHWZJwLyH4rDA8xUg3XZ7+9aX4iDTWbfCP654TgVO5ilLWnTb
	jA2gUDl76JsB4pHfihSAp3aJypvH7AsWFCzcgGAGZ3ZLFq3LJpkU8Chx6MIehKS2j0RDdRlyVs8
	xuZWiQaHWwUVPDLtr7uM3kNO6OxURSm3qzGityDVyJkYUnfKkYVc2Q/jo8GIaejTkdu7Kq9q9o+
	isF1bw8EAoGSTedGzQ6G/6mrlyiUe8x/YQcezMpKnCxeuGzi8o/hSDzjFgi9jsEnquLIQAnQgpE
	Wt2O8uzPWcmeT/ujMnvpbriV56UAeIueEdP8QJvY9ZFlbgeZ3oEAMkKLUnEh5Z4ibIH03hTnGus
	Cd3kDktAPadywT2/WTzCTi6S82mFpxx+icN/+AL6ppJavK2i
X-Received: by 2002:a17:90b:6c7:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3a6ce97d00bmr4272307a91.7.1791093982802;
        Sat, 03 Oct 2026 23:06:22 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:22 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:41 +1000
Subject: [PATCH v2 14/21] arm64: dts: apple: t8112-j413: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-14-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3207;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vCW3fxOJkBinIg7sVkVmqG3Z3g/7JrWUIeRSo8E+Iow=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+St/vRVrMtqLbPodA5vI7HnVZnR2lXxE8IMjM63n
 tA9emBFx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKrzyhn+Suj37xTkrZ/kZvugg6exaKKM1GzuW+kn/x3XqStTmeaiwMjwW+Ny+45
 Gp/tbjzlvfpLv9djH+or04+zeuD/CTjX7/zzkAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 7ccfceb08093..5f8768832e1e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -92,4 +92,112 @@ &fpwm1 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_woof: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Woofer";
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
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_woof: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Woofer";
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
+		compatible = "apple,j413-macaudio";
+		model = "MacBook Air J413";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_woof>,
+					    <&speaker_left_tweet>,
+					    <&speaker_right_woof>,
+					    <&speaker_right_tweet>;
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
2.55.0

