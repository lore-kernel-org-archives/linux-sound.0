Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950E3B71B1
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544001; cv=none; b=Ztyv44XBBa8elxQt+9t9o32fSXYhwJjeyvVLGoGwxydzc+2QNbNUXE36rLJe5F9umhmFnrKVITIPBfWV/jOFsShi6p6v9L6g3YQ8rrDtOECLZ3F6U5Mw9yt2biDxG+Qm6d+CO58VlBdNMQxBaJc1oBzAmOaGtBJFyzsrRk8Cay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544001; c=relaxed/simple;
	bh=QDjjIKqtytZa5TLKiM1E5gSLa3jkNbTkYeP0ySI2gfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNT0slytqvhrU3ifYtpeXtctfzZ+n2IiBsk6mCv0B5hqT8xe0ms6V/h/Kl3l9n7SnDPl5QLCJ5Vk73S+kDAiUg/ZYB78xh9aomnd6+FcK7qKZ+HZuo6d9F5aI9YwPBn9mfaUUax/URpzXFD0W0+ewE/Pb/SX8h/dL12hC67XrQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDBLLAZV; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDBLLAZV"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca88130e09aso6309157a12.3
        for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784543998; x=1785148798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrmbsxV1twv3/f3bjHkEVIMF4cyUsK8RkfT7r36jqR8=;
        b=BDBLLAZVJtWX0AgBiTtuTUOfjWZYK5DJfMzg6F1cFS0qjI4SQsWsqbymMT7/501WL8
         24fGkTafE4ob6reaLxn6K4UoldXv2vxOAP/MCWyx1VHUNZNiJ+8ZcRHnzL2dV5xvOv9Z
         3OqFbaCmqmrqjzcpHXuE/Io7sqPVJoS0eZueurNnTvIdV8qMTdoKvR8cqYL6BrCK5FsY
         txVN29ssMOmCOROV4PXjWG392aSvplZJG0DGyubiN2rauzCQm9kvZlbe6vtMDPQ8FIU6
         hJHfKa5SqR6vqeO/9y32M4P1cpHEjqqJFtHHiWaYkHRq569sOlcIgDc/GjHS52i01BgK
         0Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543998; x=1785148798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NrmbsxV1twv3/f3bjHkEVIMF4cyUsK8RkfT7r36jqR8=;
        b=C+ExgGlkbj6ACaF5IbMfjm4Hxu8bqNv3FBd7asBy0O1nuP31HMkS27oS0iXBQNw82A
         6/eAROtprs7QeAT4ETox9YqaRE8GwXheTaK1/TduMEnMuBiTEhlpaEF2grA0TmqQ5NPM
         IFCjYbq5GNDI+ogMLCINCVheFNmxEPlnEA6v5gQDIbqRlXyupkhMhUmU74i9EisxeHLu
         03Ow3g1+UNtE5K/UVh36IWHgUgk9G3NWY5abn++J2KEExACRzLSKl7XnQNgamj7I41z2
         8/V+iaooMFFpknDTmhMeBAen2/zU1Ln2fxJc9oq1G7L0waAMLN6c5rfi/YePwoqPprEp
         84tg==
X-Forwarded-Encrypted: i=1; AHgh+RoMRaqJ5uOU7b2qTOxX6R+tdcDZ5EgrK1lJZ0LZXOJ8rqA1xsaly3sfEkqswTUK7whXJbqrj2IxdLBH2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY1rk1w4y317kILc0620ja7cY+M3YOuRgFGnwnT5f+X3FFpKn2
	LA5XdTPkUw/5tT1mQVgaR3lShjA5XDpEn5jxGMCUSZHCSX2idbGj+k/R
X-Gm-Gg: AfdE7cncBntZpfM7pdrHyDiGhdfy8PPTNEvk02lKpAR/kxH486WU4JggzO4XSjRtIb1
	FcswCdB+Vr6BAq61PGUltaGE8MHC5v4ymG6dht8cV7lxjoPXrX1ELRbBBUgAkUa8lhm0YU+jSZc
	aReuc0QnqQc0N8md7xuQIOJLYkiMi4xm9nV4g9Sn78ZbkaXasTdWH4B+BeqQjndk9EFmF+rB2Cf
	ZXL+yU4Mi3toXMjF3s6a1HgJj3RrMgnOqq7ffM1xIfh71iwYjyJcxyOwLUO7mLkpSBfshoBckoq
	CJzTGXYU7zVPlImFIr/SztkdA2taQT6t8M9b6ImZYaJZn2NMNbqZJ0fF20Op/kUuvODW+dvWydK
	oYDEMQrmuUgy30yWJulaM7XO+P8LMd83TM9zAxa8uzgRumKfdRvFdnTj3hWpSPx8pAJGaW7hWf+
	HSiy5j2nuZMj3bwKA6kXwaHAJRO6+2JCZV7u2C9NM37Y5FZxcf2siDf/XRrmGKnyU=
X-Received: by 2002:a05:6a21:3983:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c3ad5aed84mr14122872637.3.1784543998239;
        Mon, 20 Jul 2026 03:39:58 -0700 (PDT)
Received: from steellegend.taila75641.ts.net ([2405:201:304b:4973:59cd:5c84:346b:aa8e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm35145876eec.24.2026.07.20.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:39:57 -0700 (PDT)
From: Uday Khare <udaykhare77@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uday Khare <udaykhare77@gmail.com>
Subject: [PATCH] ASoC: max98095: fix missing IS_ERR() before PTR_ERR() on mclk lookup
Date: Mon, 20 Jul 2026 16:09:50 +0530
Message-ID: <20260720103950.14474-1-udaykhare77@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In max98095_probe(), the -EPROBE_DEFER check after devm_clk_get() is
broken due to a missing IS_ERR() guard.

The code intends to return -EPROBE_DEFER only when the clock lookup
fails with that specific error.  However, without IS_ERR() the check:

    if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)

is called unconditionally, including when devm_clk_get() succeeds and
returns a valid pointer.  Calling PTR_ERR() on a valid pointer
reinterprets its address as a signed long; the result is arbitrary
and is almost never equal to -EPROBE_DEFER, so the check silently
does nothing in the success case.  When devm_clk_get() fails with
any error other than -EPROBE_DEFER the check is also skipped, leaving
max98095->mclk holding an error pointer with no indication to the caller.

This means a deferred probe will never actually be triggered for this
device, and any non-EPROBE_DEFER clock error is silently swallowed with
the error pointer left in the mclk field.

Fix this by adding the missing IS_ERR() guard around the PTR_ERR() call,
matching the pattern already used in the sibling max98088 and wm8960
drivers.

Fixes: e3048c3d2be5 ("ASoC: max98095: Add master clock handling")
Signed-off-by: Uday Khare <udaykhare77@gmail.com>
---
 sound/soc/codecs/max98095.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..130b6694a634 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1987,8 +1987,9 @@ static int max98095_probe(struct snd_soc_component *component)
 	int ret = 0;
 
 	max98095->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (IS_ERR(max98095->mclk))
+		if (PTR_ERR(max98095->mclk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 
 	/* reset the codec, the DSP core, and disable all interrupts */
 	max98095_reset(component);
-- 
2.55.0
