Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0763E3D86
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370953; cv=none; b=qzrBAIbDUNE7LPiiPW/0fKYinAdQcf3n+bcdlJugerDikPh6O5Il45yOwz/1Hjw/Y3HeS8UwQxXygZXg5OZmLved20JM0oJ4x3OMHDUeY3W27X5VL7MerI51hHI2bV/VEs1qew0VyvgZFH0o0oTOlWfxARA8cr2xp66U2tC2E5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370953; c=relaxed/simple;
	bh=BAoT/932YSIrHskc09yxSfBLfT+jJ1FbZ080fdYmqB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH6GmlhshaTsaDTxWFT69l5Cb6I9ktd27ePdieQo2TA/riTZUaplWn6Wot3IteOxOq0hEiBA/4Fan4Dp5+YWkpmidVIH6Sra7A6tcoIrC5VfjYnZpACJIkNc9HwnxL89ewpMdXpSyLOeJhYoi5whh1lbE166iwd0tGXbPnWr0nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=llZ4h7dE; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="llZ4h7dE"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1646298a91.3
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370951; x=1789975751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=llZ4h7dEYVZb0mjLVx1MV+rbxsryGMetvH6167nBqdYOrf1KdbiQapFNY8Z4IzpGsP
         BmC5rb5eElRXjdhRcLV6pbKce6wmUKzQ0SMb7fUKwLbMEnWnI9cQ7/rwXDoeZ5lor809
         W1qeTQRFV6yt7n00dqDbMOfb/gt2FueEAO8yS9gTODNz6TfddGANxO0vWTb2jxKYSciD
         zS6u0Pu0ILn6AAju0/uXLY8MFkKrNgBxXhIIJO2zcA3Z8gBDKlVJbm2omVnZyj4sTZWk
         gmAGQ3UcouVuXnj779fNdeIc4o3zUGzmScTbVLzPjoUwa6+SKKZJs4lIREG8lpxGqili
         zWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370951; x=1789975751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DfKwZ+JcEx0QM0xlpom9cfu2SH2Yy+DujTq77/t9jZI=;
        b=kguZ9/e8TENpC0dWkJ1haPcKZwEEbzApiajzij1zv5oC0FT5lvg4vV+PfuT/D3n7cY
         b1VfR+HSpImiwFEiIL85hNSk5eG7KycXHWj+RYmSVnRisr97zmS9MAPDq/HkaJA8MLVX
         42k/hBXOlM/SkgtZpjjpC5OleciIG7YJVOO6EmqBysyU9btCOKoMNseXrUuDSpWsZUpz
         9bGQlUkVKplZrFTWs0tTxJvwalL8GBnh7Iwe+ZuZLe0XQZOoy+eOYABIGmcbNMyShiLc
         hIFXTf9FVzjItZGWecPAa+s6W7OcY/+6nCeu4PycpEyyEKlo2CUm3WO3IiwIGmkr3coO
         J4MQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrGKA71x3JvzUJygGTM6lSeipDkxzqd/psdwPxAnEGP2gdeExm5ooym2U56HAyzb6eOhWqHXD7uJjdNQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nfwlVsd8oLMZXT+8Sk/pc3BMqzGcoEgp3IbaEjOT5Xf1KMOIjZ
	83uRB/fT4mtFpfMjMJ0JT2DA1NPMRKZ7wMgQ11EH+Z77zsoES79RNEFk
X-Gm-Gg: AYBFou0hPGazJH5O2U89B0F9s0FhyrRvgoRUeTinwFaVtP7iqzaygcvuhuS8IHp7PAJ
	Vd/s4OijcLNjcpiS8ZI31jaIApZTR1aO3SjfukV0bmiSsG1AWgLnTLQAdzV1N/qg0d0hoxQWbQj
	kU1RPnF1zTddrAVQ2R4deC1xRx2Yy5xhqKtrAegq8C4twIlj+Ef/YRAwoyfmZV72dv7ONQIl1Kt
	HhulT48XrpifPh8QZwy2WFY4xrlRh8AqDVj0jCloZCduwPMinRCQLqxTaTK7aIGeoUyClvgjsdG
	5YthJjpyJRu72jfpC2754hd6MbfPO6aFRcit41yis2tuJU2R/bVUQ9SBWyXZ3T2aBHf2Lu2W3uG
	415nBVnUt6ArCvbWQ1ShJcXa7ij5sydEeTefEn2s5eOcDYR2tk2S7xjYA3XoWgmUEUPHZMWcSon
	pUGLl4KJhXX0HwOZTCHIFk+85KqEyO1GS2AZvSptKll7TpDydPS4W8pe82AczXJiyU1wJwVW5Y5
	9KH0Y54XZZeAox+HymFsf0WGwp3qCe3CwnAMIfoMNeI2c2ERiL4QHfj44iFygJ1JyjKoFysgzZS
	Dn3FlYQLBcxxM2E=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3025082a91.12.1789370951458;
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:11 -0700 (PDT)
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
Subject: [PATCH v2 03/13] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Mon, 14 Sep 2026 14:28:32 +0700
Message-ID: <20260914072842.24420-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
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

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index aaf4f7921363..8f6241d47a65 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

