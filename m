Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796084;
	b=hNwWbKGOv2iDq59iBPdL430QrSOzVx7vpMTtwdDHSmTyjzLBnUYRlA6ON6fEJXJIRNOr
	 RFRemJdNEu8y95541SBWccURxgMpTovk64lwxGPJc4OGdNUkHcepGI8GP1LlDckigL2oG
	 p6BS3NF4tFpxeFpRdQOztV8wCKfYmn1bQhYiqUIkPz44uWFeNZuhCTgYO4ngAZz12zIhp
	 lc9lraSpTcErPK5HkcOBaKpxQSxkM/UW+pygycudGgON7qiM6cgwm6ZNl7tBw7CvHFWLe
	 FxTk88LpfjXeSlYGVGEQPVgK25Y4k4mxgyJTl7btYm7p5A7QYeX0ldClt0qpbRbEw2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
	b=POcIItMV6D/ZwMeMkNLPUZNsxJ8O195C2kkITM7r7T7RLbEq25M9SERY0Uf3UwgKX4JO
	 +mIOywxfdrDsJw1KR9Cmgtl/2thp2Tacfynr3lqd8mD/JGyMUxIEJLhpqg2v2xzbLzpXh
	 ZMlzqM7XnBRojgaCBeAI8gQdtrQSC4dQaiic2dSTj65w0fJauhd6Hf1Aa4tPqVD61cIaY
	 qz7rYdURsR3jm01VZcxKTO4aXcYadbQbAThR6nsGgwhvgr8K1ETp7dfeNBcdY6h7nTXMD
	 Zi/K5vww/juBMcWtJND4G5qAPUwjCvyMsIpaJ/9ReeQXVJDYCl5AxZPR/Yt4v+X7FAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKY4OQFF;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEE1606A328
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 12:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDEE1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKY4OQFF
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so4486955e9.0
        for <linux-sound@vger.kernel.org>; Wed, 04 Nov 2026 04:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796082; x=1794400882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
        b=zKY4OQFFhb/TWccWcZhqYME7NpIAKPOvuGo90LadGTQ9KTewXXAS6ZMqyBs9/GbbeX
         dxvYTXHKTf50H7XwFnzmj/n0IskHBp6LAGq3FsIUYyeu9uQbyDAhoJkqDpTyWJ13Zd8y
         ByBJhwGZmuj9RAhkz9Fsg+3QUKA1efAoAKu3R96Vh/CQh6jJe6GjJNEBFFrFHhBDnGCe
         qcQaPwTejmhNGlx2Bp+QxdtBslS5MlHoWKn+TP+C1KexTC7MWacYIAmgwJUNNEOd3hiZ
         PUuhY9fcR7zI3HofX78Sjik+H0gm1HTG8NYZ+RIMgs0QSIdVHpTjMnRJHqifPpTUkcu2
         sLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796082; x=1794400882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
        b=y3uzBhUkPq36TlQY4yvoBR83nT5MzYp1Z26ElSOQ8LVhoIuTciDNBmId2srjc0Nmcu
         jZlZZ0iXjZvEYR5NiCUHbEmdqnypCvJn6v0sdKj8BMnYvRVtXsq2OyUKApi2BBGHRR0h
         cxWmrvcYKN5JV1OBK2uuE6M89LQyt06zGniri8FYcZgP0w/WHjyFczFhs+ZrEHXDUUdf
         AMO7Sia2wmRORQeV7hPamqHqrfup7q3oN3xcGl6rwzT5YbWAHadnST0uF2ekr1odP532
         GWDnNs1ky9a3Pbpr5mmwM7xcdIPELhhFr1oNvDD2lGyPx21raAR4JG1cggjFJvrGnfgY
         AE7g==
X-Forwarded-Encrypted: i=1; AKwUvByFdD+o2YowrnMCYlbkqb5Bmj/zJ9jtEGppiKoTAWbGXtC9Y/DvCadxeTmTI+aKAxQAFhy4YmTN3L4uoA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+sCZ7/vlzQpRiiEu4uL7ztkZYkbY/NQQnLYvqzNUGHt6J2s9Ey
	FIbFF9M2LynR3zfYSq3ewLrYxArT5Xpmo2So5S2b3tXaoZOILPFLlqnm
X-Gm-Gg: AYBFou1xmV3nQZ/0PMK0br8zPhhwK4x6ZqhStIz0qjbN3KjprVriCOQbSrmZRu9X+1v
	fyBEJcq4GGaqP3P4UR1Krrs1J3eChb1Ngt5DjkSqvlH8+80wBJUhJ+PIKoVmexTqWP3YxZedWhP
	ieJMx+7kZsIFFfndHqkcInHXiMidB+xjtQIOxh/65DctLMtaNpNUWfUYbuEH+u5IJGLtGP2voBN
	Juq5OEVF2IzPZSktukMzFecaZpWdeCVjYlk9WL8cWTEYujNoqHvtiUWx4CbWGiihcbpL12KXxww
	lf1DxZMt6APhx4DHVurWfxDnB1KQCkkmHkiDzJwBfu11J9FzFvr7ac451S6EE55GrMPJnDmnhL+
	vB+CM7RxItq+FRTIalrK/4ayP7pwrXPtL3jBEpLNA0v0b+369PdgU8S3oe4cHPeG5o/uf041Wa+
	EAtBrHcts3poFvn1blrALkTiQw6CaFWduzXHKK4Zz7Wp67+TlVi4NC+bnd4Vz9LQOmhade7QJW7
	KNbgqeQC/GtFBX792HbljXNXUHk3xLrXQoQ6BnHOqHBzEuTFRHW7jfOglr/KyBO2sbeXjVzYYiQ
	9K0fJe6AuMnLUYc1kCfgSoyBakgei5ptB/O51SY3b2pHPOf5WHqUWpXVkwVP0WwWuAJk+3I=
X-Received: by 2002:a05:600c:c0d4:b0:4b1:2026:6b31 with SMTP id 5b1f17b1804b1-4b12026723bmr142181145e9.28.1793796082303;
        Wed, 04 Nov 2026 04:41:22 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b433ebd278sm46347145e9.3.2026.11.04.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:41:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes
Date: Wed,  4 Nov 2026 14:40:57 +0200
Message-ID: <20261104124057.240288-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104124057.240288-1-clamor95@gmail.com>
References: <20261104124057.240288-1-clamor95@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the '#sound-dai-cells' property to audio-related nodes to support more
advanced audio routing configurations.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi | 10 ++++++++++
 arch/arm/boot/dts/nvidia/tegra20.dtsi  |  7 +++++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi  | 10 ++++++++++
 4 files changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index a5958f3a965b2..f2766c11ee6c3 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -881,6 +881,8 @@ tegra_i2s0: i2s@70080300 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S0>;
 			resets = <&tegra_car 30>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -891,6 +893,8 @@ tegra_i2s1: i2s@70080400 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S1>;
 			resets = <&tegra_car 11>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -901,6 +905,8 @@ tegra_i2s2: i2s@70080500 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S2>;
 			resets = <&tegra_car 18>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -911,6 +917,8 @@ tegra_i2s3: i2s@70080600 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S3>;
 			resets = <&tegra_car 101>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -921,6 +929,8 @@ tegra_i2s4: i2s@70080700 {
 			clocks = <&tegra_car TEGRA114_CLK_I2S4>;
 			resets = <&tegra_car 102>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra124.dtsi b/arch/arm/boot/dts/nvidia/tegra124.dtsi
index 86956b94ca0b0..920b1329a4dcb 100644
--- a/arch/arm/boot/dts/nvidia/tegra124.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124.dtsi
@@ -1125,6 +1125,8 @@ tegra_i2s0: i2s@70301000 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S0>;
 			resets = <&tegra_car 30>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1135,6 +1137,8 @@ tegra_i2s1: i2s@70301100 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S1>;
 			resets = <&tegra_car 11>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1145,6 +1149,8 @@ tegra_i2s2: i2s@70301200 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S2>;
 			resets = <&tegra_car 18>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1155,6 +1161,8 @@ tegra_i2s3: i2s@70301300 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S3>;
 			resets = <&tegra_car 101>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1165,6 +1173,8 @@ tegra_i2s4: i2s@70301400 {
 			clocks = <&tegra_car TEGRA124_CLK_I2S4>;
 			resets = <&tegra_car 102>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nvidia/tegra20.dtsi
index e4be3b62a51fe..b7102e6317ab1 100644
--- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
@@ -405,6 +405,8 @@ tegra_ac97: ac97@70002000 {
 		reset-names = "ac97";
 		dmas = <&apbdma 12>, <&apbdma 12>;
 		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+
 		status = "disabled";
 	};
 
@@ -419,6 +421,7 @@ tegra_spdif: spdif@70002400 {
 		dmas = <&apbdma 3>, <&apbdma 3>;
 		dma-names = "rx", "tx";
 		#sound-dai-cells = <0>;
+
 		status = "disabled";
 
 		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
@@ -434,6 +437,8 @@ tegra_i2s1: i2s@70002800 {
 		reset-names = "i2s";
 		dmas = <&apbdma 2>, <&apbdma 2>;
 		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+
 		status = "disabled";
 	};
 
@@ -446,6 +451,8 @@ tegra_i2s2: i2s@70002a00 {
 		reset-names = "i2s";
 		dmas = <&apbdma 1>, <&apbdma 1>;
 		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+
 		status = "disabled";
 	};
 
diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index ed1bbf86434ce..1e51da329f310 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -1043,6 +1043,8 @@ tegra_i2s0: i2s@70080300 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S0>;
 			resets = <&tegra_car 30>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1053,6 +1055,8 @@ tegra_i2s1: i2s@70080400 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S1>;
 			resets = <&tegra_car 11>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1063,6 +1067,8 @@ tegra_i2s2: i2s@70080500 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S2>;
 			resets = <&tegra_car 18>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1073,6 +1079,8 @@ tegra_i2s3: i2s@70080600 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S3>;
 			resets = <&tegra_car 101>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -1083,6 +1091,8 @@ tegra_i2s4: i2s@70080700 {
 			clocks = <&tegra_car TEGRA30_CLK_I2S4>;
 			resets = <&tegra_car 102>;
 			reset-names = "i2s";
+			#sound-dai-cells = <0>;
+
 			status = "disabled";
 		};
 	};
-- 
2.53.0

