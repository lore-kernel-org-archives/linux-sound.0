Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238904;
	b=xjGCvmtYLUkKxos+ee9uIntvkl561rLAL1HXdzTfjeYqAFeV1WdlOIpdfjp7+gu7OekD
	 05bgstCc30s1hH4pNm1QE4saJKmMBbPtY9FoeyuSlBalDil1aZxA6yNmc2eXjeWSRn5cY
	 SfK0mDY9lZ8uZkOzRIGD2D6U+vgB7bHQUeXlzLVva5dZ7rt2FiUCU7owb6iB/QGRdaYh0
	 zp2RPcUk0lin47KkJ7O+lOKUfmXnYOvh03MvRmwvMl2PibPmSNBWWlZRKbipm8kVekXpN
	 BedPOjyNB4uX5uyzzMtIIwAXoclCA7/4O+MhYsokkJbAaDtJBRmTHB9tcGW5cLtyAyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
	b=Y3qxhm2KvRPWmZqMbpOZTCVDwPxNN3Dgd6AZSw6zOmbyl+O+vliKW9Zws7YCebNBJx93
	 /mJSD1BU5ds5o3+KuWftnGurRr9yChYwS2WLJC2TSnedPujEgkevEN0KzBcCYcQyL4YvX
	 XNRKOzTVCPebrq4FrJO6XYfueoe1rPhD2ThK3iv7Z2nRIKiHxlyWkZ45PYmGoC3BvJtFW
	 721pLGhaxQC8U3FKrZ89wAk5FbNjov+p0CiExObseS7Y98WLqdfEn+6AGwlVJTy1Pixro
	 DxkNMCNpKdsAmERBSGjLolNyhG4G2UlpE5cXk8Te1CZiXbhXf0bta/CM2Yo8ISsbL0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2IRYRDE;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C2606A33C
	for <linux-sound@vger.kernel.org>; Mon,  9 Nov 2026 15:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 377C2606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V2IRYRDE
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12465225e9.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=V2IRYRDEW6dfC/zMwiv5i52coHSR6HRTWDTVNhOsO53P6V8DSfdK1r9FW75k11M/bn
         u5cwpI7gNs5xMh9zfNuE5xepf3hvpX3JFr9ODYeaY4m3xP9QiP3Qz8oiMHnkg7zF9gSf
         fducrG1HsLlcsEjNfzv+mcrrBpLZdACGJ5CILOqSCH4SA2LPWRbGMVMcyoOwZmlXgCih
         eyo+txNU0RVtnvPvat94ijiEKVEll3hI7WpEBaw+EbsRpraremGPDX98+Ysby/B8ZavA
         4aZBNzgXq1iCY72liAg6ZgSjtlvbudtFy9imzQZ6/GckZWJCmMbLkBCxapcbyme9mdcm
         PHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=2S1SFseFH10I5CjuTL1CYVP5PXc6Y50q1ugBk//5TEfAPGxy9tduIDX5WOI2SwilT/
         tbpJliOeVmrUVMBi9WXdGLnPy5AB+RNyZr+gsMH2hbeJjXWXXt7HhO6Tq4XsDti5xKVD
         N8ejTwPMbuH0gWlN3AQyqoJJXw2i07crMFcez8gKCFFSQKPZce8GxM5qTz2aSc88XNwh
         ztNyNP+UQn6cVoln1rkxwO3lDSiRoEPG/V4TFZBYMdGHP+HJyJYdZMZSqdOlE4443GGY
         bH3MTaSRWI7X2Y497vjPnnT2AoEcy7yBRN8YbulZS0qD/pOEFHDIOjfRlDgD/lzXOT8W
         CjFQ==
X-Forwarded-Encrypted: i=1; AL+hErGZIKZcstLxag506XA/HCa1qw5L1Xz1aeebqK+BDDFPsDvir6Z8tHcqk/TYMk96n6JVOnMMVDBHGenqZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/z9TWgSJ/xRbNkDIuxFeuicy1fMJRC/mI8zk9mk9hbsq5w88I2
	oTLgAZ6T+Pf+0IuV4XSQE20Rqgw+GafeHe9tbesbyJwu2BkgugDSkeZc
X-Gm-Gg: AYBFou39dUqUhWuFX4JdfK6WYG/vQFJ6aEshHdJH/t2Y8IlBZckXrcxZlXP8RSeV1F/
	JGzXU4tp4K/se/iKTHqcB1p1NPky6LkzGqGSc9xB2P6MSKcH3x9SzpjH9/iYAEZ6R6mhiLX7ynB
	+NbOLx+TZAQxGgcb/w+et8o1Qtnn/+Z3F1+qhdQy2oQwaI/bhmJx4cOOfNioLl2++GKfchhiPok
	0JnO7h677gbM+48MZHoSM+hqfOPXG4eIME1Wqx8GTlh9XnPDFbPYk6tACT4brzvQbudDOa9F7lv
	fWnbXDIDDmFfkNqOMYSzWJQwvNuL+2IH6AIsLi8PlhjNXv+klv8SeTj2WP/mGuozD/khxLr43Or
	PgU6LVqrXRkPfGE7ya1APypwc7VyRZ/lJRjavA5G9q+xPSNwzuNXbISkyH8CmqbQAoP/OUD9WwP
	AGCc7vL6vmr4QgQlZ2nS7ulI3/8FVjyRXulq76lP2Bfy1Y4br/hZMqCHMC7IQTWgDzG3QT8G53A
	bXg3UxqAGKaOHeREFSlHCdmKKFzFibgcr7sSVWVRj/3VcX1wBrfKLLqSXKFAykUhRACV1ATkQA0
	Q7IgWHDPi6tH+A1DA4uryzRe4+PO+K9lKPLmdAyneyNZsTehqzBoeo7OjW5EaNaNCDqBH3u9/tB
	Lqg==
X-Received: by 2002:a05:600c:c114:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b963c7c6e3mr61028555e9.16.1794238902401;
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:20 +0100
Message-ID: <20261109154120.592392-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
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

axg-spdifout calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifout.c:(.text+0x9c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFOUT unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFOUT=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 53eb4b7aaa04 ("ASoC: meson: add axg spdif output")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 10c7d59a5ad1..272639dd8eaf 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -76,6 +76,7 @@ config SND_MESON_AXG_SOUND_CARD
 
 config SND_MESON_AXG_SPDIFOUT
 	tristate "Amlogic AXG SPDIF Output Support"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	imply SND_SOC_SPDIF
 	imply COMMON_CLK_AXG_AUDIO
-- 
2.43.0

