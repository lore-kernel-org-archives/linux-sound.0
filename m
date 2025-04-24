Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF02242D9C
	for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490363; cv=none; b=H8SlSF2b0cWQyuIZwoZVWs0KC79fCzGKu/QAtstphcDJZA8axw0vIVXqzrZKJ5z3mK4XJdPW/XI2ueJfrSeJU7twjClzwVDlEo9FQtOmePyqWoX8JrALyGIhyGO/Q1wGIMtn8dsLGzj0AQwFg0wiu6ghKiBWRL7dR7pD/7T2Ngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490363; c=relaxed/simple;
	bh=1AP5rv5hz9Rs5QHv/2ZGUfum6cSdggllp0xp0DoZ+js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A1DP+Jb8GX3UcD6l9VUfraeC6I9N+9HNymxhcBdfQn4q0ekK3QHma2FJyoSwvfiExv0hakOwI0V9u0onKMFyzZPuUOhY9xV5d4j5fKXP6mztHFqNL69NH/oY3/UsvrAwDFBD0O+R1lUddgEmqeICBr5rpiF8C/kmV0/hrzIwGFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XiKgYo4R; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XiKgYo4R"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fb0f619dso8699755ad.1
        for <linux-sound@vger.kernel.org>; Thu, 24 Apr 2025 03:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490361; x=1746095161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6nLuv544CgGW21n1DbIuZxhKW3jrit2HZOkiVGCAv4=;
        b=XiKgYo4RIJW/vzXR9mTVYdsHCVzGLmGHmtdsiEeFK09XqqwJJNQC4gz+65ZxFsKMd4
         mCRnEoL4x0hYJjsz7xyC/AHHGWBzkVMgr4rH2ziP9q89vY4pnf0/Is0PfVeYYAKcEmhE
         FDCfgX9ZQeFijcBmlDXES9iYCj8gMYqzN4LYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490361; x=1746095161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6nLuv544CgGW21n1DbIuZxhKW3jrit2HZOkiVGCAv4=;
        b=Kxys5cUDNMLYRs3L7fGF5liiHf/7xn2wlEnnfPUqOjXm6YIDgl3bbKRUVMbCBDh/ax
         q+waqSNIk9EpYeUM2BKWybS6ixJ1fnzDNpF0DJ43B9BvJQ+Ti6DaFWowU43CJRosfN3E
         WQR57DmxH8h4JoU1UNW/BZsfQEvSplecybveGzeje+P+7x9j6R15Lx8btiQ9ZUMkZSZ3
         FkvXlcZNAc3IpEYl7y85sFkzW/EGxUyxlFi+ivEWbXgG+e68KfLjzr1G0H8ZbdyQ6+Ii
         f/29LttCuiXG23YyWcqiFTsZMxhDUY4gEUMGvDXYQx0HKA3vZT+CY+j4MOP5G7rXPn47
         ND+A==
X-Forwarded-Encrypted: i=1; AJvYcCVpgG+1LYpqh/3t5Am6DLdkKSGMsv9nMZGFLo+KSIhhpGdlFyjeNVBmt4SkDPku4JjmPvel2ncs1+BqNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEeX8CaV1kggJocxOyj5DoESpM/DDjoYqAJTPWRwrlz7V6KE+E
	DYhyRoIvdSdJe3/+IdNr2EoouYoANDRRgJuu0YIeMEyIKPyTPe98HVEdQjwCPw==
X-Gm-Gg: ASbGnctyQVHytLbXV66NjGlZkjfeUbIh35ldzEnMaV4PfBUZONMWYGjzoXLqX3OyQ0H
	3fyFT9e6MNjwtTb0V4mAyNGpVB1hLG/j2t3ilOTUTZGCiIgDeQ4uoR8pbr8hN5clODhyiSsBeLk
	NL3tXBlc65YbYUk3AFp4lj/gIpMwZuMwuxWma8f/T8NrmVIUtoeIytWNPY5szYfWHfXL2tyEgqy
	hzuGAO4T+1qz55bMdVBLbh3bv3m76ohWPKLJ9uuFe3QPwpO2bQV3NIbS1EXVDQyKMobbB4HQn+q
	GIIQhxEairZRYJKNKwxkiEzBCoODCrWzD/nvVDMLmywnRw5NWLRfZrdlxg==
X-Google-Smtp-Source: AGHT+IEelhbgbGZri6Py80kdsIiPuav90J0vW3iMX5g3fAzfa3TjO84nP2ENhMsx6DVzKWavR3GEDw==
X-Received: by 2002:a17:903:2311:b0:220:e9ac:e746 with SMTP id d9443c01a7336-22db3ded901mr33410315ad.53.1745490361492;
        Thu, 24 Apr 2025 03:26:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:26:01 -0700 (PDT)
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
Subject: [PATCH v2 13/13] arm64: dts: mediatek: mt8192-asurada: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:07 +0800
Message-ID: <20250424102509.1083185-14-wenst@chromium.org>
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

Reserve the same size of memory on the MT8192 Asurada family as well, to
align with the other MediaTek-based ChromeOS platforms.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 516fba9b3c6d..0574fe50468f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -199,6 +199,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		scp_mem_reserved: scp@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
@@ -277,6 +284,10 @@ sound: sound {
 	};
 };
 
+&afe {
+	memory-region = <&afe_dma_mem>;
+};
+
 &dpi0 {
 	pinctrl-names = "sleep", "default";
 	pinctrl-0 = <&dpi_pin_default>;
-- 
2.49.0.805.g082f7c87e0-goog

