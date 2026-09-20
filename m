Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338D314B6E
	for <linux-sound@vger.kernel.org>; Sun, 20 Sep 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880294; cv=none; b=SUbycD4n8pXU87fFlzisn1F92wEmV5QcV5liMhwjgS5GvdjLeW5By+O4fuftp96io1J6jXkBQy0++52tTMtai1pprZHIHSFgHq0/ielrmP8cyyk+Je7DWsdbZzYcqZaTlgzHRh1zy0elN0YFiMB4boqDOpigJM2HkB4fKvkjx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880294; c=relaxed/simple;
	bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DgEWzc/5GqzSWVHJrbAk4g010+6Umujw18/XOvoSAYIdxFJKz0kMjY3ceeQIsgnrlvEcPIIglL0Elf1Gtxm/USEFtD29q4zUH4DLSB8x4hTO0dcLKLkmpYBIK9ysVzqGEUh6QcP1uzVtZIxaME3NW4LfkqrmK2x8LhYRo+pUG80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9aJbK8X; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9aJbK8X"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df38376150so1168155ad.0
        for <linux-sound@vger.kernel.org>; Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880292; x=1790485092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=i9aJbK8X7QYSNvIYnLeyEaVGBTyPwWWTNVQBWN1Y92vsXRRUGVF4Q3wAWekK/8hZjt
         dw0hnarz+miBRfFt7wIOh0R65ilMbf57nXYflCdoOk2d/OMESzOyWr7eLviyHSE+AqPa
         b/JF8HPRIcg06dcPJYPIXXMlFyr59aB04fERdkclGXUFS7mNFt4ywFDS+e/f7km9LjAr
         jeGkqiVoIeywmkSOabud2Gf1pOB0yXeTkqQg0tBZe7V77oh1psLyNsG4PEmgz4CnBZkp
         UtAu4yIHhO+zkDML35K8FExVGlX9knV0WWlIQKmuZVWsiqMGoy1PUCIIECuKnhV13p32
         ebaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880292; x=1790485092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=uMpTiW4JGcIriVc568RP0r96/UWuxj9JktJblMavaCNs1bV/tCKpqZUiyOoSMwkJ8n
         We/t+JUxyodUHded8gunw2KJaAmKUoO2EvYVbYksyIKPgFblDoEXh3ubwjOqdPXYPQqF
         VrEzN8x9hjZTFjzfaBuR0DSLk0IN3sdYLbe05Owpmp04xnjNGMispuOUzRl3G2desYeu
         4INo0zePrB5jV/CA+/1CSjjTNmWZddYSVgilQKxoVdSCqlJKCPmW+ta71RuF/Gqu8wGK
         ifLYSPgx6xVHAK+GHRc5dRED0ApKe71f7upBrkPUvds7YyMYlqEfx6ZbG4rWMftmsFQe
         T9Ag==
X-Forwarded-Encrypted: i=1; AKwUvByoYboMEnw/kVHqcLBNIg73cH/zC57k/eJJIKqGsKZn8footrFpueR3i/0Z4wFetD1a+f9bksnAXl3e9A==@vger.kernel.org
X-Gm-Message-State: AFuF++nxBMl3a6D0iZpuybmJTsoTrq9Dp6lnFlZQ+xe/Nia02Hpwv4cq
	VQj3fgOmvWpA8xfvfS7duaBHE3ix0u7tw0+OkStbqGMpTKpiRkFQNWPb
X-Gm-Gg: AYBFou1EmkLqMZFCHn5IyQRQ+8A5Uq8yahX5gdzRwD37jqT2KRVN7uWHNJmdzn1+KqN
	nFUHfTOthnRTyUrnTt+b96LXbZwOfjJQsbhNZ8MhCy3X+XyPfOYF4+RTw4JOJez9ze6DInVBliC
	piircX+8IowuceRBKd6jI0ea4i+dtqOROrE7HGxBe1l3omrEwwnFCBQoCrhP14vbATxer4Pne+L
	BznDxKL3kq0XBLvFfyUGOTF7c427D/LYixHVYtrmwy0gT/2XXyccZeAnEKZg2wfWYV8ymi3EnaG
	t51RpLDLPde3p07atj79M1B66W3AoO2e3LU+uqG90E+e25BZK6FX9DZLNHwVCjj/hASYuHdhfbm
	KBn+oKHtPdY89RwIOX6/cLUyaU2WHxmRnE543qgGGyDnknExTYHy1SLJctnvDnxirpPp7n88nBk
	bHTKwJOJ7HLXLiJJttl3k/U+BrBoWhRWyvuaR367upZ0Py2cJx6JbSwOKREBeANnHhKTcBwnio2
	/WdqucK8E6t/93i5a+fdB4gG9iRbybZP04M49FhnKIhK0qDAshwWIAuErhlap50jJpg/Q9pdDt9
	9Uupkwm4Zs/VGYAy2COV5gYQB8zB165cENq9Diek8Ci9eNkzrW/ZSuQ1fA==
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr41443735ad.32.1789880292039;
        Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:59 +1000
Subject: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuyhvMW7Ds9h3dXNYauaI1fvENjrYLNloXfE7/+
 /9FwcL2joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT/msPIsGD6SeetzNUyV32e1hbMDmx9b/3btb5snUCd1rEgJq2buYwMVwW3aDW
 dXZGUEtGZUOsgVbG4d47hzTtOzj7lP3bJzRLjAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 33 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 33 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..41ec1398f981 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,36 @@ &pcie0_dart_1 {
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
+		compatible = "apple,j456-macaudio", "apple,macaudio";
+		model = "iMac J456";
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
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..aa2a08cb22cb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,36 @@ ethernet0: ethernet@0,0 {
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
+		compatible = "apple,j457-macaudio", "apple,macaudio";
+		model = "iMac J457";
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

-- 
2.55.0

