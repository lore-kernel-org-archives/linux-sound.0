Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F95D130A6A
	for <linux-sound@vger.kernel.org>; Tue,  9 Apr 2024 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712657650; cv=none; b=RXuy6tNMt/V+AeVmRfUU3cQcArABj0UiJmi/GdElHvWnXiR7NA5e4ag/apHoOOZL8jhc7XT/Rn+8dBDc1KTEilvVraWG2NnFx9bhDswqlxQ41mVYEy0iRgtaABUHwGjFKVzNs8ZUFSc+C+dR21oITuRv71YH90zHIfxGO27Aq4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712657650; c=relaxed/simple;
	bh=9JiWubCt7cv90b13bkV2NJN74YeswiFHCbXLjZUbZs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kge1SYu6K0/7GJW0dHc7YJ0mDWY2RMRJCxRgOV+T8cLshtO4kEx58/i9H7NMk4WdRTvQdbQtcND3od7iA5xT3eAOw28Lb3GnQ+b5tT4f6H0mrz+gOCXtkRCGsHQu4EoPzV7wvtZru4FQ5kmg3i/WnEybr37SJLKc+9I26epA/YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tAQJ5tco; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tAQJ5tco"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d8a2cbe1baso7503591fa.0
        for <linux-sound@vger.kernel.org>; Tue, 09 Apr 2024 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657645; x=1713262445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
        b=tAQJ5tcoaZj3B5tjzydVxUds1xavQqE4da6DBFXgjuhIv2GXWOoPp0McA8rNUsRKeu
         7vyX4yFUeK/TuVu5FhmWTmpkeDBYCd7zPZa8a+NDNGSNIInlSwNj25JiWXHCMti4zMcc
         V9lhVHfA24HrVrWSA3MhuRH4XqxU6+NUW1n20weC+/UgCxRTaHSShIo6SP3N9tQgkVPi
         qrtK9O7MXHhzGTLHW1So21f3tJdoukjPVzHtia35Rv5ZtNNDESrSS+6OaSqWdxXuSR7G
         YaXiRxpOKmmYWDlTgOJ1GItW0PDB7IkH8AqsE9rPg9aX/XWx/rvsNa8+AP0eoBF2oHvu
         VLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657645; x=1713262445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
        b=LELkf3TAqHCDWNENxoJXY6Z0kgWKtAavckKxg/nn+RjXmWUy6O41aTgMVe/l+jkkeg
         AWVL9peBW9Nry3zi9X8I1zVqgIxq3OxTacab+yfbfg6Jhk1/NnOFbB3nvY913hUiWnXY
         bCkk4TPOfDEN49v1MbJ01aOS7uvEmN2SgxSvYUNhD/ozznF9jnzyi4SgcfwAcmluAwnb
         XOHg5ShQs1uY4YAgjnm33io8ygsR8dbneLy3fT4ZRNkizctAvFZemawcWBvic+Zld9UY
         KimKH9iVD1bOwcD3A7429VSXtW6p49UQSiYCw3tAMegRYB0Y/WLNRHMCZ0XgKMsJzIx6
         lx6Q==
X-Gm-Message-State: AOJu0YwDYzxoz1iYU3mcH3EbtZYwUprygsPYPEuPLQiyXfpdt85SbBPz
	apTGtcpdgUGrJjRvf5tZyggIbQGycHbmgNIyZQSN/HSU/2quTAOOQ2Vl6WI71zI=
X-Google-Smtp-Source: AGHT+IENdUOHrGfs5r6bs+Wha4bn9SDjds7qLVwOQAcnUYwqRAeg46DX9D+xFYcRM1j81YaRR1bsjQ==
X-Received: by 2002:a2e:9891:0:b0:2d8:6e0b:8166 with SMTP id b17-20020a2e9891000000b002d86e0b8166mr7274355ljj.53.1712657645405;
        Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:37 +0200
Subject: [PATCH v2 16/18] arm64: dts: mediatek: add mt6357 audio codec
 support
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-16-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9JiWubCt7cv90b13bkV2NJN74YeswiFHCbXLjZUbZs4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTG2fTNzUli3ntNCZsXBAHw4VMKqQOmZ8HnVyz
 451K1leJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURXv8D/
 4swIhESlxC/0lqHODwrAjRgviVRfhgvqxo+Th3OJ5EqCuB6mgn07DpwhYr39z6xFPQuZ8ACs5cVxq8
 0kiFqDuyuSy2SoPq1Q4Edcn/UxpUJsta1MghQ9tIrj90OMjJs2xIMXVhvOzwSz+DDwafKaTy+stV4T
 uxaKBpicLjp+mXYe4rF+wTkPCmsUJmEktncgNswuJ8o3WhLCNOTkv86LVKKLglyOPqocDKf5eOcwjX
 RjJZ6r7ctGH3SZp7eAbkR6vNdpW4uRh8UD9XREPqie93DW6HeSA+Ck87bNhY+wuDGbyKthzZiRp1J5
 hTlQ3TzYYgCl5muwUARI/jKr7PEefR9ebBfioTXeEqlAQKhIXyuA0qJxjCZUBW1ldstdI423VgezL9
 Uof0r7nHT1zTFI/Usd2NnJfZkqSgzQmRkmsVo+RAJ1zonBtJMghqJmLh4XwVB9YLvwqvSP4XMs6Qrt
 T1cPlTkMDyN344xkkYaEognTPRD8TnDrWyI4jXM8MUTypzDfM51S+kIjpUtPwcek4LD/22YjWZ87Wb
 esb5AjAp7WqMQ8c+BmYo906y9L6zAbCjk64FX61FpkTvl2aQksD8BSgYMVtEf8fad+82F/WpIGsSng
 7hxh43JcVhRMdEzpBrHIN5rEwic+qjEkWM+Y4gXlZELArf7DKwXVkjVXq+6A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

Add audio codec support of MT6357 PMIC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..ade410851524 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (c) 2020 MediaTek Inc.
- * Copyright (c) 2023 BayLibre Inc.
+ * Copyright (c) 2024 BayLibre Inc.
  */
 
 #include <dt-bindings/input/input.h>
@@ -10,6 +10,9 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		mt6357_codec: codec {
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1

