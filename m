Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6E3409271
	for <linux-sound@vger.kernel.org>; Sun,  4 Oct 2026 06:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093956; cv=none; b=FWszDzrNyQjK1fAkCXsRgoK3uspe6KgqsGqPmG5XoYCxVAnYjFw+vUg7CZO0oUXRWlixEDq0ssxmoGq3HvxjDPeNLP6Fcmzj/wAhUZ+vDDiLk5XSbG94RnM+j3wjUjW6J/Tyu1mPDyggV2XhMz17UKZ7yIpZ72XoIETlvtr3Zg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093956; c=relaxed/simple;
	bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iU9caLsyzfhe+MQ+Qa15IqRFH7vlfVAo8vXSVHsKf7hfC3Vhmm8iUtux8m05D892YpWgfDT3T2/esmSJ9rNDPedERXyQU+/wwoup+Hl4xkPBFrbI6Fa5OxIyGVKwA48GdgCkkrzq7FHmS80Owy6nbN1jGfmYZv+Z0MEtxjA1hhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2GRdQRk; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2GRdQRk"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0eeda3e03so270840a91.1
        for <linux-sound@vger.kernel.org>; Sat, 03 Oct 2026 23:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093953; x=1791698753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=S2GRdQRkuM3/+XF71ucv30FSSWIrTmegQhcT19Z/COjnrjiPWHEr7bN/A9TtfUdj7T
         uFSXAmEcLrRYy6m8jQqlaOVIbUMPB1mt/SXnIxzl9HT9pXjpSkp6hknGb1zTm4yjCZOf
         b0M9Ai0WAaMUiyJ5HdSHm7fOO05p+4CA8ASssIWKTfufewrrwSGphVSjOUxvs6BmIj9C
         bhOeOmkdRVaMxkQ+P5eckdV1JJWH2CiL2c7jUlvuYkmnSsoeHkgD6psMphIleQ2rZRxZ
         PzpmUb0Mu9DX3BZ7AEnDTOVOs0eiV4vXZw5X3iBzKFPQfBSH45KOS2kBh399hSd8qbxm
         dVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093953; x=1791698753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X5SKZmWzqnGYCKYVWh4hl4aFlpfm+yAAED38A57h1ak=;
        b=VsIgsWe1+nCoon6QOcrepf/vHhDbHF2yFPK8MmE4mcGxjaTiBEMvK/Nq7R+4zhpzQ0
         mZPQxoKPgqjS5No87fGI7VSEn8Q/GbIPZs2uPrPW1XjpKG/PydRT2cf5gYQ5+KKjMgHG
         EP5MVKpciKS0/xGjD51TWdQEAFsSXoiaXOdUQeT8L7UrJh0YYbrSHmdU5B8MdHRVt/5m
         yKXjmaK3oNWHorKZcyQQOf1wldwuiBrGgu8IxAN5gbr7aVpiI6LBMD4dPbXVIqBBR833
         4zIP30HvGq/qoBC/ZtlNXNn/c2U8v02LEY94mdOSVXuFG2CwFNPWOBwfmn6qXwmAvo7U
         iEWw==
X-Forwarded-Encrypted: i=1; AKwUvBxhfSMzw74SQPGQH/SgCDXo86Hsen7395Xf/FfAUOaAeTmDv7hZUwJ6NUG1z0OScFHdWYQPNRJTvJBWAg==@vger.kernel.org
X-Gm-Message-State: AFq9FYITxWZC+jOIc9KqD38ujEvIOfJ9JDpLpIh58Ym3utXyQi4+6ivx
	ACT7PcZjOnmhyO7gypCAPw3xRQtrxDowBE2I8ML1xs44RrMUPHEkJsB2
X-Gm-Gg: AYBFou3mE/N/XLwpOAuYe9hY9o+edNpNK0f0zUSm/KT+Jvkjec4MazBOGeQkp2vaDil
	3YKWM31EtTGIQ5z7oudpX0KERK3kHPuFc+kxNuDI12tHpGUqPgPpeHdwrJbYC3WYJyY1T2my7M6
	hdgkmRwndkcN0klhC2uKk0eDVBFQ2QKF41W1h5IhvOlsE80x8QCGxV7HqopVGqkAVzy2MoEPMj/
	6ska2RAsQsXaW3IJKrP0NPlEu8xg4GNG9TvNHIqC+O4hLoBpIk3T3vM/4PBPy9+UkaZbvXsjs54
	aYOQAn26fpLrUhZ/jZuVt5s0r2mIjPPPWWS2pe78cTs9XwMmvX7oz0Lm8UtBrLMbcPek93SPMFQ
	kl7yMlqL/rFYazmFhUzI60k+TYydh3Ahzl+ZLFsiELjrWBHQ4XaPiPX6plGjaRomjBxDdpfx6oF
	mG4KUU4aNO1vJw+S3T+BDzobcNtgOIt51p9SqL/AsZINJMtHEfrjwwGhAk3ggokam0Zqny7exRr
	GL+lxukImHWVYdgEsIUhTqIzTMmxS8jeckIfOzzW/vpM8SxjpCIoYCUNhC/JKgtCRLBL3yA8Lgt
	/3gJQEjP2cAfgVKNs0R8cXMvtCwdHKD2rkWU3K6EmsJq8eI=
X-Received: by 2002:a17:90b:39b0:b0:3a4:c8d2:6c2c with SMTP id 98e67ed59e1d1-3a6ce845d78mr2965260a91.49.1791093952798;
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:37 +1000
Subject: [PATCH v2 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-10-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1879;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=YcqdYPkEPgiJniI3m1/5Z4GxljDKdHVHbbdhKHfnQAU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+QWXGpdu8z133+eZ64Lnup8sujus3zwc7tQzqf9Y
 uuKT+Ws7pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEw1Cwsjw06nGQ5barf4Td6WU/r7ituvn5LT5msFFjB0rn1gLbuwazsjw+w1bTU
 7D/Zd69RfL6+UNX937tHpsh2djX+uCe0/ZhtfwgQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..6121e3a89a0f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,71 @@ &i2c2 {
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
2.55.0

