Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7925B08E
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198251; cv=none; b=c71j3Ax8rvu9OAyNjxWDG6fmONcS6WjdB3mQGoI00IKQBMkEdI0nbKksHDDMuFuC4qeaVs0gtXUaGA2pXeTTeveBgnvaA6rhXweapZ09OZ+0LpjUMPj+D/uKI/6n76uALylmTRhFEAlGiNZUjwPN/pi6UQ0Ye5h9YmSSsyyL2JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198251; c=relaxed/simple;
	bh=RFsDwGuziZnLQYvPIagibDKiLenJn663Co716dknJHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RpCjhPCi1dYmWpIfl++GGYdB2r1MDnYSJ3Z5zJNednrvYr8kIvhhapbi4vN5C81hZ5g9XOswT6zbukZPxmJFOCRC9CzP0LBGfW5aAOT1jVsnedmcRPZwoi3Zg+hkLXq4XG3BgbKQWiWshZ8xN03HbXgYFgF4xQgkq6ss+Z4kJQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJ9EJvnX; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJ9EJvnX"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso619071a12.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198248; x=1791803048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=iJ9EJvnXZKGwgX60waPqk6/mC5h9UKciD2jHQeonDlW+grHlgGzLPswVk2/52DLQuP
         top914lqsjFqeKht1xJI5+Y5zGz3w1aWtfKukuWsaFXxGVlb1Fx8mQUZbRS0mSF5/utn
         ct2DYt4kVMhwIbpSFilFGF1aHuQ4SttZ8YstFYKKw69jmJXFVPvYiBuRRtMrlx0vpjk8
         Z+tbOZWPjQdVakL5agrbK6+mGwb1HEkZgwSh5SPWiMdMurFbQuXeZN8/lTYFxLp0Iffx
         W+JAYZXaNceR9sUmJNKsbP6GHZyxUNcKvELz1W30/QIxIIM+2YZbtqTpa6l2NFbCk3UV
         YnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198248; x=1791803048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cC2JxcNZX/PdxSljMsgobXdfIwmK8OmUL2fGB78jIko=;
        b=23o/M7pPcta1VwAwBjVFnyMNLLGMG5Zw7wroiqsMawKer1s6Zxm927xWNfxs4RMq66
         LA2ssLFC39XVBJGqgn7m6ulS9t38e0bNkbyCaNAwAhlOtOT0I/3p4R9rSxbbS6LacVyW
         Tie4qUv1O/gRey9enh9xhOToQkKZjZ4gMI8Qm0fhdSLP0z0umjHvIE7exb5ug+x8MTE0
         b7T7WdHBkVeVPBo85YFRjoBJcIq3FXAmjoys4AGQhNSSqDMGuEHvuHoJzFIrIAXA/qoy
         8TMG4glMXvlnB43Mdwm/rraFDjc5U9lf5cm9PcFI/rMwHS2GdYOH7rWGxzmxE/JFnmew
         /p3Q==
X-Forwarded-Encrypted: i=1; AKwUvByr1LumVhcU+rp8BHllWZdZVqJe5SrTbPq3+CXBZadGn/fI2coCpBZgofaVoLZ5yytZliIcGDwIgngljg==@vger.kernel.org
X-Gm-Message-State: AFuF++msjyBiqAXICvdg01OjwODnROL0eG7+EWg3KMC1rqaVzdzTZRmd
	kD6MDAwDGYt5JaAL9lpf2wtWBWGFNRF10GtJZwn5SAVrSv6p/kkGF/pA
X-Gm-Gg: AYBFou1vLyGgbSeFvp+Gt55IXbdelvVx9Z63xx6aO/p+nB8AxNsHyXViUFJcIyM8Rnc
	cQ6vjJYNJwpvKrJ6FES/Wx4CzjqBRi+9N1nS2V3UPYjnUZp5ayxE0ZfYblTEtMxcx6UJr0NeCLB
	3HNmfsUHGNTHZD3UIe3DI8PAvs0eEofQrZ+xJW4bTzrN3H/VC2NccLx9JDFPanXEjzeGpP5y/6u
	GG07jWAD3t6SPbgr6AxbkJ96Z5XHjaATZGsF1HyNib+/C2GMi4BvOCveTeCsELmaU5p10WrUda5
	vZjxfyQdoRTyiOpwjw1aGpoMUj1KyThO95hafjNHKhA+zsaMFbzLNvNPdIJVOJfgAQ0VgtjVU9A
	EdEXmNp10pYzUC4BnfZy6Jmv0gI7laeN0DqQOu4AuI4LtdDRvIwk6siMtS5dYlj2sbwMp0ptyD+
	M/fm26Y8PQHRWx25zgqY5DhH/rpe+vRqyH068ft1nssOytlesQsbz7WIAs2ouVz9tFuZqC8CKkm
	Kd2sMZQrYZ03u3NImrBf9GQCDj4SX9zCZmI9Ct878QAtrMS5s6HUrCgMequS/eJvrAYzjWfBkm5
	sTpNIkhioNDQoQ==
X-Received: by 2002:a05:6a21:9089:b0:3de:5a86:9dca with SMTP id adf61e73a8af0-3e0d6b554ccmr6744719637.19.1791198247726;
        Mon, 05 Oct 2026 04:04:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error handling
Date: Mon,  5 Oct 2026 18:02:54 +0700
Message-ID: <20261005110257.50145-12-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors when enabling the ETDM MCLK and clock
gates during startup.

If enabling a clock fails, disable the clocks that were already
enabled to keep the clock state balanced.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index fba51c552eec..1270fcac6b3f 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
 	int cg_id;
 	int mst_dai_id;
 	int slv_dai_id;
-	int i;
+	int i, ret;
 
 	if (is_cowork_mode(dai)) {
 		mst_dai_id = get_etdm_cowork_master_id(dai);
 		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
 			return -EINVAL;
 
-		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
+		if (ret)
+			return ret;
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 
 		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
 
 		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
 			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
 			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
-			if (cg_id >= 0)
-				mt8195_afe_enable_clk(afe,
-						      afe_priv->clk[cg_id]);
+			if (cg_id >= 0) {
+				ret = mt8195_afe_enable_clk(afe,
+							    afe_priv->clk[cg_id]);
+				if (ret)
+					goto err_disable_slv_clk;
+			}
 		}
 	} else {
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
+		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+		if (ret)
+			return ret;
 
 		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
-		if (cg_id >= 0)
-			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+		if (cg_id >= 0) {
+			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+			if (ret)
+				goto err_disable_mclk;
+		}
 	}
 
 	return 0;
+
+err_disable_slv_clk:
+	while (--i >= 0) {
+		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
+		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
+		if (cg_id >= 0)
+			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+	}
+
+	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
+	if (cg_id >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+
+err_disable_mclk:
+	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
+
+	return ret;
 }
 
 static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,
-- 
2.43.0

