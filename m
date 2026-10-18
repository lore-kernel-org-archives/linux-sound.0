Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42D52D1F7B
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302975; cv=none; b=nTzbHdAfy0pmB3iEf0fgGD8qsZZJgcKJHi8NjjwcU3cknRH+4+udb5caARBOWqonye5fRY5CaehNiPAqp6n6MIz5e8hN9Uz4GFqsJIp0rKE2NQw6NLkx2Np04T4zL73LL7aJMnk61IohU1V8N0LpRzRgdIZ/K+A3lIDVt6vT8f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302975; c=relaxed/simple;
	bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=snrphyVc4aX/HV6yOCWvk5KbWTeytUD7ooqGCsxfVEwqBvy4Ciar3Re8EKcNO7Vx/BgjsDig0m402AzjgFN5uvP+3VBUWc1myItRKwDEQMlHkxeFJh0aosLW9KVrgUaGEbuigUnLOY4RsOtrHiFl59KuCA1t+cGxzBOx5VxxAqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZgkE2UG; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZgkE2UG"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab41538192so909459a91.0
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302970; x=1792907770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=OZgkE2UGSYCmkKP90iFfrB/IVNMt6wGV6c0EohJ8rGRSwCDGPwxwGXUque42Hawrz5
         +5T0h0GBILlBssgxHDKcm9cfBG5IzPRY0RPzo6LxirRUannx3pockcjhHq+kYUOqIRNT
         zmN6QNPJSSFL3Fxkozwmjc7CHGpk2nJ8Z6trqgSRXzqnU+HiOmYsA8URNuuo7yGLPc/J
         sAX/uV22uVzWCcK4L9NCpt582aNdyvA6NhXO3uSfCKlwl5KXccldnYXP6M66b8LDkEqD
         qYiDKZiKCBzwsmnZKxwp+VTWWI0tSPE4Gq3D2/g9RDU6dC4hr9Z3QP+1Qeq/e58pns7i
         oqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302970; x=1792907770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=Gx3cOYnhsLAqPHl1XL98Wxf9erETc5CeoQfF/x18ZBG4ZP3GQNSEQZ+KHARlbEx2vP
         0g4AabrXX4H2JIv1tB4K5O3j8EVa8W/5HTzFO9wnxL396VswZbHL+IRFnzbsOtAg7K26
         SyhbTUl+uC7RLvdo5MteRc81vLydmkbYqLDcsrq1HMkAcZZkUbknqxcZMoEejC2Ry5f+
         Zz2FKEWfFhJfT76KEHhHMvHvAUjBAw6PEJn4DPJkQ27/7/aHZWEzc2sphDuMkRatblNC
         ZGSWqSGH9mk8Peqm6bqy86Iyi/asYBNTC6vjHyWJaTQgzF2L2UEd7PXoez8LN9TCGoOW
         DB0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmlV8B52aBCBHEL2H+NBYs08gfAGUS9CKsT24n4XaF2++B0Gau66Q6IyTwp43mcvTz/RHVMmFvpsrl2w==@vger.kernel.org
X-Gm-Message-State: AFq9FYKDu2LUanNv86ELcOY0nkaQNpNYVZpcTM2FA2PG2IhVsj2+k7lz
	bPk7QUhVSdmNvvOjYm7MKbU0slAJi9470+zyRXjAwgPPmLPTwWO/s9jI
X-Gm-Gg: AYBFou2ZBPgDp9RdVbQolVj/thfFjx/3kJeersXFtrCsIXOhqijNciD+o4srp4Jgnx4
	inuzRtp7KdvVT/NNqbi1GPqpsv8SN2gjI4ds8MZQuZqgtr9nQvaefc1lQm8+a3EJx48Sy/d9Uul
	75PFb1uzPtlmCg6QzwFBDmWyAPMNLj8V/MFg41sLT/TQpEUVW33ORwXPZsUbd21PCYEps+rb1ep
	mmM5NblEYcWholva0wTcK+0SfG82ScfiR2v4AQxhd3ZWuyc+b5V06RqRqhg/l9bgdzg2l5nJ/XY
	yq/Hqjh6b8IDD2VAu0oolcFiUNLDdscrI6rZlGbzozHLLQSaK0PeH2a/c0FDZFXzg2Ov99P6M0D
	HJaqjyz3V9sFb/JCHbAbyB3oOgfhZJRy1qQQ4ODZiDdsVNiaGS/yrjNbmwAhrkRfOqul4Ehq5YG
	DEdrpUgixL6PiqMcr7Jq2jGXiNFro2miN28N8mooCojtviuwI7Yrd4UBv1Av0ETJnPpu0AKBtvz
	w/EMndtNaAkjHV81iWLqpHT1VBDVR+Du4GBuF8Q9wruQv5uVuF5d+kHSQEQHBQOq2HP1BtX35xp
	tecBVCwJgpBQc7jVQDBm1P67Uv5XcbpCAkC2RQZiMvOOsqNQ/MfnuQ3o
X-Received: by 2002:a17:90a:c10e:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3acef10a76emr3948159a91.58.1792302970047;
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:04 +1000
Subject: [PATCH v3 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnv5xU5ifpW3Y8/1tgrVHjA1jpI9H2itEec0gq5j
 cLG1eIdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqdafychw6fvlqiSXi6yOnRG7j4qU8a7tZ3v0/xjfpoCN0V+n9UyRZ2RYk7e4/Dy
 XRAJ37yHxqKNftsdpXTjstlGpi+NdoK04pwMnAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..150d778565f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,76 @@ &i2c2 {
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
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
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
+		dai-link@0 {
+			reg = <0>;
+
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
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

