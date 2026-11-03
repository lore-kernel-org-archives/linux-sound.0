Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691750;
	b=IW3yafKsOzBXmMPJmkNfgzNlpu9NNqrzHa1/ZP8/ppUGvCuWVxEfoqPmdvVGWnqmlGXc
	 8pxP6doth6OQaKpEYdYlvTWEKj2ekwweoE+Bd6jCVfZsvkY8a48yuIVDv0Pq7Ige9ns3H
	 sayJzraOq8k9Os1b0narKv6RO5AJS/88UvkZwPPnEspI2G70xIhAKK1VxqgmMrOqge/xl
	 uxARqal+7yIxOVM4WFYQWdkTPBnmjJqaM9ZI12HardPLp3OZrZW5Nhx51K3NoFlr63jo3
	 c/3sANjHiDnylChG7DL2XdorhxVRIThxL9jlbsOcJvU8MKyhzArJC5o4bAIp+YYyggQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
	b=3epd0/UN5pRVohhvDMPOigV5rEFSR5GylgtxXN1nAtfWjgREttCNNUKEIXxt6vD+e3Cf
	 k5yw7TjBYs6dBylM0R2dP6ckHBkqNtLt6xchIuP03Awow8qtrtE8MVkdrYY53nRYLPKh3
	 t58XfoyYeTkpoG64Z97tgytXHrf/uTuBFLb6XOrUkj4/4hwmtWLs6Shnku2YX5wgxQFpb
	 d/bU1jFltsu9j02RJco1gFCza5PRVYKvxoWXvoeyIUQcJo84muSOYVhDeNPzV8U7EbPWW
	 t9aUbkOTikk7e1iCW/52VgxRlEf/xMTr2+EciLOk5mVrRtBTrMGyOj1P65peiT2BMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="SYT/M3V6";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B9606A330
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7B9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SYT/M3V6
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so4193962a91.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691750; x=1794296550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
        b=SYT/M3V6VV8WWpyT5qMuUuaDd94+PczvFT3dntVswAh/czxx/m1S5EpzNOXBQmM+0E
         pJsKJuf/ajAzAKNlfxYIUPWp0+ny1C1oV7rdVKsFleQ+Z96wxJSU/RCGtNcedINhNULG
         lrFbyzgPPHnDuwzjlGQIeiIXdCDYKSMLWRhxqOishzRWWLfIaP3bbwgIZwo3TEUDcrKl
         ToVPQm/OEO9rEhIBihOh2OT9qamMX5O0rFIzxZQZwG9ZBSOiIsiASZI9mwWlms++qPWU
         fag9LpseiO6sw/uwp2B4SyiCdrGPAvv2YH7t6f1t9JeVhiCoR5nkZCuYiFVs7aghH7ug
         yaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691750; x=1794296550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x8g4da2osIvT9dB0y6YHGuuPY52ezS8aWxLsZNigBE=;
        b=Y170QK3Ih/0J2d7t1RqoRV6ZTOGO/eUDNS/4c7r/UUX52maZscRCyTGxfU8WX9FqfM
         mL6l5U/5hokqS02m/Zs/2JAAZ1biJpLKfVJBI7LrSahTx8c4oShct0DMBG6nQAuARFOF
         x+JDvuevFiZ8mbTknD8B18jSgghw1b0GGaAOpKSwtUSvw+rg9FlU6DT42+in2tOb91LR
         e1a3c8o1diC1AJ/0JclALxyV/7TEHehdt/SY6gQhPSGXqliessxtoCIpbf5yeiWWv5bp
         0tQJT6N/W2jBETInOZB+ENJzwn1d3bI/aHp4GJs8GvrmstkJsH5YbABGBg4AqYQTp9SU
         /aOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz31+YYz/LyHCwg8xo+pfDyBlRzpVL3nqvcnyqk91lIIbC97rKrC4+G37lRUlsQVaiXRd3uOQnMk1xNQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9PXA9l6Z5fBtUQUXDcfvkNeXrUKbnkpvgawb9aWeIFvTbqoR3E
	fFi4X0zJWlBgtuW9H1JvwfQwoOE+9PmiecXXUmh7Uu4MZFswb2Ile6Lu
X-Gm-Gg: AYBFou20hC1dVs9vcFYgXVqRaL98y8q4JoJBTx+mOf9tmRA8bu3qrZKT4ItTj86NkOn
	je0RZP3Iuu19znb0UPs5fAb3cZti1EO7pkKm5SBB485JboiyBDh5PEY3tErii9PZItB8h1Ue6Wv
	gsPgtGCKsTVurxnRKqS/vqpCMEHdY3hIusiGM+aYikqSbfpTP0r9iFhS35jjYiXpH1xpa9KFDHh
	bdmaA5feSHCMDutRSDlzJx6k7MEttW7fRxqHq5omjlMpD5LXeqJJ+w2vWrpN80+yvFKGXiJrCFB
	cWiwcCH2rAcu4RJqCPmPSopm65QcPsmu2XkqRhMZS20SeZ1SHtWfosH8xZF7U2kn9HHtQd8Gb2Y
	BRLK2lnyLsORRDeiHoSnjXBm61KKJt1fEw3LWp4aoynaU/gK/K9nE8RzkU/uPSYJmTDkMu0bm5I
	+QpOYVJbq/woHW/ixdPbwCL9j1+4jKO+9YSUrotVf2TLpieoaAP3p55d75QFYvMjpUFNGOcK+Aq
	r3smc5iVwtpxCvWpjPStaO/YPl4n51eassYtJ84s34tjrQDMpsafjvCugfPNVxTDGiLTT9assTb
	H3ohbrneyr/vROMXzUG67NOpbCK1bfRIIPLqdJJovGgjUYFgUYrm6s/VwmcPqIiQnNu9Pm37Nl0
	/ok9HjhbHSNT9o12ZK+ID6O3p8o68BeEGnYEMdKnVh68JdzTR2VHN4sUqJifPAWJmGine+ZVBEG
	rBoDE=
X-Received: by 2002:a17:90b:2ecc:b0:3ac:6fcf:91d2 with SMTP id 98e67ed59e1d1-3ae897c64fbmr10444576a91.19.1793691749540;
        Mon, 02 Nov 2026 23:42:29 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:29 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:04 +1000
Subject: [PATCH v4 16/22] arm64: dts: apple: t8112-j415: Add
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
Message-Id: <20261103-macaudio-v4-16-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3946;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Rg9mnllZl5Kfvh6AnHIOcb1AniA07neRdlq4UArxIs0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88/vXtFsOrw2mjPLw2TDOIdztm19a/TrW/vumKnp
 tp7J5ivYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNVeTowMv/1eZqvd4ov9bN2wee7J6X8VJr5c+nbO4iCdU/vvT5lSxc3I8Mg0ZL3
 bP8uNl9tzO/5YnOR/rcPW+sla05+ldOXi3gMhnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Air integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j415.dts | 128 +++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index fdc3409d2e07..c3f646e21934 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -92,4 +92,132 @@ &fpwm1 {
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
+	};
+};
+
 #include "hwmon-laptop.dtsi"

-- 
2.56.0

