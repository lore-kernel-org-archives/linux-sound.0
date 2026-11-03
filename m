Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691767;
	b=D1QYaltpJaTW2MSjkkDzxe0kTQLmtw7VFvSZYtRCEUEPxMzzmfozxy2k02LXfhwwt+PJ
	 gsSfAyIHC98TotPU+SKEnux1ekZuUV5N5p88FsEBSUrhZ+ctFozc41nHo/HTz/hizJQ0V
	 TLIyTo6VKcU2DmZhKlV1bAHL90FizkgQ2xe48jateM5c8pe6/1JskSLllu6zAalmfLRGm
	 mrd/sw0A70w9fQ76AxUTw4z404OSJZYz6j4UfIl+4ZQ4E4dUiH447fcse28mNx9iuVPQw
	 pYAHCyHKM/v1e9LajXVisDdP0C8mKpniZJWM6lsLTDgU2bMSE6BAtbmLX428/FNfT2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
	b=iPRqTf0ivG9tp6SyvgBNZyOVVwYJQX3C+lEOdiltRgfPTCJgw8WbZcMqmrsHwYiaJarz
	 rN58H32L1cJXntJJ7ZplsKMqU86HF3yimJbufPigoL846/6488W2b8++RWI8YK8EsA641
	 dAkiaBMZZTd7citQJApsDUNGdHTQQD8lv+HxsIeZ6AM5/AJvaAwnEAa1bpGj/13aEeV5y
	 F/hbXho1tKI8pi+yPb0eLBL4OX2IShYkU7jlrTRUbHJqj2bYJ2Bd9ZbSihTVRIzXCd9sP
	 iqTFy1Tx9TZq6mHLWmcZyFfH4Hy6wmakS1Yyya1Eerez4sLgP+2WcyyY8YA1w9lAydg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3bqAphT;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD7606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFD7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3bqAphT
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso2436337a91.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691767; x=1794296567; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=V3bqAphTUc9TeQgAfjQ+2zHGFsAgaxhG7Hbh0gvvjkB7wd1H4YaDcv1TadS3Qn4vB/
         4iCDd7EX/7tFUsAEfnPv383nO/WVwmD3zjL+M85tFJbAx5OB5PI7MotsrXyPO/il9eQ6
         vNzhwmfqqzIzOQUBZt7kxdMwoCBhkRhKXL5pOZZG7WhLehx0cdNuSqgZ9/oMXzfNnMaX
         IiSxJrEx7IGHacaPk9xTygEFrYY/y8isngO2RvGz8YPk+IZVEfqTxeLGueslbGJGW+LB
         U0ed5siEhfS5gNjd8WL4MbVZ+9MOp4mOxN5k8psw2ZJ3mFr8ZeTXbJekDvtoKX2uwCCN
         jGLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691767; x=1794296567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZetKM+Ta3nWU+g4aVmYGtlY4mbrOL38eozs+DIfj3o=;
        b=VCh0lR8g7AQ42iV6FE/6i6ZZhy/w3MZ3ap+ONF3KJ/eLxxkBeT9J6cKxAeYizAvYhk
         RSW+7rmtMfdu9Zho+FAzKkIA9lQ7ouoD5zsdntNO4g4cy/zABceuap6QKTubtH6XzqkQ
         yQn+aGK6pIblKbihcU7pDivYXjG0d726KRkdu/vD8QR+jorRJjpYAWsZvlCf5G6monN/
         koKy9VplsF9Is+KiYMYcpABtaUA0XG0mSSc/lWjBCceOxxB+BhYFcQnjflqush/bQViU
         F395axUOndFXJT+1oikzeXrT64V3Xl2r8rGhyErFCpY4x+Sz98XxqN6Dq7h12cNU31rg
         JOJg==
X-Forwarded-Encrypted: i=1; AKwUvBxGPy9yROkhAdq/ye5FCwGOX+Z3l/LGk/nGXJ+K9DSnoOnzuq2fqNIlAMXtXRXx3X5E5BhxjuQSqdXvvg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/V6oVH2XCEcx+qkvowjV4NZKhue09jki2etkTEhnBkmVwfMvV+
	E6HiupeYAyAA2SgsxPPovWtihuuw3AxzrW4CA407YSJQUk3XzIzp52nF
X-Gm-Gg: AYBFou1vzS0/mFHeMa/2aEjJM4fdT2rtRvfkACZhWPm54daCgTDYMlY4KDFGAvSOFh7
	Uu/Rq+fEEJsjiT92zHvO2X+8nsNVD1m1eZ/J+hjzxZKiZdQ/UQs0P1/Zh9Gyf6fWib9B5bV0G7y
	zVMhVjZe0vWkY4+YLphclqYPqxJb9PusVFwWMVPRawLkqKggbfIBT+gHdgR5E10/1LuwW3Iuk19
	TnVSwLgdJSRorpID7t7HkYIgsSCfbQ7HUewYs69wfoOmdYrpriLtUndVM4hJgmLxxuWfsC669N+
	csv2nBF6lVSzSiA+7FJTjSU3yE9wSPUi1QKjVKuJh6KgwfM+qm5ojhj0YEuYAH0/8oRFoBd99cw
	BvPjeLLSDkfqF3H9alPq+RMK4U+mTuB5fDz2ogOWluXM+AiPmG7oKx/b6VLC+r556pk7O1mQOhG
	5mSoigmfJDZ0u1kxGGxOU8cEn6QVfBpYV9BQV5DgoTV1nwEDrqldammrP0ifvHcM3XhD5smGC2r
	vbnOy4Ak8d3sWXX/Oe0+/mAACLuYFopBzhb+h0y3dbdA+DPbntokgxdfprccAIPK9mTlt0gQ4iF
	z/F7XYsh9Kl8WWPB0o55/FsjYclBZXbMytsybooRd/pQtI1A8+k0FNDi2XVw+cjm56GvfyQWadd
	w9hfoQxIdDrTYPKBMGmeVZ1pn1OBsZPpUGJTtkhsa80fSf8XhPNkIutldAB719md6nbovJ2focN
	XHInA=
X-Received: by 2002:a17:90b:5847:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae89773f17mr9382729a91.19.1793691766813;
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:46 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:06 +1000
Subject: [PATCH v4 18/22] arm64: dts: apple: t8112-j493: Add
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
Message-Id: <20261103-macaudio-v4-18-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3235;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8fzOK0BtAM9BKavKDtzvC9SkMIH3VaTohkyi9BTYOYQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88bPdw7+8zxaeJR3g1PXwjIeS0/LufRYzbxXFvRF
 sbQSU8aOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9ajkjwzoGp3vpF83+FtboLflt1byU6xkrr57qIumIVLazKrVXdzH84Z7/WCp
 jd6xtRMr1hR8S35z10Ou0ZEixmRvEKzjfMmcCIwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..832c18538cab 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,109 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Rear";
+		ti,imon-slot-no = <8>;
+		ti,vmon-slot-no = <10>;
+	};
+
+	speaker_left_front: codec@39 {
+		compatible = "ti,sn012776";
+		reg = <0x39>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left Front";
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+
+	speaker_right_rear: codec@3b {
+		compatible = "ti,sn012776";
+		reg = <0x3b>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Rear";
+		ti,imon-slot-no = <12>;
+		ti,vmon-slot-no = <14>;
+	};
+
+	speaker_right_front: codec@3c {
+		compatible = "ti,sn012776";
+		reg = <0x3c>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right Front";
+		ti,imon-slot-no = <4>;
+		ti,vmon-slot-no = <6>;
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
+		compatible = "apple,j493-macaudio", "apple,j293-macaudio";
+		model = "MacBook Pro J493";
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
+			dai-tdm-idle-mode-2 = "zero";
+			dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
+			dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;
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

