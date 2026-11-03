Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712364;
	b=C18WknTh4i7QMRRAIbfmIBA2YHkXiH6ffnFFeSyV+wcQSB7/ogTdsKVRgF0V050V9re8
	 nAUfwPP+71M9Yd2Cfd3bJ+HmcPXu5yOmv+045ksxOQ7/G46ZLcQdKWjGDP7sKcBAmL/8L
	 z141j54AlQCHAGBmZITWs9kznydXL0j8xx1i5zDzoprVSeQ5k2HXnq2x988W3WsZ2dFof
	 h4NUOCCpQgTDmjSVQQ3g6ECJQ8KyDtu9njkg+Yw7is0VBAfOwuA5OfdJ0V24emeE1o7n2
	 hEZIemxqQzKyCC2ePEdULKbSRBYYvxlE/a1XpqxolKaa7hUe5t2MVxli8Lh/Unjy2IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
	b=dIODDE6le7Kj2JQqhmFmqtBQKOjS28fYuQNIADR7T8PN25P+00DYUHsGlE/Qndt9PGp3
	 HbbFf22m6CEVsx+l1Q50zHkpeqwKXhQoQzO/9z3D8TVh2qoDnOTsSMPsa1kDsgb8XC6fb
	 +NC6Bw5xo/KzzkocSo2zttUqtH7Zvqj7mKw/0a7b/KAkZGN9a/AUhnu1YK+akWCN77BSI
	 qLRDCQTVCVKKRWOn8U5h7c/qorHCpqyfKz53x9gvmxDFQ7EoZBzE5qfE05hHS8M40g2sB
	 ehBbWNMjHULB3cKat2IUR5WBM5P1P716peqXewXzfIvobT9jj5x/hp13jJb348BdIow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TV8ddeBn;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907E9606D802
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 907E9606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TV8ddeBn
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so445496f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712363; x=1794317163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
        b=TV8ddeBnRKImlaxB2pGKNLHUaBOH32ONQxYZ1DMJdgrMGyNhGzASpabQ1CDZSwEn/a
         +iM3wFl4I+lzhN6TA9YQNEbUsXGcaHg7dsZXW+Isz6Hz8tkZbU2Ib/UExTGbmycM0QZD
         8GeOsYKX7nDrGUkjw5jcpGiBH974Bxu4dJIwxd6bzOUDNJp3suH0E2bFvPNpHWRvKjeF
         xeqFQAu56XZkxVGoMNwj74a4uC67+rPTvooOH55xLE9TS6lVLO4UNBJzAdkKOlyNspW3
         Y0JYKN20q4zxkiyA7hHF4CarXq0ktUDgTA98f5XuSjddwLkp3JHoCroUMHD4lgefzl1z
         esHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712363; x=1794317163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v78bi34KShnhZM38ptpqSX0i8uHNTah9nPD3iSNdSPE=;
        b=v6o1P/Nw53n20bfr3FO2svhjkKlOXLG0mwx65zXMxHAA/y+s1uc0RO1feM/qdMkF7I
         k7x+tx7IsrmaLwDvuteN68uO8pUUdTxAjCMucdRmV0ih9KLv39mF1v6juHXcAkY6gH+0
         Ta1RUwaOY2zuscAOwzF9j4wlo9DKScNhzPHwYPjahquQAKalQVpsz9WBnphBkd3hDFwe
         AK0MLi3Pyr68/TDr0Zd4tY6PioeHaYufA7x8v/XjtlecTiM/txHBazXGI3zX7rk4cCBF
         aThNh1MTQ0XFA3Czm/DPhRW156uVIGQuKE9zSkvs7hwqjMF2NCaw1YsCP2Or2V7JhpDo
         1jXQ==
X-Gm-Message-State: APuU4Z8OxfNOy/+XQlQoKrv4/Nk1FuzR9TaEqPuK2PxhZREC7/Ivvkx3
	Kr3yGFYQeu1YyLntaeS7jdKiQKuiqabk9QPIk79W2YFRUSJkho16bXkv
X-Gm-Gg: AYBFou2zP6X/jnKqRBjRc4f5inghR6QEf75GvXn0Rkh5H7Gde5GFfYKl2hhAuqF0JPp
	0GnUWSih9q8/ABtJyFdMytPWrjPW3XFKUgPhZCdqS8LG0VpDBiD0x+2r73jkJ6TG/4kwj3lQomt
	YpgXXFO7fE2H7rvxcE8TEEiLJpjivavZvXYxnqMHrx5ZENXYG1KDOCVljk4AybFnyHnOoirV3FQ
	zJnLK8ssDd25vvoMcBG7Vx2V/V+8ES1PcNn0psOo0lBvGvCREM+8HT5i74jUMLoYOmF4O59LNTu
	scQVN1/CtKx9z/mNV/LSolGSMMB41rasq4D/3lCjKrw67heEdK0jBkxsw07R4PtkZAEWGaEEuu6
	z/lt4BryVzkqY4v+xQaIMXu/YU+t1MbweVBHFYjtGSdLcgsJ8vjnl3Qp4k5DBxTEU1SXKMPLDkY
	4eWDmJo8BHksiW0Le+D3/LfZp23DqoiMY+xqxWAeSns0gE+AL8Am0hlSvCTHITWOGYxOuuRnrZc
	XVvBckBA8BcRyKz8gIkHKzaV0dlLfSyrWE4Qi2PRW28hic1wsF/3VI7Hjr6UmDzbd/ETRu1+7sK
	JMBy50U1LJMow4rwoP7xhgeg+0TymSpJrQSXIWO9inWjaAZhlFfpxvdykePlWGUSMO8nS7NCVM0
	p4Q==
X-Received: by 2002:a05:600c:c87:b0:4a1:efbe:529c with SMTP id 5b1f17b1804b1-4ac17567fe1mr309294265e9.12.1793712362853;
        Tue, 03 Nov 2026 05:26:02 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:01 -0800 (PST)
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
Subject: [PATCH 2/5] ASoC: rockchip_i2s_tdm: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:34 +0100
Message-ID: <20261103132537.3717496-3-jude.gyimah87@gmail.com>
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

rockchip_i2s_tdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_i2s_tdm.c:1304:(.text+0x14b1b6): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_I2S_TDM unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_I2S_TDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index d7ec1fbe17a5..0f8ef6868356 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -14,6 +14,7 @@ config SND_SOC_ROCKCHIP_I2S
 
 config SND_SOC_ROCKCHIP_I2S_TDM
 	tristate "Rockchip I2S/TDM Device Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  Say Y or M if you want to add support for the I2S/TDM driver for
-- 
2.43.0

