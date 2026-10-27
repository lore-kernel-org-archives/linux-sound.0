Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102471;
	b=I+av2sWsmN4NWk19Mxdfwaj1KU095NKr4qrHYIL6OIDJ9ZZDuITRriMVm9eYf7MolfLJ
	 mCy8H8C+7XwxKePPw/xs1/jGRE+wi+OxU8Wwse6QQSZptdN/nwtYzG4S5ysvgR1KZiPQQ
	 GhrHVJaZmbKHDXevcxUmiB9cAbFNgx+EOGjCLras9SBUYEouTRr3VQwAxRffz1fz6cdC2
	 9Z/68sVsEm4yi96grufVOEs01XBYlVo5QaMSahBsYGfSBR1aXZZhC/D2JXXZPPPT++0AI
	 J2aHcDFe/VnnvV7ZQbyQxNNmQwMWqUnyD5mZqIS/LY2n3CCuCIf6zViG86mM44vZndg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
	b=zMCGEv4Klg9ER4cXQsKgBkKR/Gbco4B9sOKiuRqf2dFXXZ9A5tKC/BklXawM8zCmMasU
	 af1W8vJgyaNht5yo2knALQDKBvu3z06DMR5dTtTlvoL2s4/pwHVzQgfNpjbNHzPQAvxYe
	 BOzRRy7clCXIUQsm7PPPDy6LJEL6cypabxM089kJVilYlXEKVrM2X9qZT3FBqXAlfXFza
	 iC0YnuEKjj9Y9EoKXThNcTBhglSmMezYHgBfzwnxrcnwHWvY80aCua8UDinsIKjJynEfn
	 UL56v+7hH6M9bZRjbQmN757eOW81ZzrArn72SahA1N8XS5ubUZ4Ubqrqy7UzHJb7N7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="g/6FlN/b";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F7606A31F
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 12:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257F7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g/6FlN/b
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso489155a12.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 05:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102469; x=1793707269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
        b=g/6FlN/bPV4hFFTmIx4Y5oOLqpKprBGYUkmf+he1xFuS7KA0wJMMfPaz4sOVUK5jKZ
         nIZbxMKpQqUu2ly57cYlBOkYsm3dny6NNVkYvTrsQcLgezlvBhYhj6+kwGdFp7WDAjw0
         4mI/+e6bm3YP6tshi1ALeurgkbYdS5JSX4+52nIg8W03QwXQkN+RT24470Le5bXRkKas
         Uszu+TlDmyHCtMIhxZmeDFzsfx0brUI9vz2tuGobcd2YwWDEyHbdjyvpORHKo4VWEFSf
         e3WTCRiqT9iBxSu4Ky9s2dj97OiQ9k04TkeHLaEq2+v40Uu4TVvvkFnQqpoPhqYpER0c
         37ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102469; x=1793707269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RX5JkljdDqaMIqrBDcx4CTusbOfYgX4R/O3KQl4nKGc=;
        b=xig9HNm0b7lAb3TxuA9P3+VBBGFGH7TpvSsiAFHtwAGecLLvBNKAH2bF834qt2j+Dr
         Z+LL5iRLBYKg+yJdgczxvrblqwtXMsE+AmASCF3NdBqYQS9KIR0nlPgvLTv5zo7P4kuo
         tCuA2yIMGUX/RMK1beR46gERenSo9O3pf4Zw6/WM0lVtjeIGHxKGr+d0jayb4GyW3FCH
         3/vquK5nZrdz+Q7tc0fx/YTUeTP2bDkCO2W+/R/f7Zi334jvAi8f7iMyWAzz+WpeWTxH
         7on///HfqtfL3v+Mp/SppHOVw/gmQxMC1gs3scLJyQEbuF4maNzIIJgtBbwXe/LhbHGm
         CxpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS86T05qAFkBJT60rPfQIbqt4ApDHVjDjPbhiu8YqXCLPppn93rtcvLpf/j3e2OYjDFWusbOVK85oXpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFr6UAYEEr6IwVQy71aI9VPYotmot9PBIAY5rJKdHG2NXAx1sH
	lbNvGnsX+J8t9eldmSELUoBl9GuSJpLZHwcNML5AaDlCB7avCSf8AIKe
X-Gm-Gg: AYBFou3st4NizKI+kWBtypgANWA29OGi4c8FsCUXqWkzH+uDkSGMp7wjdTmgV0TtyTP
	OBuyiJbBYyL1tUD+qrtJhjsSOLDqfTeJUdGORPPwohnszEAbuSeCAZtcTvaw7WAHarT8v1ZcQm9
	Wpm+Hq2uJb29aZL5v85qoy8tJcHCjC22SPwhaZ/FDw4R6eUW0ETEzUHMoRwHndjPLeT57CVJ0bV
	yf0INr2oFgzTIYhwyL6LyyzVgyOJuo4Btb3czsJLgqWVFFygx8FD842i1nDrXALahvaA/e9uoDn
	EN1YYsmpN5LCWHFrxKa+g862dg+IGLBW+3oVQ4lUdkwgOQZvP8nIcVMS2on2ZqS6IFHykjMZDpJ
	LYmR17lYS/UYdhnIsGkE093ALoCAbI2LOeYFJhmYDZ4MeNjS9oiAj3Exzx3yOydWST67+eQiy7/
	QX3bytJPfaqAyR58S1pQPC/TT7f72ukNISr/H5j4cRPCcMomz8E3a8DhAnqi9/ldTtvdH0KSLlI
	UKyFTQ1/V2/+LAEvV/Xpl0yRPgNkLV/iwLMieohFfJs7dmHwFS2TpdJjjCcKQ==
X-Received: by 2002:a05:6402:a582:10b0:6b1:b9e9:6cfe with SMTP id 4fb4d7f45d1cf-6b47bcc0a05mr1504025a12.14.1793102469281;
        Tue, 27 Oct 2026 05:01:09 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:08 -0700 (PDT)
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
Subject: [PATCH v1 7/7] ARM: tegra: Add '#sound-dai-cells' property for audio-related nodes
Date: Tue, 27 Oct 2026 14:00:19 +0200
Message-ID: <20261027120019.93611-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

