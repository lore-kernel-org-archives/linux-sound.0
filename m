Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC7417D60
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405287; cv=none; b=s5bN+zTXfY1SI9CjMaw1tpIf+0buwToVdtrY2qsNWp5ti3HO+3GDBkk3p1riwx1/wUeIZkMGM9QxfOQ6Q8LwBusCZWPFE3VNdwIryt37Cz7BOcyIX3f92nKhHQRWD83knT5VydLFB4nhnhr7pOARYqnHK3rV75pMZ2/ti/8N0P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405287; c=relaxed/simple;
	bh=HCK3DHzzTS5ZoxKILNZkRTEwr07OI7YEoYg+8ShD6qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+Y2HrvwL16UK7j7MXdxv3PbH4N02VBPywJxA5sPC3MTrjveTHGfk5ocpCsZBhcyu3tavQEC/DeMA1epZ/AE/Cc2Z5aJ7RbHvw9HUJsc/dqS8c3o8asvsjpVvzIYfJguj7SzozmekFmsC7SGdHcRDflORAV0aSWOrkPES7A42pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4P8LNqB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4P8LNqB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ceaf8a1265so24473895ad.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785405286; x=1786010086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71R1GLYuIWI1vsOmM0wELvCd5dATq5UzCDfvq0UQp10=;
        b=N4P8LNqB3Z6oMA09FfCWoWnhjIM5Wz4l0cl0QxTIhLfDS9UtwlEHHu6edDzR6NKlz0
         ZQik5gODYdjtEgwXzfw387cg94fvprLfi+PczqaBk0WXC9Y8466l50khHg9qyleIUyc9
         Ub3VU+hJSS+08LCgth1AECKJVNK6AyhMfwpNQkTaFXWgqmmhscK7dhEAnf44QEf37JX/
         7NDM6ztHlQMbiqVRlB7qJYldHmY1uXQfKnZgKlcWuP7HGjiuyW29Tv0+OnnAkYjx5Js6
         GTEjrf1KhQyLSL+AXbivZCJM3OLlevfOZbyL1jym5vqZQsyqNx6N+vUw1X5fqDTruj6G
         ubhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785405286; x=1786010086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71R1GLYuIWI1vsOmM0wELvCd5dATq5UzCDfvq0UQp10=;
        b=GXIravVV0kXgkfq1DgwovzLaRTYnv/rbZKXtEIL4GOGUgdD1TT4efq0EVJ/3NGrOLM
         uhyl5i1MlChYJNAslvguGbOX6zc3Utv5Rj1eUCTeuzqPLnsI4oyLdCLNPEbhy5TpVAcd
         3//wgZnDxbDsvC0RIWeu7gNNW0eLKOd1n6Dh5ynxKR2ejwqNX7SAb+oEZj+JwHUNeyXZ
         oAvrt3xOTPigzoKnktBIDUUjFx2yYpp8wNAG0L/LbABVdTT8Rn9zomsSsu8kBknVsOeV
         s/lSlmUMvKBdhXhwCOJJqgUt1xHWBzA02NEVAUFq/zJum9lM5zbxSsfF4mwa7eVUHfFo
         lvrQ==
X-Gm-Message-State: AOJu0YxPiz09eDA3CQjPUitEkWBbHJ8pysB08bzsCD+TJvTJ0JyWhXS4
	SMfXXZrCXHxtIKcri8BJqwwCwxcmJJKSJ0PBkyNTEuAj9ESQN1+cVls3
X-Gm-Gg: AR+sD12pQdRKoyXOBBfz2DlGBD4TP0/9Bah3YGxIJt14Csa84yf7IXLb5lvzSggkFXP
	T2//NY58aMvRc0y34sdm3vya7MlLOxYN2sRSDvOnn3VdBoWvaDkh/KiLMDPr6UmV7GNFjH4A90+
	8J/wd7T8lV/DbFQBd6ZiHFSg/kVbEf1R64SD8XHJ/uOcjVhd7QSyVDvhrGWsZU3+F2u+nyYQdwv
	XaEvbR78dJLmppihfi7Egh0HBJQIcQmfJQek1ih3n/wTCOvZ44WzO5kAHlioMR6u7Q0zhkwmE/f
	dl24Dgj9a3nhNCDSw2PppmXVZUv2A7ZH9go/fsm7nRksLxVK0Goe3HVuDtUTnBQkLy0ZN4VqRqu
	4tzB+FUp4575IgFWR/ViLUMveBaWiNM/kd+h1eB2sddjw3r8TcClKCpgDngVlwTCsYsPBX03CzU
	yXOlrLhJH0sf9QclvcOBAvnBMx78GhBxSZxRTlt0fhgwY/zTyoMZwkSKNfGGRAH44u7TGYpOruG
	lkogHxn0YnPpWPA3NIOq9yf3wzR7uVilmV31867GTKewa8AbpXdUJUquBE81gMOA6JJrYsiJtqf
	nn3Z
X-Received: by 2002:a17:902:cf4b:b0:2cf:ba10:6d6 with SMTP id d9443c01a7336-2d035bedd89mr18879235ad.4.1785405285918;
        Thu, 30 Jul 2026 02:54:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2dfb1sm23982345ad.72.2026.07.30.02.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:54:45 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Tim Bird <tim.bird@sony.com>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] ASoC: spear: spdif_out: Move DAI probe callback to snd_soc_dai_ops
Date: Thu, 30 Jul 2026 16:54:07 +0700
Message-ID: <20260730095407.33894-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730095407.33894-1-phucduc.bui@gmail.com>
References: <20260730095407.33894-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The .probe callback is no longer part of struct snd_soc_dai_driver
and is now provided through struct snd_soc_dai_ops.
Move spdif_soc_dai_probe() accordingly so the driver follows the current
ASoC API and builds correctly on modern kernels.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/spear/spdif_out.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index c06f09c646a8..01dc2cef7448 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -249,6 +249,7 @@ static int spdif_soc_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops spdif_out_dai_ops = {
+	.probe = spdif_soc_dai_probe,
 	.mute_stream	= spdif_mute,
 	.startup	= spdif_out_startup,
 	.shutdown	= spdif_out_shutdown,
@@ -266,7 +267,6 @@ static struct snd_soc_dai_driver spdif_out_dai = {
 				 SNDRV_PCM_RATE_192000),
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
-	.probe = spdif_soc_dai_probe,
 	.ops = &spdif_out_dai_ops,
 };
 
-- 
2.43.0

