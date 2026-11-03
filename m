Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691725;
	b=AwcMAnbUxixdy1mQEXgYARhQjiVDmFw2Ou4hrKohvqSvehNSxJ6Yv+E9IcrmWIUIZXAs
	 437KJuthyHQkUqyfBO8igk0OPSO40r3N2AqYLCoH9o6PssHacM6ZU3Y29zzKCYDXvJ9uL
	 kJjNUeuo66Gmth6ObPzppKpbAThRDHd12gDOu6BMORzhvK5OAGX9wfQX4p60lr2ysx1lg
	 cW+jaeIvmCTC8PpFEPk2h2e9626sgXSNXRMocGQiEDpnTZjOuUBr0rHCui0Jk0mlHApSw
	 O+Tj7Amj7L3LiZ4jLs5UvCIosZqitB7yaT3E9UBnZhUBNEbl2SDf3U3ZpAGscEVBbNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
	b=sSAb1lCE+Jil55RIEFsLtppSGmlumw6odoqjvj+BkqmboTFVqQCaHMtFbWRavaPY33/u
	 KgQahdcdgdMv/XQwydJdBuiiQND6bKc91G962/ortgOdJf8RNoe/bjqrSnOg/NMhd5M3X
	 CQZt9LtNDPfDY+tltVJbQwhHr6nkFnkBT2aWUdgQflJXXP+TtD6N72ECSSQaz5ia/gIGl
	 j0cG34Nh8w6lxP3MzJVbA+hakGhoDfJDiqpu66S8FRxNBTM/lJkyb3eDuv/YD4WhhD77J
	 pkWlDgUaOR2mL6/e+QJ61LJf/uneeSEu73LNxnhiwg/E+LBybIJE1HXJOxP186TA6gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KbYrDQ/P";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82105606D80E
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82105606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbYrDQ/P
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so3027085a91.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691724; x=1794296524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=KbYrDQ/PBMHXLAVISOahHHRIDwX+5yVoQZvr8C08QEK20RVp+AdnC3YrJXlWX2WHJU
         ZT0pp+SOEpqFrwCM/2V0V1X9VQG6ZQYd+gLJubsX9eYTzDPqCPFMpzJ69QtIJrAVC421
         uyGvdO4HryWOrdCpDIbZRqdtPtolI8RcyXzfbDY1A9QpJQFj7GEI8IaKGATh8b5dviui
         qxkR1mS98ixd+ShtXBITXtTeK5Y3eY/+FlipaKgCPTYYl7CtCsyLohagAM98sooSi+hQ
         btjUOwLlBkjnJDpnL4kAZCq+cfMNI96akqK1TKhXipwCdojAvH71VnoF55uBZj6BbaY5
         p+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691724; x=1794296524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwoh0z95/GhzPxuFda/2Z71hW29wiXz/USZbZfeMSh4=;
        b=ZSm8m3/XfGq+TROlDyDVuEOrS4/HIKiYmvk0XrvKUIGTTBx3XY0K2N93g3dqh0km6b
         c/YUZUOiQaqpgdCXYlepVabgUJtJ6x3ReQypKM2pZx4SBxbnp/w0X6EusbaFhdf6NikV
         RNX73aUPc0jlaDWpcX8BP3FOTLaItskD1WkXkfcy1D70Ab85dkzD4820agTccHqPzf0r
         2jnoGz29evPf/OqH2N8ipHGttnTi5p29UjNl27c/MEUPEj5a/Z85qph+A0Vl5bB0cPyM
         dgWkMETHlt4uEejsS5v235JaZCM64erVVgxJmlkdIybGzzvn2cYV4KNAddAdLdp0T2cq
         +8WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdfNNpd1uI/maJinGznTKsP1zO0vjSWmaaNkpASHdIPsVU8xxGNPgz8uNs4o5RX0jLGI4PYmP9axAgeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i9sr+NCByvHJzNqaZV2J4WaVTWx8jrS5H+X6Gb8n+fjrO8vL3
	DRpQWj0pvoZMjEYq24rTbx0OqczHUMOdKZfVok5gwjOsXOw4tEDT3Va3
X-Gm-Gg: AYBFou2E6i/4HaOc7hOdXk5lRHC0y0ROfG32pe2OehWMcan9sIyamH5ZIeLvvQdCh4J
	lKWt75QqNwcf2Kuh+QsyM81DqVnX6/XoAFvTliUI/QMVjokKWrTAfjebXeQdq04p8QSDb2m0eHR
	QIexekKxGugpjiNiKRc89fk0udUbo/znZbz6tJPXA7FJiM5CAeC4Scbdpg3WKSarJ7TubS8hySA
	r9Mdcymty5UM9xIjwLZ3jXyls5WYxSO0m01BkVJ4sR6uZDY+bBe4cyT8h1+WNwed4TdDLQ9W8NL
	i/9qpNnYZcpfLhTcqsawH/KfMmeXWbuJuChYoW39+L6h0226717g70j6TjHFCc1wjSi0546/Bk8
	QkhOjyC308u+GYHXaZonlLCQsu1qxo/oFmwPJVhMA4XGHOBIRrZyTHWB45pRcGFSbNuVvIiKMYU
	PVBvGGx20wYgqjexEAULPh4s7LejGiAbDFMNAJArwqVttXnNXp3SgDo4SLAXlMfui6sm06RUFEn
	ew5hQjI1gPrEPtSsX98rjrhrmpPrs3YMxghtg3wll4+DV2r44B5iXJydXSoxPWU4dIgmjnVXhvT
	wsOJbhofUXWhC18kxXRRkjrJvxQX3iH/q34ymSzb18kr/j0A6pKpTEzgelWRar716beg2/Swduf
	hGT0XJER354BruV7D41GoH376YCYn4u6e14l8kfllVaNKa2/7Bu/QXyruvuP94L2w9d4xq1dYAj
	YMOyE=
X-Received: by 2002:a17:90b:1188:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3ae897eb75bmr7420951a91.17.1793691723756;
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:01 +1000
Subject: [PATCH v4 13/22] arm64: dts: apple: t8103-j293: Add
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
Message-Id: <20261103-macaudio-v4-13-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3383;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=AKNOO7q0vuQyr2QN1X38WMsoOdMQ1mDEzPGmlv8YRhk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/7xJ/SVIuv/ng2cm7unSdmjQsFFy4sW1xg0fKwz
 tpI4L1px0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr7ehn+u3b5/9eXOif15smaL7cXx6RvyDn2UaP4otCkj+8tfm06xcDIcOMpj9C
 VLdt9JdY+WBvIsCKR+XTLh6Pmmq7PQvty9yoeZgIA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 MacBook Pro integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j293.dts | 114 +++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 1d074b9e6018..6980247b94e5 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -133,5 +133,119 @@ &displaydfr_dart {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@32 {
+		compatible = "ti,tas5770l";
+		reg = <0x32>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
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
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@34 {
+		compatible = "ti,tas5770l";
+		reg = <0x34>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@35 {
+		compatible = "ti,tas5770l";
+		reg = <0x35>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j293-macaudio";
+		model = "MacBook Pro J293";
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
+			dai-tdm-idle-mode-0 = "pulldown";
+			dai-tdm-idle-mode-2 = "pulldown";
+
+			link-name = "Speakers";
+
+			codec {
+				sound-dai = <&speaker_left_front>,
+					    <&speaker_left_rear>,
+					    <&speaker_right_front>,
+					    <&speaker_right_rear>;
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
 #include "hwmon-fan.dtsi"

-- 
2.56.0

