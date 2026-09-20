Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6703D25C2
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880332; cv=none; b=js3mn7un8M9CRG60/a505zv6jb1OFBi8Uo/Uflu0GzVrXuODnFeVMi+rXU70CAuAoXkn5Mxa3xgnvhmONdLCQkWRLspnCkil9EHIYWmg9Kuyvp4FMjU4iRuoFA0ZCX/7LLVnKup4Kab5+DYCCTh23y0ESM1mOaVKrJHgsyO3L2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880332; c=relaxed/simple;
	bh=StMdE/41Quj7yIXSIiTM/Hm7dUYYyFp2jqXhWfbLNVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBTaCXEDyafKIT8gRHAIOszRgfYCcA3YU8P4HSxRZdvMXWt3g0cKrp+NXQ2HkGZHuYWfB5KrueozFRc94r4OHuvgPn6Ehe+5ylZaeiIaUSOKX/Lr7yX5vt52eXDO2owGP5aq+1HiVsbXXF7nJGASo1prkFOWhT/kjNOZUMdRWE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghjdKYCV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghjdKYCV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so11906705ad.3
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880329; x=1790485129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=;
        b=ghjdKYCVj/yz9ywflMGDlW25UnFrO9/mCkS4OZmdWvo2DvYbDEwYvXI2KvdBWp4qnb
         UtH7T0NJZy8YpiG/vWcfT1WsNas4BdRkuC6p5QS/QmY+FUXvT9l/E/OwfaWvaAKsBPOE
         Bq/kRDbF8O/IYH3utejFiEk8iPlcCRlcuVneRubmpeDM9UZkFRvtZu/aM6sOl2AYtQ9N
         ujZLuS8Y30gS+Y6AviGANLDn8qgayZYSSt9YXrPjH+uc2mnK28xPikZr3K6isJXeQBQm
         lqq78ejAQa2kyKi4Ve7hW004aADVCeiuwPUNh7sAPlkxNaWtJ+TXfm4/1wPX5C4hcwlB
         RKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880329; x=1790485129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwMS+SCTdXpEwJqRYlXmGmIQiKyrThQd9kYVEal5MRA=;
        b=cpGjg9gKxl/Z9J7Hy6u4OBmPr3VHWWl/ljhgcsGBKSH9ugYTLhjaNqCHsyj7+EzPYt
         ep0lmGReKdbtE1+2MNX9dez2O5qlC2KvZ26W7IhKvD5dnhJ2mKOEEE8FjCxy0BQG9vDb
         hxqZZKOLZUyW+FIUom6KvRW4aQHH9vnHvR7Xv0PdvALNLNH2MHzpk+BxH6CpeOxoaIGu
         3NpzJJ2rzVIvc1bjbFvuiWSGZSN85xKuBWVlY8LVEtfU8k0n7CN8YXjKM0f2vVxZeDdc
         eWiwJC1er592FDmkLjrQzileSH1MbYcwqq8WRBrvf5JElGEE7xETOGLsskf9UiJ/kVjv
         Xfcg==
X-Forwarded-Encrypted: i=1; AKwUvByAkHN5JNxOkONy5ql7mBEfsm0wQ0DezCwxsFln6ZevDzS8Vx8Z/xREQc+R4M5lAruKqge5HN5jlezEZg==@vger.kernel.org
X-Gm-Message-State: AFuF++nvNri7+CfRqUUArO2duXO2gpoR+IQmdxvUcmLV5AiIy3BM43Bz
	X/ErfOj+RjlepicqPbeZl6cHq9oAyHtOOTwNn/Syf5HjdbM5xYSycLrx
X-Gm-Gg: AYBFou3UiMDhChSd7u81F4PfHwVDSzj8xXvGdXav8mjuCzecRh3xVdPgiBfZFBqr2LZ
	ELG36csBH/R7DGE4L/d+SMAmf3Oz06b6+a1hyiOjk0XiSyhHm91hO6tJ/2LBox8cqahXGZOiEM2
	3EHsJhYJQHKfJdQkfiu7H7IdFvM68/3x9kgVTKY9gMDV1D+mLJfddVbDd+uvPos1IgyTyr1qkLp
	+fiJ8iqME6r/fZY0HZ0eDUn72Y4DT42+u0bHiNO2glUIqZK4TI+kgw1jJQEELWWHfd0zPlIRo9a
	GHDvfc7nXmy+X3jKwkswnaKamCd+RbYAy2ShLyVFg4fpr9tqoFfRxrZ6kfh0pMO99w8o2i7+D3x
	3gmxYLzAKfcLvnsK0BZArKtZDwSjBvF547PhSkzQIaQ6ktkWaLefTUQqm4TI3k1PsJYCn0ZTcoz
	aXw9VotAcwjchelhyBDfa/CA0kEp3EgN00Et2RvJhjvOUYyDfJwuOw5ng6pIm6M0iG4sSFpTog+
	GeYAYZCSIG2HSlpL7F9r1yGMGLeohxKaoz5GJk7SfgCtJA0NlISKbS6Q1F2JSOAk/sW0e4U4pE2
	eWwnemilFaqcBZFu8W5u79Pb6o6K4bGV8EbFeDJlzltFzm8=
X-Received: by 2002:a17:903:28e:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2ddc10044f8mr51674075ad.55.1789880329399;
        Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:49 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:54:03 +1000
Subject: [PATCH 24/28] arm64: dts: apple: t8112-j493: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-24-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=StMdE/41Quj7yIXSIiTM/Hm7dUYYyFp2jqXhWfbLNVs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05UuHtmzzNTy5hyeCe56m3uqbz8rKFxy4t6Kd/9Ug
 gV1Vj0X6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1VD1GhqtHy95unr6tZnfMpnu71vU79bx5xat/K1qC4eaHrgUpGusYGbZctnv
 2QkFJ57zSUeMVVvO2Tj2/2eDbYy7OQxbb7C1PLWMGAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 MacBook Pro integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j493.dts | 101 +++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index 7cea5c594810..eb401ae8773e 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -147,5 +147,106 @@ touchbar0: touchbar@0 {
 	};
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker_left_rear: codec@38 {
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "ti,sn012776", "ti,tas2764";
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
+		compatible = "apple,j493-macaudio", "apple,macaudio";
+		model = "MacBook Pro J493";
+
+		dai-link@0 {
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
 #include "hwmon-laptop.dtsi"
 #include "hwmon-fan.dtsi"

-- 
2.55.0

