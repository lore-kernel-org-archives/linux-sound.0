Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EAD411FA7
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303000; cv=none; b=j34fhGaI88SyU1SKrL2QV1N1BuqkmkGgSx+2crk2durCSITDaRuYs/aZIpQ1BHthYt4NtsCWkBXqmN2EcoP8DnZJKtm9RDF6Pd5eKb6aFbU1CTqgV0xJB8A2lmtO6emRseYNxtPBe1KJ9ywGUVfkd6s2KDvXujH+VcrGSU2Ju5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303000; c=relaxed/simple;
	bh=zDYarNXpwu0fUg9Z/Q5DjYa8aciZr7oQNJE40M6audE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qF9Fheyc74Akg9rjW5uKFPCqEopPdHp2GB0ZBol4vKifcgpKbjx9WAORg3Cnm4sXXDt+QlxhSQtJIr6A7Aax1aAcGABo/Ny1WhYYueOP2qSZBVlm819432z3QIf9LwatsRyraJa0ulkij6JXdi9eB7mXy3wLngZe73PxYKGV8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MWlRr8wB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MWlRr8wB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1099040a91.3
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302998; x=1792907798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=MWlRr8wBXXLSUrstFaQ67WIZwEbleRB6X9ZG4R4YXSchHD+BlcdAq96V+9+7+XmRb8
         LoVy7t3LasJ+cCye7tdwox/35fXMjS2A6aybfsAlbtbBstCLjBt8E4NdGSQFMwiuUpoU
         A88ed8Jf3wfhyFQWkepSLaFpp+vhii0YLEAF5hOhKnVDU7tWfXA9TcuceN4FqndKj0iG
         0mDOwzT5baEUonrjz4XPSAXW5T2iapyyEADsJwmeazsIjrU1hky5nDe83vvUKHsHIrx5
         vpL0pU6ydW2B8riIkyJW/4ZwifrOYkbHNu/kAW5GMN//2NbYHSfHz0aREyetyfbjdfQl
         2/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302998; x=1792907798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=UtG0mq0ochKiUvOC+DdKxQWXdMwovOsDc7OvLdetAyCVTxkE56Oh+h7H+i6eWA/3Lf
         Ps9+INygRpMJ3wBtKrVwWw+E9jmXVnMLJ3c/x5P9tRn2rGZfG58x68flSuQ2DHKjejYD
         Wq0t/vCVkBuzJp1uBXIvhS8Yv0ici4D28RPYd4FvB3W9vCZlPu1lM1YCicCqeUvzS0ch
         t+1qGgnvplSnWiwMQGmc7ry1bH3N5lqEzcQWAjmaM8ggEFD0WGEPYGh9/wrjYuqsvwUt
         qRTv7DEXzz3KqfHAyTYlYVtkMPNCuy31TIVzyIDbUth6y/zb2FBRI7biJrFu6Atdb7tC
         BuNw==
X-Forwarded-Encrypted: i=1; AKwUvBwbi98SLSwUJelZin9gAFRexKDKf/XAdg12EmIwM+oUHk0ij13V2pPFIMXvX88jTt5fLAaWwLYY71+cGA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIbJ/BKa6jcPK3I/FI5VfP19e/XMRfG86Rx9ft+R+YT/CzagNku
	2XojyP9mEnmCI/t8u/FEh9Ri5bOFAZmZOQ6jsJ3THCnfr+sTKNJRxvC9
X-Gm-Gg: AYBFou3A1NHesrQagkXbJ3Y1eT5fetXRoPNnuarlXaVFQTr7JJeFNQyb9pXX12FmlL9
	F5Ui+I6MuIDPp5shKfZ5tOFe/Kvwe5s3qLMvvrOBkeKmsGOynzon8A1ly0l9QjrKhy11yaTSktI
	y9PvGVPYX3bMXXPoZwavuh3Ye3C3U5finkhtRBQRIkaNJ36LdBnZMeB2EKr5Vade4YLs748rhbP
	8xhwycVagCCFai98u/ZjQQjr+fw+UFwrErtVs7DAKTCc+/nEIeYdhuEaN6hd7y/nws0IgquAvCW
	7+wCIZMXzhQnGuBR6JgOHu/etCcVs1B1bi2wamT2rmV5YVPYYZBPfJlaF516uUcv+AgmUZx8lj+
	PLkj0XnWx1K7wx+08MEjmiRee2isrGjKMh1vQb6Id+iMVL87HljVyuLPaZAU+RrLzmPE/9xJEEP
	aeSEdKaDCbdkon3yzH1AFbNB0tPBPGa98PBmwfpHIxgLEl1C9+iixPhGveBEhp1L+Cn6VyNKpBM
	V+BbFgrycOSyqVPZySxTW8V8QLeD6ACpj7LkPmJ+uEtpLiAF/thyN48Gjuh1mQq7hkRmkoO1HTa
	IrGLtpDWk65b/rznjNTy2cgSy0LvmnOTALJx8kk6e8fNvMM=
X-Received: by 2002:a17:90b:2701:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3acef11c1b5mr3627242a91.60.1792302998052;
        Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:07 +1000
Subject: [PATCH v3 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-13-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zDYarNXpwu0fUg9Z/Q5DjYa8aciZr7oQNJE40M6audE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl7jjpbrPtfq/B2r8mC0i2v87d9qLkfoL1488r+7
 rk28cW8HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlu5Gf4p9x7XHTL5v7PhRMnxF01lBF4q3B0R8kZNlO+RrZ5irn5cxkZjlYts+l
 3+W1fKeeq+m6vnGKG0iGW7KC/y1+wzt+7UPUFEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..91da90b37089 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,46 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j456-macaudio";
+		model = "iMac J456";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..3e8d7648b3ac 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,46 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,j456-macaudio";
+		model = "iMac J457";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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

-- 
2.56.0

