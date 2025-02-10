Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA3923E24C
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199705; cv=none; b=suLFJ1ecLIOhpEM08IS5olaguadLl/GNQ2JO5h6mc/0/KgWmL21HQX2vIzLIXI24tePIl3G2gLJChftUp4PsKI+6KpfEd/pq+Q28rLO23LQcAzewWvyq00pGNBfoBb3TvEFzJk+CJVrY7T6Cgq87qLR35/RLq2AGottWBtBtVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199705; c=relaxed/simple;
	bh=KAhecjI26XiC6Rkzh5V+N4uCqMajbLT/16ybq2CB8AQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q2gkwXpai6VCyWVgSucfFc7/wSZeb7EvEC9I6Od2lI3YX3UZ3IIsXGXyDnnAn9j75UJOGskcfVELgpkyJXhUloKobDgcFeBk7C06ub+tY2tt6kfoGvf+OMmkaF8/R09xNrMUrgFLdEUf3v0gwWBB8gqGZ21onZYdkSryGbA9uCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JzjZwR3J; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JzjZwR3J"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so835911766b.3
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199702; x=1739804502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zy3IZpzQXEf48BiX24sRog0zkDKc85etGewBmE/vSM=;
        b=JzjZwR3JpvLBny2gBVPIvGEgJPzim6SWO6Ae/EgwBZfxleXmKrnIbvm0087KgJNltV
         GIc8i0wbKuUkOF128S5c9FzBmufDnl7YH+eYToZjDkR+t1vWv5d/1dLwPbAaJgUdPVPl
         7e/xCsFYGVV/YrYn+QaVGmyL2uNrX2MCk4BeD1cBKPK1Guaj38lB4opJKX9KDE7mg8hF
         Ui9x86zBCxLZmmVnhhLfJ1s8RyZ2LfIzy3NtU4WwyUGfXBp8HlfEzizxfGFKIYmOy9kl
         nWtVnFJxcjCDH4XAmEi/feoKB2ntLveM+U5DbfdiDWY7BRrA4gMaV4XAcuRp1084AmoE
         ThSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199702; x=1739804502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zy3IZpzQXEf48BiX24sRog0zkDKc85etGewBmE/vSM=;
        b=m1xb50I3pC1HJvAi2raxhecVDP2078gy57PhGOrcsImaaLl3g3LHBkp5TAoY3q0fZn
         atcQjOWMfZTbty+409hthiskQKEHikKJhkeKGJgQGDR3MPFmk8mGZhxaI9a6K2tZeYLW
         1th628ecK0/f4ot5aA1X/O3qJQX23xEZvlvEKwunRGaf9tOzAQ4Rcm2iZAiguaFabsOf
         hBncgfw7StcypzZWZnPsLRx/ZP4xbltwWVI8S6Rr2nuG0SsDw1ftU8hvlUzMnkdmObSP
         8GM+LkiXGAXltsReApwbMuPjCyFhy7IM1GrqBcNd9Hinxtc6WG3Ng/vkdp+McUUv+gTx
         MLqg==
X-Forwarded-Encrypted: i=1; AJvYcCVKsGUCR9eKeYbpXMEWJz1qELb915miouHdeIT5jnpvhVhvyv6jwQqO2VIA0OPHCyAzXzQzhoFKd4cOGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0eQ6zD97nr7yid5mhLvH/x9YGcjMlNnddaDOjs3lssSMoGy9N
	YU36vr84Vd6u7fyXjWtNwlaDCKcNTOdCaHm0rGYXzSPLsDavvTRS9WZUL8soSrw=
X-Gm-Gg: ASbGnctWwAmZRQ4/7Wfkuuh4ByyeljT4dKXZ059Zh0XNEYGejbUWi1E1Jzm1l9HcwhU
	ZBXblleF6jAiU4eRxHzk7OKpe2hLNQcdb8EcrNzRNrluz83umTKX8fkhN3es1PIW8FBX9sjIHdl
	rERgE+7ZpiwWVbVSP6GjEnPDF2d3SFKYeMXFkmZh/yCkEnYqKMaNNMnuP38txGBr9NVTdRvnfeS
	BhWnZYN3B8awn52LHv8XaZkxMRKIGQtTRg7tsY70X/2jabGeNwxikspaHdwlvxgLYCc/u+BQ72M
	wBHDKxCUF1TG8n3Hmhw89Mt3qe14
X-Google-Smtp-Source: AGHT+IEbHPd1oSXP7eD15imjc/jvWXdr6BpOIe7NB5TG+hcbBq9WIktQHOMG5ONOKZqK3lCo6o+VLA==
X-Received: by 2002:a17:906:110c:b0:ab7:c3c9:2ab1 with SMTP id a640c23a62f3a-ab7c3c92cd1mr373031766b.50.1739199699671;
        Mon, 10 Feb 2025 07:01:39 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:39 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 5/6] arm64: dts: meson-gx: add audin support
Date: Mon, 10 Feb 2025 16:01:28 +0100
Message-Id: <20250210150129.40248-6-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the AUDIN audio device to the Amlogic GX SoC family DT.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   |  8 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 25 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..594d7de606ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -304,6 +304,14 @@ aiu: audio-controller@5400 {
 				status = "disabled";
 			};
 
+			audin: audio-input-controller@a000 {
+				compatible = "amlogic,audin";
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "AUDIN";
+				reg = <0x0 0xa000 0x0 0x308>;
+				status = "disabled";
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x84c0 0x0 0x18>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e2026b7aa03f..2db6916684fc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -94,6 +94,31 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,audin-gxbb", "amlogic,audin";
+	clocks = <&clkc CLKID_AIU_GLUE>,
+		 <&clkc CLKID_I2S_OUT>,
+		 <&clkc CLKID_AOCLK_GATE>,
+		 <&clkc CLKID_CTS_AMCLK>,
+		 <&clkc CLKID_MIXER_IFACE>,
+		 <&clkc CLKID_I2S_SPDIF>,
+		 <&aiu AIU_AOCLK_DIV_GATE>,
+		 <&aiu AIU_AOCLK_BASIC_DIV>,
+		 <&aiu AIU_AOCLK_MORE_DIV>,
+		 <&aiu AIU_LRCLK_DIV>;
+	clock-names = "pclk",
+		      "i2s_pclk",
+		      "i2s_aoclk",
+		      "i2s_mclk",
+		      "i2s_mixer",
+		      "i2s_input_clk",
+		      "i2s_aoclk_div_gate",
+		      "i2s_aoclk_basic_div",
+		      "i2s_aoclk_more_div",
+		      "i2s_lrclk_div";
+	resets = <&reset RESET_AIU>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
-- 
2.39.5

