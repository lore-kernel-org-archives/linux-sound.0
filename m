Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E38E3E559A
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370961; cv=none; b=gFIwKgEpyBwagnKdwqyJmDgeluFpiZ1yCtIw5zVxBlntUAVcAXtx0cs7EqRjX8kIquFL/K8AhaQMZrlogS0p0VJFgW3HFJAnE1W7bRs8BzUmCx12gBvf1u+rMRpLnSaBXmI0M33ZQDuxpd6TmgtShqf3H5PW5vsaqbNfrbDKH38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370961; c=relaxed/simple;
	bh=cIca475pFe2f5ZYvVKkisqa4yG3Dl/6iz7rvR/7MMYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bh1FQ+Osk37YtcpOmSVlIedVDy6kfpvR4yBSMu76TOzjgIOVr2sRNsKLzcXxEEGjm4vXLY7nX8//4SAHqESBo2XaoVK2New3Dn65DL5NHbDyezjGjHg6XeUwrKe4gURgVUEUM3DsfT7nXbcl1Pp0XF6+/DYt2ndzqen1he8q4Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWfWKVcv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWfWKVcv"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d715f4a587so42234475ad.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370960; x=1789975760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=;
        b=gWfWKVcv1pRJFAtYkpiZiPR/A2g2knn9gzHPHFp1P1u1we10zuY9RnELEcXvAbH1aE
         2eAue8QPtXACxmA5f2NV4vWWE+k6zAQPb0i1qv8Tp7cuIDG46/aYjQxbxu6Io1Ovu8mc
         2IfvUc5UhK8YpKw0tmVpTV5kCNKGPUpfZtdy0HxChiuU0e66NkeM8JizfrP9SQPpB0Oh
         mBzVSXQ4+qIRR7a7ghfrHzcAFy+o57Ukd8jilWv9meJSKpRu8jeQ3eiOzVJOca8hnO1d
         dfYDmyD6NSeNrAljs/v6/p2bQv4ytD/StfW/NbPqRSzCUP9Uw4Us5XhbKWiCuzqMH9u7
         qCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370960; x=1789975760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5j422sp7IgKzOpG0gt3MXA3l3kQYxqi7If+zAVtiI8=;
        b=ccDGE4VfP33X5/M+n0POKyqvpmJu9X2PV0F4Q+G9wvqAH6/MaX/I9nVNvqQ9KU2/jo
         TTPn5fpts/ImlAhK90hvvudGnw84WtH/iVG705ouXUUQ1xsTmTXje9hW4OEa3CTyf5+x
         WsOjfn7Qn0IDRCUT2DvcBEghdsJ6oLfYnj6DFFriY/iXrcJOAkF3uCHt5HCzkrxrSpQn
         TP5aGIul01u5OcDv7DW67qDr/4JG0yT4WePHl57kp2LkTjywcnrEKGh+58URgjc0Hi8/
         8XcHEKMOHEpo7g538oaHLF+8ksASSaZ5O/hymiTEPfYZJfYEuSroDxN+JR/Nwq9rvE1N
         C8QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSpVSpoqnUlAFQcT69Fx1pgA7WVRj/uVtp+5vl6AvMt9ytii5GTSzrjZJNjTXmbvRqHAg7bnzIZtKjMQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kybw1baD+Ulu1DRz2cYYrMXpd+zxP2v/HSA5A9sTHaPQblefTb
	islqyW8WBkYK8cg48PjqxoUHDB2H5HOXKRtaK7mrttmVtOnDoOJg0TAK
X-Gm-Gg: AYBFou1Vh6wWG1q8Su/1GgCmRKBHaPSSyIKEtQ6/5NhyxHx9JNG704ZxESVn9RUBipC
	tfH+OGbH1Ci4N4az9blimNPm7RseoCtuNkACzkSn+LSbH7atZp2QTDA/U5kqBXhnVIw/GhFlY4S
	ChMxtKWvPJ1OBGuItbSkPYTYGm+3u920CMft6tRBnYMvw88MdKrNEpucFJHjovyjM1k62j/JGWx
	TK45ZcAhO+ekIiRDWVNF3Zbdbupf9iWoTi80S9TGDdPjV97g0TqvYPbdDZESgczleg8bM2N9ph2
	TTbK9TrBhK1G0wN1Gw8dwHhaQFtz0UnYNndiU1wiw5XZCq6YTYm3SKlIlTyu9TyD+Z9BbWgR9hD
	oNfP6MEZWc5NNe14/HAwjqRSF/ch2uTpyzWkxImUQJLJL4aKeMLntUr7vXnyB7pyckRQ97JyecO
	AZyN7KJIgvulWBy2jgUqWXx4LGSBbBU/BHIB6DJoBxRKdja2afHGRr7bVd4fZoLoQ7/+ezpa1bj
	y9dUnEiOpNLrf1ZWa7yhK7W7NWtEGARH/jeQbiN541/XvywbG2cl4MsdAVKpVcP9STNyiftmGd9
	oXxbtEF8aznMohI=
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr9021a91.15.1789370959820;
        Mon, 14 Sep 2026 00:29:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:19 -0700 (PDT)
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
Subject: [PATCH v2 05/13] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Mon, 14 Sep 2026 14:28:34 +0700
Message-ID: <20260914072842.24420-6-phucduc.bui@gmail.com>
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

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 69aa3715c19e..173ee0709b16 100644
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
+		goto err_disable_audiointbus_clk;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audio_h_clk;
 
 	return 0;
+
+err_disable_audio_h_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_disable_audiointbus_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

