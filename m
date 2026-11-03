Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712368;
	b=vfopIGuZ+Z4UBi7A+1TYaO3LRMn0KpWmGDY0g65p9+2CSrfheW53pgugi41y0E0pabZa
	 /m3CvPvetzpIXh6UdtVfbfs6OczTr2hjbtWhRAbbcUTV/v3Bug7v30Lyp8/lOymMO/ycN
	 jJ0bqz60m2cjPH9/Wota4DfPTZXpKzuQ7j6NuNaFKErRefoWWYLp5Cw+deOPR/cUD9H3Q
	 aqhz4KIwFwEEhY7hRaLrZ9WAHJJvr4HwiHedWY8Uyw+/ihhpZ+5i2ttomcnIKxVTx6ah3
	 GX3B/9RQC0k82533tHJIwtqsmfK30ADtiSXa0TpXI+DAs1Z/BDAkLcvQt7tP40VkpnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
	b=PRBroe0eZWJYx+JfFCVgrfI9+ytRGxXXZ4kmpOs8zqInMDJsNrXsGsVRjEgNgfD++ULy
	 1uRnwmDQG9ozcSnz0dJSEk2tF9RgE0HTVlXz0ZMCWVcgNTZapsoVI5foc0RVMckKxvWp+
	 bjxIyWZkh73za1n4KvRle43ypqR59yrxlJoEu+4eB1kIHSJ9kGTZjcHDDz6fTLC0h6wp/
	 SWn72h48Ww3195hLZOtak2HAGxvuz5lI1ra25FY+vXrNnRb+ftWD+rlB3hhdEp0knTyA4
	 5AS/MJYMkiUj8xct0BoALlDIE3kSXlUt5KZKmROb9h65Zi9KmkrnpNgyFxth7mTyxsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWlnjz4r;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADC606D82D
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFADC606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CWlnjz4r
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so9182745e9.1
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712366; x=1794317166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
        b=CWlnjz4rrRz9SV2C7HxzrXH8uQwffRboT01bIdNjdoU/CpU6VNRuT7dV8mJLhkcdQu
         C7EnTSgO+/V8b/NINxTfys7U+6VyjOflCbVwdOD9b5BLKcsm/KQ9ikH9BfaSQiU0Qqcs
         6dZt3WZKHzubmah3bts/maoMf0MV6SgvWVrwhg7ejvl4x4/eArvRHPlDpvQIqfp51Jju
         Cuvrily8cWhaWmvS+MBa1sYVOtaRdEro9k/ZdSL5pYr5IRNN2LWtas9TtSExGOiB0Dp0
         zpSS8XqpkecAaCZkm7SatmjWhyDtDv/PHb25cGCxcrWFzmH3PIQRz8pfzm57Vc2kKkG6
         KqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712366; x=1794317166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+g2AMTya4HYz0zERnN4BvDBd0jLIZfZI/CWvcyCK8U=;
        b=ivd4RW/mTMq1pOaUWQAE4YrHZlNrzlsxRuiIaGM62c6lP/ig8cDsQmsqeG5AmfY8vF
         tzD+YPTMj/0SWyWcIsUuAuE/62MITX00BMbhGXPrsEfH97/FAUO5fGrNBDhFYwR1d+ja
         ynrnBEF0xHMlNxDOUa1gu3ythCTaNigJ92GI3lOeYfSe3PgFSB13eJLV0uLzTCBzlrOm
         UMWgjB6c4KPPyX/3iSaqpEyhjJme3L+Le2VQ9K1iWKuE5k1V5KzIImTz1R5ui+TDkyxh
         nGRtAw3KSd8emgbs8WBiBK3YN8oJoLKk/2RMDbjzDRpmWAQf4NCPYz8FHFjNXYuv7Hmd
         q3NQ==
X-Gm-Message-State: APuU4Z+81cgsyAxEmyWWn2bcF7KrJTyT9Rk8qWXtvg6B0cdWSDMvTLIm
	PBGc9OKZPSvn4oXcpizxkQUvFHnp+sjmTfBbECuIx8tKg57hp4CxKAhk
X-Gm-Gg: AYBFou3SMv/j80Xa138ro0FSiHpv+/oJ+2DNrtdxWFBMs7Fopv5q0FfEXWndi0wHAHd
	M8+H7hgs8BloMAJa2tGVFR5S8/HkyjZuwIOSPJaSurfQO8QhP6i96s9693FDMGQ+iTYZahLS1So
	bXPn5gD7D+o3/RmNdsDnbfxo3LtoKoZDCq/x92p2WNLx01tXEWnkJFhmHPLVfGMW4j6r9ifxq/n
	t++BJPAwMyO5gcBTRrywXLOfHGFom5dibxbY1EtZRoQeR7EouJycs4MVsHp9RrtJAPl4OkR2nFI
	09IPoRLwz38h1dxB1DL97QhvU6djJiZLXw3/W839j8LhfXfayt6tfXxL9SGUYomzwL4t9SBPYcr
	4FDRvJnnu/5URIA2WTtiX+46E5Qoyf1aVhGwf32LfOnT+k8Dbn4emGVz/U/AnVtr/xrw09AZGTj
	+3uXBN5w1JG1QZCF+GcDjwVaoUb8MbKoaegKfPfAFKvncczNxQtcpvhqPzLTuSLBOdLr0OaqVQf
	ROjNQBVZcI25LeoYIuNQyvh0K8gUZyNy+TTYwcEPe5b4GjAWvCHTsoLemjuUhskipmXY17tLrer
	HLUTo3E0O3OIHMd24rkl61Buzs3ifg5NBkRuyvipZMHsYwQWtx1u9PeuJFog+0pKxCbYyXcZEi3
	UDQ==
X-Received: by 2002:a05:600c:8116:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4ac17e10724mr301749905e9.16.1793712366192;
        Tue, 03 Nov 2026 05:26:06 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:05 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 5/5] ASoC: rockchip_spdif: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:37 +0100
Message-ID: <20261103132537.3717496-6-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
References: <20261103132537.3717496-1-jude.gyimah87@gmail.com>
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

rockchip_spdif calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_spdif.c:(.text+0xf67): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_SPDIF unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_SPDIF=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: f874b80e1571 ("ASoC: rockchip: Add rockchip SPDIF transceiver driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index aba9a518d3b2..0e5110125c14 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -45,6 +45,7 @@ config SND_SOC_ROCKCHIP_SAI
 
 config SND_SOC_ROCKCHIP_SPDIF
 	tristate "Rockchip SPDIF Device Driver"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
-- 
2.43.0

