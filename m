Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68492E972B
	for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 15:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009187; cv=none; b=cqLS50IPSbpFhJ4SZjiwMy7r3ruwkrNvu5jCLF5ZrmP87w5OPitQwwSP8vtcCSYlfXya9IkZ11me29+MCBPo3HgfziZAjsWhnpPHiophZLqVG3JlFot2AW2Iq1iXbuPNc4nz0kgtl20V3xC8ib/pSmqYYLaBbPOoSkDqQBhEB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009187; c=relaxed/simple;
	bh=6YFxgIiWMDRz6ewhhuoxOqQQv3KJFocJIV9lWN9kSuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=etc3O3wrb5dOHGpLVpI+0AwzIpFWMgfayLYFz4OthWgmBFhO/HBeutuIjfijc47eki5LPUS2O3yqVxVSjZM07B/WjmHtMFP3VeexPaBLWgY8j9bEnZDO9zKFdjhF89k8easkGur7VHiKpJaGFgEu436y3fDscJGqWYozoHsMcmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv4Xt6Y5; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv4Xt6Y5"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88a2e3bd3cdso11276566d6.0
        for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 07:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769009185; x=1769613985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E/tSSdS9sPZfUGOWrQzpUElB4CNGuByUTymq8YDWTqA=;
        b=Jv4Xt6Y5xFg+0gmhQ3HGKF1nUE3LDe8XFgJB1XMOSvw4S3lC3X7FrrkDDr994tor9B
         Jl1SHEajHk6+rX4Fc1+JdxF808lB1LtI1elL/w23PUQqxc7DS/mMxQR6b03elaU4cRBZ
         ssiZonYCvorS1Bq7An/IRdYhDrOa5kMzN7Vme/kmHYPRxv0oWI5pj79w45wJuG7ir52M
         I4WAzD80ENzQjAaymAnV6PqGstvBigj9bZiTIdDuF2UehrXrMhsu4ZsmS0jgrylfKJtz
         f7Lkx/KOD3gMFm5rd1RVYmVjRwfL0A2hGqm7gaCQz7WTVndUTligDp3H0sXwI1jiZBG6
         L74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009185; x=1769613985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/tSSdS9sPZfUGOWrQzpUElB4CNGuByUTymq8YDWTqA=;
        b=l+43Wog/BmD7CiGwoox1piOaziN4kfvtCTt8xIhG62LDS/CjmF3QDfHF31q8+quQhZ
         YgNSg7v0VY+uQN9PPmBfogAxY+ctZTFimp+QE/X940LS9j44pWGco0k/9b30W3W+e4Tm
         xsM/t2I450iEIdJ7lIhhRgW7eiIizkvUNy0p+4Lk4SCZ91DRHtQ5eCk404Xo7Nvi2IZx
         9sdSr+IoAW2V4vZKvRYxuNmrCQzC4VbLEtJRp+kgwI5Aiu853JzCz8XkVkr3KkMFTeig
         wWs+1rB+F+l0SuKnrdHbinaxnuUH2k8rsqVKdOADmCplkAYhgBP4eO8XnGe1cHqEVWrd
         44tw==
X-Forwarded-Encrypted: i=1; AJvYcCWdy1vrizg56aUMu9t2mn8nEyugsukvsl05CvjDx+PVR8SUFZcT9cV5EcGOLMa1DvhpNzbsOqhPGp+tgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzH+tuHFAM2Ny2WPqGPiQGPMCg1fgVPuWyPLHLQs1m6T/MMw2Il
	J8KV7HjzAoXr3tUz4FeMl7RbEjmR8FIFZ9NZCPzTHyUN/5ss638ckRTw
X-Gm-Gg: AZuq6aKqPfFbXPq7uO1drKGfi0sXG2k8ep39u4JdAeaN6iG5S7a6IIJAWozMnF+RSt4
	W35oAVYXWuGb881D7tfYPIDGMMIeVp50uTlH+l8Kh9dS0PjhfzAHf9K1W3Wh19+xvY0p3XCLpqE
	EerVlV198U4iO+Lun1YKzrTa5M7DqCDmvIcwsxSEfM1jMELe3Q7WV/1vc08Ho6RiFNgXfyiIVv4
	KHxU8Aqoq7JPzqRgYI21PD+qTGDkPrf4O1vpyrUX/WtCJdGTMXJxZRRhx6UTnvEC3PkOVOVa3be
	a2AdtmdNe6uqPUbUzxTFsWJ/qmaPVpJgo7hYCO64ljD9L08tkFaCJy8wKoiTaIs9oMyXJAbGQMr
	+CIy9i4RAR2DxuFHFtKGHWbYjdHXIIU313RfdF/83txgqtSUl1z26N3DmWWvjDm7sEY0OplfufS
	81K9o=
X-Received: by 2002:a05:6214:2502:b0:894:663f:6700 with SMTP id 6a1803df08f44-894663f68camr72399646d6.22.1769009184639;
        Wed, 21 Jan 2026 07:26:24 -0800 (PST)
Received: from fedora ([84.17.53.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e49f2sm130533536d6.6.2026.01.21.07.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:26:24 -0800 (PST)
From: Tagir Garaev <tgaraev653@gmail.com>
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	linux-sound@vger.kernel.org,
	Tagir Garaev <tgaraev653@gmail.com>
Subject: [PATCH RESEND] ASoC: Intel: sof_es8336: fix headphone GPIO logic inversion
Date: Wed, 21 Jan 2026 18:24:35 +0300
Message-ID: <20260121152435.101698-1-tgaraev653@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headphone GPIO should be set to the inverse of speaker_en.
When speakers are enabled, headphones should be disabled and vice versa.

Currently both GPIOs are set to the same value (speaker_en), causing
audio to play through both speakers and headphones simultaneously
when headphones are plugged in.

Tested on Huawei Matebook (BOD-WXX9) with ES8336 codec.

Fixes: 6e1ff1459e00 ("ASoC: Intel: sof_es8336: support a separate gpio
to control headphone")
Signed-off-by: Tagir Garaev <tgaraev653@gmail.com>
---
 sound/soc/intel/boards/sof_es8336.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 774fff58d..fce50fd9f 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -120,7 +120,7 @@ static void pcm_pop_work_events(struct work_struct *work)
 	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_en);
 
 	if (quirk & SOF_ES8336_HEADPHONE_GPIO)
-		gpiod_set_value_cansleep(priv->gpio_headphone, priv->speaker_en);
+		gpiod_set_value_cansleep(priv->gpio_headphone, !priv->speaker_en);
 
 }
 
-- 
2.52.0

