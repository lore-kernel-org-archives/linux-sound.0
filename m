Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260960;
	b=UYWk7DFVbY5fRFo8ept0RYcF57qVhXQunorSIMQWJLi11VBiM9kk2YkxjObQHBG8YRA0
	 +e8WwNH1JvSNaQ1yXVLgTd/ZUv9ZBIotQ9W6gQKLiCb1U5R39f2u/dhqhpCNJpFmJXhxz
	 SYSl6arZGWX2wCoQ/Z8vdvFuJ7MhelpeCE3g7V3g7WW+FURwbimZ7R1YQqFkx4PLB/nzo
	 wGsiTo33UX8oWVwt+E7g2AeyXcyrFk2LCt8h8XGGn/WGOspMK4hKRHDd9iWr082ycX2W8
	 pRpwEpNclHvrmHyZdeLwrP9rgtCHHynmajDIrqh2s1SqGx64uEBzUiJCVNaKoMhP3qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jf//jGkpoaafkxQgkLXGLNO187YYediMJ6KguSHiIjo=;
	b=P7kZSo69TwWPtLjb0dqCYZ10KeETujVS43UwbJYqIYA1ugglDtALxrf8snOqJ903+ieE
	 7F0GEiZvs/1ZUQX47bruOpAfUOHZKxSv31c5GUxxlVk0jhz+GNVGXWl1abpdC2C5xBOit
	 5N6WHUMmfxquePuLujrjATCnorIpVAPIiXeWyuxi5plFVGLwdhCUAA7wS2sEPkaEh1jTh
	 FWWIk/AEPDosAsKenLw/fqtNtykE42pa6EoO9t+Wl+mrMooWRMHjIjaWRh7xC5xDE9lxu
	 eL2gf6SOaHfbtLLoqopKnbzaW6izUC9HI9sJtQV3Ywrff/ZxKpvdT+wxCiuPjZn4N3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3XBvDSs;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7636606A31F
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7636606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3XBvDSs
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so259940a12.1
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260959; x=1793865759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jf//jGkpoaafkxQgkLXGLNO187YYediMJ6KguSHiIjo=;
        b=Q3XBvDSs1IN/w5HWxWK5rlqy3F9mzbJGY4rlkKlZ38RlsSvv1BrHSHHFQxwjdq1miD
         vf3hSQn4xCULu6CCXfD/NkGvIA14R5YsraKwIECjGFTgid0ANuuUJ8YXyB/6Lrvcnyia
         67fZUF6C/1Xsrt5iEwwyoddAiG5//KnurABnCMif6oSn1IS2p2qvM0CyL3X7pUtSJgEY
         +r512Y/wuBvDmuI73B2Mv93uyDuTQmDxt+SA/sxTCWSXeZT2h3kSHAM7cuL1wDaNm+3r
         0x/Xwdedf7Bmw3uv0natcB2guiZheuFqb/Tjh+5RMeOZ6FIVvWn4vouk1x/kEI3oY4D5
         DM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260959; x=1793865759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jf//jGkpoaafkxQgkLXGLNO187YYediMJ6KguSHiIjo=;
        b=zi30N9E07xYsSGQ1JFB+W2ObAauQf/bG/EwawVZCix89IyYe59C1k20onwuwtkKNSM
         QpVKnGJB/CgDzwQ/S5RexWiJz5FTyaGGYQVimd9HbBViMbhFxPSscbBVG3oonZGbb1ou
         dbiZvEn6MasApozyHQk4xZ0H2BOTxRYk6MLMo56fVFFkRXN9sNhFo6HmcYWeBCOy3hpt
         4KdjOzJpKlbeA9b2AR5/lR5TX+56DfGtUv0IusfS0Lmu05HFUbVd6ucN/jJyY5TraFPE
         yVXjrVPRjOl20FwhUlKLgXQeRDXIlBWK53ozLBIRMX/XSYpK9SxdJO7R0hrXQhYXs/7e
         fIYQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeUJNR3u+yotSTbiPyIhbAEDMsNJdYWv26kljkCivTIBfwxzOpBl3RBDy7tQ8Lc4JrapRNatcDAdhMBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI8OBz+p76ZtQkZp67XHednQ9tclK09SXaM10zuGw5NqMfqNR3h
	a/lgUu09xWp4QBSjjUXQmbATaRuVsMmVlR7+nVQq4pU/HahCNNIDHYzg
X-Gm-Gg: AYBFou02ZFvIOG+MjpY/wRJOqY6oWwvCb1klR/1K1yeZLxvsfYjH2ek+lvaaHDwUVDW
	VtbajolqKzZ1Kw05cXJyuBLGk4ruixWq+c4ntFICm+qkNiRBKyhh+K4xQ0yxjdY3kA7/YahK2K0
	cgCwZ0DzvOSau2vJff0IbJPpff6LQc5fxBaez2gmGtvj7bk1o6p6hc2GOTE87eN1mVdY2Ay1vhO
	2QrPfX3gt19zypraaHxV1Cy8gYt2Y6U1bIMjYJp+eVZVoxkDk0fMd90XIWi2zbDYbJRR3/4pEuz
	5GBDXNM6HloO18DDjbJkkoYwa6VpbVuBYCKJ3QCJkbMHLPNzFSZbv/yDhNlxISYrFgUwSOm4v+w
	Z/MRcRLTqefX8/Ic4maWsxIHmhnA9HxSMwHY52lz4tUNjU12LSvtaign7PL9qlt+kINDCOPbGjJ
	G9loEGyyW/Uitbo6aFg10pUiwfWN8chnHMzbfhNojA9cy4IxKlk+ewekrrta0XKw/huzvjQRWN6
	+HvLdyG8tIlpW0iWFLUkIQviJxcI7V2nl15NW57RHTA3nIH4cAQqE1lUFuLHBTmxNIxes0bt4Nv
	4ewCL+wlOgOB6KyhCL63c3yvZPq1heqbhemFSqIy43BpuuVkuWnWrqY5zl/k7j33rHL1NEplvno
	QK+MdGfFr/PigpCunU5hCLGrn3GYnOy4tCWQ+qJaKvdVd
X-Received: by 2002:a05:6a20:e290:b0:3e2:9b9e:7efb with SMTP id adf61e73a8af0-3e913da171dmr1397626637.50.1793260958888;
        Thu, 29 Oct 2026 01:02:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc682d8sm5059547a12.18.2026.10.29.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:02:38 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] ASoC: google: Fix frame size calculation in pointer callback
Date: Thu, 29 Oct 2026 15:01:41 +0700
Message-ID: <20261029080143.12304-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029080143.12304-1-phucduc.bui@gmail.com>
References: <20261029080143.12304-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

runtime->frame_bits is the number of bits in a frame, so converting it
to bytes requires dividing by 8, not multiplying.

Fixes: 702648721db5 ("ASoC: Add Google Chameleon v3 i2s driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/google/chv3-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index fd12cedfe1c9..6353b2a079cd 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -234,7 +234,7 @@ static snd_pcm_uframes_t chv3_dma_pointer(struct snd_soc_component *component,
 	u32 frame_bytes, buffer_bytes;
 	u32 idx_bytes;
 
-	frame_bytes = substream->runtime->frame_bits * 8;
+	frame_bytes = substream->runtime->frame_bits / 8;
 	buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 
 	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE) {
-- 
2.43.0

