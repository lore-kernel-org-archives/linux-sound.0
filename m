Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691794;
	b=t25iGBltEQMXplhW4tnqT26g2pRYEm1Nso7lLUhrKHQsYTYvB36E3PxUKtTmK7ZViALr
	 Zg7GhoC3+BUQgJhSOhlqqyi/xOgQzi+DnqZaj4kOSTOaeP2IlVtl64wFzS9Z83G9HDBa5
	 cSVZfMZtr1kPtY3Jv1aFrkiEkHcwnQUQdEaBlEg17/CTF2HdbrhP05roHn/a6yLd9nket
	 kVS1j2S+z6EYUMDwCEyARGE/Xym59C0uLXTAN1OF8SCzc+ag+ULBygZiqSZupyleqLDS+
	 vKLCyzzf55VqQV8GVRorZMBk0PZBjFLofnvMw7WYbne6XUNlNm/9outF1kWye060SBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
	b=XCfGF5W7kA8P6KL5t0q7jEOtdYWk/d71u/qHmOdyacgMGHG7Fam9IWu84DYdtc4pf2Wu
	 GEjWMFDlLLEmFExphyTj3+dnTGwKm5QTs2TWxbFcIqUoMeKjgL+9NLEE5whoVripRwcBP
	 UwJnZ3rT3ttP60rCdedwxf5Y9BQJ9xSVQn8b/CAAD2oJNGn/Mma5C6gc+PHlGi32R2z5x
	 4gdQHzc4XJRGcmfSehr45g3/tNKikYeFVUcOabvtKvmXOCaxNCovPTK/gIVtIEqx4jIUn
	 NcIJHOH1V5DdJ5wZNsHwqMQSJzY6RUnazUNThbyTK8AGk8wn+BE6rId1SUX2KxezyOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4zKvvA2;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90FA606A32C
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C90FA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4zKvvA2
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso1623760a91.2
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691793; x=1794296593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=n4zKvvA2Ks462iJH3QATVJq4VUjpdSMQ89hWNHewVHAINcRR7rmjNVms0wzU1dX+Sz
         zEOa/1Ax2FtAcTiEqXlJI4bAMi0dOxnBo5jRYahFg3hGPtzg7qGeLesAa8F5+enPTLWE
         rRv7KBgOYQJzjTkuNF8ibN8H5TlJA/FJ8sRVKoM2XIjFMebSHvAgGl/X9xCoH1DoxD4y
         MqafcXTFWDLWI23P/zm9l8jeL2Wn02qYUpx6qVq81UKjk+CU1SVCzopQInRcR5vFIdy7
         4aTtlrRJ5/8uMKXCBWsAF/GE+Eut1UyqAqHIEQncVT5i3O3Sfu23P+NSg9+a/tJfwUN1
         V5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691793; x=1794296593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60XJaMYLbT/o6HXjRlwFTyr3vUVptClPltCAojDk0R0=;
        b=YrkavREpuaCGU1bOrwkgmsOpgtqfjw8QRUzpQYYXSwG6eoRto+RU0KLkU/EP792gDa
         IGkJ7JMIPE22HLVRJsEcPMGdlS/MAoylSlFvQaLk/i/sLgCqi0BZPuNkZFijSkB7yXpj
         LiHw7KJv0RpbhqcLZA23QnXamCRVdvxT08cPs0FZlQaHM0k36cRuKtpjqyL3f4LmTLwY
         iZV8MA9p8kXZzE/4ZscwDXmNkfXU2jMB0PDtouL7S8+XeTsFFuAtqZugTX9EOVD70QFc
         +bggUUjeLiIdDRBBoBoujDXsCz6Q0rIO3Trg46BGdzbj8lkwds5j0YJHcywWzjf+rd/l
         yR1g==
X-Forwarded-Encrypted: i=1; AKwUvByupa0sALL3F3sT6DKj/7G9+8e3pZiJaZYcBdZU6Y8Ea2fkFN/0GFlYy2OagIUqM1CalaM1LMbW0tAfGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/z9+qslHwA4zWq/LTpLcw0C2lp0PME74PY6tmb/9R8JCHTkpr
	4IdptNlCZlpRMuSwWU5BFdX9mb0wSH75v2HQxpkxmdt4Ict35uCMFe4f
X-Gm-Gg: AYBFou3T+0V0R9HRV2NSPiZs+vAvosNultXN2l7jt6fv4NNOsB4Lo4G7jHS1Pbd5wgr
	p+0aHfasqdE3qetYmAgR7a60uCzRTDmdLBn+U6KJ/o4lbVCSHOLd4FGpSyp/35yvLl7JeIRMsJR
	kk2aNOpj+J3/GS2Tn/wzgLl1p7jm4lLrPjUrRFbfoUDNnaRI5Q178IvES9BCcuWWeBZzvsMnoT7
	4Ios6SWREOMQaADTsQGHH2p+D6LYJOg9N88F5tiKZRQXwePoS751If2cHPPSEr1LJqf20QHaYpf
	9pqV1TnFgDoWhTIPMTauMsfOLZ0UsBlNiH5bOlFLvl7wvJ0k5q7Rca7HdjBJreBI2wX1oojwV53
	Wgnw8wrkVpj5DdvhsGmZTKaL6dVqLhUglWy+82IJ++/ihOVeHcV3TrdpkJGGaxpoIxCS8tdiVy9
	YrnnvK+hGA8o+fEN6n0mwO47SHgjl0j7jH7pZqouoYFOnLkbTtih7ueTpBT6FXJg1d79X0P2H/S
	ahHfJLmgp+ztznQsGqnz5QrfgKfG7ZVHPBzKqL6yxlcfWwFTpfgzgFmgK4ChFnUBEndEaV1xeZw
	K/yiRcZQ2EsAMkAzt01mCuHht8MRsxcQNnST33sH5JVhANc+WcKYO+XmX1nF7ISIac0UUGGj8uN
	iKJYhAXPBiqcglzsO6wRdrAngfA3bpivQuidx6RYROEXxeBkPuI7u72SdMa3/mJ/dcE+ZaYuyb8
	KJOx3KuByAaMWKxRDd/xIUsIec
X-Received: by 2002:a17:90b:17cb:b0:3ac:9ed8:f309 with SMTP id 98e67ed59e1d1-3ae89736030mr10686171a91.29.1793691793151;
        Mon, 02 Nov 2026 23:43:13 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:43:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:09 +1000
Subject: [PATCH v4 21/22] arm64: dts: apple: t602x-j41x: Add
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
Message-Id: <20261103-macaudio-v4-21-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3735;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Y5xIM4BZ0PHyivynw40OAddi1sDRIGnERSTTSJ+mmxQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+y9wRso3TUh9auS6Msk2fH98Z+jd93PUc9fpqf65K
 rjLdKdTx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqNRBgZ/l1zC6o+0FBrukKdT0arUvvX43dRzcYnMjyW5bUY1ApOZ/jFXCG+ve/
 1Wrd0w8Dr8vOtLfWkeWfWpr8tnvh/bZh6Ix8jAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Pro/Max MacBooks  integrate Apple-specific variants of
the TI TAS2764 and Cirrus CS42L42. Add these nodes and advertise
them to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6020-j414s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6020-j416s.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j414c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t6021-j416c.dts      |  5 ++++
 arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi | 35 ++++++++++++++++++++++++++
 5 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6020-j414s.dts b/arch/arm64/boot/dts/apple/t6020-j414s.dts
index 631c54c5f03d..2df6a39c719d 100644
--- a/arch/arm64/boot/dts/apple/t6020-j414s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j414s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6020-j416s.dts b/arch/arm64/boot/dts/apple/t6020-j416s.dts
index c277ed5889a2..7f3f0d6eee87 100644
--- a/arch/arm64/boot/dts/apple/t6020-j416s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j416s.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j414c.dts b/arch/arm64/boot/dts/apple/t6021-j414c.dts
index cdcf0740714d..ec4050ec0ecf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j414c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j414c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,tokara";
 };
+
+&sound {
+	compatible = "apple,j414-macaudio", "apple,j314-macaudio";
+	model = "MacBook Pro J414";
+};
diff --git a/arch/arm64/boot/dts/apple/t6021-j416c.dts b/arch/arm64/boot/dts/apple/t6021-j416c.dts
index 6d8146b94170..0037346959a5 100644
--- a/arch/arm64/boot/dts/apple/t6021-j416c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j416c.dts
@@ -24,3 +24,8 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,amami";
 };
+
+&sound {
+	compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+	model = "MacBook Pro J416";
+};
diff --git a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
index 0e806d8ddf81..852fbcd6277a 100644
--- a/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-j414-j416.dtsi
@@ -43,3 +43,38 @@ &wifi0 {
 &bluetooth0 {
 	compatible = "pci14e4,5f72";
 };
+
+&speaker_left_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_left_woof2 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_tweet {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof1 {
+	interrupts-extended = <&pinctrl_ap 58 IRQ_TYPE_LEVEL_LOW>;
+	shutdown-gpios = <&pinctrl_ap 57 GPIO_ACTIVE_HIGH>;
+};
+
+&speaker_right_woof2 {
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

