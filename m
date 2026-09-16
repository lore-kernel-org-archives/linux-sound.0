Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69923B71DE
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534892; cv=none; b=Lbv0YqHwb8A/Roj/I9QC/GAVeFiQzL9viPdoCXZdr5wI70XFWjCOkWHp119ao10c1HOaSsUiuLfgBUuNwJEDd0IhBWQ5xwG6eJLFRj0JV8I133ySfSub6NHzv8/8rxfWjRayY3GWGNUjlsvApW7Ixkz8iPLH2itCu43c8ff+2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534892; c=relaxed/simple;
	bh=Xu6BPAMU0+75jjsBaml0eU1zP6f+KPzQJJ6a5O50TOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EAc3DyF+RLRGn/msEF9aMdEJi/LlHF9nrEE8gIB4wrb3GoVKmJjSkrQZMmDH1y3nB45CraV3pQfIelg5zXWDTt4h91nQeEgfilgB2n5gZ/8DHwJoiVgOXujPmEnEJTCC/4PtxGzi4aiQUGMcU/oAJcJv9EM/jwHDMFg4QTFSCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YV+eYhxo; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YV+eYhxo"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so342966a12.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534890; x=1790139690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=;
        b=YV+eYhxocU2u5DolYIrBPKfk9YzBQrNNblwIIckpemz6mzkVq7YMp5YMFOBtGcR7HP
         r1aUJcFOO1A7KfNf9E0qVKxEZstIkTQfMsEb+7pcui9yAmXK1WPi65XjhvpHhm66Tost
         5gp/kMN14eNunVw/bL7SUXHAt9UC+073ki6B0YWuyTMaKuTkLfbRYAQYPEHSjETJ4xXd
         4ZS7Giujek5I1WSuVh4b1x8XiIJuZasSpEPxRqX8+dsA/g6Vu4iMUe/HnF2ll+ql88pm
         mYc0KEVad/oCln+Rype4N/3Fl/KCsQhyFvhq5zfturseEpBf92yeWHVd3luX1HJaSsX4
         LOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534890; x=1790139690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6bmQtp3Ds5+ZJWXFpufINVse/crG8NXJOilyMFAbqM=;
        b=L7uPDD6FP/ntDp5J0+Rgr+cTcgw4o4E70FyBpaTSACa++Mh+/Tb9L0LZ2Dgti4ekQu
         8p+Xv0qOyghjFfej/3dwtr+vw6znBRfttyvEXKpVsMQXZBHdsZhCbQ3e+NwbMIsyIsIo
         1lz6ePHgMdwQBCuVQq7O4vESRzD1T7t4vnnnT5rididCfV1278/OQwbbntBmERWGVTYh
         8vH2sCYWQC2AhzhiNHs+j+Q55h9Q+dt18VegBVZskcys++FQy4Y7VXbcOghsXu5YgirZ
         HnOZD2Unm49QymD5YP4GjCEfVfqWPf8Ando4JUxHFxP/uZGq51nIEWmkojWmYAUM9uhq
         mmgw==
X-Forwarded-Encrypted: i=1; AKwUvBx0A/qnpktGcjfzBlMGOZQV+bf0i/FQTDbpd2hVTdMyB/fARAKa6FoBDTCFhGYFc/WauhFLV1UpobNBzg==@vger.kernel.org
X-Gm-Message-State: AFuF++nNy8+eCJ5vfzHMStxJDIFBrNYSaAqUBzcuG4dHvsH+DF2bri79
	CKcKdYCotb5qDbt5prlID0Rzu+xx4j2+rZPRxl9UaDgM9QXOBx/cM9ss
X-Gm-Gg: AYBFou1cy+7arqx5Wt5ZXloJHPocSdQWLkXsIyxEBzxUohj516yKaULeGsRYpRX8ULD
	mzGj12U9qNgt9mgomE3n7pC0tYWfCiP2bTubNaLicDVfFMfYljb/td4AgqwuwX+zb/RPUaDJNIY
	HyoJ/ijMby5reGRXVyDqpDvFmUI8U+N+ZFscRPlEjaPUWoSh2fWyXEGxZMqKqHEaRn3oMjHspkn
	bkkFxiZT4Rg04zFkQq1VVs0TITWZetB5zjgMvV4usPVnV2oFZQorxkgyVzba9bmZ/M34mJWRvGE
	Icsv+4RH+jWbw95hILdAExgaM6vdJPE5Lu7WyYszA9kQJr3f5WpRm0W4x9C1fGaLLi2KxZhC/R/
	NIx7XRzqlpogplsAFqS6siGlkagADhsvvSDgybKXsp7mnu8RMKDr+nvfpgzeKMZP6k3KB2DYmVB
	42C+wtGDPLww2hkTfrDNbEUPCcN6P2y6ESNWsCk45L8NWXYxG/Xys4V+NV0+eWWIPhYf7AnZoOA
	RGRHqGBFENs/KgL+09gGCWe2dg3M/AVIf20+xoqU37C/YOUq2H+Qy6AZmlALZvxcjF3nuf3VUqP
	+Tl/p2WlqRdGiUE=
X-Received: by 2002:a05:6a20:7288:b0:3d2:89db:1688 with SMTP id adf61e73a8af0-3dd5f3f9548mr2947733637.2.1789534890268;
        Tue, 15 Sep 2026 22:01:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:01:29 -0700 (PDT)
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
Subject: [PATCH v3 10/12] ASoC: mediatek: mt8189: Validate sysclk frequency
Date: Wed, 16 Sep 2026 12:00:17 +0700
Message-ID: <20260916050020.14575-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

A zero frequency causes a modulo-by-zero error when validating the
I2S clock frequency. Reject it before performing the validation.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Check for zero frequency since freq is unsigned. 
Changes in v3:
 - Add Angelo's Reviewed-by tag.

 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 8cd5ddf62d46..c9e80ef42f60 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -1287,6 +1287,9 @@ static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
 	    dir != SND_SOC_CLOCK_OUT)
 		return -EINVAL;
 
+	if (!freq)
+		return -EINVAL;
+
 	i2s_priv = afe_priv->dai_priv[dai->id];
 	if (!i2s_priv)
 		return -EINVAL;
-- 
2.43.0

