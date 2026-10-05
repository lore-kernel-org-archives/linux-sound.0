Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316C946D560
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198264; cv=none; b=ohCnzWStV/p/nzNJgCIpVGmyAqTfqymt1ePT046uqaHtSxJdBNIBg5k9TE9/NhO/GYjfM1Fk9OcwX4eM/aRluVguCKplQxiRjJMlxpD9uqnXMPsryfE35tYwJ/XJLoQGKYL6nNA/vWFTeQn4h2Xhgyzj8E7CB2BRcAqMnK/V2JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198264; c=relaxed/simple;
	bh=R4W/s5gJc4IPH9tGG0NMkgYOTqk1l/A5nm8KgAntf7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAylXtNuvtLCgTprL6JUXb3X+iUXwysNOW67eGpTuX7+BxblmamIOnNrbTFBl7OzeAgldwo+L/P/t8SD8OmhB1A+r2++0YAr89WGZpMOLsVIR/uQ8JOOmYDGaJhR6gOzO1YFJwdx8hC21ZGJEpOzRgP+JsbQuvHD/XMeER4EJ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu2im9HE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu2im9HE"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so245030a12.0
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198262; x=1791803062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=Nu2im9HEk7OwLZtTm7ZK6yPeNE3hofjmg2B3aiN+2E9HXT2RGoC1agQffQGE+1QCqz
         5j3GVTJfHxr0Z2aY3/JYLGKL5LFDImgBEAobkuHZd7LhoY2DPrMtYYiKprjU/q+a18JB
         k0zrlZrRQJTpjarkcEwRe0htBVlHPOH5RJmtP07cCuAd5pHVdyixh8a+eFPncKxQgp3F
         R+0MUXtAxyzXZ0YJdwhKamAgow8wugn46+P5AoS6sDN0KB5YDw13xO6gHU9VH9U0iQQn
         Ylvl53EX17Sy+arL0aElMMT3X9ob4djHT2afQsh5MUUflPd8wJ31JCTJn7LxjusdvDfX
         G7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198262; x=1791803062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhIzfLC5gjj745ZZDgOhdg5fEWiTou40MIcz5JgYdEA=;
        b=ffz3xPKMYJUcRYP8neS5lM4ZiuHu3gfIgbP2B615IoPNn1xqKR+o+sw9sWt0hHqFFP
         k80HxL7FaTKo3lP2FAh4QXigyHdePjYkXXYelKAQDIBmOX0XmvM3ZIGfYpuE7UkTpXm4
         EPVvlR5s6ATBMetFQU7puIaMQkM8Vntt2KqH8xS8KShqs3kry4CY6xeHYGGVD2cQf8AU
         yylmTd4k0Wbn66KruO+iw3PZDPng3s1IdmEWp8VEAzJ6qQ3/dd/BH1nxs384Vduyj2df
         +e2PS7ZfWblfi6obAH1rkZCfCSDCmDq1c2AK/Hd/V9pAs95iBIhaxdCafNzaB83w8679
         2WYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5CuIFSEovr+huec2NLGeXFVrmEBNWdFcR+BU4RBFGnfOU+khtBeE3MfmP35WP3TYJWAEfhJNRZtrsQw==@vger.kernel.org
X-Gm-Message-State: AFuF++naOwJLRHOh8sKdCxeEibcGJqfsO8tfxj1yHxX9FOj4qTJZ8C1V
	Dn3NSkmY4fBnXF8o4pJcwuOXWHFv6salWtN9oYcu8FsH24bRSrCZGQdt
X-Gm-Gg: AYBFou0WAEBz5LmElhUaVo3fdb3fHKVeL44zo45N4CAOJgfrpxSbJhM2f7asIgJ4+nU
	X9QgK/m9R0UEWBijRaOjfYM3YTgUl49EYRtYPj+ylYZVBNZhkW1lqYLnJSa4eHiqoXu+8bQlAJX
	+YwW/fUcMKLTM7RvnYPOLneXkrh+F2f7356St4IS8Xk/mUaZNTIIItwLZ5sGxGD4QinNgLgbN3W
	i15aYYKLZzJ4KHyNjnbImC0NV3TgllqJIIT3VjXbsZmNKdPs3mRugYQJYz267UziXGeyZuM+Qbm
	LSadRvgfjdVDcBlAr2sYquSOvk7BU+S5gFfizzpLL9LD87V8/UpyVuzkRH0Qi/5DlDNj3APl0uT
	tli7dpPccCR0HxBHbVO4IxOCpng9P4AQBBIUOaWTd8bnbiPVBMZPRjX38Qx2SGyGU8qF8tcVCum
	8nf/1bv3pcLwg3SYoYK3XtwQ6aZF88I9Eg3YXlDPGPTn1Ii6f+fnDXceNZofabjZluW8yt6Gx4L
	TPxyKkSC5tcI9RAFaXfU23ZSrVuRUxKyc5SwYLSGpvHfxaGbM08efq/RlhUK65Yp86Og2b46Ygu
	6Aqq+tOQCxGAxw==
X-Received: by 2002:a05:6300:68cb:20b0:3df:f477:1e19 with SMTP id adf61e73a8af0-3dff47726f0mr5590214637.48.1791198262474;
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:22 -0700 (PDT)
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
Subject: [PATCH v2 14/14] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Mon,  5 Oct 2026 18:02:57 +0700
Message-ID: <20261005110257.50145-15-phucduc.bui@gmail.com>
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

Propagate the error returned by mt8195_afe_set_clk_parent() instead of
ignoring it.

This allows clock parent configuration failures to be properly handled
by the caller.

Fixes: 3de3eba588bb ("ASoC: mediatek: mt8195: support adda in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 94abde15ea09..8a58a142064d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -262,9 +262,8 @@ static int mtk_audio_hires_event(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-	mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 
-	return 0;
+	return mt8195_afe_set_clk_parent(afe, clk, clk_parent);
 }
 
 static struct mtk_dai_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
-- 
2.43.0

