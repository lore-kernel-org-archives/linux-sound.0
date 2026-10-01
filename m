Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC14442FAE
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 06:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837507; cv=none; b=F1F5EfpX5oDGwCdI3wdgur03BehYKC0WYghyUe2+KWll8w1n6a/8QH9uQGrmsJFsfaf60h9k0iUN4CieOLyWAGBOm7WsNXcWrb7xpY2T7KP1D3Kok8yrGnflrNwmvTbMqFAU1/fjVRfRYlTc3ce6PTxIN64dEg2KEbQ18Yux780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837507; c=relaxed/simple;
	bh=ocBZyXnmPjgAPtRk6FA2TiEHq62NG3ZX1SDLky9qQeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lN3idVc8P9TatcaCrjFoVDvoGF60q30xvZyyumzVYaO7bjebl+bJDS/5sSmqfWpz1a92ZvqZQZ8udfS2QjKZ0sFN3naF/2pCenDh1nGUY3ixyNqcDa0IGa50RQRF7ZivlLkO5vJczNIaVaYxFpl2YnxWjoSJCTlzgLU+21NFjCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ler2z3m4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ler2z3m4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so11033595e9.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Sep 2026 23:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837504; x=1791442304; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BgfVERDb+GhfCkZCGyLwonBZB8tjb9GDFl0ljY6iRAQ=;
        b=ler2z3m4KQxXoSEffvAvm09SpfIPwz/0lx0ZV+GaYzqkJtWcAU4oJf7NbH3fqolgpr
         fAObO1OVRM1T8ST7hKbSAhv2C/3INGesAnxKgma9NO350voqY2AI3LxRf+m0wOX/2nh/
         ydRzgFfnS28w+YaA320BkcDVUlFFVAOHLcncrz7OsNi5WiZXYXR6iLopc3ilMyxtKgDm
         ZGMq6GkbpdbzA/Ee+h0PRQjWr+ILLYE05y388jRlZFv3WkZIwOuVj1kMZZmkelOsnVOy
         0CgLgXO9aDLq2u5iCfi/XLoXvj/zUJt5bmbTobY+Q1uBySqcQ4cPlaixGeskGDnb4LoH
         N6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837504; x=1791442304;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgfVERDb+GhfCkZCGyLwonBZB8tjb9GDFl0ljY6iRAQ=;
        b=EMwp0mrwSzK0n4bCJesf0H9ZfbaF1ppgEHRpw2Jgc5M/QqHuFZKp47srritcnzGJwg
         1RV9zDnF9eLFvWNnODaGHsBs8OKgF+HGODJzZzzSmE/V5TJj45O3JFTKukVBwH57nGB7
         FjskyQZgmpg5/rg/Aa37i5lnI3eY5ug0BaYV8ZW7GgSgyLhsgI7Tv/VkJkaNqy80aUoy
         Wz/WvjrfEjdChsAYF0d3s2+v/VIhDLGGA9QwKmXUg3dUW1KA3WMwzvRHy5iox296Zbxt
         vXyx/OJSeUwse3U3h/NQ9WMCErLNDOEp68HsQKKLpsd0lmBUFS+y26B1MW7Vgz2xWiMZ
         WVrw==
X-Forwarded-Encrypted: i=1; AKwUvBwqLPGpZcK1KL+SHBHwgge/cDwnb3dKT8XtZiX1gzST1Xgiykty0aWbzA/2xSUEjAOtW0fCmBBRwzjH+g==@vger.kernel.org
X-Gm-Message-State: AFuF++nqVD+R6A0U/0I9eiTLLthFkp6C8IPJ4szpQKOVUOG2VBTPyTBK
	2ueAZZSUeCF+34xWboLQG7BpSiKuKFVOskqa3SntdMGimLtwRVGHPSPo
X-Gm-Gg: AYBFou0nAr7Cqm9/V9bYjH7IYxNN7fv7Ph1XUPCoqfLlt2WUXQNITD5JVu8AOTuvuaB
	souHYCdUMG599tSSRxiE7g+2scpJ7BoQHmYIhccvAemRcDjFTfYpM5KWuToGLUDU3YenJqbjqwp
	lExXy1ULBPBkLQc8s0ETcQMuCyKeKlxmUM5WojfSPnlb+s3ilevXT8HvnqZ8CVaV1OhJwpbO4cE
	aPCirbQ1a2u2iTk+2dqcMX4HFXlibSXsjIMqWxRt1imeM2PNbWc26kcV3lLA+dsul6hrewGICqS
	VuqnCfti3YTXtyVnPl730MseSBchN6AGwG/BpkWifKS4TN0rtUtYFn9KdgklSEW2p9R5n5lp+ez
	t0tvyqaFPWUaUKUkt7z9lARMxQHQOBnvsZG1H70fAKl6Os2YdeiQrTYpPmCL2HG6p0tirgxHWTJ
	Ed9MbxrnfVykExiJ/bPylAEUfWMA2gtUiPqrrjCOo9/LB9qtyfSB6qIqBaq8RyBnQZwg4=
X-Received: by 2002:a05:600c:4584:b0:49f:fc4f:9efb with SMTP id 5b1f17b1804b1-4a01eb0389bmr33875355e9.7.1790837504361;
        Wed, 30 Sep 2026 23:51:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98604csm35255355e9.4.2026.09.30.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:51:43 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:51:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Val Packett <val@packett.cool>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: codecs: aw88261: small cleanup in
 aw88261_set_tdm_slot()
Message-ID: <ar4C-0NIYXiAvxvv@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code triggers a Smatch false positive:

    sound/soc/codecs/aw88261.c:858 aw88261_set_tdm_slot()
    error: uninitialized symbol 'chan'.

This would only happen if both the tx and rx masks were zero which is
a nonsense scenario and reviewing the callers shows that it never
happens.

However, if the rx_mask is zero then we're comparing the mask from RX
against the chan from TX which is confusing:

	if ((rx_mask & ~BIT(chan)) != 0) {
             ^^ rx          ^^^^ tx chan

Of course, in that case the condition is going to be false because
the rx_mask is zero.  So it's fine.  But it would be more clear to move
the condition inside the if statement and it silences the static checker
warning as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
From code review.  Untested.

 sound/soc/codecs/aw88261.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index b8d06534bc8f..8671069f4c18 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -853,13 +853,13 @@ static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
 			return -EINVAL;
 
 		aw88261->rxl_slotvld_mask = chan << AW88261_I2S_RXL_SLOTVLD_START_BIT;
-	}
 
-	if ((rx_mask & ~BIT(chan)) != 0) {
-		if ((chan = __ffs(rx_mask & ~BIT(chan))) > 16)
-			return -EINVAL;
+		if ((rx_mask & ~BIT(chan)) != 0) {
+			if ((chan = __ffs(rx_mask & ~BIT(chan))) > 16)
+				return -EINVAL;
 
-		aw88261->rxr_slotvld_mask = chan << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+			aw88261->rxr_slotvld_mask = chan << AW88261_I2S_RXR_SLOTVLD_START_BIT;
+		}
 	}
 
 	return 0;
-- 
2.53.0

