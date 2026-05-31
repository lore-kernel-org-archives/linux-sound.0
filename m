Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B453451A7
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 10:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780222512; cv=none; b=YAPLnNyTp1vh9nWU/6YHp46OqIc5w+xp3YdIaaiy25OxBm+OSsAEdFmuI7Q4EQGzhmWedN21VOa0M41Tdqj2hvbki4vwN0+o1THqrpWu6mlStexYfAumm7wDd4YvPozHVoOabFZ8lnWKuivgDUdOUOS7MyuvvPkt4DWRSsisBMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780222512; c=relaxed/simple;
	bh=tw6peRAwz6RNPkG0j82Xv0xrb4KelQxz06G1Eke2tUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kUOh530hj3oOZjwpd7IYFViJW5CMOya2zEFlvInsVSqARq6D47iaEwPrgqggVu5zAfaGjx/beXqnSMvR2QQ+7gxezneVPkLkyJKh8FkN1cUX9JZPM4FV4wf+6vCbWd/ohGsUbGo+82XhxnwuheQhOYNqzJEWvOGgfNB05cvHDKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HODXJSec; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HODXJSec"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4905529b933so68500385e9.0
        for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 03:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780222509; x=1780827309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1ZGEeNCdzdVrX3fZ7vKd89YDyLp8nWy8sViWIJqhtc=;
        b=HODXJSecgn2PlsSbGdB3TottTV7qMwysTCnhNQhVML0wiAuD+LVFWsCo2byHs9/UaD
         V/jhHJOPxzts+ZahTB1YhWKl34ZhEvwWYREPprb8zweqR8Sh7uf73o7Dh749HHPdldVe
         nBTNGIePWjdgpMO0FWE41/4izbmHqDN0PpllSW7/o0X5c4epfkbLIOIywUsu9+0KrqYy
         PP3d3afTS1oQpNHGx2/l01jFZscq4U1k4SFXrPqYuNIesTXqPj7ZDv4YtQ07JAspf13E
         W9QkrYDXQePjkPiW1F2JfdoWa6G2aTLPb1O6YTdrMq82nvtUE/NucvIxIxYyxUofavXN
         F4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780222509; x=1780827309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1ZGEeNCdzdVrX3fZ7vKd89YDyLp8nWy8sViWIJqhtc=;
        b=CZxY3akzfsdzajZtK5sOGFfiofWARi3zia78LCZJ2fK9rdgo6lIS36n3XdG7sXvmEC
         hsAGewBqt944G5huNBbCDF42Oe9MJOu3iQC62AfrAhvwPBjUtuczs05ZKhvn9EWmU2Fn
         B7Nw1taTBBU8jifYlZzWL/V7nYGJdXntmNUPOikd8bXb6jMdxjg8baI0iN6tgAediBmU
         9EGcqvb6OziaN+p+DUMHK07femJmS3OO8l0zoZOJ14fhNpgP3CHBxy1JXIZjsJlGMDxv
         XGED8oKQjoUPAS5wVZRHzcDOyBzODWuLiHQsRpjZp7yrfSN2hZ7xzRjMFCRHYySpGIYu
         S/Ow==
X-Forwarded-Encrypted: i=1; AFNElJ/ie3ZqhECBS+6blXkNzD4v/v4vdcnPxwdkANPWP8RNN2q1AMYsUF2Lr0yETmJc/C7a/D3zcB3qE+cSLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWeTIxf0lbwjgO7ll9VjTstjBgz9f/jZUj+7+LLe0EVYvyhcho
	mo7gbzc30XUCJxVqW8NknJ3E1WZFCg33D6EUCZtL1oHpyu6vh6SSUIaZ
X-Gm-Gg: Acq92OE0o9/Jqtkrn9Qqll1SMtqjECa2Ws2XPX8iOL2XSzLnllJH+QoIlGedIWaIyPx
	zMgPPezUi08HfU9aoZXhX7is8zfFdMgPrf+id260HWuclX+lDeULNhMeyf/5uKnSFB9q/v47YaU
	yLlDR34z4bWFTiRkiY81DNYg1T4vqhxrX3B4wuEkJlG9Z4TwMUaaFWzhZu9XSrnyNS/0ecAKPsv
	LTxcpT613V0ZAKEj2DHo0+VTZtTRtHg1u2Sx65eiabNYasHtZq16OaeDYbIzoB1QeRbuoJJENmN
	HIWReu3NjVWcL9ztE9LwG7TtSlPS1pQLOPviRNvGX/mXAMCg+ObqGpscQpTWYYQHCzov3k5opLh
	CHcLYOAlsh37lqrRdjTUlgs20tNyw9T1wAa99w5+13eUAW4qjaTmknRgtk7nysOEphE4SZAHcJS
	RPHGtI11FgkOseKdfv7HRTTCDtL1F+frIV
X-Received: by 2002:a05:600c:13ca:b0:490:845c:a1ea with SMTP id 5b1f17b1804b1-490a2953c87mr76925765e9.21.1780222509065;
        Sun, 31 May 2026 03:15:09 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0a89sm197038165e9.7.2026.05.31.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 03:15:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ALSA: hda/tas2781: Fix spelling mistake: "Froce" -. "Force"
Date: Sun, 31 May 2026 11:13:39 +0100
Message-ID: <20260531101339.42155-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a snprintf statement. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index d243baff95a7..0efc476abe8e 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -593,7 +593,7 @@ static int tas2781_hda_spi_snd_ctls(struct tas2781_hda *h)
 		return rc;
 	}
 	i++;
-	snprintf(name, sizeof(name), "Froce Speaker-%d FW Load", p->index);
+	snprintf(name, sizeof(name), "Force Speaker-%d FW Load", p->index);
 	tas2781_snd_ctls[i].name = name;
 	h_priv->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_ctls[i], p);
 	rc = snd_ctl_add(c->card, h_priv->snd_ctls[i]);
-- 
2.53.0

