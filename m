Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C49748AE20
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045106; cv=none; b=i8QBuczKukRAlfPYMB2utZSKCOvaDIFpu3yRcbfWqt7i246pElirwGLOvcT99NLb0O+pD9WMJkpsj/88CylymJvmylAaUQpAwr8KPru13BlrQZz6IiwS2kpPaCddIF7jWkfn5VirfX+PdNWtZ6AS5D5hIfjjxJ3ps0N3Uj9O0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045106; c=relaxed/simple;
	bh=sIdjIJnQzzDHHd3jtn8HXsF9ZViycOy80c1qBL2u6LY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=okG0nZJ06TBp5Ja1dYZXGFY6dfeehuDKCO6EgC5h89/QTAemWqP74LSxqIw9z2xPLKG+li1wWy+Q90Mz/tlQMfGMNyE2TxK+97eJLFkBn6sqYKMHs0iRzZvc2+B/OHeE3nhTYpBu5Z1XVQPaqXtIlq6iGdScLlps02+eMigQBNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G640F5VX; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G640F5VX"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso6554469a91.3
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045104; x=1789649904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=G640F5VXxl5Z4GsUfiAe0sX6murh8Fmg/yQPi8pLB+bXb+JjrJF/E+r5xGV4q+gSls
         yDAKzDTIqChG10Mr7CWu7VEF8up6HX+fHY1lnD8BzXoInwZtodul6yW7pyAS5av2/N7U
         p/h/wW8rweSTY+hjhsPNnmWUCnPDnb+gUVpx1p90nFoQDgYiCFbEIWHeoT08WMYnfW2J
         29ydoitEeI5VUSetPblsFRClYlh6FcBtorR5WcBIk2GsqqQkKBh6pPK6qYRony1apwDg
         1V43+6CqEd165A4RdYT6Ps0FS/S7juH4Ejp57KfTZXKX0GUBt27igXspMNqRQj9KwHHM
         YGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045104; x=1789649904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DhFmxksn93jaqEPBP5cg3W4kPZXQ3iAg4tUPjfm3otE=;
        b=oEUalkd9qJYWoubI83tFZD5uf0OvAtzpgo0i5YmOotzsVTVseI5oeoHz6+e3PU8cdz
         klBB5waf9CxmyABa+IuyxRPRQogMCLJZo4xonu6/3K0/DqBJCoAASBZGNdN59HRIUCyQ
         at/b9qeQ3h1KgK17W8DfMiSfibHKOPxN++HQQkVCzmaMbMLsdyfvnF2F9Xn3qqEucGGy
         7PzRC9hyyxnMO2vzi5l3BftaF9/rYC8pwbv/2fbLS/F6MGNk4Oo4s0YTg86HIoiwajZI
         1VDyV2GTMAriacDG66c0kQY+JvvyuFT/ufOb2NB5tVMAL6Sin0VGEkX7ev56s2dbzgKx
         zyLA==
X-Forwarded-Encrypted: i=1; AKwUvByuqWE8q8tQXYcf5VeYLhmBBe4ivuLN5e5Fm46Sir/0vVAKtuQOvNzkngwUI5pBYU6hTMxs5x4LxLc+yA==@vger.kernel.org
X-Gm-Message-State: AFuF++la4pSTlzooRDqaCRRClI6IHqdjIs0h5+WYJtahMewxQXMpn+9E
	B8dsHs067G/Oot7ez6eetNl3RZcItF8uufuRBfQgnQCyzIB+CBWpF7K0
X-Gm-Gg: AYBFou0gbAo80j4hnlA6/l5LhPflmrgMpoSluts4/fj46HqY87959SEQW38ymwEJ843
	mwgQ6vW+iT8PmkMTRP7rlOTr6NFvV9T/XmfaE8yUyMEJWfzDNlH8zfF0Zk5ADD6M3PRq8qKt+Jj
	O9Pl+hSZEOi2RQXgGVBmmB4WvX+2FBDCvjFVMelIeITPzeDBbEjt1R15JDvU22C1T0Qd49C6Nbc
	facG3lEAU6+KOnqPJAHR9GxGHAuglld0QRmc+fH4UOcC0/IWnQmwQ69p3JIP1xTBc8AzacrKm3Q
	QPDPmxc36cI9ey+1//9ar1Mk4O9IsZ3k2A6L0XiUaPU8FAoggjxPDVHlTN7zh6qH7+V5bNZCuxa
	UvoFohW0yBPwo2aHZaVADxVjDtrTs0GBIl1NnBk6VU2zvwnm1u3JauYn0gDBb19PrEpseWcHtnW
	PtK2kOEzn0g8h7s0IKrmo4iAPvRVgg5XlpPdQjizAUtoUydiqcZ8x2tGTCury1Ypl7hfZiGHR2U
	xtiVadrDXqMOro+sbYyQ1WKMqoJr+6j2lG6NtsUc4auaOYx2Ducr2rQQHmOPMXwBVW3FTXu1d85
	b79D/7L+cX8syRc=
X-Received: by 2002:a17:90b:2e0e:b0:398:9be5:b419 with SMTP id 98e67ed59e1d1-39b2622bfecmr60688528a91.20.1789045103695;
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Thu, 10 Sep 2026 19:57:34 +0700
Message-ID: <20260910125742.150902-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 88f15a9c2513..435914aafb44 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audiointbus;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_audiointbus;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_audio_h;
 
 	return 0;
+
+err_audio_h:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_audiointbus:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

