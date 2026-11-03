Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691785;
	b=siUlX6zagAxOeTH6CxiS2TG3yufLKuLf/f+arZqDO/WBcDHGims0NIg9lmc1d5kd4F5x
	 BldIutQpRLeqjSNYtKheNJxxaXKu6y4+Yop7xhZDSPZIcGpWz+bGUgHZcHRMmo7D/ZmAF
	 ykY0y0K1Z1jPy611+0czvst1hnVsz+Ca4/qcRRrLT6nRXSsi00UilIXt2cE4MNUpHMbvD
	 5lnPcCJ77qoJVpWpXNfLcIvD7r3+NYlOiULQaU5twpqX9veHFCWdfF4WoJESfVhjdHZQC
	 huuqr7/Y2TtLyq2pLly6b2NQ6cnGXAqDbsIj+t2MmA0BAA8q7faCsK0VthPKLDgThbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
	b=B/YkIlLggQX3bwuSTOeMkOfuJTMvvGK8bpvwgirpgcG6oQ8Ic90j1jQEBQR15oDRQH+j
	 5Doy/FAI4OddLzxutMRj/FXDQjfPhbYpNDkHE4Vnao24jCwaF7d7UGCKSTcVvvdmnUzSk
	 sYUnk2TFcrNzDwpb1VrYx+2SATwrlp/oJn+qcn5kqBZLynYu6b9B5dns0CjRw4pKLd1Wd
	 WARiXWaStDSdwNmj/7WWbrGQiaa9aMtdNwQXF1WNL8tGqa54Elrclq3eRGNuEAmkoiUSk
	 wDDwzp+z82THxfZu0NE8e3Xb8GdWbEaU6f9Tw57O9r2Cqta9Ofw1zPOIgUG9LU7z19Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdwKjEeF;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2FF606A324
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA2FF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdwKjEeF
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso1533199a12.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691784; x=1794296584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=HdwKjEeFEH942ZxOGogEM8bpcjna5XKdLHEWZUvR+Qht6XTnOavyuLda+ynqDEE5L+
         D83KhSeN+eV1IPaNK5klaT5e7glto2MLFf29VLNLMAmZInveWV2cWHuw/b1Kl+FYJdU0
         nV2zsVlU+TAx8Jmd7jUEf5eh40kF1Wc8yRyUIHQjYjjjUz/gEWNoTxY1fxAq63lUzzOb
         FVlU3XQTL+pwnSakSr2AE6Z6lvcB5MO9AR5maOlwjWZy2IcVlGKDOL6F8tSWDROyFQYC
         h0mP9NqD4HdxTJUTg6AuVTY6aohgTfHkf8CTs46ctnEK9p+T/zR3CATJYu0gtS8oipew
         Tb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691784; x=1794296584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/b7kR7Y+deuVHS67D5SOGfvslKe+NoSSMlOu6eM54zQ=;
        b=LGbN4uf3IfB7jOmfHuhxxmz5hds5QjlefCdYm3RpMi4U/PlxwMwi0n0UezVe59kclz
         4f53l+XibqnpH+KWerux5GdgczbN5zfDp5FwAFA5InORlRUjXnOejWPSQgeKpIzdt7Bx
         ZgDFFe+KirVvdXhwpl81t0QDtmEv2pdz5GvYCrC+DPMU+SuE8DKFKPHA3128HRXzFVYg
         +9EjjJIzUpgo55Tz6pQgcV5vJqp0WPCDenDMInIDl6CXwgCV8h7VPkXBsUqdMQjWtlTt
         9kF6yxTVar31EONroOQFqGXJyRyoVu3BdGUNOE72fSo2plEW4fTnfrMBm8DbwzPZb7ec
         zyvg==
X-Forwarded-Encrypted: i=1; AKwUvBwuBOVLBpBDNVfQ9v8Osq4EEK0MmN0b8FIHnNHuWp8TJyD9feKTJpkPYctwq17YbyWC05pSW1mOckUsQQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7xgPSGJj4DjOC+Pxm6gL3Cz4Wo3RJRQX5ez54xiWuFD84S6wQ
	PDc2qOpj7behJHHATmR+rXXNA6u0iYJ7jGPWtHo24QEPsxfALMFIFx55
X-Gm-Gg: AYBFou2kLGSrlXENDLppRflmmHqeAvdGx763N2t06N0kQ/Qfr1EeH86qzhR1zITMlwj
	DpeopXD0tpTY8tMKMbT4ej9LZyVqsiQNl4JUBHsk55x2qSczebnoMh9yZMwVTa2Ff3rmkOOAKlZ
	4elpQkr2yjVN9L+pCBzmSDfWofkZNEObb4uUTP82yzttoV/sq0rwS9JN1DTR+yef8y5sk5bP7qY
	mtE1c5Kd6bpf675CMysmNR9CKTwcrn6bZlFvvSvkvUrL3+Cd7BM/zoS/D5NsIJB8S1cieoE5ylZ
	s5hJOV9XzS4VxP8Z5KI81DzSh+yUzBF65UDN5M0rPty/kzPUXFPqCnqGWs+nut/G4LJnH/aCA5q
	n4DeGWMWhG1VHeSzlPtW8F2etecdJztdF61vXrbU7KotZgBNbX0w3mSrJR/Ob14PgunQeWp059X
	XYHU4uZVY67IkydRugXAnxQ8hINoZCe5ZaCFX+K0Cz/VAHzgLgjgvlmjJS4/x5gpBHI/Ql55clv
	JpRCUM8TA9jeckp/GQVwXvVphSXE8o5xP9YFSRE5ZKncrDr/bwZR4K5hA0Jp8Nfaf2T6jEGU+9S
	EfPOjmGog/SCh9r1xIQzCDVqwUG0QcC9NrYnwV/qFiobSQicrvn7ESib5fSxBir/hV2E/JxtP8P
	yRkD/tJW1+C5yd2CUk7ltxsCQ6bNsoCaTmF3JRbiFBvqtv82gVVRuNi/xd0xGstzlNaLCPRuwfc
	stg8o=
X-Received: by 2002:a17:90a:f6d4:b0:3ac:b197:1a37 with SMTP id 98e67ed59e1d1-3ae895362cfmr7683697a91.3.1793691783996;
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:03 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:08 +1000
Subject: [PATCH v4 20/22] arm64: dts: apple: t600x-j375: Add
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
Message-Id: <20261103-macaudio-v4-20-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2964;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=nKyDcyWpWxK4UlDAQg1VAwHp+X0mdPayNaMxBUVyu6A=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y8Y//97r25PvzvjpWdJ34WepC2NXJrklmvY5H9/j
 uWRz73zOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtnMnwV0hRfdnZHy+6mZX+8r16pv968468OqV3m646B2XuVvj+5TIjw5Nw/3f
 xm7LLL2+KOrTr6pPtNR2vJr/zvvMpc/tWg+cP5bgB
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Max/Ultra Mac Studio integrates Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts |  5 +++
 arch/arm64/boot/dts/apple/t6002-j375d.dts |  5 +++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 61 +++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 08276114c1d8..2e544f43b085 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -25,4 +25,9 @@ &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index e6eb6b6c386d..dfdf90fb1825 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,11 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+&sound {
+	compatible = "apple,j375-macaudio";
+	model = "Mac Studio J375";
+};
+
 #include "hwmon-fan-dual.dtsi"
 
 /* delete unused USB nodes on die 1 */
diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index 8a1494949e4c..fc45dd9b1a94 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -179,6 +179,34 @@ typec3_connector_ss: endpoint {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 179 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 178 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 180 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 4 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
 /* USB controllers */
 &dwc3_0 {
 	ports {
@@ -410,4 +438,37 @@ &pcie0_dart_3 {
 	status = "okay";
 };
 
+/ {
+	sound: sound {
+		/* Compatible is set for each machine */
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
 #include "spi1-nvram.dtsi"

-- 
2.56.0

