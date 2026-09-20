Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BABC3D1A81
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880267; cv=none; b=qT24KKWxP6i/P3Nch0cJFUHtJxdgkN6MapG3XNFAsVCLS0Y2KmN+MsKqrdzeWsIPyUXGnY9ScPpucO0CEZGx+fx/1+AKNy+u2y8np3CExGVXaTnCQ198XNRKAIF4S1e6Vw9FoG52RfT9OipGH8oS5fzNc6VuBKP/tAFC8h4kkBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880267; c=relaxed/simple;
	bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyIEwYBsNi1BPlaoYqOoxmRU9iIRUAkq6023FzVn+sO2yvrxu6Tz1BVDWoCY272AY1K4STg88lmFz/VB+tPZewqcfHOfh5gMvjqF8ymlOnIft0Zk9TVOH37gX4b7UXb2hM5u3A2oXOBL4NQOnVJvACHxJeanZu7n7FdaJgdcDys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0YP0012; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0YP0012"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df38376150so1167695ad.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880266; x=1790485066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=e0YP0012Tx79B5P6JkQ/XHH6aE/DsZSulwx9pOeBiNCDqK4LCd1dkMhtv9kC+P35cR
         ac79czZAuYFz1HsLP38UJP8emc7t1ys9ndH+nj/Z0vStj63I2/J0Dap0YD1CoP26vnNM
         I+SrQDHDNx7FRXYnybhxYpv/n/m4vDBY07IlGjzyWJ6UfRemcfOki3KJlAMQdLT1isvi
         o53R/zbxQDl7vtGi97QjwR46uOire7k+IyVz1T5Yd7R70ihJOjbnc9Dx8mqDPMND89bH
         XPrc8quynuXdVMWKQr+qQ4JR2JNJDt4b3yEwGrYIRQMTf2Zsh9ObKOi4RjN30d6dSWMy
         RbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880266; x=1790485066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=e3t3arKtVrWxNoeUZCbW4Nxe7j1d4HjvNa73XHbnAHBqq8farqhF3VEUkzmc3XGZIl
         6Zrp7wtIzgbveaESGYPqVHLHwC0zx4XO3QBarRn8VUsN3aV30Gid+lyhpM0GBFV/So0o
         W8qagxm2LCb91Pd0uskeQ34qWywF9AoBoa2hoywPK34pegVPtmtD/60U2GRfHFlv43B0
         ZxhWA+n2/BB2NGwdqWq/7Oyy+jb8aFc091TiPaEhAmPrFAVZnUyg88cFa5ySralmV5My
         56oAh2AKdm89g48QVcRdWdZu7GOGfhy53GSNXV9d2+0agRKPEOcTfrUuyqcB2vhrfjMn
         SBLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhgdmQu2mIU0wgr9vYTlwHGnRm9SplBavuIeQfj7VvfWXwtPopXccXdb+5Yu1y6vrE8phKiJ1WB+6UCA==@vger.kernel.org
X-Gm-Message-State: AFuF++l23gZvN7l5akSPnOeuJNrpvYsfTH6e/CkZ8DAmM/ng+qlpSe3c
	E5GA/jg4DJn46mBaLQ4jdlogbvbtqjKE9my6kKOvTL6JyNHYeBWXV35E
X-Gm-Gg: AYBFou1msYmfovyoKRAjrG7RmpRrz/VPihCoueB3i9hfkuUuhljoY3nmh42bks194ZP
	azDyjf9QZXy6QWTgRnlq2HsvFkFRmhz8aDzNcZO2lf3atzOSDm7rFGOFyBp2w2hHf6UKG6BTIW3
	AAiMUNQJdG/BxyMjlu8ZMHicElGFCQQsvhcnniTjNJzVh1YDs49Ivl4hgu1RkKQaDHgPeX0mIOC
	dA/zQGxan2m9DPkEOXn41HjM65DS6iqi/BvfiEPxnpmRkD4GPVi9nBK6DafH49lA0UHFekR76aY
	vCiZoM3z4OW2V2pkd2ISCf/J0F71taopVCBKqYLO146UgCUMM+tuNRPQdIBuoSgSI6njlImRe2H
	uvIeeB8OcsXujhyt7G5qw/RTBNFWu4HkRNCxtTsYWGHQ4QfLQ7EwgNlT+XChydAexKMa7oJCvda
	fAIve32QUCwq+1tKBJOXpKPDstdTZrFsctJ8jA2SgL/lnPwwgeFr9JGF5qj59zoWu43V0NfeL0D
	jE6QiK9jKUnlYuvKAQc5SkQ3EYDQqmofSbFzOKyVnWJmLBGW1x28OpbGB3y+KvL4eVfAt9bQwlK
	uy+v171qD8jyuSLZvDLkjZ//I+8vnPeC+0ye7j93haPNEQyk
X-Received: by 2002:a17:902:968d:b0:2dd:c100:2522 with SMTP id d9443c01a7336-2ddc10025c8mr27195935ad.43.1789880265641;
        Sat, 19 Sep 2026 21:57:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:56 +1000
Subject: [PATCH 17/28] arm64: dts: apple: t8103-j274: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXdco7N+HGOUWzOheZGiRfnWExFhb/cm2C20dHE7
 VzbsU+rOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtvpqRYf6XsGtTFtTf6XP59EMmqiisXvPxPqbFIjOKGw6XVD75d52R4bZnwxJ
 Fn0PT4412Hr2i9FaFwzzHdc0UvkJne44aZ/lbnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..4b30f08eaac0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,64 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+		compatible = "apple,j274-macaudio", "apple,macaudio";
+		model = "Mac mini J274";
+
+		dai-link@0 {
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

