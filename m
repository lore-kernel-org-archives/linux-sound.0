Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691707;
	b=r9Y1SQM3Qmprx6rAvlTfrado65otKtYYVthcwicFzhVOYFhy+ZI8lkAOEmbd5VnKeq8c
	 KhEe2zM/eMnzfcGX8GoFiYwmatIdRusdQobs5cvj6irrFGrH5+p94npXhetjU0fSQM1z5
	 qNT0fnzOu+tfzLNbnVjKUXXQ+Srx9CesyoUQJGAxpYm6ZFmanrK9HROZvPUP/I88JHxko
	 dXs4Lp0otuyoN//bv0Wu8dT20LdQhdBbHbP2ziU6YAsPf82GPFexmyx0N7dlSHfuJpbja
	 e626NqmlHi/vOpfnLPTS2E2ESw3ZVQ4ZcVEcCH7DENhTXb2jd4m/vlRGbpoFF3l4psA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
	b=DLY65RYMDzsMAVwVibjzpEZdilxBTBiI71gIbPGdEzuX8Uj9sVZcpm4Mvlqm6VLZiu6P
	 vlmqn86+nxji5CIsIrN0mzeX5WKNVAI7nDw3beeiFxpklCve+glar6nDJ+5IQaL+q+tm/
	 cuUZ8JIZJucAe0bHI7oXHomGQeLaUk1bkQfAoTXa7l/7WCX2pzZGYDJUqDQyzo2a8mMw7
	 UmslRU7xSOhqeK0MadiA1csQg9NqxfLlTlU6yRLQ3xR85z3MJP0LePazGwJp4HPtL++Vn
	 bzsVOnfSzP13WxCVrwxboIG2VmSP2T0HxcV1vU6onksOIuzF8B0+STWxSjeelogNrlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPBPtoN9;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3365C606A32D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3365C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FPBPtoN9
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e98798cbddso18554875ad.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691706; x=1794296506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=FPBPtoN9j/4seq6gAf4RWywkPx3uJ//miA2/BnYi98KKl/HpeGvOt6Hr2aEnr4nMhQ
         flMLzJUbqm3wj22MTX5v+9Oz98MnOd3zEg4keTJE7wR+o9lvH2W/s7Okd/xxlylSkitG
         Om9pA5owP3kJ9I+8fFBjfrZ7Mh7K2DwNEWLfU3XjMp82U0zKvp2hU5rfxCpnHzP7SE9O
         yDI2+vbU95Cr2vRhLGxEWQp0gL1lIo/3I41Qxr3LeHakdUYLSA5UC2cRqEQeRbXvy3JM
         jvRywffmlvN7K2FGJzm8h8Hw28Qd/MI4f3u3vG0DyIbTrDWmJAfG25hsM7gDIxPKo5nX
         YElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691706; x=1794296506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8v+Tuf1uDUVKThHm+Y7dYa6ZBevGkiTnivFGdWh/uwA=;
        b=hv6zapsuc0g38ReOIc7UKcQ9AitJwhwtoBei9GG2fi9Jr7gyBIou2XdSrYCw1FQi/T
         HLdTAQABBNyl/Q59/UD2QAC98vt53kr3BwWkfmnkpZp1x1+yf6HiTEimQIiZT/N4DgOm
         pA5P1LyMN1Pu1p46bV3PxxvT0Ut184YrRthC2V76tu7LWUfSBvuQq3iexQ3CGq9/Hhks
         LmuQmoA1sQc3/mZ6RU7wVeDoD8xkzdVrqPrUdsb2/rYtj5fdfg4bCN8MbtBWHnWADrRX
         u0r/alFUqgN37Ju9lMZNfnkWqaRv+EajXSOTEYUVgBogUWhp33zE+miSwzJzuKhKnyQF
         eBEQ==
X-Forwarded-Encrypted: i=1; AKwUvByoPpp4zkjSivfBw1N8dPTJOondqBobX13vNV/FYxPQK79kuIE/Mc/LGqiXUBbonynt0nAu8Q2tAANzUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CNTQCv2tAN7AKaE29GqykmFyy4P+1IFoZ0u2U6LjbADs9sFW9
	6og0rSaY+31LYfo0GzLo6kxW1uPcVCOmEuq+YMRi8iTJa6CyuGagAAAkmBtmCg==
X-Gm-Gg: AYBFou2KJTZbhwC68gU7qr2bxUWB3mKQO/q4gQyT+zDCTMoW2jEi+jcs3SB36B+z7kn
	0LyV/7iusJfTjMpXSc/g6PtAeBR427SAN4DWe1BZP6URJGfbTSjtOSLgiC8i2hFZTe6L+BZJ72b
	opdeJsZnnOa14db6llWRRk66Qja9w1Zq2Ii5SWcvxlL59ElH+PixZuZnzHan+6ltPCsrMYW85/k
	wcQt+j2AjJxzL4ArzZA6ToOrrpmuRwnRkE1tdnKBqJ7vCj6i1dkqukgPuyK1x42T2VrswPPIfq5
	iz0VPwdlcQnddG/CGHCFEFZT+yiKR9M3PA0Imldm6NL7DoNZO/abegCYystWEeGXnP6w3Xx8y/K
	5U0FJpOBgr8R5qEbtwtFTTc9x3EXI9uHMNonDjYrjeuVjZ03FExEiWmXFNTY1hQElSCTj/8xdgs
	BoZNxfIfKK4jwhApoAm4p2qvgItWx2aoNLz9vz44AtGQjgO7Uy6QeQe9DKw7hbuUPLdj9eC8KF0
	BRYNR7fd9/yeFRXiQMfGMDXl8dVY6lo/9f3n4I2u3moEdpVVJH3t6XyqUI7vJo7f6OXX40vBzfG
	MRK4YlyPXO3aFB0mk3vP3tnevpVn4TicSzIcj+54VZveyUiqG2PMz6ngQgoqUdvOip3Jnsfrm9g
	g40WkbZf883SzJcTh2mziJGcbP8UVeUm/TnOMZBwKFgRyQ9Ct6IX85TjkMWyFImHaU4o/CYnhQI
	hhn5zo
X-Received: by 2002:a17:90b:2691:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3ae89776111mr9578811a91.39.1793691706582;
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:59 +1000
Subject: [PATCH v4 11/22] arm64: dts: apple: t8103-j274: Add
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
Message-Id: <20261103-macaudio-v4-11-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2035;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=TytIUXjJL8r3NaXmKyOX8nX4Lbzdfp/ScRYJ0q4A7Bw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89x2fO48DAsFK6dtH2TTMEeh6r2Vx+/xxg9e6bdW
 to/6/yFjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSfVWf4n6Do+UD+o9H/Iwu3tjuwHzrNUMB7P39p6hynibxu+343RDD8Ztl/91t
 skAdfhWSrz8+MTBaRnIfZG56t4tilkCugsPQfDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 70 ++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..2fcadd77b1c9 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,74 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
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
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
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
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

