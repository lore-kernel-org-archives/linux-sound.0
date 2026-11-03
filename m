Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691802;
	b=1mQWOr427Ibayn2NfYe2lIujsyZWgUmpJfIrtAyAPnk+KEVnzGycCpMQSkBdN6X+Q80t
	 tia32QSLqrBkC8Ig3WvHTP3cT6ee/opyiP3mumgbVt5Pr/l+mJjkH7X4jIM+JkO34vbpR
	 7w1HkP0nEB1tzX5PI9oXyX8sKNCaa7QA31n/9bnU74bVgk75eaUD4vmys8tUF4urXBImP
	 T2TK6rYaSB9TxyjZ6R/BhzAsWMYagbEwLxdTggW0+T6xi/cGKLJISrJSPNN7rjOpp3BGP
	 zxyuMSBs4ZlJK4OIJxw8SS1NPuEzF9FsN3wJqOg4USsOBRuEZqYERUp+X5Sc6LLwPSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
	b=oVVKTSzuwizooy//ULfAqkLEfk/Qm86hr4yihWOEorOlMbvWtHkTIkB+6PKc6YC+3Bcf
	 oqgoPCY6wa8qp5m6GplOxl9v5IZwrRCNfKiZCEh2wk9SA+gkA5dVKPBgkJaAaeihlqR9B
	 fG6IEUlriNtwtWrgOMYPUx+4C94+OlImnHkeouZ6aGzKf34b0WDkQHGqw009mOrThT30Y
	 ZYNxXBWvHvPlJTwm8NE14fVJr/uAVN4MqpKKJnuetXckHxW/1kFCV3ymebQfGmhVDC4k2
	 M4kZlZwy4kGhQx3R5fuK8mysDUy1bwmIvzxncEMLqavIYCYRKekVc4S47YZ+Lp/XbCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOMJs7wm;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9C3606A32D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B9C3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JOMJs7wm
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso633282a12.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691802; x=1794296602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=JOMJs7wm64L3SLWZU+8B/pCRUU08onnqAWFtbZGVHmVRi7yT6nH0gVq1sDd3yWBZsE
         y55EPlDsqqFNRCTrmYzAXT1Bsimojw7u0AurFUQvjEECf7k+Jv/lLUWIJ4WvBHpZlvQj
         bpQp1RG8cUlcN5qfwrovcIFq7DvoXiNJhbT/01mdLKHzHYtq1vNnTzfrUqlmD5InvfIM
         6UI17jZ9Irrb8B8Ht4f73SOYPNgYULsHeL1JOCwVGJHce/J9a0E7aUv5wMtRWpkHYUbs
         yeuqblaFBKOGT+bjB3pe0yzToWtSIqteNQM40kyBdO4TIp0lifCsjZ0QPZL03Ag7mo8/
         75KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691802; x=1794296602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z65FbJFnjWHxVaxQI8JGYbEaf36adoL6Hch5QBpP1Jc=;
        b=T3hrjWnrjjTvO6mZit1bqBZHB6BBM7YyCuJqMFr75cVm7zchW/oYmKWt+pRDeQ5xe4
         yzIdQss7F//DCgyp55qYjgBlpaZr1jo+6DFra5oF5SXEt3v6EJ1r/+TCRPBKM/EZ4QLL
         lSf6k41rOKyA0r4t76XloOQtLwljTz+zmJPdGqs8XTdF7dQd+SPPLPV9qyFF95937W4c
         yhXSquVa6QPeGScwGpPwPebNehIh3luhVQjmYL7BZm8oM7092F/8IbvJNTJxzLIZnChs
         klmHI2Ds7ndciOyu8ad3pWVP+CPlE+xe/mPhoeJ3p9glkkY8t5N9krq1jHaPFIBGxdnb
         0SWw==
X-Forwarded-Encrypted: i=1; AKwUvBwe1bwksWl0sb2I1BavOhcxQlWOCstJ5IWKvyjwFQLTvL0DVpc7dL74bjkJABGGtt0iyvNafWbIK+9lcg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9vgdig+TnYxSOCUJqvTNMfMXmbZ7rmYdORIs3Xa3ZvKDqScda2
	nrGu97OBv3+1yy1ifIcJaN0VXfVr8WSOvZX69CH2YUWD2YWNgAY/YOjt
X-Gm-Gg: AYBFou1USgKHY04eugckQbUJGwiGs4GuzvPCjPrDlL9ZbFvrzFOpxYDlBYp9nHKcCsE
	jQ4mr8XGt85WZJKWOUtbaot95KOZwGYo2riYcyr+wvenlar6zj6dU6JOMbY+pQgfmbdsHvWy6Aa
	HBt1EC6CsVZKvS+uX1xa7J7B70vI2kKNk/LPQV6iKYibQpTouH6AQ7Y1wE++nyDOVJR/95TShnG
	Zf439Zvzc+D9Nr/bQxXcPSl8Lh/3hwihUMuxfYZqDUiBfq0Pv9a95JpYlb/RbsLlzc++yVoE43I
	jEmtF4DutiaLnsOYeqK+Xfwm1kq3vKCN7tyWTxESNY/7EqGZKEKT1lu3ukvOd8wB15cIyVM44g0
	3i/JMhdg88lq2KTG0rPOwHtAsXR4kuO7fzAYcY416SqjI1ze9wA3iosjvMhyaSxe/QJD3xZNCeA
	Exnt3hZ50VRh11SAySYj1Hh+xYRVDpBj73TayCH1xS9RC+2SY4+PUZ570TVH1T/m8Qy3RqIPjqS
	lg5KfzWGB7cKpbyETphG0i/CKkBrnw5VrnGnq62Xtd2Qjb0vi9vsYCnZA9wkmumB2w1VWFkffE8
	HzBNa7ZNY+UaAVo5b98BKMXI/0VB5wFDKBto4SnjUYKQNMkF5ij6F33DWV8J8ZqeUoH571BWEXS
	euEyngxligWbM+LouEBFziRpNQz1FiPaCw+dXA2jyRcotQn65SYftDpOd5VMDJ32zvvl5q/kuxZ
	a8AqE=
X-Received: by 2002:a17:90b:4c44:b0:3ad:9ecf:2b88 with SMTP id 98e67ed59e1d1-3ae897356e2mr9451595a91.19.1793691801674;
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:21 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:10 +1000
Subject: [PATCH v4 22/22] arm64: dts: apple: t602x-j47x: Add
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
Message-Id: <20261103-macaudio-v4-22-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Mpa6Lyvo5t3WwDhLa15s7MQvnpQJvZyAGw7Ghv9V1tE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y/cXfot+mNMjqG8VQGnwRn3EyJWLF0yd4RXtmu/+
 PuK4dLTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT7czD895M+e0r0trTbnV0nPsxR/+sWH2Zbxmy//I3n/ESnsJq4dYwMZ+yOvLw
 gwH4mdKdQWcjzb8U8nGvO1fbvNZLOyU+ekd/KBwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max/Ultra Mac mini and Mac Studio integrate Apple-specific
variants of the TI TAS2764 and Cirrus CS42L42. Add these nodes and
advertise them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j474s.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  5 +++++
 arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi | 10 ++++++++++
 4 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index e3c2635d84fa..f39697490365 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -46,4 +46,9 @@ &pcie0 {
 			<0x300 &pcie0_dart_3 1 1>;
 };
 
+&sound {
+	compatible = "apple,j474-macaudio", "apple,j473-macaudio";
+	model = "Mac mini J474";
+};
+
 #include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 9fe17f1f7f59..f8f776f9eb1e 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -36,4 +36,9 @@ &pcie0_dart_1 {
 	status = "okay";
 };
 
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
+
 #include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 32938a3bf96a..153899f1569b 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -73,3 +73,8 @@ &bluetooth0 {
 	compatible = "pci14e4,5f72";
 	brcm,board-type = "apple,canary";
 };
+
+&sound {
+	compatible = "apple,j475-macaudio", "apple,j375-macaudio";
+	model = "Mac Studio J475";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
index 926bb4ab77af..7f1faefcf9bb 100644
--- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
@@ -36,3 +36,13 @@ &hpm2 {
 &hpm3 {
 	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
 };
+
+&speaker {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&jack_codec {
+	interrupts-extended = <&pinctrl_ap 59 IRQ_TYPE_LEVEL_LOW>;
+	reset-gpios = <&pinctrl_nub 8 GPIO_ACTIVE_HIGH>;
+};

-- 
2.56.0

