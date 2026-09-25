Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F363C76A0
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311823; cv=none; b=XS2XM0kj+k/OByjkrXeIN1NNuRVNvcOPk/izz9T0zisxWIgweOCxcZpBe4s66CHc1WsRUZpiHkX6buASSTStfPT3spTDfvnjQ8zsiCnOyj6ka2LHm/pIQ8x/QiMKzIVnyWGBiu/gB3dpdZpYYNQiLxfMkbPW2XBhqO898Gj9zMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311823; c=relaxed/simple;
	bh=VY6f9l6xjiZWDVL8eVXr2ycejVLxeVsy5j8oDBYt7EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NzSywGq38WWlpmFH2c1bLqJkjlLlLpW7OAuKkHGRtObRB4x6otzbKSKEh3zjcmuctP2i2LFrUFNcpkpJLSw1SLY0dQDv2Yq4Gwz484oMhEE2gPbTCVWOYLT0foVPLrcmvd+s4Jhlbs/JRyiwGujeVY8ttFyAtICLR/AWtEkUfAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeXvqNHp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeXvqNHp"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso2646905ad.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311820; x=1790916620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=IeXvqNHp+y8x4/I+EgurKQ6JeAeAw4/xIVqsQTNsH8cfZgx3lj+n5UWxmxmQHG2fg2
         CdaDX3Fc4W6NLmxZf+3xF3cTH+n1lATfyOdHQ9ff3gDFzTQPQnnfuAx8g5AKi8o9ENg5
         HWBTz3j1k7SOJTbWnqzKIkO7JxayqCX1CBhEk5gH/pX2aTv82d9OETRzwZfd1+bqsbjb
         /CB8UCSvll0MXDZWtXezd4wtu01csupMaudaZShXJcTqWqQOWfJMQnpD5G+JIXOtNi8p
         CqFgubp5DmOPKPq0HS4XW2Azf8aDK5nq/OmNxFvrJTJTJN2bhTxK5tDGfFkJ/pw1QzW5
         /dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311820; x=1790916620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rr9O3pSXlopPJwpXTp6LzZ1GSJi+3cpwZPBmE56Frg=;
        b=JJBeYRNajLXzOJX3pxYkkKhQ9EMg/sVRGa3o95XMLwFma0ET5SxfjG1bv+xWJ5iSAQ
         VouP4J2SjipOivXyixI+xPsD8BZOGUuW5blM3VvIJhckPlgubVU7bOXQ/S3NdReTh5WT
         Snv+JkXE+lXz8wimQ6zViSG2Io5qHBxlfbQ9HekzbIPhV33aWCB4IXDl+FUeYKSJUex7
         XefFcv2p9KMycjuYtVtKzwNbWI1I1sx6qjG6TJWiTBO4yEf0kaUDCh/HJyuyJ5ylnvDg
         6ojzdrmPCySj7CQ0uQwpEFlhm5azOtxPA8YzEijpZhHl7FWoCuF0DV1qHEO6jwb5wg9d
         e55Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHqB93TQ+N4sL73FiNJRdqbt4ZRVRYEfKq03wWJxGcXI6QjC64GiIXgTkp+WJ9x5EnLNf4rwpKvR6eNg==@vger.kernel.org
X-Gm-Message-State: AFuF++ksZOyb6bc7yEApfcy1Vy57hoxwwX3DFEIk4vh4dvVXbhGJrkyY
	UCw1CFzQAc3Ql2khuNw5aqXsr0U0G5Egvq3wDpfTnX3233nUGsGwsiMp
X-Gm-Gg: AYBFou11hEzsQ5ktVY5AO2l7OSm5oH5DMYc43/3xtKAJGzhL74hFU+wZ33SE0qhe9yw
	M6cWJSywoA8cyAkEUcCysSCYQy91tasPcvsWKdLIY9u+AOGaXq5Hw/rmZe+r5F1pVdT5wZ26/OU
	IQ+xV+3pSTCKNuQEqpP9ozv7ag3FR/kjWKS09esTEXeuDbjDCEc9UkL7DmuXM0eG+7FdBtRErAW
	ZSjAvClWNA/FakUXPjzqkzazut7/58BLLfk+9JjjOGZgmfnYgMU+rz7Xy/Eyu5P14U9QPq+e+LG
	NzyM1z9pd8GFMk3RYZmDC3sznIA5atfERL+ilsYTV7C/uC57QfXSmAH7VD+sZjV4z9o8lNTNOYT
	qgN38Tfa7OZxmLsL1V4KkE1kDZSptgVpWoSSvY1Mb4CnxDJqrEiECN4x1LVrxwHwbIOYNTdZ2hg
	hb32Qz0lPErC6pGo68Ch359lkuGjmrxGWRiNuhpOnc9IVH81wcd/WDBQ85BtTsf2XiPKEqY8IaI
	uoR/afNgRH6PqRww++QwA7sBA6cNO2gGFA6Y1qYM33XxuZLHiAdm+MDIb19cv9GwNijdSsFSIXu
	nig4sRp64JUZ6Q==
X-Received: by 2002:a17:90b:2d46:b0:39e:6c6a:657f with SMTP id 98e67ed59e1d1-3a0bb6606eemr886083a91.66.1790311820391;
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:20 -0700 (PDT)
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
Subject: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Fri, 25 Sep 2026 11:49:00 +0700
Message-ID: <20260925044908.450775-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 40 +++++++++++++++-------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..5e76625915a5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -364,24 +364,38 @@ static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	int ret = 0;
 
-	mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	ret = mt8195_afe_paired_memif_clk_prepare(substream, dai, 1);
+	if (ret)
+		return ret;
 
 	ret = mtk_afe_fe_startup(substream, dai);
+	if (ret)
+		goto err_clk_unprepare;
 
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
 
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
+	if (id == MT8195_AFE_MEMIF_DL7) {
+		ret = snd_pcm_hw_constraint_minmax(runtime,
+						   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+						   1,
+						   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
+		if (ret < 0) {
+			dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
+			goto err_fe_shutdow;
+		}
+	}
+
+	return 0;
+
+err_fe_shutdow:
+	mtk_afe_fe_shutdown(substream, dai);
+err_clk_unprepare:
+	mt8195_afe_paired_memif_clk_prepare(substream, dai, 0);
 
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
-	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
 	return ret;
 }
 
-- 
2.43.0

