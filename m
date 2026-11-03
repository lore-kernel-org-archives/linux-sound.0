Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691717;
	b=ElYTZ6atFa0h7U4AEI73lrvpCZD3zF625zVOynEbg8yZJcd4tg0RlZeI/xKJAkwTSUfj
	 242ODjtvqQ+UlJMcpZqB3eGvdnYloQ0ba4WrR1Vv5pauiB/mLmVMDH3zwlKCnfk++KPSW
	 5kE2o5zBkjoBgJEEYXCkS9Y8mEJewi/74NiDm6xJM4w1xaeLLKbtSVcpvvnb/VtVGo8EB
	 1MYucL1JoNtBRxTiGOoQ+kx0WgJNdNdQjZTsQz8XxJZwLmepeo87L4JsO11i8gry4DSCx
	 r9UoRNkr/cXmG85HXcZo8byU+tXmT1WhBpq4bsFsbd7c2h9Pn3/Up0RSz8mWcLO1x8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
	b=AMYWMhElcWvw+8DcAwgotrchJyi5Xa3NFTReMOxzhh5aWsYHqq6S020XXZ0Purr1M3XB
	 0X13mcL2NjXH9xf1hM6X2ipWCG3l1boXWtEzIEC1C1aar6PeyTnBAsYdxLSAQnWESYxnx
	 COiz/Q6ZRdyxwB/Nf9BE0+Ez0SFfPCM/UKWnzdDvG/Vs+ajK2prT5PxYHe/e0NfcM8hbH
	 +tuUokr/VNhBAAkisLJE+s9U3K5jGTpKGwtbCGVAAAyWkm/mGnRVMqpy5Am5v5jLh2gol
	 iLUtvgyKNDdaOEl72aqKZ2paXqtsgM7r5UeAjjvp0FM1Xq4dKTgbNr8S8jEy7+/i4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQDdsUpg;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB8E606A333
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFB8E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eQDdsUpg
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2780432a91.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691716; x=1794296516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=eQDdsUpgJOK1HVIexkTRJa/Q7nShHwzw7iUC+we/MY+PU4Tm+73KTQiiOBvf+qt4MZ
         jY4CA+Jm8pp1KTdxAJYvGZNnK7GajtffxeiY2RtaevnmgGImistjjW2btGL61fHWNcyb
         PfW90cWOt2/fLFb2VYWUtL/+ihliiFX6u0q5P4klOig8eUM+HHhRl2fvxmKmNReSvgX0
         7mZBGphU2BeI4nrPDBXuYto3JhZo3WrMQe9kq84XvHWAG5yauKNuX9cJLosNZ9j+DGmj
         FZhlya8yEtqQ8tsbxt7zMpVB0A3HGD6ZjMp/ZSgFtrxzx2Y9ss4t9MfvEp+VH4FLrZcV
         6ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691716; x=1794296516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfbhdXr+xU9IHzzXCCLrrQtJWTVcaGZ00j5M2dfE53A=;
        b=ZIOzOVxT5Gt1lOWlOU5y6LHMQaADrO70Egxks+LYKM/UM872MDvD/FIvC8GeZ4vO4M
         n7LBjvjubyIuJB1k4KO1ppb5pJXhSG+BIQGAfKd7/qj+3SZ6fR6jlzaQ3ykOL3K4hVGl
         Gx5vmkUz5aHXI6jtD1P1TSnQCEmwFJWk1hNOCDCEf0USbfCgFL3wHVu6jTjFlZ8dnrGn
         m9YMpT2p2iEMi1K2hnQJi4MQoT6/L/ZaTnSsO5EQTmhduTwwVbjkxfZGdQHq6sJCbJjO
         loM8F7JIEYnlJQsu+/L/sIBWhp/+LvMue2UOXqCVEVyk+MoJ85/UP7byDr4YbbRdrcWN
         gZJA==
X-Forwarded-Encrypted: i=1; AKwUvBwyi7s76mh0hesu38XUQvu3kmB4QfCDzr2zvWLobdHds+BqowNHUsX63pM07xWkV7iTLneTaRGM3D1WyQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+uabaj5Yg4PshZgmhhH34bWauGxE5zipKwh7kaGDc+1pL3q3dZ
	1pSJnjQgJ5C7PiqTqkpfx3Ogcg0M5iKEP/Qe6eYUniRzcyqFEDc178qR
X-Gm-Gg: AYBFou3Tr8b05632MP6v8zuABrUue0hwJ/Xjl492ZQ6CmALOQuNPUPKrZWQozEnUxPX
	wuk5w3dvhre5ioekdPTmEn5bVwWf3o+eyPvh1h3EoC4wT2RP6OMsAYE1ZizepouFNvJD86mPq2P
	vQiA3C4zAuGr9vko+EAJ+OInmb4W1r25LfvSYoqmPFXiGu29SPrjgCOiZLdXRzvAyKUXYYWbRkv
	6xp32eUzus56qNmEE6AQmmkFrlZiD+fiVBdcIGcUvtHYeQs5hEZK/Ss050XK8aVUzwdysdy58TG
	mIw+nWAC/hTrmzoZXgTSU/gn3/NO6+cmbUO8080826Ld9umwc2CFGV6P+12lZM0F1cFjwKYzrV+
	m4Jk8ikXt2Oq0Bi7XyOW8DyW5ESZL/ICaMt5FrpRmznL9J6WBG9uDy3C9BboFJs7ibit4YXU2rZ
	PaMcUMgbUs7rdUh2+p523VW8LbvSdCLDvsecP7N1xtCFQO9bMM9kXz+U6lRBez7TJnJQY8l4h6V
	4DpK4ewW2lA+zBGY+FV9ynxn04O4OUiEg5qnpmA8TU3ClKC9I8e/ydhTR25rTQ6+KfcJFJRrOvp
	xtIGy3H6BYlJM9RV0xJm3AMKy4G3huJSUT482D7lycdP2A9V+mBSMnUBinRioWe3P0Asuaup69L
	IR/Ny5ojdXBwpSbPzqc9Nd/TkPZt6yDHa5eAKI6JdgMbhkhjNZjDbtR9cfTdjKT98gfhWom3wfE
	MA/Gg=
X-Received: by 2002:a17:90b:570c:b0:3a8:2c7e:8986 with SMTP id 98e67ed59e1d1-3ae897c8820mr11559333a91.17.1793691715180;
        Mon, 02 Nov 2026 23:41:55 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:00 +1000
Subject: [PATCH v4 12/22] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
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
Message-Id: <20261103-macaudio-v4-12-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5HKyFCsuZAaYnH07XINXm4pOIg/VsCVnTKPu6wyChjU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+v45h1uUCPY0rCtPuamc+e3xb9dDx4p/h/1bLYQ
 4rqZ3v/d0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaa5zgjwzPGSSEL1Dcw92rcS622su/eaLvyVK7rFWHex0oz5Rc3T2FkmHHyR8Y
 RlQduJ2s6U7+IJa5tnFLfq8544XXu+R17O25f4QUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Air integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j313.dts | 85 ++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index f8b2b1637b9d..36c47734a1dc 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -55,4 +55,89 @@ &typec1 {
 	label = "USB-C Left-front";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j313-macaudio";
+		model = "MacBook Air J313";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		headphone-dai-link {
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
+
+		speaker-dai-link {
+			dai-tdm-idle-mode-0 = "zero";
+			dai-tdm-idle-mode-1 = "zero";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left>, <&speaker_right>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>, <&mca 1>;
+			};
+		};
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

