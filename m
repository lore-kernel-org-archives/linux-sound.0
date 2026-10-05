Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352F147DF94
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198225; cv=none; b=I14dW5w6+I646ntwQf9aVNPhr9icZB+M8khcoWxGJ9ik1Kyf7K2k+ePd6FsixQf9MyflA2DlzKAY4ZZtoqNy9NJXeX9OzuFYLf17ROYUzhNITOlyrJciTRRNYnZQaoobfU73nopM5jYbB/UrCK2tJ6r0kANTHI39MIXPoBOVAGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198225; c=relaxed/simple;
	bh=pxSpe0O1bS0J5JevJ1izQfRCUVeBTwQvQAquRw81NNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNtg8zfNJ48mzs7/a6SSZbIBvE7PR+4jIOJTjb47ezuXPxRzGeMYzUwR6TMMV9U/lfjW7HFd3Jdaiz+o7eVSR8Y2NJNRZ/35ia7MOBMPpSI1qJZf7U1B3BL5N3UC4ILuVf5Av5ClZfzV2aaNeaKUd6sBPesmcJFxripIXxdADx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs3qFceA; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rs3qFceA"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-883a16b758dso238494b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198223; x=1791803023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=Rs3qFceAImpWqXBdNxXEdnTAAXc1B06L0E/PvrNm6GBuORfPyvAvsCIjlYnuR2Bz0y
         piG58+yNbVgIDpl8GNC88+GJgyXgS5cyywT4A/48omrNT9UrAFlomrMa3gRpR2xzHIUo
         Ff7tUOhzmwdOa7kVtvwggp5RokJAQLalxMNfiOBwTs+ESHfNRP+lcxq6/GE7Q/S926Cr
         gMceZkS7Rc58d4fdhHpOnzJAuLfwP8hWaRAEs9qBemqVJJmtSrTOOikz857BySRGgZ95
         UeWkJJFcqlIfN6m+E2/M8dJyRrbFuT0yhUkZ2h1n0f4fnfJKzFA4d2gXQ8lHpEO3nsxA
         cD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198223; x=1791803023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrzhrSiREEi518WgYUmB9rjEq8Ct4ueH+v9/vpcq6jQ=;
        b=ai3LsZdXRY7Ad3x4ifmGJ5fIhBtVqKmPoUvycpC0psPqSJ714KXYmOk5M7J+6gQffY
         1eHa99Ia78tjvJ3G9QRtGqLER1F5N0PK1h4I73xAwNEa8hh3dZT049WYM2oiWsPcxdUn
         3W1eq7amcSGbYZUw9vRekQg61tbZXkHnCwuU1fxj+uhpHUoXXmU/rxxMdsQSnGZsxDVh
         /IyQHzq944Vh3zc+s0D40How/T/D/xahDPNFlnjcclJEcL0SqhQVbp3SqfF7+iTvllzB
         BWzFgTSC8e+imnVLg/h0cTRS7h/bq8Q+rhlJqqNoJXkcBWqcsdrTRFSUaIWdFAuxwutn
         U9CQ==
X-Forwarded-Encrypted: i=1; AKwUvBz14FQixk7E3LmZccw/E00iXDbWDfbUVMjqaJN/4ottay6+4CXw0AV3BRABEuB27GaJJ2nPGg9my1zWVw==@vger.kernel.org
X-Gm-Message-State: AFuF++n/yH6bs2HiZsXh/MthLP9X3phCFldpJp5qLqvCRF05B8Ze/zqC
	tAye043kfBqECFppUNC/TX/MNhOTUyUL1MKXd2v30IlmQEttVlfK9uWh
X-Gm-Gg: AYBFou3IT5z0P0mQ/2mQeEAUbjyZ7r9QD2KKvIjevESFCYzij8FyFKUeU3hhZzNRW+e
	hY/diTBnXaUk+qBRYHmN7K1UdD1EuGo4JOs14W/5INocB9UrENNvW1MR8ttbVxmdVlFie/HlQka
	72Pb43aq4dXqJHLe9OIT17DQOPfRbPOBaZSCggL7gso4pHctio/IbnR8KKUmgwjZVfv5lg/gNus
	JUpTeCR2dtiUK9yfvRz9Lp+COTDDf9jMe9d1rmSbTe1OglfX8CDFnCsUUkjJ0N15hsXQ0YIhHhy
	yZqxjlq36IPI2xd+TIJJcOyWBK1/FKEVQKWYXGXH3OyjQ8dIxKoW7JEOTwSeS1aZq/tKAiIUBCc
	q1k90/A3ZbovkD7sF4AuilsDsqYcmvA/kPhS+d7o2RkFKCu9ESXODnksXyqSxT0ILlpx3ZyfY24
	bGV6LhrGvaHF6ClBS6GhFmt2MQM4jSfoykyDdmoMOkHh1cHhVviAZUOaVeqN9HDYzAGUxjbiG3B
	vMvuq0WG9GqhPUA6kuPm+gQgB2yL2wqheWEeotPvXChxyImciKXRP8EZIch1fK6EhjE8pUwSoi0
	hl01tSKj7Ba0Ow==
X-Received: by 2002:a05:6a21:4ea9:b0:3de:60e0:5ca5 with SMTP id adf61e73a8af0-3e0bcfe8b19mr7326452637.9.1791198223408;
        Mon, 05 Oct 2026 04:03:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:42 -0700 (PDT)
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
Subject: [PATCH v2 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
Date: Mon,  5 Oct 2026 18:02:49 +0700
Message-ID: <20261005110257.50145-7-phucduc.bui@gmail.com>
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

Check and propagate errors from paired memif clock preparation and
PCM hardware constraints during FE startup.

Unprepare the paired memif clocks and shut down the FE when a later
startup step fails to avoid leaving resources enabled on error.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 44 ++++++++++++++--------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 1d3e01e2c3e7..02736949ae6a 100644
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
-
-	snd_pcm_hw_constraint_step(runtime, 0,
-				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-				   MT8195_MEMIF_BUFFER_BYTES_ALIGN);
-
-	if (id != MT8195_AFE_MEMIF_DL7)
-		goto out;
-
-	ret = snd_pcm_hw_constraint_minmax(runtime,
-					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
-					   1,
-					   MT8195_MEMIF_DL7_MAX_PERIOD_SIZE);
 	if (ret < 0)
-		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");
-out:
+		goto err_clk_unprepare;
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+					 MT8195_MEMIF_BUFFER_BYTES_ALIGN);
+	if (ret)
+		goto err_fe_shutdow;
+
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
+
 	return ret;
 }
 
-- 
2.43.0

