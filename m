Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B575489FDD
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045098; cv=none; b=gTwEojVtQC+H3xGJnrmNpZsFF7rkmLLTFdZan5t5pPbeqynCBF08TpK/SthKDKnW1aRFwboaKnpgjezDtkWHM8EpwcZIkFPvMq4tLnRSgFSnXSkN84o96HS2Z/CPCGCIzMEzhPkAnRMAxOjjaUiqWaA103lrnZ5AqA8VYrGTMvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045098; c=relaxed/simple;
	bh=gxw3C5/yz8ul7f7LJNdtEH1VOBy0BfPp0Uf/l7ubhrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUSq3fZ2M8bLAo4bWWq7ZGZtfJtlolsq38VQPpXHq8ovc8ZcwhG/qknARLv1UrtQO+/6wNo7OF+326k7f4ro1/T4muHnh5Cx87TGqgfnrwW8KSKSaAFTH7neNZm2kaRIP+Ma2ppnCRb3CMqPzKWXGLYCTJh8KQCZ/D9kVTlUB3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hufIA9G/; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hufIA9G/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso1367868a91.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045095; x=1789649895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=hufIA9G/ggefXX0rfNyF2raSWNK3tZ5ieqR7Zjmv7m/2QIpe3gt/QDl+86TL3fnzw5
         QXJk9Y4u4ttmxXtuZn8wM31meINvmzu6vMp2NdG26pmJ57cbCVrAh4Lhx3vEIpAjklOT
         0pGXuaexVUmu5KNR9WFtu4JIdk5B03cmVnCmMVPrg4rYTfr2mh+z5Rn1So+WSVeHjFyb
         GbK0KQ6b4P+QCJpoApjEtSJpKi4UscLz/y7uTpl5zJeRgZkFi6svn2akAHLwMxL1yH8y
         hBUHMxPIaLkUmfpT+zoOEgLbJgcpBP4HSuHI1Zgf4O15e01f8q13rvHb89bHjBmFb9G5
         4Fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045095; x=1789649895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap1gX+PkBizjl0Oij+OVCGBkei2bcoaYLfDjuKETX2w=;
        b=RYkyNafpX9U0h6wZFmNZ5+VMUAJQPYIN+ZpJWrpki2jI+rAVrQwtzOjGSOF0Q+aeYe
         mMEdDYRqY/g4wNYHufzxXm1iVkeKPAjB5h/We5RE0KWCp0aHANEb5vf8J6oswz55P8h7
         0Cd5cdBb3BKBiUMexWal+aGIeS0TYUOJOYm82m48bakWkjB7Rmc0l3IAEV/U0tzKXT5h
         2aHI5BFMyPQSYJACBza1SH8xoD3aEQsf1wiqQLMQfCZ0mNsJgIgjopbaMhb6shpxK+6P
         ZXLXXul2F3sBp668by+rn5iELc3P3WGiwwzDWWUoFgkLoRcUEzrmloBKcLQb3CVfwiDn
         T86g==
X-Forwarded-Encrypted: i=1; AKwUvBxoOACf6VG6pGhgZlyg2ajrCmR+umDXWhL8ZtUdDnlxciPIu8m3iUdE3IU/nM2YhJFQXIcERH0aNiM84A==@vger.kernel.org
X-Gm-Message-State: AFuF++lpvIrhtGRopM8QKyNp1a89l2eMZkRZzyJipZkvsCGqtClAVsfT
	syfDPnzskhPzNG8qHRRzjvvjHNyBbxWsG9MKIJkw7PtiEzZwDG171k/m
X-Gm-Gg: AYBFou1Rv5nYFvSbt9cxCljLK5UmDwDS60xTt33I42SkqXyDQ0/vTj8wakTesac11XT
	NNYeL32B9Q+0L9O8FJW5CTErbuxzgxkJxum+jPFt0qfKkh+PjhdoF992jkI3R0H6+xLY2ipY6lD
	Cl+tD8GBHoJoM23xB3OxgFCe1hAKUW3QEVkJKhMM7sfDUQKMWH6tnL5ARtbGexzeriAYsilgN8c
	XDKwZD1f/cPeIchsHfr0X7L2DRsIY1eoNWC3TlKqgLZMK81/KCSf+k+Hc0UJE0cXqbVrkm3HZtB
	1cYGqZVoZml0sw+IaGVcjptK+sEmC9HyJf3bXnMKKbGKzWqSHDnc9iQf6y3ymhJZEZMG5oYrKV4
	ROhVQh4rLTkMgfaHOFcINObzZl3ZtrmQvBWNVz4wde4Qu/YRiI0aKXdEmubn0KGIDdd0KN79Ox9
	C5zzMlp5zD9KIkHX/UYKPNnok98R0JKtg7Ui0qyZzbutSMssCrFM8uOxeVxP7zid5xSKPaC3hLv
	qlVluFCzSnKLGk15AjlRnpt42QMIaDFGr+8GmvGkEEllTDVw6aunCmqtckvamt4tXfV+Kkz/qTa
	eR2/3I15EFj+Hlg=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr10985783a91.10.1789045094591;
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:14 -0700 (PDT)
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
Subject: [PATCH 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Thu, 10 Sep 2026 19:57:32 +0700
Message-ID: <20260910125742.150902-4-phucduc.bui@gmail.com>
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

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index a901be97e75f..933179f2a5ba 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_m_sel;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_m_sel;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_div;
 
 	return 0;
+
+err_div:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_m_sel:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

