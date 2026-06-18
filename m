Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DCA3F1ACC
	for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781064; cv=none; b=T27CuO7yyUBfIvQryBn50oGXi+L77dmlZGzbZy14eCdymU+ALo7PFNGtr0PKCkQhaLVerJgcBvc4elFg3gyvrLntTOvQHV85GNDmehxZgz8ik0Wa4YDMJCL2q03IDTsp4qeUhrHRNvwJK1R//aCXPANikjDvNjGt7uZ/J7F2WCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781064; c=relaxed/simple;
	bh=Aa2l9agGlZMpsb3Jajw4aEzL2RNOE2njupqBSV7PUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuWO4dYSlayJK16C47kYSJ572c9aGbC9RRvTCGlXIuVFD8CRaSYWppFwaVt/wA9GkrqUGFCz4FSk+Y14g/3Jf+lGS9mFXnBnMMrGkjyqJ9UD4hMbeHXTLCPyyJZGApwVpRU339QZF/Bbzork6KYl+bNJRotfIal+3tka7NS3lCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlgOq0jU; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlgOq0jU"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c6bc87f4d5so3296485ad.1
        for <linux-sound@vger.kernel.org>; Thu, 18 Jun 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781063; x=1782385863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=QlgOq0jURUbvSbbFDZYZzkwVSWy3DLSWJggqOG1BuoOj42Jr7+0rQBrFhNNi5TDVaL
         ThIP2uCgqn5oOfUwlxzI0/0TbAbFF5ZUN4KJ4zGLwIjfUWg+faNGdN93YGp2UaSFfe69
         2BQAWR1uZ9nLuPgbq5HzeDV0cL/Rgjoj4QUWNvg84liEKV2fxATk/4SWDhbNDb8Y7AT1
         1psicWLa1LObZAEMrGAwSVAeHT8dcTp+CC6uYd9WQTN0Q7vBJTFebduWfrp5ZYFKwbsP
         l635qj4XSsw2mhgFeQNnyjpLpRJizuVHkoT0GXsq9wMfT2ZxAK5BtT4pljMpML94dyUq
         cQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781063; x=1782385863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=OvH2MyuJE9a46r+a6iP+F4sethD3gudvBP98jH7ctGKBrS18MSDl1Xk51ho6BvmnC0
         +0xyfELUw5emwxWIL0z+QmCG7jG/M8WaSAhRHjCurcHXPFJ7s11ZmeK40RaR8FyGFhEh
         mtrdpHRgSsarWNEQ5mIQ4fOyGd9yf9UEogVm5AAjhbjGno+rOSgzbCrZYnFyIkLQyXEw
         Z71vCgsCcI82fRgBufYE5FoUo0cdpt5jsVRXrIlYOl9SPDkDESSnk0gOnT7EURV9hlmz
         DSfQiEYqzGfyTKMR02YtKYBH/LBqvkyldbTudlTNaXri9NMuyR/3mOEh3Ogqh7L7N2pV
         IhRw==
X-Forwarded-Encrypted: i=1; AFNElJ9CHAd7tI/SnbEfAAzmFnqEpjVpW5I+Mkgg9riu+QarlBUKN64mECc9jfFn7bNn0qtQz4pASz9TENr2iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXfwiw6f+lSwsy7dYUiv7lJdA7CGd9q2ZGuEzbPB32PwbYSsp
	K2Uh1ObUfPH+zEUAAEduCmYPuLY9gIlMNQkB2PNMV31Mw59T+iqkF8ep
X-Gm-Gg: AfdE7clyPJPqvujvOf/K3G5I29Au0EHwY2CiKqnwSTAQC4q/6kh7BmDgHMiC8OciNZ6
	AWEpo8mhWvrR8wKHle3SaYvu3DY8lymWmb2bOkgR02BnM/lHvWwBw9TdWq947qYh/2+9HFkoXYi
	AFL/eHzf6Sm2PHWQXYoG7y0yWO+DoHoQ/a70w1Q2nGBCTFG3BcCJHUcJiZbIVGUi6bVHSn77zc3
	OW3O2FBjzDwH4Rgdkf4T2qAaKmq5en2SLOjZjNXcFYyGV7AmjYvxOzCoZslYukn6ZQ0WDPuj4vP
	PXZrqmc/Ja1fT1/T0Pt+UK8Kml/RAmPKHLotbh6yrf7uwQ7yrGjnrbZ9wv42H0jcA0wCHlTzhYI
	UwNYxZCIDfua9fbcnx06MzUxNaDoHSkyliPJR5m5YFg73MVsnP3DIYc55R47BtIFP9DP0Za4esY
	GlxOdG196NNHYQZei0O3cOxSGjOXX00pNDkUxiMxIjvwJC/N8=
X-Received: by 2002:a17:902:ec87:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2c6f340c89fmr22802915ad.6.1781781062990;
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 72/78] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:21 +0700
Message-ID: <20260618110827.232983-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8903.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..7c87e927836b 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -463,7 +463,7 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
@@ -471,7 +471,6 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
 	return ret;
 }
-- 
2.43.0

