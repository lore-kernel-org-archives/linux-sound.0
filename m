Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108519DFB4;
	Mon, 20 Jan 2025 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363730; cv=none; b=Dgzqir012plc9Ptq91SMT/q0Oro+Uxqhmo2JJLFXP29HS0F1AROB5dj4jFfBjj0IBtyzThOokhRMwh8aPtw8WdpUQq43ew6Wiut8WiHnPwYZAqKRsXKluJHn/QcQkOIIEPuefkRTQNWeHmCxomUSrT+MQvI4BqojsZH7KanPMN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363730; c=relaxed/simple;
	bh=mhZBI52cSFUW4zmM+Wjfy5nZUWjEd1lQ47cgj8nn2a0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LCvNk2fbmOdQpjJ6VGUsZoooqJWFvFs11sS1xUGZU+jTjfTjNGrbV8b0GsaStBgFdlk/e0zaG24Ao9lW1zKS03NDdE+J4kBQC0qMp7tP4ddodflUeqBqOa2dxZDKdNyus81VCi14BgXkvwo86oKm+++/Ke1309PdrQvJpZ3jwMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOKkKdqy; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOKkKdqy"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6cdb7so4047879e87.2;
        Mon, 20 Jan 2025 01:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363727; x=1737968527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObQ7GdDi1GptsOmZqtnr/i0ThLMDmvsqiFg1PNnocMQ=;
        b=kOKkKdqyZwBxpOe62cZOblr5TOsTBSPDCzdkTUANVpveb/CO4/yM/HzGDpqAFNKtAM
         K6H/28GfBaDk9P+zdrwH5eAczQRZ5iUySGCT9ontcZbQEyG2Pwzl/GFt4VbzhGmqXqzL
         3OR+KU/aii5mwBt4m5zVZ6LMdXC1VROdyyi/FxaOlZYLhZwWEOOFZ+tS0f9W8FzRofjt
         O/C7XlI6uqYamhNt03ny/alyALvYOQZxEsXtSPDNKoEIh9MyudOoWcspp4IdwhXZU5mF
         Pxqvqs9bahcS66qiLei7dp7QoKhtSLiKP5ONwc2W89hDUKQUizVZjfB1f7Zsczn0aaOG
         Hjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363727; x=1737968527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObQ7GdDi1GptsOmZqtnr/i0ThLMDmvsqiFg1PNnocMQ=;
        b=kU2XBEpdYJYdsssRYjLUDr/ZnM6ZI+q0gTlXtW9YM1LTyWC+TK4KYj34PUeA2dY8Fw
         EgfXlGvois56xsbv9VUlRS4a1N+aWA/YVn1mu/WQDdE58G7Tsp7uNqAPaqc0DMnF2ozN
         5loXwrtimmkLqvpNMrdnisVQbQJJEYDqfzYqUHvNxkyW3dN4Ynirlx/QakTGdcswjvQ9
         TPZ+ujq4J8r2+PELneaaApjiDE8jgIWKgmph0kkN+BBOe3IKRUa+Nd8bCT7Hv7jaGm3b
         HFFYOd0GrQmZALEIwi3vzpFMTzn4KB5sitK8XMn92GUgjFkg4wuLAi1QntEBicdR5T0N
         6BTA==
X-Forwarded-Encrypted: i=1; AJvYcCVmJ4JPdLoLhi5Sdv7itGSAQB/wLYdSj/BhixPNwzSMOebMOLTaAETsmQHaYhh+IREAAzEA6jUnd4+/YJPS@vger.kernel.org, AJvYcCWttsCJqw/EIiGJJ2ortb4IvjkkqTt5ss7tosd5PFasmPO+ZYgQsUaZQi5pbNPFm+Ii/5fJtCPZjWvP@vger.kernel.org
X-Gm-Message-State: AOJu0YzZV9ugrWQ+UG3ybu4dMGdcFgSYzgs9bM+PeQupaVn/NBNl7sYW
	mtyNK5m8C06gG4fXEsS6aMvd5ihdogqn6JjypYo4ECcxtc58+pMB
X-Gm-Gg: ASbGncvZjaRYjA+Kdqk3X7DDSj8Hky0aquDdjm/+HBuxQ5OX+eb7dOcFvLV4zgU7uFF
	PbzncrQgVI81BHd2Wpo2NyYYYQyp9kSa1soNP6tRozAaRvWkIgnbDHDvGHpC0OICeu32K4kRScB
	5gE5gnF/NJTYuzqgXlFa8ZeMrGc211QHwfX8w/2mQpwA/vSoGxZrjAcxEy6kfK7qm/Sv6Z4CUTV
	co1yH4QU9u3Z8YkbMTntznbncqvkvp+fieRKS2eeODCco2uNiJG/Vfq+U8W0tkZZPF6fME=
X-Google-Smtp-Source: AGHT+IG+uLtQwIY7ysUBBPpzDpbxHyy+W/cd6hfRub2H22c4oda2HhPrd0zg5OQqcxaq2LdygE+qDA==
X-Received: by 2002:ac2:561b:0:b0:540:353a:5b1f with SMTP id 2adb3069b0e04-5439c1ba039mr3725344e87.0.1737363726847;
        Mon, 20 Jan 2025 01:02:06 -0800 (PST)
Received: from [172.30.32.150] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e90asm1224768e87.76.2025.01.20.01.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:02:05 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 20 Jan 2025 13:01:29 +0400
Subject: [PATCH 3/3] arm64: dts: rockchip: Enable SPDIF output on H96 Max
 V58
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-rk3588-spdif-v1-3-1415f5871dc7@gmail.com>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
In-Reply-To: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737363699; l=1420;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=mhZBI52cSFUW4zmM+Wjfy5nZUWjEd1lQ47cgj8nn2a0=;
 b=3k0A0++kluCdKMCJzs9uffAyMkB9nN6XP5utWRzFrHkWnhbpcAKF4sZs6ezzWG8blnODh5R+g
 LPjSW5xBvA9BxjjtuEIwF1rkSlrUmbTqApiJoooeSrxu/HMNIP1fWfy
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=

H96 Max V58 has its spdif_tx0 controller wired to a dedicated optical
Toslink SPDIF socket, enable it in the device tree

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 4791b77f3571db3a888c015596b4cc1863fdc3f7..68dd7329de15d873f2a0df85fb84810f9c2907d8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -140,6 +140,24 @@ vcc5v0_sys: regulator-5v0-sys {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 	};
+
+	spdif_dit: spdif-dit {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
+	spdif_sound: spdif-sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SPDIF";
+
+		simple-audio-card,cpu {
+			sound-dai = <&spdif_tx0>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&spdif_dit>;
+		};
+	};
 };
 
 &combphy0_ps {
@@ -400,6 +418,12 @@ &sdhci {
 	status = "okay";
 };
 
+&spdif_tx0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spdif0m1_tx>;
+	status = "okay";
+};
+
 &spi2 {
 	assigned-clocks = <&cru CLK_SPI2>;
 	assigned-clock-rates = <200000000>;

-- 
2.48.1

