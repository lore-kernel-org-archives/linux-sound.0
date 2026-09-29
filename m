Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C3340862F
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662347; cv=none; b=oyyA/Nx+pm39jDPuce8Br3Q+ZXRGlTVrWdala0DmYHHyTf4gJIKiKp1J16p6SLhDHj61zUTimWEwjiMG//IgQA0IkRPczyzV2fFdX4a8nbngT8itVyzmaoQrUALz4Nj0/PdvHi+Os3+MKxbC/fdtBA4wMxrVFcKy94An+DFm+CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662347; c=relaxed/simple;
	bh=v46sc255Ln1PXrxBKjqQwkinEYifo4ikFZ46vupgL1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqpeOTKB1Hi4AwC/PD9GV6uh4RnbHjwOJOyuQ0dZ3z59/bgGrdQ+XxNqfCtgkdESEKjnU9dxMh4PYzkbjEc3ZmD99tuhZtSLSE7GImOKnrMjSckIBTWvfbEYowK1/KoE9/rAQC0g84p4SnCxybrCkmEUP84lTyiiHryoL1gYPKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUyP+mcc; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUyP+mcc"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso2241992a12.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662345; x=1791267145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=dUyP+mcc/5TqVUHzWyzVKt3pgqRoGTsw2QkVX5QiIDwmwkDYvO/xmCd8V8Cv7T5wgv
         JkQw4AL6GL4KefWEVDqfm8Htv7qYn0/ilg0qLvxomXmsA2pQyosGip3UtK3HmttEuwN6
         Rjaxnm6lPWGWoJWQkVTGr6EX2vH2Toy3vEsual5z6O5VEF8dDKMNf5B+91c1iCf51Fi/
         q1BH66yFljIqctSkO+zei/j+V0kgop3Ita11aOve7im8d3zg22vd+a0FkRdGUAZX+erL
         sBo4jXLKu6EBnCgXmtvtDSFZR2hUyNGEIAFEY9+rMEptLAGchc3LU8jYdku7QFasTGcj
         9/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662345; x=1791267145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6VPftEpiZ5xyFAyML7rbLAWxXnWGIHElQ2g4AnTk/zY=;
        b=2rR7V/iZ7PSBu2J84W4hnhJHDcmBezHmJ2fd6KFD5oRXVocm8gisPUvNbxr6OTUiXP
         aTQ6UY+f29LFyO4ryZTAPx+ry39ZqhQRxY7wmwzSg88iP1KHuIh1DIe6zAMwL5h3rZ8D
         lgiCFVirqxAUrxeaFnuUJoJYftmFiZ221Xd7ZtkQPbMiTk8lYNXSpE37YkdrM3te3U6m
         /38cIqMose+ArquP1F1JPtdjJX26nAvdkm1p6ykBCz5b/gbLtKNCshdndOgcKxBtDDX9
         rLLRZgJ4zfSXbUzTGZxDXs6vWqbTgF2tGaloIzuGJWPMOuo981sKwEVdgtIiDozwndwx
         RNXw==
X-Forwarded-Encrypted: i=1; AKwUvBw4FBhGJcBDod3m+ms2McdEtxaxkQWWE8Jxvq8kRlUoArWVTylIUYLvgte3baQk4XFfklD/VF5zYFkDkQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLtNsvy9cAKS5a0vZ7xFR4b4tSyJ9al7MaZP06QFYBrPcj8+747
	s0yjQKY0pqVizd/S0CmF8bw/wlrOJiR73caBOlMguvUfj+FufdI0HNAn
X-Gm-Gg: AYBFou3K8XunLhEqwJ3BULKCA6hnJjqC/NtWpa6Wv5rP1t4kSP+iq97uQIfwTtIJdlt
	2GOxyRGr4LLiCmCYQD/Fb6BtUYqo9MACGAWI4RkfmrA6pOXl0BBlnXn2BGLLIclJDM/nw/o+ec3
	DoZqnCyZ5Yol6cWvEUaNyy2VrRfU7xujvtgrLF+Mr34OzI3oweMIevoB5wq9v8L8TDWZSr9Tbwe
	caK/UHU3oRV5+EupTQra/9XWciPi31HruHvPvbZhta5m9JwSMDJWUz1zOrEd5K53dgzmfLsFrJA
	MexdQJ4locNzyW7q9vWxU/HDGAsKG6BnVX7z6/bOAXsZ81qdWykiSrz84def8P6Y4N3xfJzX2UA
	vsTPxXUJtjwbWk1E0w7SRHYUXpDWHb3kbXHAefcjjup29jEvkd29diLZIEsfzpugEekzRpWF+H+
	XPxMOO+R8DlDZv1ONktz2i8jmYzephhHJBRaYGZe1Qj8h6IBCuezic+xGcxftvtyaoVNY7WDrzj
	ZMRmGxEDbvfUGPcogUYKmve4hOju8qx4ba2RtkjKOOp7/zteGHOGng2kh239rDqw38H9kLZT19V
	H7Lpj5mgxqE2lw==
X-Received: by 2002:a17:90a:bc9:b0:3a0:a515:c47d with SMTP id 98e67ed59e1d1-3a0a515c8f3mr8329776a91.34.1790662345126;
        Mon, 28 Sep 2026 23:12:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 06/10] ASoC: mediatek: mt8196: use dev_err_probe() in mt8196_init_clock()
Date: Tue, 29 Sep 2026 13:11:17 +0700
Message-ID: <20260929061121.124001-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() when obtaining clocks to avoid redundant error
messages, particularly for probe deferral.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index dbfd02d20338..91a05ea6b8b6 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -618,10 +618,9 @@ int mt8196_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < MT8196_CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

