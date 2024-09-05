Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419B019755E
	for <linux-sound@vger.kernel.org>; Thu,  5 Sep 2024 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725527276; cv=none; b=mduo9EurVTPKZXGKK+5ijbCzBiT2daN2masB01J9GNLi0wH696eRhWZnkgZNASWNgi9P1itr1T4DnpNOmWjf8Oi7yeJR378By8y3RwmCR4GhfqOsElNltGen9w2HFanaQpFeKHb7z6jpwsRvf2As+iGXqRl0Vc8HS5PMNSdm7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725527276; c=relaxed/simple;
	bh=FIwNsi2/7C6h+hTUlPdOVAIygtslJZRWw1saG4r7H9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EQ3af40lFmb8SvQlYtRtcSsMnUjcPYqJ54oDrEagmpsgKuf9eMVyqmBJLtDPTixsx8KkcinqIeEl8jcmdMFxRQefgXwDBGU51DjrjBO5RhXQvYQJJjKhE4ehx9LSBip/7IyjdK95bUnK64/Fi+VhwsB8geWzyFs9EWK56d7MceQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gUPi0WQx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gUPi0WQx"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5343617fdddso825801e87.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Sep 2024 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527273; x=1726132073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amEp3d9dA2kLes/bKsPMBk46Liy76YOCyltVKKQIsdk=;
        b=gUPi0WQxqMwVU960B2uFSAuXpHLVh0hplW+tJc2grFm9/XAtw9Tb59InKpK8RL73j9
         JeNUVDyJH3ZZbXZu1fhKXrt4GYbJYdeLtOxUDRn+lWINaH+1jyB5SclhWtFgRQelR21w
         jIGNOuh+KkNfksZOL4sAFlUpAn5AlT6YhL3WXsk17oZkngxGdOaKffmQJcLPYNuQ53P4
         jydf4rB95lU1fyxzGnxYcQgXU4bI36r7rZBVAFT+Kf8ZqRtK4arUK84miPk+EL7Zq6z8
         rHexTVHqG0keeQWWT4Z2EC8fN7mtB3JWwPDjwt4jgWs3O9ZMEdvBgPEmNfO/I6YTdLMz
         7E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527273; x=1726132073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amEp3d9dA2kLes/bKsPMBk46Liy76YOCyltVKKQIsdk=;
        b=MW904+f8g4uhAhZHLY27ZB8NJE0AELS5dyiyC7rPPQblekOJL0LmHrVi9kgKEdRrG3
         XJeHvfM5sSlUhMc/KUf620D6yFF8H9tuMeF1NwUDnVclYXqMDxDzY/22c3DBtHXhBigH
         tZ+aYNdLYl+HOe5RdG3wzgOXKGFY8isC2RxYEBoaObiBxibnLhP08gOMQoW+MopYqAFz
         G4kF7cujbgEPI8bh1etXBuhjRLg6Alt28zt0sbI1hmCpi7cRA9JJLqLcQofVN/r9DGFk
         qS+yIFPBz6Gqi+DBgt7lPZ5RXrybxdRSTXhYvPWmYed3/1VhCNFKMT6mh7M1h6atVY3i
         r51g==
X-Forwarded-Encrypted: i=1; AJvYcCWMFjELm7+Uw3wxuc8EPDzodcnIreQB4ba7FASk8Smn463ned5OhuzGGlh3PLYJ02ZJ73U03X06B7cWcA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHxoMzaX4mOS1/5Htgkjj7FR8wVqfCWNzreivaiPjhxOI2Iq7A
	wpvi8/vipzwls1Jf5tnYUHrECwH4oAIoZ6jhf0Evu+yx1Kn18uZnwWhjYLOlFt4=
X-Google-Smtp-Source: AGHT+IEXxv3v/7gChECZyOGuQolflyMIMwnjLiTaBnwFPxxgLEbat0KiTCUHf92EE0SVtscCFlRltg==
X-Received: by 2002:a05:6512:1593:b0:536:53e3:feae with SMTP id 2adb3069b0e04-53653e400aamr788908e87.11.1725527259850;
        Thu, 05 Sep 2024 02:07:39 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:07:02 +0200
Subject: [PATCH v8 5/5] arm64: dts: mediatek: add audio support for
 mt8365-evk
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-audio-i350-v8-5-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3691; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=FIwNsi2/7C6h+hTUlPdOVAIygtslJZRWw1saG4r7H9A=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTORpSVxJ3WbTSdgdCVCYCnTzKrNLC1U02Hx9yO
 uJ38TEmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURdtGD/
 9QPgfVxIgAgeB4+Wq1OA6v2H1AeKw1PS2HUIJjwj/wYkXZehlBvs+xePlZPiQN4/TRR/CVjAhWCkoF
 zf51VPxBZ/lp90Dlugv+8vp32PrpJfmS9WD6aB2RYg5jbnUbOWEa8KsDi47EXIP4Y27TFLQvFzTY0Y
 h12/eeBEo2b8MyIt3ILEv+HCALp5gKledvonGxIt+6fmZETN6LrhyW0SPp2Bq5hvO2TvoDUz18ZfG9
 2KPqWUU8fwjIYzJF+Jg/23G/lZwab/DXH7rXBMbq6dP4GW7gFNd9tyMrButbSQc2FqKiFuzJoaZw53
 MV92eRMwEItx4bC3iF2lNyOO0vvYyuNIfQM2+RFZ1X9kS+pKt8YsX7bnFmFn8YBibxBomvFh3EP0PK
 BpDDxSwd8W8SjrqfTqwpZh/97bbv0GzRXLTGPKvthkIenQraunMIjpU6Vx8WRODrliBlqdANnw7xT+
 YLvteJ2EOAkVtcJIAnOis3y7NhfCDtnngmHCksnkzcnywYKKjPJdOx0lzfL/o8w7OsSwT1vYlP8MUo
 xeDkui005HYUMjGbc+pT9IujVhpu555SYHNYKx+w1A4RISxic4hSUcmu7p+/3MNpBGt1H6LjmZCAqH
 2ux5hGjZYZBJcaBojKfPHEMr3myzjvFPFynmx2GmmKXusBFk9GzAOOCndFrw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add the sound node which is linked to the MT8365 SoC AFE and
the MT6357 audio codec.

Update the file header.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 86 +++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 4211a992dd9d..7d90112a7e27 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -4,6 +4,7 @@
  * Authors:
  * Fabien Parent <fparent@baylibre.com>
  * Bernhard Rosenkränzer <bero@baylibre.com>
+ * Alexandre Mergnat <amergnat@baylibre.com>
  */
 
 /dts-v1/;
@@ -86,6 +87,28 @@ optee_reserved: optee@43200000 {
 			reg = <0 0x43200000 0 0x00c00000>;
 		};
 	};
+
+	sound: sound {
+		compatible = "mediatek,mt8365-mt6357";
+		pinctrl-names = "default",
+				"dmic",
+				"miso_off",
+				"miso_on",
+				"mosi_off",
+				"mosi_on";
+		pinctrl-0 = <&aud_default_pins>;
+		pinctrl-1 = <&aud_dmic_pins>;
+		pinctrl-2 = <&aud_miso_off_pins>;
+		pinctrl-3 = <&aud_miso_on_pins>;
+		pinctrl-4 = <&aud_mosi_off_pins>;
+		pinctrl-5 = <&aud_mosi_on_pins>;
+		mediatek,platform = <&afe>;
+	};
+};
+
+&afe {
+	mediatek,dmic-mode = <1>;
+	status = "okay";
 };
 
 &cpu0 {
@@ -178,9 +201,72 @@ &mt6357_pmic {
 	interrupts-extended = <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-controller;
 	#interrupt-cells = <2>;
+	mediatek,micbias0-microvolt = <1900000>;
+	mediatek,micbias1-microvolt = <1700000>;
 };
 
 &pio {
+	aud_default_pins: audiodefault-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_72_CMDAT4__FUNC_I2S3_BCK>,
+				 <MT8365_PIN_73_CMDAT5__FUNC_I2S3_LRCK>,
+				 <MT8365_PIN_74_CMDAT6__FUNC_I2S3_MCK>,
+				 <MT8365_PIN_75_CMDAT7__FUNC_I2S3_DO>;
+		};
+	};
+
+	aud_dmic_pins: audiodmic-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_117_DMIC0_CLK__FUNC_DMIC0_CLK>,
+				 <MT8365_PIN_118_DMIC0_DAT0__FUNC_DMIC0_DAT0>,
+				 <MT8365_PIN_119_DMIC0_DAT1__FUNC_DMIC0_DAT1>;
+		};
+	};
+
+	aud_miso_off_pins: misooff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_GPIO53>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_GPIO54>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_GPIO55>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_GPIO56>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_miso_on_pins: misoon-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_53_AUD_CLK_MISO__FUNC_AUD_CLK_MISO>,
+				 <MT8365_PIN_54_AUD_SYNC_MISO__FUNC_AUD_SYNC_MISO>,
+				 <MT8365_PIN_55_AUD_DAT_MISO0__FUNC_AUD_DAT_MISO0>,
+				 <MT8365_PIN_56_AUD_DAT_MISO1__FUNC_AUD_DAT_MISO1>;
+			drive-strength = <6>;
+		};
+	};
+
+	aud_mosi_off_pins: mosioff-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_GPIO49>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_GPIO50>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_GPIO51>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_GPIO52>;
+			input-enable;
+			bias-pull-down;
+			drive-strength = <2>;
+		};
+	};
+
+	aud_mosi_on_pins: mosion-pins {
+		clk-dat-pins {
+			pinmux = <MT8365_PIN_49_AUD_CLK_MOSI__FUNC_AUD_CLK_MOSI>,
+				 <MT8365_PIN_50_AUD_SYNC_MOSI__FUNC_AUD_SYNC_MOSI>,
+				 <MT8365_PIN_51_AUD_DAT_MOSI0__FUNC_AUD_DAT_MOSI0>,
+				 <MT8365_PIN_52_AUD_DAT_MOSI1__FUNC_AUD_DAT_MOSI1>;
+			drive-strength = <6>;
+		};
+	};
+
 	ethernet_pins: ethernet-pins {
 		phy_reset_pins {
 			pinmux = <MT8365_PIN_133_TDM_TX_DATA1__FUNC_GPIO133>;

-- 
2.25.1

