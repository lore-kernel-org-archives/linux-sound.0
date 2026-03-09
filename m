Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB8B36D4EA
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773093281; cv=none; b=sXHBPBlbmUsflMsTEbWTfd92Im43MFbgTq6okePicEH5qRP1h2Jq0SYslUNIqarCuixPcIvoaDyHrXqayhFHqmNgoXYoEXG6Bhh4mIXusmRqgCN7yEuCahOx9whaBI0x3Uzu75MeMN4VhEOEgIs4LW7n05sMyMH18vAMtT4/xKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773093281; c=relaxed/simple;
	bh=xJJ+aAAUWIYX+T7gb/L79FWjjHl1aKkxOExGsg/yL20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eUceFqf62ygVwSxrU7KhncUIC8ZmCp6Hdi2vugBbOYo/OTbmi+QiXqjQySo0UUpJHS5G999LVJPwcYz/lOiDIDZYUSO0hYZah1bWz+dZ6pmdzHTKn2NJa97JizfgwdZ9+/0ncYOcNoL/xxMmpYrCVpp1zq7BBe+c8AVWhyHuNVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dldilH2l; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dldilH2l"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48538c5956bso17387505e9.0
        for <linux-sound@vger.kernel.org>; Mon, 09 Mar 2026 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773093277; x=1773698077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aagr+RSl7ZMZ1uHk4kYU5Ynmd9OOsesO87GYrHN5PyU=;
        b=dldilH2lEeJc9K0XPbn4tN2E53ZKm+0sMgphzktTzvniRKthbptjaoCipx+4skx+AY
         nePTUqcFmsWM+e1S02D0m9rgaex8hVV3f8wJPenp4prqZ5/E5oGRNY8FJIPPRpmzN4IO
         4V653DHFgCc9VBtV7zHs6Wa8rWk/mtF8RcVx+pXW6Cyp1QNB3R6ilgIWsPr5+cd24J0Y
         IupnF0FFpDoEbNk/qNTh8WaF4csACJ/pg2NESDWioceAbpF/SJkl+sQYS0DpiX+Ox+54
         F5pLDuTMCkBWWXjKXWsCn9TQ7qhpzdj5w/Hb94jbucGvfr/oApYOm/5TMHAkBY2cgU5g
         KKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773093277; x=1773698077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aagr+RSl7ZMZ1uHk4kYU5Ynmd9OOsesO87GYrHN5PyU=;
        b=MYMpKaZ4Ym39uvk7FPp57tVBuKj5K6g3YN7eRT302hVhsk6zLSbHpJynNtevJHuYTA
         JuISsEO5AzK5xRrb/DxDuiSTs+stQwtLrVuuPVqIXp3iPdC6P0V7wM3M7lKUVI1i1ZfV
         jMF1SYtxwlB7+yL6/4GBHhhgMi4phjagYhblNTWfbRxroXbWn9pBFZgYTjM2JxBgB6PA
         qFr8m3RjbOGQcgklqAJf9SkdsyxVOeHVgBU3J257EONyQqWlYSAmqrG+4TP9WlTuKT8j
         2WVez+OYHECXvVNEIX/uu/0JL8xPHXzbQTNiQeJYGH2Pzv7A36XFTFeBa/ve1aJjSkBg
         dkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG8qO3Feu9eznudjUJCqZaf6c9EcITrBaXQ4jjaojICwp18AnqGqKFstGt1u0uiif29gZ/dZqLvTfcNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xCw3KHm8jZYCayEk09cVukQ/ovCNz+Gw96egzFTlMSPGXpDr
	/3mM4/BAbz9kkEtBeoUCoTWvBVyiOveyy47fRhtTHCWjZV00Ovctb7o=
X-Gm-Gg: ATEYQzxTXtovNPl/Hlo2U4CE8GkXY0PhVFiLQpgSXTd2HMcf5M/VF6DJ0ujBh4b/+lj
	IbpDQBNDYuybn7aV+h+jvFnwPqZsVrDyiKfvyYgzbTTKKneoed/oW3MINXp6tYgRqdYLbPHZRz9
	CPM/0qpZ0K53w+hOuZpIzYjLnoPfytDygRduokdM4idX587Sg8uuONY5tA1zhgAVzKmgy7ngEIf
	CJwocxs8Bn0jnJ2i+hdEk237rR8nMn0tX86ksz+wIsnBcWIqcnNG09p9+uA97HRYWGB5rCiZyka
	d4yaYP7BR6cpo43lzHSnfzcPlM+BUj9SKQXqUN+1eL5tyYSWYPyFKwP13zHHGzZb/Y5vNoqJ40G
	CYRD2WNw+NngvlmmpDmce5U11g26HFSycXhFvXrqHL86t65CIu7VsDMWJi/TDhk/7agO7PVe1SA
	mjdYh5M9lje1kezG21LWURPM3c9MrNYOdLoA9mVIb/CjA=
X-Received: by 2002:a05:600c:8b53:b0:485:3b33:f4b6 with SMTP id 5b1f17b1804b1-4854192dd55mr15703755e9.0.1773093277187;
        Mon, 09 Mar 2026 14:54:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e11:2401:e440:4d43:1ae9:c232:cc4d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a900easm28183845e9.9.2026.03.09.14.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:54:36 -0700 (PDT)
From: "matteo.cotifava" <cotifavamatteo@gmail.com>
To: broonie@kernel.org
Cc: cotifavamatteo@gmail.com,
	cujomalainey@chromium.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	srini@kernel.org,
	tiwai@suse.com
Subject: [PATCH v2 1/2] ASoC: soc-core: drop delayed_work_pending() check before flush
Date: Mon,  9 Mar 2026 22:54:11 +0100
Message-Id: <20260309215412.545628-2-cotifavamatteo@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260309215412.545628-1-cotifavamatteo@gmail.com>
References: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
 <20260309215412.545628-1-cotifavamatteo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The delayed_work_pending() check before flush_delayed_work() in
soc_free_pcm_runtime() is unnecessary and racy. flush_delayed_work()
is safe to call unconditionally - it is a no-op when no work is
pending. Remove the check.

The original check was added by commit 9c9b65203492 ("ASoC: core:
only flush inited work during free") but delayed_work_pending()
followed by flush_delayed_work() has a time-of-check/time-of-use
window where work can become pending between the two calls.

Fixes: 9c9b65203492 ("ASoC: core: only flush inited work during free")
Signed-off-by: Matteo Cotifava <cotifavamatteo@gmail.com>
---
 sound/soc/soc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d0fffef65daf..e5ac8ae1665d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -462,8 +462,7 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 
 	list_del(&rtd->list);
 
-	if (delayed_work_pending(&rtd->delayed_work))
-		flush_delayed_work(&rtd->delayed_work);
+	flush_delayed_work(&rtd->delayed_work);
 	snd_soc_pcm_component_free(rtd);
 
 	/*
-- 
2.39.5

