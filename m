Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02323E358
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490357; cv=none; b=ikgp2iPp667unHajXJko1x6UGtIOqAilATEBFpk6KTkt6JyOH7DiQ41iSqeKJBSzOqgdCEdorA4xETgsPky8pVhbwmyNkq7ChPtnzBs88/TuD8H7pu4OztsLk1xDceOmmJy1UiujYvJxJSZPvIHFF1amKzVKOlIa+9ZFrpVq8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490357; c=relaxed/simple;
	bh=v4fkIWZlRlBlwcudSsMGRFd1gy1KN6jxgz3zZ2PYfv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbatVnoLPJaRxHkaigrb2lil2iMt5EOlaV+soIVWpxtbn5EM+F1K/1Uc0e+KqMUjaW9F6wR/nHglo4KFJoC3RfUHj7OfY1SbeiexqO5m3Jig+W19p6/bUZCEehaxzdTyhemyUIBAm1gu8dxnJPFr9f/PFWrwWNfUElbh1Arx+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EL6uNv5m; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EL6uNv5m"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22401f4d35aso9428105ad.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490355; x=1746095155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=EL6uNv5m3QW1X/b7SX9m4M4lIslDnX9Y+xejcBfq+KqM24ImmxwfKeUABLnxl50UZF
         QZN2TR5j7p9j3XzWAJiQvxuGTjWqGiMKgMHNuKxxgwvdfBiSMN2s1ZptGv68RGvt8VcZ
         lQTp4E3fjxN//eSjSAoLN8xQJs/gSmlSDhL2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490355; x=1746095155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=Q+1fCyRWDiLTIMHGrQbGPYBMwxQE6whOn6Bx8lactCYmZVmtcWscUcjn0xpPdo6eym
         JEyTFP/yNL8tKEtFXnqeaQYCmyL6QDK+LThyJQZSMDBL4BgUBvXxmPWZA9VbN7kWcMIJ
         c+m8YngZuUjSNLvtqsXYZcCCSM2eedq0NJ8jNeAMnc25vvFz3w41iT1iVzaEidgN85IV
         Uzws9JmYHeLyGxal43R5YP6yYZoYjr+eBMAenZwtBahHJ45qg9UdoMAJLNV0/D+a4LFX
         EhGoTDlbTPHad8lLc0JLREWe9v9ssWSC5AV+W6UehNIWbENpOdbtDiRgoPEvcodNdsAl
         GuQg==
X-Forwarded-Encrypted: i=1; AJvYcCWo8f4DWNXDpOCl6DTTxHfuTr/Us6zO0tB6KwabVF1N5ixXAb6vOAzr7ImlGZ33SCH81FmZ/rRdpmX/jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI2yUkoi0AJmBpdfwzqXYrtz+fRKB1Pen0r9UCYKML12IZf/Vo
	Lu9pdS+e3ysqC06IVjrpWF5ssoovINuJMVBmBveXL0B+1YJqi7l3kfe+89zR/g==
X-Gm-Gg: ASbGncuPeE/KBUuvBdXqJoOl78eBgHJ0jtzAfzn4+INGVO55A/NnzPED524+vBp+992
	YDUA+u/WQDAeLYjArw7PnBtOPeDtFlS7NxIuHlM8jnxxUd2rtqAuUfkUXbvwpbarNOpv+hoU4Pw
	C6ckKcZ1MuLkjp+hm3OfSiX44yG8usN4gnQKI53j1uXLQfzd2MiEQE6WCA4t+Szfj/m3SN8N8RV
	2BkVS/HbQgAPF8fvpuGTqWpBBFu6fLWSVq044TVLtQhuXxDfyDL70SVP3ZpOCcof0+5PYhZPhBU
	EGHBsf20nVnnvGFrZZd77CC4DzgWuzqJOj1qJsG9qK71blsC0un7gegVBA==
X-Google-Smtp-Source: AGHT+IGVWgP+9f44cPO1R7mfB5z1uFUey5yQnac/oTnGNxfAaOr9FFOdDrHbUFBI3ie8mEMC8Jfp1w==
X-Received: by 2002:a17:903:17ce:b0:223:5e76:637a with SMTP id d9443c01a7336-22db3c0e722mr27960035ad.23.1745490355124;
        Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:05 +0800
Message-ID: <20250424102509.1083185-12-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8183 Kukui & Jacuzzi families
as well, to align with the other MediaTek-based ChromeOS platforms. This
also helps with memory starvation as these devices commonly end up in
low memory conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 0fe9f2d1b912..00b97cfa0eec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -85,6 +85,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
@@ -198,6 +205,10 @@ tboard_thermistor2: thermal-sensor2 {
 	};
 };
 
+&afe {
+	memory-region = <&afe_dma_mem>;
+};
+
 &auxadc {
 	status = "okay";
 };
-- 
2.49.0.805.g082f7c87e0-goog

