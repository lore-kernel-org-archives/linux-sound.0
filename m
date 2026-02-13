Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128436213B
	for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771003484; cv=none; b=XJRoaScXDqCBS9vvTTMXSjxQKCcZfr3azMZhE3Z1BMh0QbaA4SBX2CKV/kD0208EqPC6jOEgq053NndvsdXJ9Z1Dh/tIuCjk2TFcy05I76TpYS6mnnrSHE3JcbSjOgiH7gGGizDTdb38F3XDMUriroeqZT3pir/Ye++F8jRphc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771003484; c=relaxed/simple;
	bh=ZJTe3ERC+VD+X7F+RyeaF6x+oVdC81oxkUJxpf7zUuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EC5TYO101678WUCyXY5hVMdNHNnEWEKc8n3OYU+8wOJXBwlFdm3K89//JxIviv0WPELwjUSTpMuazbs9mjdqJmDub1COL4zpsD0TaFzBz2AUi15Y+5jLNq7jtqk/hRE5+0nZSxEOJYqqqR4zOMQnqKKy15zgo/X5yNl4n+NbAJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TX2XHw3U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TX2XHw3U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4362c635319so1133930f8f.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Feb 2026 09:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1771003480; x=1771608280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1zG5+UDdMMHpsekyaasD3SxdlSC1EMGJd2kbTx0zrDE=;
        b=TX2XHw3UBKqV9yO0+BI8SxuDnlIsknR5Q/7bYaI/ePp0mCJzZqxIqsKFaXFUZA/JTD
         j/cfZn6zZa96iS5N2Ne5Y0/Xi+M04zJjCpqpjTS+9QUKSZTFiBCGNdVcvZCsdOjNYNUy
         xUGYzRDMtCUu1WIYOCqxPy/UEctT+O2o+ire2xP7TRjQbi/vaNi3r/f2lW2nJ4Sv/7lU
         F9TAJHV6fx4E2YP2gjlh46cSg+gbAY8GVbXAekMsGsf5ylJxos74xfhmUw/wyxAYOTf/
         jmLLg2dj1Aw6SBB7b99VaMuY+qCmFsKwzG9DvasFU+XWco+/92tJfick8qflcDByWxy+
         Xd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771003480; x=1771608280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zG5+UDdMMHpsekyaasD3SxdlSC1EMGJd2kbTx0zrDE=;
        b=lUtyAVKkzLj0qRD08vkb+1/eg6TA36vo5svu6B+sJ6QwHjlRw+tH42Dv2riIC0np29
         DkSswBdO8lX3SOCKP3/BLnsqlj3CwFpeCOw5tRnEFODA/iBb5aVYyMYUo3oTgs9e3LlE
         4R2wjUlJc+Lal9fYXU1YlyZKFsc3YIkEFTR5bpYQskDEIdqiIohDRbjx6/xgtlMeJTts
         XZ3TJVHSey4OcbtmWVSZM6Kyq2o/oQd9QsxABZpdp2QS0m7KCNxk8kdZXgD592LfexOX
         QIqMjdCSAQ85pNiUwtfEmx6WASCtUNBXBaIDMw/SWT08gkvGE5+AryFK6/tdwwGYIuDp
         tVCg==
X-Forwarded-Encrypted: i=1; AJvYcCVh8P/pLPAiN4I4ctSTWxgkDZpYW7PYp7O4qvRv6x8/JWjsscxvvyASKdM1Ll0HHLtcGj10KSOefnMTBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR96ZjdBD1LPR0F+jF8iO+i8fvZ8mU04+FmJLQ9+r4aGHbaqJt
	VMBo9NvOimV/YRpHFjkySGdpkH0cNwbWEz9msSacZ1fi7XtLdJP1+tW7p/Cg1UKkqF9ltCk0F8p
	jyBY8
X-Gm-Gg: AZuq6aLsF6TthMWQhYCGQmW6qSSgCax5jFqzW/+keV1kOlcusW/JQTvpjlZ5YaoCdI1
	wZBf0YrZSRmGlzZPRj64yKvTEpQ9Ad1QNipO+D+HZMTTPsTq5b7LY24mTe9zwFCdLupu06GjCHq
	UmO/S47VYHrnFm92YpXop2OMqNZtPH3HCdP1kqWE2M24tAarV5+VPcu2uEaMgjZh6BaS/erSVUj
	LMoXNVm3u+LZq2YerHCimgNoOq3b8ZcvICoKyO2aSx7KFJ/38B04Hg69246tY5lsG+yrX1aOKpi
	DqoIGt1/1B6xCtdahM8U250bgLVBarlzR3bd9VhPi8GTPj6s3JrzI+tYwehFN1a4ms5mBnYGw2n
	3LNWduaK+cBP6di+N/544rRkUE5rxqsPyhWtjInFIXrrOVwbnmLj8XIHHsL9iruFzYiybVHPaoo
	AFm/3VQqhHYIwUEUQcwV5RzlxruW6HLvEdMnTFPK4kKDJuBdNDYyom
X-Received: by 2002:a05:6000:2905:b0:437:6ec2:b110 with SMTP id ffacd0b85a97d-43797942efbmr4671769f8f.52.1771003480135;
        Fri, 13 Feb 2026 09:24:40 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc85csm6782557f8f.22.2026.02.13.09.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:24:39 -0800 (PST)
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
Subject: [PATCH] ASoC: renesas: rz-ssi: Fix playback and capture
Date: Fri, 13 Feb 2026 19:24:34 +0200
Message-ID: <20260213172434.3801015-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

In the current codebase the rz_ssi_stream_get() is called at the beginning
of rz_ssi_dai_trigger() before rz_ssi_stream_init() is called.
Since rz_ssi_stream_init() sets the ssi->{playback, capture}->substream,
relying on it in rz_ssi_stream_get() is incorrect. Fix this by checking
substream->stream instead as the original code did.

Fixes: 53dfb2ad6fcf ("ASoC: renesas: rz-ssi: Simplify the logic in rz_ssi_stream_is_play()")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 39aa865bdca3..74e078c04150 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -180,7 +180,7 @@ static inline bool rz_ssi_stream_is_play(struct snd_pcm_substream *substream)
 static inline struct rz_ssi_stream *
 rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 {
-	return (ssi->playback.substream == substream) ? &ssi->playback : &ssi->capture;
+	return (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ? &ssi->playback : &ssi->capture;
 }
 
 static inline bool rz_ssi_is_dma_enabled(struct rz_ssi_priv *ssi)
-- 
2.43.0

