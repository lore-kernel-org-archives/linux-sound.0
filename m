Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691699;
	b=pf+yKqFt2Y5RJGIBPzbgcg0LUGUQ8H7U+KjufOMVfxjMa8Vj1eB0tWdzhk/yaJWQqIi/
	 WlmuxREpQC5+tTcOoEqLJ15KqY5SWamwBuVg5XInlA+tLDdE8jsKwJBq0QAm+WNVnt6D9
	 mrOuBSkAdqFSVTRdzZkPbCcLPREdxHPgfkRU1Rayn56aPmstNuZecCeCpnh0KBJQw4KOJ
	 +8tolxX8z1Qad2lh1Q7H3GuxMhDBD5akWUlV/tF9JNWQuEnNqC+McQqo0BCvt7ZjSb8cI
	 qKlj729JoBe60cFTJ1/DWyEKDPQ99I6Mca2asnTqRAg43eWXcFCdFaFLNpafWTLqsVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
	b=evbAKU5iILJaMoCx8p4UlYjGh+aqcU8GBBH40x5WFvhlRYO6LD2mB0WN7N/Flej/p/W6
	 ymGNn9AXOz2hSs6pHLoK1ewKIbVXQ/z+85lxB2lUS96cl2HAP0Bi4Trl+l0uy0x5SC0xY
	 U4hXCDrd0PCp7Hm4/SFsQzTyinPxTsdpmolJIy3Of8RU7kpe4J3SpA1r+hHtX0Ie0GtiV
	 3NQ7fMofqPsFET20IgM57idmp5AXrDXqxMZFJ8u1WL6URyO2JqvuwqejnaimSV84MRqnU
	 PADwPaaQ3ZAcRkA9R0VggZmtBtr9126ZFbPC3ALUXnKLSu+W/21aql6/WNtdUYv5kEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJfZXYzb;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3526606A32E
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 07:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3526606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KJfZXYzb
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso1717290a91.1
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 23:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691698; x=1794296498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=KJfZXYzb9V7BarptGpXjwtFkFLWZHfrzLpBtYZ/hT2sClqSpIOBxyHx1i0CxoaYq3C
         M9eYL90xk0ZhTZSVxjZQi+xZN2bZ1IgkqWw0uYbU+xvc9DXmxLPnxYU0GuAJm2Bmn0Fn
         HNXqOQbINNQhVXAG7IFWI1MJGA+58ibtFCPOvIqDvZo+ojymWESc7MvnfHeS+H9zT7kO
         hkN6itB3FyOxC0CAoEdBBWtrpwbGJjmo4KStjlQTf2LNLeZ0BoZXHR9O3xkR1S4HnrQf
         lz9CxjdcGFFPFC+Da9D5XgFKSghLUss4sE+zZBwG7wqJtaS0KkIeFOhtcWNg2RFqtayi
         eL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691698; x=1794296498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgKBfMXdyH3JiV8S086KL7jIltq3tXtvUnKZO5GkGUc=;
        b=t14bSsfWgoBxtR+bVEjs2fCXmgi4Eoh8WgGC9XOG+XA894bHkjT0OUICGa5gsZwwTs
         kNCOMNQQNDKVOukHVc8XSntO4rqqBvFpifXjE6NXk8jw2LFISDZE347IzZ8nQi4QMFXU
         vwyG9Fi5+zMRPVPFCBp4FHxFF0H2XOD8mSBDJJlujZb1aSW8rVOo5ULOP5K5bFVSXmeI
         RpqfdR8cRK7mqvyTgKezlosvZ/eXCxytRugoUPi1WDkvR6NLGMrYnQL2VevqkYN0iXGI
         1fpLaNs0wleVIpZMZpmSLOv3ZGeYynfPMFr6lt5LQ63BGxdDdOMrygN64GdBxg/GcBuh
         7bMA==
X-Forwarded-Encrypted: i=1; AKwUvBzUECQSSUlPQb0BbKRl7vFo9gG3N0D3gmzjjpgpQKEQpLiEVvTiJc8pxlvgJjZX+UdVBL99DOthS6fY3g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+vntZ8XWYQKHw553wRBYsR1NJ14Ni9UXOy6Ovt5v+Wi7u7OTSY
	i2RloyK4VgrSWqZMgQPSFhhzK/ef5tMxgPZLPs92Al6/FdzVbJa6fJjr
X-Gm-Gg: AYBFou0Cz/H3P+SiKlm02/lR9kDu+7+Hlhf5nVNsHGpGFRG9DUiYmPpa3FT3vyM3tJL
	SuxWVfY69Aplfa86PsjYufhR4Wv53QJyIQBtnugKHupMMyNVN2hyG71jNa2XIiSVZ9WK5XRxtqT
	zeWznmiqa4WBb7UA3FM184+1jM5c9o6qOoedVoaLi+25PFtD0O3V6ndvUsWfhlnHl29CKvmxYBg
	yvySgalneU9TrJODIQJ2gNWpHfBRVV9iqO2jRJMJQEe3DaeRYyXn/e6mEPItUSBHEll5mqY2Czm
	LOGjK+Vnr06R71OhNzTW30k+VadAqdD78hfEZwm3CCx20tPCuiTTYRoIZLniQTFNHHUjAwiSQ6L
	x0fESoPKKSWs3UOsDxDjNGJQpLXlSBSmHZc85NiPtphLGGhIwRhHWn+XfW2wugxvOxUqJBRM+eM
	A2UF9K0ZI04LODRO74b0ZtoI01bsNbBiDtShalPARrFTwl7/CsfmhZ0InjAvrLUdVPJY8hFcCIe
	RhZXEBRzXWJnflJCIL4R4rgORQgOgHAAq/l+KCEH9/L7TjkJsxxq3A/6FeAjpYUf3Jt3ZBwb62B
	bA+VWKh+XE8u8OJnggyMjmA9H7PjwW2sZYXlkvaI48onx3Zs4KMFvIt0NFwDdPJDhXWFtxG2aBe
	+tf92/BxMjtAZz3HRAXDqitiLy+8dC0RPpx2XBxwwzYrJsJFQEXC+6TGdnbozk+VA0hd8eMpEax
	kkdIs=
X-Received: by 2002:a17:90b:2ccf:b0:3a4:6e84:e7d8 with SMTP id 98e67ed59e1d1-3ae897a8b33mr10316524a91.54.1793691697979;
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:58 +1000
Subject: [PATCH v4 10/22] arm64: dts: apple: t8103-jxxx: Add regulators for
 CS42L83 power supply
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
Message-Id: <20261103-macaudio-v4-10-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1835;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=91sg/4nKfvF74lrnGKYqCKgThTSUHsOM+GGCNFkYSqs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+88JbPI72Su8M+7Bbd0Zf+xbV7Nr6FclxD/dnnT9V
 n7MU+kXHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKmOesbwz/IYh5nksXNOV/8cU2vXil8j0SZjyleck+IU2sYVW3tenuG/yxuJtQf
 /2BkYBE01uGa7Zk4Hl963N2flDnT7cRpfC9jBAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The CS42L83 codec found on M1 series Apple Silicon Macs gets its voltages
from fixed regulators managed by the platform. Add these to the template
Devicetree so that they can be referenced on the relevant devices.

We do not (officially) know how the power is delivered to the chip
(voltage rail names, commoned pins, physical regulators, etc.) so
the regulators expressed here are just stand-ins.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
index 686fb1dd215d..34694902c945 100644
--- a/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-jxxx.dtsi
@@ -38,6 +38,38 @@ memory@800000000 {
 		device_type = "memory";
 		reg = <0x8 0 0x2 0>; /* To be filled by loader */
 	};
+
+	/*
+	 * The CS42L83 found on all T8103 boards requires VA, VCP, VCP_FILT,
+	 * VL, VD and VP regulators. We don't (officially) know how power
+	 * gets to the codec, so these fixed regulators are stand-ins.
+	 */
+	jack_va_reg: regulator-codec-va {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-va";
+	};
+
+	/* CS42L83 VCP and VCP_FILT */
+	jack_vcp_reg: regulator-codec-vcp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vcp";
+	};
+
+	jack_vl_reg: regulator-codec-vl {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vl";
+	};
+
+	/* VD_FILT */
+	jack_vd_reg: regulator-codec-vd {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vd";
+	};
+
+	jack_vp_reg: regulator-codec-vp {
+		compatible = "regulator-fixed";
+		regulator-name = "jack-vp";
+	};
 };
 
 &serial0 {

-- 
2.56.0

