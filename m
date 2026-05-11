Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B706934D4FE
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 23:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778540651; cv=none; b=DnYn7UHNUc8qFu00jOJnvdfO75slV2bkD4Lx5HfpkU6+jgvRBzUnNSSJxicBm4xfQYoVwN+uWYVfG5vyuB2VfpDCLwrfULJbuq57QGvi/cn7E7n/yVyfEzgYVTiN1BZ5/ucrb2nV5GwUDz5Muw6eWqk6MgAjfkO0dhjYbR41wMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778540651; c=relaxed/simple;
	bh=NJJ4z58ntZVJJWii5qhpclC9a0GKXsR5xIhQMcW5Wcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISLrOs2M1ww1h6Hps153mrBj2pprmvIYIuYVBvjh9PNLz5ZCLAz6apwLEX9MYYN+v0qA6jat+5u7tyCvUmEA5RDBZiLkdrLyo2Eou4WATl62xHx0kNnBFbnNYKm++aGUVTpBfKngKZu1evgSUz35eZU1nOnd8+UbCm/c+THz5Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpcXDf+L; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpcXDf+L"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82748257f5fso3590790b3a.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778540650; x=1779145450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WFUfTZlDpnyX7Z/idAd7wH4ivawSmxAe2/AUBnbZWuw=;
        b=PpcXDf+L9PJZgIYioTG2Tb+Md+g1a/MRi+2zY7f+SpI7f7i4nc4SORNmXCw0dBecUN
         s06N2vN7kR0oYMcJHmLUkpHx5gvgxyQ5npCVcgq1JUrZumK/GjRZDepy1i2npUdgYZhD
         2FK2PpGGrLk+QVRJy5cGXGuAHP2ahnTK7x6PCndSS/aHHDvgRHM86NSz9zEVBrMd8/vS
         wb+anz/IVLrpoLMK4Tx85E4Rt0G8cRHlWkoCUA1R1i8xORFnME2Jd5fjTDzhL4WwbTnO
         t6vVJSPkLulbr9VUqqjJkKYgElefQMFD3Yc/DWPlwnrqwcd6640GoImVl4bClXi8HE/s
         9cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778540650; x=1779145450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFUfTZlDpnyX7Z/idAd7wH4ivawSmxAe2/AUBnbZWuw=;
        b=V3x5sAAOsSCx+MZEKQShABHCjq6X0TP5il8u8QxEYp/h+qOsSTHMqrFKjYor+k07O4
         96u1rdzu4muTRRQNxr2EQox0Vy5drSjYWFVmJzcAJZWh6GDGKzFV+RJhV66yxymFlPTR
         x50GtRYGrXIkPKVwCoV3hJJVoEtWVBfIjQ1mi+Z9agYJJAizw30U+SlxXfR94TwRayBo
         qnIUuHbzRv8jE9Qa+dw7OQCTQfWC2WMg2hYx7pzyAcJgyodadFpMDoE1A5Hs2IFe+isa
         i65EORyWRIbqZbLwN/3YCgh5TBKBCY3PRAyF2Qu7u8x9H6tZYtDrIDJwtsdThO7NaBcu
         TXIg==
X-Gm-Message-State: AOJu0Ywj8ckc61dmkSlYGZtMLyofiXhU604bSulti8JiNgqAJxh2yDmr
	4Vtic0bUI3P2lJBkcKqp7d8QOWRr8DJdvCTnuSlyF6GVnr2MW5rHK5J6QynbvAPk
X-Gm-Gg: Acq92OEm5RAWbM0V6qHcJwmjStOFmJ+MSVAT6kKOD+T/suYnLvnhhS78q8J6Qc4asPS
	YigIOcypNj5jDkG9du23l0g2jqwf7QtAcWy86A7tgp0w5EU9SGj9vDkxO5fVYoUuy61Gla1xjJA
	+TeCG6hPff8YlMd+qwrefdmtGNTrWhcAezFn365nBYpJpCLsU+vat+DhxG+ZlRsI7BHr44Zt8qg
	aT9LlU7YX7g8TlBELD7kc2DHyRrX8w3lrPtDy8FaeyrRHtq5ymjcBmUDeWx8EsVO5UI8M8c4ZFu
	0RRgq+fzv0dN6+nwiB2yZOI1vPApcq7fJd+K6G0fvwexzIoONOSPHX8Gm6gD6Olfq4N9Q2OzBlO
	u027VtSVyV5v2xOo4beXws/T/BQPV7yEeRE75OMmhBXYIFfJoZ83zCBhjjHsCU6i2x7J61GtKY2
	f4UTM7znHhqD7fsb06OijOj4YL4qpxU7ndl+tJlijSxRnORegj/bBNW1XgGIBXHIenuiudQ6tIg
	muXxwIz099t+Hlmc/MD8RH0DvzMuVn5XTs=
X-Received: by 2002:a05:6a00:f0b:b0:837:6bb9:acc1 with SMTP id d2e1a72fcca58-83ee8324f2cmr1077588b3a.13.1778540649580;
        Mon, 11 May 2026 16:04:09 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83962e7e3fcsm25992172b3a.0.2026.05.11.16.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 16:04:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] ASoC: sigmadsp: Use flexible array for control cache
Date: Mon, 11 May 2026 16:03:51 -0700
Message-ID: <20260511230351.28868-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocate SigmaDSP controls with kzalloc_flex() for the trailing
cache data instead of open-coding the size calculation.

Annotate the cache array with its existing byte count so the allocation
helper can initialize the counter.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 sound/soc/codecs/sigmadsp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 3343dbb63d2b..2e08fde3989c 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -35,7 +35,7 @@ struct sigmadsp_control {
 	struct snd_kcontrol *kcontrol;
 	bool is_readback;
 	bool cached;
-	uint8_t cache[];
+	u8 cache[] __counted_by(num_bytes);
 };
 
 struct sigmadsp_data {
@@ -223,7 +223,7 @@ static int sigma_fw_load_control(struct sigmadsp *sigmadsp,
 		return -EINVAL;
 
 	num_bytes = le16_to_cpu(ctrl_chunk->num_bytes);
-	ctrl = kzalloc(sizeof(*ctrl) + num_bytes, GFP_KERNEL);
+	ctrl = kzalloc_flex(*ctrl, cache, num_bytes);
 	if (!ctrl)
 		return -ENOMEM;
 
-- 
2.54.0

