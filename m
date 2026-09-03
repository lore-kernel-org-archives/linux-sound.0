Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6DD33939D
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 04:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411185; cv=none; b=BUJyDM4zTvRut7zZWf1nCiKsUII+gCeWphR4qjeJdlwhKCJjaoROZedWu3UzIAd+X7HjvbOwtFhBWv762ybVM0Pk23Urc2wHg1ghAhde+Y3WEju4d7A3PicxaUqlZ0woRRnE+uzxOq1jMA+FV1qN9CaHIk4Rxh8UF9WgqhMMCco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411185; c=relaxed/simple;
	bh=LZvlbcsgGaGSFhVc9VXtl4EgwIRrrp1Uij6NVG3vb9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyRpmY5UT65DM8OH05tIk0neJjHVOYcSS281c61Y9IHGdEDmftofiVnVdbh32HJAK6e1/OI4m73pRWSGg6+6nSXDdscvLavbTIti+JZ79I6G87N6jALh3qtJy9mog4DSw+9IFEv/MowF2aJmzYModXnbZf54SmqUD8VT983SG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX3CoRwk; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX3CoRwk"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39647184c73so565355a91.1
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411183; x=1789015983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=RX3CoRwknFAO+CrG4DmVQpch18D1wocZFeIg77g9ineHqyvO/smYB9bxk1dRFz8+qf
         1gX/t9Q0+SFBe70xHKhlqu3cXMZyTxuYzl38Pj6lSV17ufmrqNRv53l6Tkzo9490OV7e
         ZR94HvmEYkzbQGjlD1mjs+0NwgsSAxRO6goXCZTdYsNmabpJT+O03o9WKmBn2GLSeONn
         7AqUoocCKcBZeRjQObVpzPj2u8ua5s0zYPsc+ODX9+AcWNwZO+323URFMtk8GBqf1CIX
         GtnAA88mIN+Pjd0hBG0PgjpUCQseAsln8AqxZJpdqBFZwWRMJA5/zrm0g9oku0ng4z4B
         Gq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411183; x=1789015983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flo82f6nJyQV/amkHfEW5LTC13dBqnuwC2IX8NNo5OA=;
        b=EJ1j5CVotbaWhbvK3aNgh1BDAQEa1VahyFk3+N8ZUmlxJxgAB6YpkluSN7kD8aTJdN
         BuVgGmATHwt/KN983lPFu8bRi5TUIdFINHESHchZ1AX2gahYpnGZv5c3nbakOF4JmSS8
         vqB+rzJhBq1WYP7Wr7tP9caLo0rugTkKlZwd5bLFJYNsNHGPCwuJ+LGQfaq0oZ8s0aGr
         8a/qYjLXdtQtB3DfnkVCmS0vuj+BptcX4OG3JnAS16paYdA3DorI0ojMzobBDTnrv7EM
         CEJuHwR/s4vAUWSNNMIvKy204PwIqZTmJdcn1EdUsdJrUUF/G+3oQ2X1S/eszolPs7WD
         3vyg==
X-Forwarded-Encrypted: i=1; AKwUvBxVtLKeI5V+BoozwXmyAqK5Yv7muxpgrjBq97TuuqoAbmLxsyJiq5qEi3CmHAbJZIIz0i82W51ZvnMgbA==@vger.kernel.org
X-Gm-Message-State: AFuF++lQdLTqyAveuWEiALOq3Ye2sMaN+8Rs7NjvRrp2zZRs8XwogVYn
	4ulb8aqq0y7vPQ00m0i7CzAyFnIJegg85WLtrcq4mFPXrsiDK/ywng00
X-Gm-Gg: AYBFou2I3koGUfB95dCWZQZdbP/yK1yoc29wjUzQXkjUX/pzFw0VUrL/fvWEFk9BFNZ
	/uvXl6iaeh078PvvNgsxB8vshrVx3mLzqMN6lwEbt4A+KgkH6b8zMsOxiL8gkCyvjEtmXp4x1iJ
	yn0wejLXCjdaxLfhX5IFtc+SZCkwm8hvUxpHuIIeaYMShlExo9Inp9N75pRuwALO0PKBBf1E3UE
	oFQNNxS4DUVNogJHhG4rEPBl60lk9f0ZBMyYv+kzSJOdQGZ8baTwPTp6a6Epht7maEhCNpusNmV
	nl/0nndj3BeQuFha9srMXAPcPHLjyYcpyxb0HSrh06yoFce2liUkoTf0L/RWLjLHvPn1gbDC8S+
	Hb6chVHTrFocdn8jFnVs5axaVxB4qe3oqx/t5exe461/bYO01FuoFPb5jjsMLc4nE9uXvQm67VQ
	sxJSCdijF4w3p5PZr79CGr4T8oDJG8b80jeLXwe332ESrXFzP6X+IR0fNgmcsNeMBiSwzTenxr7
	eB5HHwxSRvm2jPwIoOOuQEDJmK8uIYMNsbAOCL0AaZr2VaAqHJxGTZTVS02ZoCGtOkLgpnWleX4
	1oes
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1191332a91.15.1788411183106;
        Wed, 02 Sep 2026 21:53:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:53:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/5] ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
Date: Thu,  3 Sep 2026 11:52:02 +0700
Message-ID: <20260903045203.175337-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 06556689976d..40f9afcdaa16 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

