Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6474F7CB4
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977313; cv=none; b=A4VrOiJLy8kzldDrhXR1UAp/wTmNEOV6/RKxsJWQzWwar6TqTKZMjeQQRSRQ2ts6h/sy7o4blzo2vWJ8995cgHqQJ4SaR7GebG1CapsE1o72BcpN4Wr+/A/DJ7ennkcvdMx8RZqWBYb33cProW9R3ufSL5C6LCrwvDajsp0MZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977313; c=relaxed/simple;
	bh=8BVQGuuD7oUJbNndvp9+ynasbcq5BxwUFY6hOWwfM14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n0Ttk07G9hrKbXx5/MzYhmbA64rJjT7azVOjvct6Cj15BMKPj6EFZTY9zYdduDGdbBC/5Y42jDkFbzi7Wz+VDDYbcNk6WgxKa/gMGMsjzHsySy95a0/dwBqznLVDJe3DlXgXHbl+o4TRBEbGfDmaxzuCYcQJsl0JpkbesNR0y4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXe861Qb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXe861Qb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so196965a91.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977311; x=1792582111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=GXe861Qb5ePDTn0slfZYwSE3/lVCm1U/mUmWYTRL9F27Rsky8DAZrzuV9Ipvg9ml0U
         /TGb/TxBSDVkoUFAt+TptExtJSmtqX917jGsDC2lHyGvClevpLh07uY1+449jGFzpHJM
         wPkJTZYvTukueQUB3Kh2uNNgDmuLt4297UeNdRSmYKrjihOdfW8AVuynuOU50MleoYfC
         E5fZ3TzurAelPAdCRUwtIMbnAlVXh8IC0iUpiH9Z7ZB2pUL57GULXzjCfcq+CHL4J6JO
         5VBGZ1UOAsTtGc5gDuJCwgvvN5ORyKk0cc15sB/3Sj/g+pnFTHB5TZyMLQO83RAYTURb
         UeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977311; x=1792582111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RVD+Izt35MN8c9Vj4EEt2lHnLwzvzVH8w94QaOy/wEc=;
        b=Z4rooxNf9SoSPE+HNbG9jAox/lKbfXoseyFgLIUnoTGXUsozzy9VB4K2wIykm2iEbZ
         JxalYV64Q7yQO68MemamnAwBO9Emo/PQF5/SOzZHtIn3RmvTQwSg4OXCR8dm521/ZcJQ
         39uZTo7xIddtculBfZdj10B5MW0+PjDpUFsVnEn3TUzJATZErRHmt9Qln8uhjO2Yjg2w
         FBrcRt2wBg8Gk6+yvODSU8fd8UtNauhEEW9JeG2KRWH8AbxRC7fRNziqqA4RsQwdYNvk
         HtxGjvBtQfSfOhHaTNR/T28BTHMB44ai9J+xqMWFi3+i2cA0n8qj8U5wQeW8e5uW73Vb
         oKjg==
X-Forwarded-Encrypted: i=1; AKwUvBzs5hT2m9DkUlu5sdFx1m3qBLMlSjsxf0FG6tzBuSZeJkd6IBlzGnOBwbsZbynYGk9yMVCsBS5DHCMdVA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLedLvGknRUmBphehozJgUrQlgqtYHzciIBtJgUHJk54hcLAQRh
	Nw337RJ64eJEPMC7yQrnXNo2ENF0M8+k5Id3cGUBo4Kt1it4ClbbKevs
X-Gm-Gg: AYBFou3qIcaMQvHlz/RNvJqQTeh3M3yRB4EL4XTnfSdphylQjBgtkrzalvntAS6wkam
	2rRwUtxwOiDjp1axOg/oRVYODgOVvl/E56PRvu7H1xb0Q0h7X3p252je7MkcfIo+qBlLYLAV9RA
	o0cBmxyD7MNd/PwgDBXENi5AHgVNkVPSBko0zRLLzlbLgYzFC+cgAQx/PIVPpnmECn/fYXCL/3F
	T/vI+2e++Nx3iLEOhlwEkDn8ssApaQmRrbvmaPfC60CpDQkQCMLGs4Zwo8I/sEl5kb4u5QAvDLk
	3M2kNo39ExYphQLx3UjFVbpT/U0Slhki/6DDMxmvfnRnlvtUU1c2AHO4Vm1GxHzOWtmtbkS46i6
	Emjzu0StCOlrchgIvZhfqUfdhs0hzyHR7rqLmjxWZ6fpPHokfz5njv39iPY0g83giCRLHWTL7KU
	aiPC+Zwd7AmgiKmT5mzkqS0fRIHuqDSgNXQkee+xblPuLS147mkZ2yLPrzsxuGmpCD4CW9jZsz1
	0TNaujgZ93tgUJSLtU/dQZ/+4W7Gm+xyNea3sZTuoYgLirM7w+kDLanDWESzYJ1U1npeC3GK4Qs
	5VMYaixgiwV5gtc=
X-Received: by 2002:a17:90b:528d:b0:3ac:6e91:3f14 with SMTP id 98e67ed59e1d1-3ac6e9140e4mr1552762a91.22.1791977310692;
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:28:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
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
Subject: [PATCH v3 03/16] ASoC: mediatek: mt8195: Fix register access clock error handling
Date: Wed, 14 Oct 2026 18:27:38 +0700
Message-ID: <20261014112752.683032-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014112752.683032-1-phucduc.bui@gmail.com>
References: <20261014112752.683032-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check the return value of mt8195_afe_enable_clk() when enabling the
register access clocks.

If enabling a clock fails, disable the clocks that were already
enabled and propagate the error to the caller

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-clk.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
index 12d8159338be..34c828fdea29 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
@@ -599,7 +599,7 @@ static int mt8195_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_t
 int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	int i;
+	int i, ret;
 	static const unsigned int clk_array[] = {
 		MT8195_CLK_SCP_ADSP_AUDIODSP, /* bus clock for infra */
 		MT8195_CLK_TOP_AUDIO_H_SEL, /* clock for ADSP bus */
@@ -611,10 +611,19 @@ int mt8195_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 		MT8195_CLK_AUD_A1SYS, /* AFE HW clock */
 	};
 
-	for (i = 0; i < ARRAY_SIZE(clk_array); i++)
-		mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+	for (i = 0; i < ARRAY_SIZE(clk_array); i++) {
+		ret = mt8195_afe_enable_clk(afe, afe_priv->clk[clk_array[i]]);
+		if (ret)
+			goto err_disable_clk;
+	}
 
 	return 0;
+
+err_disable_clk:
+	while (--i >= 0)
+		mt8195_afe_disable_clk(afe, afe_priv->clk[clk_array[i]]);
+
+	return ret;
 }
 
 int mt8195_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

