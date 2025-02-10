Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9424D23E250
	for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199705; cv=none; b=jSXVT7bb/GPRptGYXdz5Yl8qbgrBbXwIBuuG4c7l5kzNTvQ6plhfpWLSIGbFWDWGzTmWXzf1B5FhodrtWfLnySWRvYBN8AoeOLy9V+pwIjlS+7V1Wcq1rIVX2K3Z64PMZ2J5cRDSqjpFi+CklUOQ9f1hk8q5WVh6hWUnWLRit2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199705; c=relaxed/simple;
	bh=ra186LwKS8pvRQ+ulkF1Ob/abglWAThWB5JzaYpqjE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ory7/YGgn5hw6BsOb6xF7yg4DZnNrIOy3PoBPaYmL1tHsI8foiNlmbK19cy99aLu1CXhNwzxMr3cXLf1TZ+tlxP5cQ3ad1Z23PflTMJiEJyKjayWVoRHnUHzC791kTut+isyxUzybiND2Vv7riOMwp3OKEB2PnB2uUm5HCa2wqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y2FluRXZ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y2FluRXZ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso184908166b.1
        for <linux-sound@vger.kernel.org>; Mon, 10 Feb 2025 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199701; x=1739804501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDwysfrxYdnvpIdJT7USDkw1h39r5hFh2YykRChg6Kc=;
        b=y2FluRXZpalIasDu37YaPRWxbZbxwoBOfegKmrERc6D/uS+n2GvH4Eok2Y8tO5qN1h
         e1F6mjDTbUzA6Xvu3qC1nzGTVCJHyJNcLRX8jxSGLZM5G7aH2HPXjFXPCrsuO7GcZO7L
         4CtshYEf8I0kHP3Wgt0CMqBDU175aK1xz2Ipx1oMzAdu/2H8iqodr8KznJY4MNQrLKng
         rNEquzYJPlDNBJf9CPevWrU08ByTDc2kNIOkadqlJ/7j8act7OYFiFVCULaI4shvf0Lw
         uVKas3iYUBYxh0OpmRXwmiRnCU/EpkS9R1Rv9hysdhZDF/21JkYsyGJMHnU5Swc3DeCZ
         U36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199701; x=1739804501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDwysfrxYdnvpIdJT7USDkw1h39r5hFh2YykRChg6Kc=;
        b=F/+8yzUQ8E/11zBLrNBlq3RCW++dgeG/BXFJCj7jHFPcFOnpJYQ3rtX+SK83ItA959
         b5rTVwkdpM07l13UaiaDV6aT7wrrquW8qMgeaGonY3gU6P1K518wZb+SGKssO4SUNaKS
         4qICxbwrATdVGZJWUECMk3S0oS28zP61Nkc5sugcw9bPJT8XhBsn79yjFMVvyTs+sz1e
         moQNebEwtMgT/DuLGxnCfi3XZFCPgaCoUkAclSzlHzkr46wyEuByaiTe55Urb8eGN3Bq
         ivCvaWUTVFurADyIUkV2ROGfV2ocApI2F9ZuH2Yt/d9fKFZv0GYZ5df/dT8B2Xh2lmNo
         6WpA==
X-Forwarded-Encrypted: i=1; AJvYcCW4etHJob4jzfpzg9e55UvPlFzoJkP8xSk//9FWWZG9rTvB4jrTl66jXmTDj2hjUXxzBP4rNUBGmtZv3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh62t6HidWl41s2YfeVqPc1iKkvrUdK193Wm++DleC72fVFRIz
	mepUKP9auua8K/XLN4oikp5UCfEjg+jZA5TH2gNNtLiS/3WRU/vOlg1P0KCq674=
X-Gm-Gg: ASbGncvDEDvvREUVwnhPRgcf72TUVTm6K7WsHZo2xBZdzVOgb72zxFn2luZjUwpsU35
	lZk4bAiCQorhV/vK7Q+q4b0MzbMXDZU4mOnLsXS26yvvQp5KuJ+UlgvK6qn7Lrm+N1TJFIvD26i
	5WTGPw+HaYNZzfFTv431GhlokZUZDgGbtaizp3qwqRys3/wLyR6ltUzucKmvD/W5p9O74p85AKP
	1DEnjdBVWeDJ7ZYYFvOS/vR0iW3KRXPoqw1hpBpX0UdKfP1A04lBJTxE5wa6ASw0NdTpdyZmeLd
	uvzIetKZDVQYQ1poHSeSZy+Ue80V
X-Google-Smtp-Source: AGHT+IGGApn1+B5eCaOcf/7nnDOcbipSWzqajWhFXoUzR2omWufSb2FAoBNmw4R/1Cmqf9KlenerKQ==
X-Received: by 2002:a17:907:9411:b0:ab7:b84c:361 with SMTP id a640c23a62f3a-ab7b84c05e6mr572978266b.25.1739199700513;
        Mon, 10 Feb 2025 07:01:40 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:40 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 6/6] arm64: dts: meson-gx: enable audin on odroidc2 platform
Date: Mon, 10 Feb 2025 16:01:29 +0100
Message-Id: <20250210150129.40248-7-vsetti@baylibre.com>
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

This commit adds the TODDR #0 module to the Odroid-C2 platform.

Note: this not enough to be able to start recording data. An addiditional
dai-link node should be added with a reference to the external codec
being used. For example here's what should be added when an NXP SGTL5000
is used:

		dai-link-4 {
			sound-dai = <&audin CPU_I2S_DECODER>;
			dai-format = "i2s";
			mclk-fs = <256>;

			codec-0 {
				sound-dai = <&sgtl5000>;
			};
		};

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 959bd8d77a82..a83373739019 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -10,6 +10,7 @@
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/meson-aiu.h>
+#include <dt-bindings/sound/meson-audin.h>
 
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
@@ -210,6 +211,10 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&audin CPU_AUDIN_TODDR_0>;
+		};
 	};
 };
 
@@ -217,6 +222,10 @@ &aiu {
 	status = "okay";
 };
 
+&audin {
+	status = "okay";
+};
+
 &cec_AO {
 	status = "okay";
 	pinctrl-0 = <&ao_cec_pins>;
-- 
2.39.5

