Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0D5283C89
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852394; cv=none; b=s5M9gsG8436v/S6mmGZPY8xLQkx4Fpyr6mv+3yu+r70XpKkL6OgUzIVaQ/tGL0jZ6S4k67rhvyaojoiIVhY549RclkAaYHZyGbOh74GYILWvMkZcKn1c7hS4PE7fQoSVgxJLCBu0R53LZb8l2+nxgad4nY94E0Jho4LHKQk6zzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852394; c=relaxed/simple;
	bh=sEgcOzdkJB4i1U2lvGg0wbqZtIVnk+4CCknJx50DshM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J91w1S4TnSN/ApeCI5plKIIJTUiGJ2dhFirUDhzAQpKdnbo+UrAvxj1x32fYd4WoIhLkypd9FRIZmV37B4PbhF1fvtABxz5d4F/cuahrso6ui3w90rEUea9MSOclduYh0rpLcz/h5WZUQikznaN/KTlOScETVNIc4+r425GgU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fHyeLxZl; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fHyeLxZl"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso9639229a12.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 11:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852391; x=1769457191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgnwvaXk3Vj+g4Vws4wVhdESpFwwCWsk/73Dv32O4Vo=;
        b=fHyeLxZlw+Rp5hh8Blv55sHk+xee3amcUGbrkyxoHHAQFJMc+B505xvmMcXRmoa2Xr
         bm6Vlx4WrekuQKAdhBRskwMv/vi2/xmTuH/MBt5WD3cEDB6YJUBYnS5DPDaLiSnWb0Lg
         ozpwDhRzo8TXSFy+YJMZNQNt+lGw9+jwkKLWEBYG/S4HoGRRhUqvcZ3tdA1T1Opr8bx7
         eGvI+FWs5Bt4H9AolOpiTMh4LdGUDTsaMF9QRnQB4TrGYB8/JxXEnpEA9JbiNmdNyQY9
         TwR0jkBK/qFXldvtebFVfoDg/QupN6SfaGIr/U2pDk73w/TqOv+61ed8SLP8Zx4MGtxB
         yBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852391; x=1769457191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fgnwvaXk3Vj+g4Vws4wVhdESpFwwCWsk/73Dv32O4Vo=;
        b=Ea8PGaAgjoxNoCHjBAq8X2zRuV83cvIhAA/Apydgk6UX3bMMjtr4td8GbwL63wfQBN
         AQl4OxZf4pV7vRjEUb0gG5QeSUP5l1ZFVJFoqTWtjlHnXHKn0wu6F5itEmi8hBdvcVpt
         9s1pPlLNgj0l58b6ehybNAeHx4+N8gybRzBqRexf2d5yWfNrictSPHkmm6wLUy8aSuX5
         ZK48sISG4AQ2/xRM14NVWNRS6kMQRwxsfmNNFksVDA9PJ72p+CuhKU7hIKynQqCKTENa
         +IYPoZJxg6CXRigGUhczRwjlk4IcTMaMdduu37zSaHsRQLIeOjEvOiAKvxMaoWbjO7+t
         iABQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlejjBRM3pWAXplYLhjmcnkvkKA4ynKolErLyjfYxjafjbcsbq9yHhFV871audWFBB1iHLvX+AexxjAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHjUFnb6e3+S8B3hraaYky5LXMGK9pBQ6+qS/pPz9x1/8upmq
	ZIZLS9m18Y/+VAvNByDFtNNgydRZjzVkDhcfmbGKGLstECb3OFrstAmMTTu0J0PJk+Y=
X-Gm-Gg: AY/fxX6W4LNJ9xetEC+SxrR8g9WTRcjuPKjcBRJUGGJaQsxIv68JSpTmeE1gvMpFOQK
	QFenyvwwB0a+YR+1bsj2lP98gysVEBq4RD4XifSH7k+7qoTkdJF0ReGf6LZEocGbNg5OxIhFIaL
	7sXkKLpDVexg/PM3TKNGIoAj6NNSDbSACRjkVyj7vzGIK+NcZsnwzdL+Tc1uVCLKePizOwf2DoF
	nBU9qLdNCu5xtWKhmULmilzHYXVxTL3iiJ0s8N3q+BufSjNvuRBAG2mgaVT6Df1PmdZwrh/9N5I
	i6ATYOeS15l7JaoXErImbBBjbRXZQxqhrYWY5JUswn7EjvchOEUfzJIdIIj39Ll2pz8VqUxunzO
	N4+pbo+cdhz2fafvg8QSwoPFBfpE82LYrDS6AXprG2cUfJb9zpbA85mAW9B5dpDeiRn3rTKAbhS
	kQQGfxWJGefc+Ehe431XafoQO0MJwo6vdAO7nlprM=
X-Received: by 2002:a17:907:9488:b0:b87:7634:b20c with SMTP id a640c23a62f3a-b8796b215a4mr921693266b.38.1768852391173;
        Mon, 19 Jan 2026 11:53:11 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:10 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/4] ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()
Date: Mon, 19 Jan 2026 21:52:49 +0200
Message-ID: <20260119195252.3362486-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The code in rz_ssi_stream_is_play() checks whether substream->stream is
different from SNDRV_PCM_STREAM_PLAYBACK and returns the capture
struct rz_ssi_stream in that case. The logic is easier to follow if
substream->stream is compared directly against SNDRV_PCM_STREAM_CAPTURE
and return the capture struct rz_ssi_stream.

Use the conditional operator to simplify the code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 5909778a6a70..35239ed7f916 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -180,12 +180,7 @@ static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 static inline struct rz_ssi_stream *
 rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 {
-	struct rz_ssi_stream *stream = &ssi->playback;
-
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
-		stream = &ssi->capture;
-
-	return stream;
+	return (ssi->playback.substream == substream) ? &ssi->playback : &ssi->capture;
 }
 
 static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
-- 
2.43.0

