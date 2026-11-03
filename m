Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712366;
	b=Wo+yzmteXmCXAF4dGpkIpxtmGGxiCuhMEhHOv0+vBLR/Y4s0Zp2/jxQCVpYHs3PwFiib
	 ryzmsSuNPl96jkuzyQGZY8JvYmaxVnoaqEbLu/sARh50eEp2cej37pK5Kayq34O7eB+vK
	 OcWxkzmgaB+Zvm77gvDny/oUpuul+wE45KsCgHzmm/gSqzaCEdbXfwjqO1YSy4Pccftl3
	 bzzrc3434X/p0Pskqpw1DXIwe3bRVJZ2GaNOb/43lGa4/qIDPKzdxsR/F0a8hWNHG9fSS
	 19ZjtwPWLgcu6/AFvBJKrYxvnE6tljFVsbdUTmweHwPnmZHgEbkM9+OxJ3VKKhwhiVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
	b=LO1ulFKTLOigmptd+rowFoOYK2Domgn7gOOpOVSklLhlH1O0+dy4zDmxv1JIyW1yz7mX
	 cN02VaPKMAqFM+W7B3fhpMaDr7yvxYpYrBvXiP0AXLtWXOIt+Itzs8ZYKLmBdRnp4gR+Q
	 Zt6Ri++V/TpBqtwph/68I0XZnjXl4QtogD759HeWxC4+tmMkpbbtlO5tqmD1pZjUWXP44
	 OfiHFP9CqeddktaQf5eqoSSYDF5sxw2uuSOM9JBdPmFBXUtTbZhggpFCx4PWAtT8oIlTX
	 yzwsv/SEN9HgoidWVGNaHJa7E+ojLg6FPR1tkod9KVLY6tCIItgqWNe3JfNqlfKAung==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aj+3v9d0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6380606D810
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 13:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6380606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aj+3v9d0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214af2076so32036745e9.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Nov 2026 05:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712364; x=1794317164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
        b=Aj+3v9d0Hq7t7Ledk6BYDcJDaLvC3dM0100jRx0QmC9n90jczMR7vZSML4vJ98Ih3t
         tVbhx+eMCw8i9ZU8wCit3kJCt5c4TxKApPh9Ngtmd8n5hTmANwU2eZJjj8zFITDGVIBL
         DnFGUvO77uA7tWlwRdzWDwfSer03uOPU6JKL/OhaoX3+uKMDUAsU6erYRyj+ZWvhRjPj
         HqeLLtwfJCrzE2M+Hx+6bl9WiulNp2zMCvino2D31qZZ15IfD41Fe+wTBTXzzo3yLksm
         dHCyziv4ys6FVDlir0E3BDCuuONtzuU6pRrkUAllyZqBm4zjd51VEgD15zA9+YasRuTo
         VLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712364; x=1794317164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m14hYTJ7sImfdrXTR6Vi6PKPRVQE6sf9x/T+B5eWk1U=;
        b=MdovgiJp2xSFmYeEquIQtOZSMBFrOaouzOkDv+Dq4kxBPKId7+sZxzq6lRIFrqGZfE
         K5UY/5zHxzjz0DdOTzCvdtB0VsFeDWJyZEmFyzjbKz08Zp/PeaQkP5xLzVH2BOuyFEwB
         U6F7S36kLd5ibqIbNH/+qQNdSRGE5aLBSuUKY3+/52Q4X6KlnWgR3Yi7MeOUmXOmKUQd
         ORgsgq1FsCuKUy1hsi/EpkJsMAr4eIHluLxAFA5Q8iKc/8FOxF5Uchw1Nrd5JoVl3TN0
         1V13IebshrYu9vFOBg/thzxguRWSqMLMCFqGxITUs8rPM5Gzsk22E1yVkbjv1UfD/MFu
         ZdXQ==
X-Gm-Message-State: APuU4Z+SuKtd6JAygkalhUN8eUnupWNav4BlziIzOZJFqfRc/QibeeJw
	K090fG+nhoSHXs+yZ+p/GLq/NfsyX9BAEStlXjrSVt6NQEBy2tvKG2aoEyuqsP3F
X-Gm-Gg: AYBFou138k/Y4IvOR87b05x3ZzX5D1LVj6+uyySUoxgokFQJI4qjcso0vGSeX50LsAX
	KqbanbeLQdtDpzQ9SUTOuqEvwf74pytVAgdpzvqo61JaW1VdAUxVM6I5Ab0NFD1wIRcucdXP4RZ
	FSCudyEFo4/Mw2f4t0k+PEM/avlQJPc3PI/LTDjy6ipvIf16NIckpiyeU1OeFOJDWjIGdfL23ob
	g450oT3qmw6mVdcnr9ttCdAYWN4yPk4mqGGTkPlyq+Ry3eKyHzpGTLxSvtUjkebtpKsSHuNOAPB
	9BWE/XmYnSmscEDGvHWKlqg20yAgMD5ybOImQ0a+3jVM0NJnC9dWzpwfIhIHQ4nEij08ckCuVSn
	CImNFyh+xw2hRYjUuYKFrtFK65ESmfcT7JDkUSayqVEFbL/bp3x5bql78df5pvMBoOdZvUrl5tM
	zyfakbHaiyo/MerUpyVs4qZ5GPWQK91ceUXd9Fdo0B7TkRi46EF/VMB0s+bxfwQgZActLKr1KKK
	H0jvDbYqLFBWxNUhQ2rNwN0YTFFRKTBYwd6smUMlvxXeyfedpH/wHFJgffzQj9TazbY5XtE8D4p
	WhS59a6FTJzRdgI1x5qWwHOcgQLh/otgGVnPDJlpcYiMLV0HukFHeqy2+o9wXU26QYEqpvSHwXb
	TSg==
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr289609215e9.23.1793712364145;
        Tue, 03 Nov 2026 05:26:04 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm84725725e9.1.2026.11.03.05.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:26:03 -0800 (PST)
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
Subject: [PATCH 3/5] ASoC: rockchip_pdm: select REGMAP_MMIO
Date: Tue,  3 Nov 2026 14:25:35 +0100
Message-ID: <20261103132537.3717496-4-jude.gyimah87@gmail.com>
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

rockchip_pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  rockchip_pdm.c:(.text+0xef4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_ROCKCHIP_PDM unselectable.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_ROCKCHIP_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: fc05a5b22253 ("ASoC: rockchip: add support for pdm controller")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/rockchip/Kconfig b/sound/soc/rockchip/Kconfig
index 0f8ef6868356..e0ded1fa4da5 100644
--- a/sound/soc/rockchip/Kconfig
+++ b/sound/soc/rockchip/Kconfig
@@ -25,6 +25,7 @@ config SND_SOC_ROCKCHIP_I2S_TDM
 
 config SND_SOC_ROCKCHIP_PDM
 	tristate "Rockchip PDM Controller Driver"
+	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 	select RATIONAL
 	help
-- 
2.43.0

