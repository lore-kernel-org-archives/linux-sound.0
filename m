Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A4840683F
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093977; cv=none; b=fuQxirE27jBcVxJe6ib92J4wOYOaI+bl+vZ3FhHG76lG48Xv2NESdgEFil5BbnsvLfyCyOBOHAOdDCgYCA9HkN3EPk2hc2ULK1KBz04Zkr2t8u0scVCIF5rHRbTF0oyuqeCJoBnvAhGEsqr/TZde3M6dRJUyy/wKlW//g+I+ZDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093977; c=relaxed/simple;
	bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLbUPMbvo0aVQoK4Dl94WDMIjrcBGGk2p8YSNwxcJlZ2FdY89VSp1qvhRr57oZrcE5NETv5w/Ca8OoCJ0TkHTNGM8IqPh116ofiyXGvZQUHSC9bgVAmRi7YMUCEquWo1+lAciXRAVm/vRElwLMqgRKMslhtqyyRiHc9XVklxeN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUiX2ZGw; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUiX2ZGw"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a2adb9bc3cso274029a91.2
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093975; x=1791698775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=KUiX2ZGwVUmK3MBiiFBrLnrpoUxm2bVzpqTNy8q6KYNuv0MANfzPzTP2znD5Fy0VV+
         xj7t+Ar9uXNW4fjGViDgQGcBpfdumSFRHk7Zy2ZnydclsqUnCmfEOMRb7Bqr5nkspfou
         o3au+0DlNsmvuyZeAngh7vOEo1xCniuC7j7xW4t6tUKMdtWTgBmPwLICHyRraeqf5MOj
         XuH9GGhSH0zz4MmWzpfsAoFIaEdEzLDFhDhUmn4Yz9HyccJ4dW3RHcpgsmgon2P2Z354
         ajKjgGw3JLZl7I05bL8+PGhQF3XPm2SN12uE02i81Mz1bwhKso7Z2MB4xL9lQ1wrm8nT
         zOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093975; x=1791698775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=juEeO1zo/e0Frb+dvraE0tXXsJRbkGAyqeOKkbIGaJSU2vZW8eOFAx5zCHrhWcgQH3
         BTgngBkK++nT0k8oreZVLia12B4RmTlR7nR4pVuwJ9IVRTRUGDgHnyCOyp1CDWQBRmRS
         t7NyOwjsh8AaTe9HYlor0FFH0xdSYaCr/UXVVTlPFq1kzUuxc/Gxfr4y1yZunliyQ5XM
         8GvX6Ksb0SksKaEUAXsBygRDfNgzw9VAbxb661EZtmnrmx9Dv9oUaMThylfekI0Qh/IT
         m059h7vffDldMs56kNcKxul3ZGRz2Sjlz4PW4J+vb9N5+hmOK/BAcyo5omOncRwDQ5bo
         glRg==
X-Forwarded-Encrypted: i=1; AKwUvBwVmdp7E8s6NSehKItZtk/9gW/5Yw10fbAwc85P0W+EGRGD4hgJ6z91uZV/OsEioNaOP3nODc5Od+K24Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYL4I/dRaUJ49HeiV7dTvkKCO4wVdc6xp+N9wSVGjCyFQXpz3lx7
	NV7MZU5cDY2dENx26v1PmgByCBsGwF5W3YfzbJA5YXnxZSHC+pnulzOL
X-Gm-Gg: AYBFou3G7PSYhWeSTLSXz3S0FYOlL0dOwW9zPrgJWaN3R8F/tlbnH3NaN/YKc7PONiz
	OcTwtZGvGVt835F7YaSMfyX1Dwn4e5tN+8gyIuaF0PJvJi27SUZSEX99KVRxEehPteo8EOqf37G
	g/9RMNQkRWeOXonLn8vMeDZWPMIo5aKOP2fa2I/anAkPm9MI8pAmgOop4YjOVaAwZqE53Vsj5Nt
	IdjCuj5Bd4uqnEekoA2HFa+OsYQ1LWNRtGHhI0uKPdwlvCQF6XFW/yu6w0iiN8X0fY4y6yKe6HZ
	YMBhE6ppq7SdbAC/2Qfr0g+KxXik5+1TvuXTUOWdcNMAU03q3aulo7UVgRJ9MtCRMPp1tUUvC8s
	ZggK3PlPc+6YWaKXUH76pCEAAqp3lVzQM71yMqXuno+IG7BAjZMB5nClhLxrRAamGlS6JgY65AJ
	YgS1ZsAw7pOZr4aMd0Hf/aD9hN1fEPBGH2qzKlcU+NtBw0lO2tBM5Oc/biesuMc/KG69A+7ylNv
	GTo2LZPo44whoxExHekLF3gIcB124Ez/mw4q3S3X2hnR00QwiR5NblPP/9BxDk5MIASo3bG9tvj
	xw52XDYyODt3+0CB4yUw5PH2+pCZN8Lu0Dd12JBRNnADE9k=
X-Received: by 2002:a17:90b:17ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3a70ef41b96mr1617600a91.2.1791093975353;
        Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:40 +1000
Subject: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Q5LFjL3RtSMiU/o6jw7r5DE+WVkp1unFFRPeVzz
 tbsxi7FjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSLRjEy/P6odGs570MmjXX1dZrfd/o9K659JXrLfrv0x2mTor4trWb4p9l83uF
 9lXVt+ubJZZkaTmalMmuOTnc/9ipA8vL/3a+YuQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..1fc74ebf9ab2 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,41 @@ &pcie0_dart_1 {
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
index ebddde75455c..d8ea6bb53b3f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
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
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio";
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
2.55.0

