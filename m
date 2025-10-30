Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305E9351FB5
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 10:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821745; cv=none; b=ga6airRR7XLGD+qhb+XAOis4sCt+XIWwJ32Vb31pGbQZUK5zoBJwywwGqW8jDlsb1Hlr4uCAXh26tbypcgsy8oWE7frYGNueMFb1RL0RGUeQbXocG3P+O0o5vW4GYuxiOTHvmbmL1HUUkMJ/qkdn8ek9NrrmTcjQ1TQClZiwhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821745; c=relaxed/simple;
	bh=Hs4hTUzQ6BSYyYqkQGWYwzMV6aX4ms6lWAYNhzovJs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5DwgTqvoj0U7R1E8WDLXFnj5agNNsrUCISj3954GWHrofzAbgSxaHzmG90YqsfvyiOE+et27Ev6w9hm6G/q/uOyImkJ2vnih7lg3sQZsmiKOkycffFyfU2uYXLJ5K7K/tFC6L52JhzyrvmvaIMdQAdlvvtgQrkB80/36CkrTfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+gFiaHP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+gFiaHP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7833765433cso1266989b3a.0
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 03:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761821743; x=1762426543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OdbZeLQdr2GndyflsV+Dqob/8hVKHQK+9QLhrbLboBM=;
        b=g+gFiaHPw4ahn+0h8Iwm3zpWIWdT3gdRf/eblhYcybAyuZq0sG4rZXdJK6qKutEoz/
         6UFh0yXg6rtBySDNXkaY3fIuUHrZ83hz2MKcwgft7AVe0hmB+gy79GJG3ZPEbhjd2hn5
         GedunSi0FE+HNpW528a5B/2Cynpsvx+pRmHEL8npyHfHO1EsgvlNtCZAgGyLp2a7wmzV
         MfLeankB+/4YWLjtvaMRByDt0CnNaXAS1AJ8kdINY07LfMxXw/5EfkDzEX+mH2zAp/2+
         EB++Q+Aq5YkSilFd/z3Y0M6Yukw5SkgBwC+PsjKB/A8jX3Atzso+lHkeKSRhkUQYe7SD
         vF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821743; x=1762426543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdbZeLQdr2GndyflsV+Dqob/8hVKHQK+9QLhrbLboBM=;
        b=JIs5yIG7PYoYoKemX6aDj56WkZPP7BLK7rqeB2uxTyqkTj3ddiKsvhbBAVTCH1lOIM
         OcOyfX3drYWHd5a5tVr3Nz97YF5mM+QJe2Qj2HciS2LcldOIsOb+GBDqGys/LyiYoZ8F
         bcswN/ouxNiZcrKwkEMtmzS6qGn3ZiMSO3Nd5RMTyyc0o+O7xlY62fNWXmbk/k3VrTou
         omErE/1bT8jlHhunKkBKeCeghuvmGDrK3F/hkr4mRm/w/34d2EN+79YJCL8gXhJroj30
         S+hAM8mGe4Vyt/k0qLg8sbrqD6H8AQW4AEjNbuWnW92r3Prm4XNN1uK2fnM1ntXuOXjc
         jUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaneys0OdUdeDMbbv1WO6Od1ZieVfffqPggteGDhOo3woBDJ/0zWhplerpI+4BzWK5DIT3qqcERW1+GA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmuOElkoayj1+ohQY/E936DGeMB5u8pgC68Ne8ZmZBQuuXQZg/
	Sbjk0GXw78pRqcd/dOfVksEm9wkt7FAQ8ivNsOYC3nxAsyVGbovc4GNz
X-Gm-Gg: ASbGncv+jaSXxMBdoFyQY+Jip5LgU2Vw77lZ8OUFDDJbIN6JbiDP1KfAbQg3JUavSww
	y8U1YwHU16Q+62DuLR9WeUHCRVZfSUyiuu/0wPapiuL27d7aqbEFvvncfAQTEJXRFwnFiBQWlZ4
	oEIc/CP12mQNmuXXLKwMq1OgBaDyJ7sb7rlzdktASXDyuW8cdZ9Fm78RhJ3w8KzRPcIyWLO6hnj
	nKheyma92eVZa0tzFInwUU6qaM66jojLLJOX4T/BnAxwJBRB9P2fpdL7Hx6xTfc5//HZs50AUvl
	6ywQdTQrweXwQe7+xN1mr28OQsuIUDDxjZx+mDAINmRFi3jujWjTeYfaxDV3GQIP+Rd9Z2KXIMr
	S8LvFU1xbC79N0xGAjDSvMDyb9M6gkzW8338i6LzKK2BeLYmbMpz6oUvsiob5CB+5gpFynQolpN
	yX2h1E
X-Google-Smtp-Source: AGHT+IHFHTgPiy6LdfKjy1W3MoUmDrMxQLVFdcBtTtfjMOw7wO5m5u9VK5UDUVwyvZbo3B6KYA7cnw==
X-Received: by 2002:a17:902:d2d1:b0:274:746c:b09 with SMTP id d9443c01a7336-294deef46f6mr82782085ad.55.1761821743235;
        Thu, 30 Oct 2025 03:55:43 -0700 (PDT)
Received: from gmail.com ([152.57.106.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3b64sm187367135ad.3.2025.10.30.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 03:55:42 -0700 (PDT)
From: hariconscious@gmail.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: khalid@kernel.org,
	shuah@kernel.org,
	david.hunter.linux@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HariKrishna Sagala <hariconscious@gmail.com>
Subject: [PATCH] ASoC: soc-core: check ops & auto_selectable_formats in snd_soc_dai_get_fmt() to prevent dereference error
Date: Thu, 30 Oct 2025 16:23:14 +0530
Message-ID: <20251030105313.32199-2-hariconscious@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: HariKrishna Sagala <hariconscious@gmail.com>

Smatch reported an issue that "ops" could be null (see
line 174) where later "ops" is dereferenced to extract
the dai fmts, also auto_selectable_formats can also be
null.

Add a proper null check before accessing both the ptrs
to ensure a safe execution.

Signed-off-by: HariKrishna Sagala <hariconscious@gmail.com>
---
Hi,

Smatch flagged a null-pointer check in the function "snd_soc_dai_get_fmt". 
But the same validation is already performed in the earlier function call
"snd_soc_dai_get_fmt_max_priority" before calling into "snd_soc_dai_get_fmt".
While Smatch flags this, seeing it as a false positive, redundant null check 
added to make "snd_soc_dai_get_fmt" safe for independent reuse (if).

one way:
redundancy can also be removed in the line no.174

another way:
to have a null check considering independent functions

Please let me know.

Thanks.

 sound/soc/soc-dai.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index f231b4174b5f..a1e05307067d 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -177,8 +177,9 @@ u64 snd_soc_dai_get_fmt(const struct snd_soc_dai *dai, int priority)
 	if (max < until)
 		until = max;
 
-	for (i = 0; i < until; i++)
-		fmt |= ops->auto_selectable_formats[i];
+	if (ops && ops->auto_selectable_formats)
+		for (i = 0; i < until; i++)
+			fmt |= ops->auto_selectable_formats[i];
 
 	return fmt;
 }

base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
-- 
2.43.0

