Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8433B44D03E
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 08:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981924; cv=none; b=IK1Xzk61F+cLFMc6QzxqZNIMZ72YGoL9rAdEC0y6g9uk50DAwarEW6B1yzhAXjj3fFZkeznkffyd+uj5OurcWJ9dpg6fX46IzJ+FRBAAPechxrZgjrqgeNQojsfzupHM91NTfPxMs0ip/0GyJV/7B6tQOYpZz23tGzZGkn6cOgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981924; c=relaxed/simple;
	bh=tC0YGMm/KhJuWZyRjORcdoPTpJ4Xczzf731BO+VkT7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8KCPE3Kxpo9Ap9siRMUyvhSltiCmKKvJ9B9KddYFLuHypIaBTGnj80msdmF2eLZBGL4dvZH0myMatsVzGhOdA4iarhZS2fQ3BhYjn5Cw+Qf3dCbmYeuJbA3u463DpL5j4EvCA77vYcQQQwF8kpjPYy3Xunqzu5HUvcmnIaIwRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5tvz/eh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5tvz/eh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso1190578a91.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 01:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782981922; x=1783586722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2H3EPpox//CfhCeR4d3j8ebYuJ/0AFhLubgcA9uxdg=;
        b=E5tvz/ehOJCP5u5AHIyVC2Au0GahonUeHkYi0shDh/KYYTxXtsG1X4c6iXdDQXDSEN
         tU660HGkhQMKpfWuCopa+ovfcv7nzjEXtQVtdZgYDEUXzatkqatbWOCIA8X/3vNAQ2Y/
         Es72+lUgXIauUMk9VfKAbZcspHJV67BxtdLtk1smFwRpiKjd4WMj4KKMCxNjKweiVcOm
         4hGQ3Uz+ON3L3e5SKrL9H384M/j1pXIZd432WEWPvb6/5F2CpQmbXNaMbzLMLrm3o0j2
         KQp1EtJ1nSk6QhmfyuzfGXqT1tZvXnd6GKBNHVRQ6fYW/WFEEuZjEac+RfCgyV5dBtWv
         Oc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981922; x=1783586722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z2H3EPpox//CfhCeR4d3j8ebYuJ/0AFhLubgcA9uxdg=;
        b=aK7XP8f4noLD3Tt8YJ0HzzY7SM+Ndo+3sMXzzOz54Tmd4c/Yj7BcAhWZ1JfG6unqJy
         sK/EkW4uPm9XL+I/vALdUaU544Y8l6rI6jZLR0tY7tdSrLwgtpfCxLQQUY2EPYPpiBFH
         yUIRNaNnBAZkoGZz4cS4GniVN8PGuvTHk4aiu06kf912RMzCoF1EI6IyCHtriVndgmxp
         5dH/feOoFbwJwnZRIDvmfUVGfEb2AOfjFEkQ/WQlMGPgIkiWx7UqtfAHatgXM80+KAUN
         YtWxVfUBRN6kyDXsnVrvUL18wTa9jwNRLfoRY29okv55Ck9DXE3oy5D9N3KA/FoKcMTq
         dRRw==
X-Forwarded-Encrypted: i=1; AHgh+RrF1iIVnTlOQX54MwZ/3B3lrb0SGm4S0533HK4AEtq8Q4vErnS56pnOOf5bJOCY5FAgkcxCumWjq+IoqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQzbvRt+gISfhxfPL9WVXct7YrVYH43ZyntmHoLSLEhvAFJ/GT
	uhteg59xNF7c9ziZ/zrWIGiEInPywbRG4se9cAn58RJXiFrFX+B5OWAn
X-Gm-Gg: AfdE7cl0i2eWSmk6s/Lrdo/7I3kkIkPCVLtx4GRW+uETMpc7Cqj68g/p31X6z6e+48Q
	KQRnHZ+QQ+Uw0ttsrtPfP80W1tjAVRdT/p8jRSlftCLVwy98L1imYsv/fr6KbLWnQvf9fbG0dNy
	YfFn0rYYiI2mTWu5e/ZKDZJxOKQyxuCvrnQRHt9wyprDJGSBjH37KJYRYB6dITlng2ItnnR07II
	W6ky4c/uo2eYDJ1tMkahVxhCEIhXSIO98mvye7APYuOgaISuyuAwKQKt4hxM7ghc1+ySVDP95qR
	sa2H3FOvjUu55H6c0BYjHyH0wXGnHT18HMMiN2NzMmls9BFY1bPNKTq6DFrqxzQ+JsRyGQXytIv
	ZoX5c2E3BTd92vosH1/2Z4Y10TY+yCCNE+n5BMW26Cxgo4CnHv4MqhS6frjxGTr+WhI89X+vYSN
	Cd2T0vwsOKh3Zc8vhE2ZmBfEcU8I8IDN4tXNTltFhxNI8BFho=
X-Received: by 2002:a17:90b:2dc1:b0:380:40b:f30a with SMTP id 98e67ed59e1d1-380aa0b6894mr5087769a91.13.1782981921650;
        Thu, 02 Jul 2026 01:45:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e18fbdb4sm693955a91.17.2026.07.02.01.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:45:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: cassiogabrielcontato@gmail.com,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Ziqing Chen <chenziqing@xiaomi.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	HanQuan <eilaimemedsnaimel@gmail.com>,
	Kyle Zeng <kylebot@openai.com>,
	Dewei Meng <mengdewei@cqsoftware.com.cn>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/7] ALSA: mixer: oss: Drop redundant nonseekable_open() return check
Date: Thu,  2 Jul 2026 15:44:39 +0700
Message-ID: <20260702084445.519669-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260702084445.519669-1-phucduc.bui@gmail.com>
References: <20260702084445.519669-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

nonseekable_open() always returns 0, so the error check is unnecessary.
Remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/oss/mixer_oss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 591cff800329..f5bcc7896542 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -30,9 +30,7 @@ static int snd_mixer_oss_open(struct inode *inode, struct file *file)
 	struct snd_mixer_oss_file *fmixer;
 	int err;
 
-	err = nonseekable_open(inode, file);
-	if (err < 0)
-		return err;
+	nonseekable_open(inode, file);
 
 	card = snd_lookup_oss_minor_data(iminor(inode),
 					 SNDRV_OSS_DEVICE_TYPE_MIXER);
-- 
2.43.0

