Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F953D6491
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454583; cv=none; b=nsexpj7r8LXoVkhSB/630xRdLcEivXWVYZdxp40xC+b4f+1VhwWgB4XrUGsrtlJEd5xgNFfNyb1OXK3lGY6sW4CGcn5+ktJrI7QYa9Ym9nbZ783aikNzsuIySrUpuNnBHhnf09rcWKOuFiamOgmXP+/GKkikYmUEMvhbELmPq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454583; c=relaxed/simple;
	bh=dHVEgQtwHDKoTcZP1GtPLCEn5TCpT4LbHpwMrUJxxes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=No324vKdUyunAKSZAEbiSFGRwH8MnXv3wp+XW3u1RzbvazRw3aBkJsTWd3gT4GNyo7QP1cprJA7RYbe1m+Ikbm5J8fbcQdsXuiobOxXNGhgKHh5zj4m/rr+hpdQEY+0WaC12voUlmVezEV+czkXvmNz+DKbCWECEEwt6tJq/b/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCvLtbDG; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCvLtbDG"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so376242a91.1
        for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454581; x=1783059381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWrg/LzI+sfMKMDm+nskCSh0mSa7CPZNcb2b72/26k=;
        b=bCvLtbDGO9uzHkJqp1AdC3D7lD0bQuWvR9BzGlMKwDCx0C1QUS4uWhRMR6yk9vT+ug
         GxFUxEmmvIR/i3uSJm59M+tExlhnQbBpDxelG0JuFP3fdSAsoPXqZb/RNa1cCbFt1Avl
         hse/UTc662Y0uVquCJZYTylqZYW09G22/Um8cf2LtqBYGWFjkkIkgL55u2kDmu3sJksS
         uPFOpIWZGsVzeEnSO3VzhJC0WYlxkDTTx2T9USpKz6VIO2qJ0kqrBV9Z3mAcsMwIYeXm
         CKktTCJepU360dBN0D9G0yK5D+NHwrb7166mdi+XSNq/yLHw/4eyYMrjSgKKWFYaj4dz
         XNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454581; x=1783059381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOWrg/LzI+sfMKMDm+nskCSh0mSa7CPZNcb2b72/26k=;
        b=QYsURkVbqD5k4knefMXHwK/1BKiTLmmPijWuglMPnYJ5PFEoHXc+3SkONbzqATYH6M
         HeTJskQLjRWQkEe74f7VH/WfzYYdTHQc69oy2xFYF5HMdpKlBzHIK8iSPUTiPmZ6agY5
         IgLzn47Yj0BPCc3AUtxRpK9JXQALr0Mps/74icnkUjNO4c1O1rkr+Xa+Ft83b4ytv2jn
         HehZWMemTUiI9sLsPYY1mack7KM6gINNFa/W7bJGZbPBOwdyYy54w3CBYam8+qRDjT12
         ombJ2KPrEz0wDyK+GzVnQgWDEHU0sjgC4fnKldWn+EDbxFJreus2dxwLovXpC2pcU6UF
         oBdg==
X-Forwarded-Encrypted: i=1; AHgh+RpPqqXhYBPrHkkHyT6vqmz07ZtaRKiQl35mhcqkujvYK74gi4cJLClj7i+CuGxRVIiex1vvomF20y3H6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfnpBI5cdLNeHOtps3VE5DRCAe4mMXvyhvOpwrVmUbjy85QX3/
	uq9p23rpHrZ3lkCxcAkZHiK5UktRamnNMfYYwLxdNeTHeYmIMB+n+pCz
X-Gm-Gg: AfdE7cm4hX0oqKbgZ0vfKdgdtApaIjotFTQ8Ai6feFjy3bWd6zAFPg+sljdXKAnujJX
	2tKiIJslbbKtNxDnMVt6UBdqgDxisi0f5HHQ+H90HAuJnxt53xt5UL91gAO/o8s8TH2defWyS0K
	vOLy0qNAOeVqE1Y/pW8tYajJ5cs3HBTlTgthSwXWSMbbV/gYZO2kOj2A1A7zfIUXA3ssKtsILQK
	PnEja5ssdnD28plKG9QAgyBZ9z0xDgPwfMlv3WrhryrcI5ZSVNinu97fGLdK5gkRep9zoLAksyj
	ADgrsHyqC9JFrVjrhq2vA5soFFkaHg0Qmd4DOsLqYSn482cqXFoOsNRs77MJXSEkczu7dv2Vpmr
	2WNsFKkHXRU151/Caf4bySVoQadGh1gaS8rebibqyv6j+TcDcY5kLreo5lFLjb0Rnh9AlGaDyuY
	hwjqTqq0Y9VP7wW4MzB4qSK7fM27iOKsjVmU/O1IuMcGwJbG4=
X-Received: by 2002:a17:90b:3d8f:b0:37d:9874:935f with SMTP id 98e67ed59e1d1-37dcd701ea1mr12987997a91.11.1782454581360;
        Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:27 +0700
Message-ID: <20260626061329.23264-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

