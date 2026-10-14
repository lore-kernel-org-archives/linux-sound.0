Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83D4FD283
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977388; cv=none; b=Hy9nDadGuhNlfG5h0YoyswlXy6Mkg00mGrAIb4+Mv5RmQffqB1DvzR4/1zbUa4UsZLJMv7wueRalc4tvhFnMSHjCdXEs2NEEHSdzKZ/Lc4mEw7rb3VIC2KpH3GdIlezPO65EMzYVpBDQIn33FvJ8FiqyXZZqdIhme0VLsI7u5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977388; c=relaxed/simple;
	bh=9vaWp1g5+ohNxdTNzyTbJOsd3dur6dmaNrd/5z9FORU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X17x/2Ivg4bWQnMMrChiCZ+jX8pccbrRQhEOtV65y66WlqWtwN8abMfKsncwvSltFnUXDk2QH0M8gkL+qeHG4xDpuqntpzD+Q4AAGzd/sm/MrBLFk4lziKCBV2Z5y9Mt3VNFuryJf/pRgzs9nzhbLZTv/EvGPAYD1y4fifjdITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di6ASZqe; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di6ASZqe"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1cf287ef8so2175217a12.3
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977387; x=1792582187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=di6ASZqezICL0RA+LaUKOin/8as6mA15NxkdUJyDC2lsTvjYwwxwWTH37IKEoGAPeo
         ybHWDcftlBTzk2j6Srdt91pYmf5q8CH+KrUMSdNAwEcu/zhc+rNj8NcLTDVWeIw2oPGj
         NbiHU2Vz5W7ghVOis80gGj5Csiv6DE6gC1C8ucX7sApMn4BGEtLw+HAqmcumzlop2L4a
         wjNGxPPETQ73TFQaLWNkDBPuJSlsc2xW+UhYnZtyRQ7I8uu1cjq4saJY9ObVd6TDgRko
         ifO/D7MdJRDQkncs4I7UhgXDmpbEH8PJv6A2uYUFlCOQYE/gTvDE2iYL1445uRVOXiS7
         5i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977387; x=1792582187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkfIx2Ngzq+2eNjVu0DxPe2A//R6mvmdZRTdeLzRAko=;
        b=oXVXWdc766ebo2LyjuZSbgTO9c7+cmpz/g6tHt8QN/X6tsEWo+MIZIn4UvsXTFZkde
         Ru52Eu159QBsfdYgY7NUPQscob0EQNB/bEflvb0hHhl2banNRoSkyc91gr/QD6vkJ0hw
         Z64jUTdKdpYKQ5S321v1HX1ISzub/srHWMeFHtrCWn1agafUDXs8Z4z/eVBK/KMlN0Nw
         3rNfQ9NxtoiVuO/6Pr2qsetUj1wv8TrSciYm3qKqpcWo3H0FNFJzlVOhrG/EvfjNu9xO
         C1CSaHmLEWscebYTVdJhb5V5dEHPADbR9lzIOpNnJYjQLt4a4K2N+5SnGQklBuiVkjyf
         8Vbg==
X-Forwarded-Encrypted: i=1; AKwUvBwdGudhEls90hzaiE/NDYgI0V5qXtPocO7X4qjPLrz4I3sMz6wBxwtBJgARa5NSfJYzz8HbekBI1Y/ktw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLLP46YYcEY0+ruV8wONF/yp2HtOA7zrqXgDZexxd+qc3vFCesg
	DjsndLSXdwaAoaO4RpSptkKYWPXxZMjITaJs07MGIybumFFhuWfeozBd
X-Gm-Gg: AYBFou0C5r/TLm7hm7Ms2KmiDdtx6S7ry8eL6aEDwLDDmXh1I1DhAQ28U6f9bpQlcut
	Fs6F6aEle7x5AAVBVY3tBuzb/UQcWOrFF2+EEaiNrdxWmCyEuR2EiTWUR4E9LG0QoQiufRBg+MS
	8jUItswUzFwyJ5HXrgjl2CstxvM+ofIcihRTYhKhDjv9auqhN8HAYC9rq6i7s0c0pDe0yIIVvQJ
	ZBJ0s07qLxQgEfVyUKn5BBnoIjHyq/GXUrXlSzJPS9baCCG1lALUR6hSyEFJXM3kIkK4QuoTHkY
	sT9/KdTgjPybCfXJIAZs5HkQPtey7Wr/4y1JiSe1BkaFD8x23+b8GocHhlKx7IUrWH+3VkajQwA
	Nv9aggf4s49T41Q82rsP4SDVtnN1UsXHuveuVfb1+r4jU7SHGlTLSxwkCjOiwuqvsCjIorK2PAw
	eWuci8w8OfIiyIAwAyl1TKL6v7i6Xk7EwpFzU9z3UnIGVJ8/g9/ytyyd5dgImgNobL8mevBqqwc
	9afy0fuQPr88x3JBUrS3+neggiIgYPR+s5jFBBYCk9Zrs67QZBpVeUhNlLmLBF7afdHUBdwwDbt
	DSnZGAK9lQy7dA==
X-Received: by 2002:a17:90a:d44d:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3ab3a8d0e98mr12992962a91.42.1791977386685;
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac61171feesm4077076a91.17.2026.10.14.04.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:29:46 -0700 (PDT)
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
Subject: [PATCH v3 16/16] ASoC: mediatek: mt8195: Fix clock parent error handling
Date: Wed, 14 Oct 2026 18:27:51 +0700
Message-ID: <20261014112752.683032-17-phucduc.bui@gmail.com>
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

mtk_audio_hires_event() ignores the return value of
mt8195_afe_set_clk_parent(), so a failure to set the clock parent
goes unnoticed.

Return the error so that the DAPM core reports it.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 -  Update the commit message for the DAPM error handling.

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

