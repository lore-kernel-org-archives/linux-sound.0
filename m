Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E689913C918
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783327830; cv=none; b=BtJI+ox5/aCyceyop8U0qdfX2UlmBUkRY16GXhsQwX0zNJ0XZoUQa35fXWy/GGhQdptPjHqwT0LRvuiHq2pXaHs7iflbGvi3183QRAF7SEOn2mlSS6n8fnNanKsjf+Tnn6Qq3sgnE3xotTSzlwqWgqHko9BCEItQYb99J+jxg/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783327830; c=relaxed/simple;
	bh=w24kCOhd0coL7UOZzJIQAkRBP5LzvS4+x/myXHiLLnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHIAm5jHppBKaX57Ue7eXC+Gm+HeJ+Ssgz7a3Cytbndv+eD0wP6P6K4Qn3EujDc7nvaIsbI++ltEIIKZeKDbEVnnt9dnWZEgeGGr/0tptTPBYdSZHUM1zUPGVo7YgAKBMxsgvWqbCfetxbHn3zSLAueoHlsqE85AhS58uCRVzEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rptWZaB0; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rptWZaB0"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8453427d3f4so2529494b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 06 Jul 2026 01:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327818; x=1783932618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg/TjGf717Hj/OrWbBMOEQ2vxvsdop73pQNz4dt05yY=;
        b=rptWZaB0Uc0ZP6UhLCFZj5NRp3AjsIdHvwCGoX/y0da/rTdNGi8vzaBfosaPD7ZSyV
         V418oOBXNXTLTO41d0vr1M2HcNPjhJtqJgSmfKL1z0Kq4dD06TaZn3yuFrMQRD+do7sp
         15XyncS4v1oeQ2O51fUp/Im/cTelZlHi7ffN1WObjKFWL54eONYYGrRMzGBZwpFkDqim
         0Oj/gXyceyDetexj6oC9gkBUsqTGzDpM1hg57l2rnVG9xcDwBq+CkjRuHpxp3zkoHgDx
         oIRq5toZsaab1Pxcza3CNuQosTdUhjerppGdx9idEhid0Hsnt9AQc7XDF2KuPfLFV0c0
         CNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327818; x=1783932618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sg/TjGf717Hj/OrWbBMOEQ2vxvsdop73pQNz4dt05yY=;
        b=oLCoFOs7YuEQW5c/132okh9ySWMCRyRu19TtLWrrM25LPPzfINxhSTJ/mlZStFkdPu
         +qQt3DU1PeUeSJPhXITJxzodbfBJWFKELzy75rns52McBh2zjL5I01Neo8iy5jmSueaG
         GDef8NafPpqgOwT82BqccU0JW693KNjAR4FDnHwkeb0j+F9wowgRvpAysQMFiwEYl2Il
         q7OLNIoa9udfy/7UE+x0Qpf4t7Qes1L1BRYZUOrmcBHJUwrpvUd5I7Xal2UMwPkJ+Flj
         zs9V9zPyo/O0FkjGXaybVENJBO4uwj9YinNQlmMyQJZ59q4JJqdksVkUCJBUDEoO1laZ
         4gVg==
X-Forwarded-Encrypted: i=1; AHgh+Ro3OMWlRlUCU/a9wwQN18B9Ywf4CXhtJ2ML+2wYCauEL6yjoEHxwrIxqezgoe+cRpKslmJHYZg9AHP9Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZie+MJda/NNA9lhz3Jfxw362e4NdtjmWxNbu6Onk6r4F9iEv
	MnJ9QVa9xQiSO/67vvGyrY0iniNz7PCD98Q7PKxasW+AnH/gl6/TWF5b
X-Gm-Gg: AfdE7cmpLGWdbjgYf3a7RnSjXT7IpeWcNK6rnRagIn5SuWWfGA1QatZDpQ1vrlXNWhg
	JwPWF9Km1nMFKUjzPGRLshWT2iPWHMLorpxTMDqhUj+jt0vIJCWNh5AkrH3X5NrzSxMzD9dwdAd
	hTC2UGtPHyxT2c9bnh9ilLuc+kBbNC0fJZRyGczg778iZBP+AAAqugiLiil6+8hAUrrPP8nn756
	HPdgaEj6IHEMkgr+WPwWes7pRAlW4QezG6UEwU0ueC8HvSHavZ2v05OVRKY54PvQjQ0qS5mh93Z
	bDZ2L3Aj3SmcUK7al0bVZxaBAwuqOuMXNyVmWhmm31CP33b5YQyVj2IOmwH7WlkyBdiI8zrEYBB
	uhpyE/xcHMeAFfXu570mAI3DCverNa7pWerP/gu3TscZk+dAmtmlpz17yykjJf+hgNncbHKPMYE
	bZRxAov1jKpRJbQogFmA8yFtpy+sS44WSEyAHKp3t+oJYdYbg=
X-Received: by 2002:a05:6a00:198d:b0:845:ce5f:c934 with SMTP id d2e1a72fcca58-847f6d37744mr7331968b3a.2.1783327815050;
        Mon, 06 Jul 2026 01:50:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c142sm3422924b3a.45.2026.07.06.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:50:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com
Cc: Kees Cook <kees@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Len Bao <len.bao@gmx.us>,
	Mehul Rao <mehulrao@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/6] ALSA: hwdep: Return -ENODEV instead of -EFAULT in snd_hwdep_open()
Date: Mon,  6 Jul 2026 15:49:46 +0700
Message-ID: <20260706084950.49331-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706084950.49331-1-phucduc.bui@gmail.com>
References: <20260706084950.49331-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

When try_module_get() fails in snd_hwdep_open(), the owning module is
going away and the device is no longer usable, so -EFAULT ("bad address")
is the wrong error. Return -ENODEV, matching the other unavailable-device
paths in this function(the NULL hw check and the card->shutdown check).
This changes the errno reported to userspace on this rare race.
No other behaviour changes.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/core/hwdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 973d11732bfd..352047e0b33e 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -87,7 +87,7 @@ static int snd_hwdep_open(struct inode *inode, struct file * file)
 
 	if (!try_module_get(hw->card->module)) {
 		snd_card_unref(hw->card);
-		return -EFAULT;
+		return -ENODEV;
 	}
 
 	init_waitqueue_entry(&wait, current);
-- 
2.43.0

