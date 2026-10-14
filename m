Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F5A43803F
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959589; cv=none; b=NhHs9pYYeQMRF/HABuYCfbCxnON/YvZCIOOn0Up6rINdot/r0K45RTrORRjpV65tUTqiqJzec+TaIJtvWkeDpOM1BBcyB+WvB8Zn525NjEqzG3xoJ36hpQCxUL7z2wlVkQznxo6fAbK5HQAgGVdySnT7aJassR5tgcSUGyUpxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959589; c=relaxed/simple;
	bh=sN0WAGJJXnpjEIrxI8cj+6CPCbBWYK2LYr+nPd7F/+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vh388HQGhj2BJ4oFOWZhJZ8/mCVM5kP1gDzfuDoweUpyGD2UD2QPIBG88aJx/du6O1JGlkatPxcW1ZdkPI8LO7EbkdPR8LU0vy+t808Dap/ycUskZacZx7TVuEm7BZjtcB6wozIEyAWnIMkftbYV8lUZG9iVOO7H/rYydgAGFps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrmdyYXs; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrmdyYXs"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a813079a55so3305240a91.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 23:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959584; x=1792564384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+YvI3Kot8Wsaa/xpmO5l3GbVsxQTm6APK2VOVulo8OI=;
        b=rrmdyYXsdMe+8bTX16RCkvDudMsaozN5MUivgbEiop82suaV1xsijbjsBWjYGoF56D
         hyWaO+ESYk6d9u+G5awDQ2hOHJirsasu8GV1R1AvTQSooJAFDG53/VkKE6U6PSuEdZEz
         C0R30ai3D8sahyO/H3f0yiP7sifPWOv5UZ+04kTSru4vgiW+tE7abF2LzgMvANi8pHCC
         PCN97uJ9d+VMPRLfceSSDXmTG1IRufARGHfn9JJtkOvWFc5HICj3OYzXrGd0mlm8leF1
         dwiiAVJ4InUOMpDDZxENIy3LW9ZJ0HIx9j7tegpeTeTv5d1jwDfp2r8zMiY/4LyorJ8Q
         2Qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959584; x=1792564384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+YvI3Kot8Wsaa/xpmO5l3GbVsxQTm6APK2VOVulo8OI=;
        b=XVGzZZQqdmoYK6WNIBFRTyGRssxUVYnHdEMAFvjZUE+fuoPIUWMR1wl671GzlONQyc
         5U26BvEtEL2CyYAHsNqSXPgNo4Yq4LGfWNaFO3Fnj1oKv6Z1eR3HkfG5GlXNARPpoTPp
         dK5URH1zyctGcCY0PM0OCT8Hpfq9vDmCChxjYah6Jf0IAQIaa0yO0cHP+SgoL9BfDrO9
         0/AiWX1rrs6hOs9K3Nzr/bEs+gSvHHW1+AnGgZ0OW6Jjjpn6W2d8YIVj0MVWdDKfZOFc
         ub2Wiz7dynDNjJ/u5kobUZTvt29gs3QwzkR/1WH+WSrzI5DP2lTQuN/S2rBTHHs/1C+S
         xrBg==
X-Forwarded-Encrypted: i=1; AKwUvByKK1ZNc/SK6VKEiJGGybYQKrb0BOYZc8hrqkV/4edjlhTYip4IJ6wrpclKcYNFV6ck719rcPmuwLGKjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKNN6/2j3RJjRspnUEROacDuV5BxaTyShWg+hCgGI90edhCpwEC
	o7/zwaqGFvhCk0+VJXm6D5Zcq2TWhCNLugzyVa2XRPLDoayyeN5E4VQJ
X-Gm-Gg: AYBFou1Gx0mVEeunyPj7r0EljnuJ+msofd21apMRR4MyG6s2iU9EgEtEO0f/5JY57sR
	wwSgKu2dFZcjV2vCiLHlyosaJfPitEaMgp3VacsCXvjmEMnKLTrAIZuTr33KBKRKhuXM3IeE8f4
	edOWRpa/1kuiogXJETUrrIDu6FTm50VUKevyjFfLpE0S0WTYPfI56KX3MORLgxAjWtoATq19RZx
	le/Fh3dIaJF2/PBc67MQKlH94rcvpnj4FzBeIUHCFBwz4V+GmDTiegm5isO++EocO/zb2XHSm0F
	ayEb08RrxMVBjXbYTW5mRus+GIGFveBk77OBBVJUVxCCuY0Kg7fsxOysfsfhmulingCTLkFNGxc
	8drXybnybe9uAgdYrBotUzOFK8LwJQykdpPi5dtvhfHMSLYGv0NeXbnUthfGO7E0VdxJeIdgMIo
	j7f0mHhqbOAYrsCF426R17ExGgYik3bk8x2boZZacYUVtCsn7JTVfTQPNtEWhBTkN9GQukr2OQM
	c1RCerTmzm+g+/mOiYplLjEORqpnRHctdLbjVTP47FGrba8f/j8quhtTcI5Z/sEau5ekZr3VtM=
X-Received: by 2002:a17:90b:4b82:b0:3ab:a09c:f858 with SMTP id 98e67ed59e1d1-3aba09d4a0cmr6003277a91.33.1791959584201;
        Tue, 13 Oct 2026 23:33:04 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:33:03 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] ASoC: codecs: wm8994: Fix definition of WM8958 noise gate hold time controls
Date: Wed, 14 Oct 2026 15:32:34 +0900
Message-ID: <8acff0f7314eef9eb3d290ca7855a87052d7e706.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791959026.git.sammiee5311@gmail.com>
References: <cover.1791959026.git.sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The noise gate hold time (NG_HLD) is at bits 6:5 of each WM8958 DAC
noise gate register, not at bits 3:1, which hold the threshold
(NG_THR).

Fixes: 1ddc07d0f13a ("ASoC: Add WM8958 noise gate support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8994.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7..c1f388189b2e 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -701,17 +701,17 @@ static const char *wm8958_ng_text[] = {
 
 static SOC_ENUM_SINGLE_DECL(wm8958_aif1dac1_ng_hold,
 			    WM8958_AIF1_DAC1_NOISE_GATE,
-			    WM8958_AIF1DAC1_NG_THR_SHIFT,
+			    WM8958_AIF1DAC1_NG_HLD_SHIFT,
 			    wm8958_ng_text);
 
 static SOC_ENUM_SINGLE_DECL(wm8958_aif1dac2_ng_hold,
 			    WM8958_AIF1_DAC2_NOISE_GATE,
-			    WM8958_AIF1DAC2_NG_THR_SHIFT,
+			    WM8958_AIF1DAC2_NG_HLD_SHIFT,
 			    wm8958_ng_text);
 
 static SOC_ENUM_SINGLE_DECL(wm8958_aif2dac_ng_hold,
 			    WM8958_AIF2_DAC_NOISE_GATE,
-			    WM8958_AIF2DAC_NG_THR_SHIFT,
+			    WM8958_AIF2DAC_NG_HLD_SHIFT,
 			    wm8958_ng_text);
 
 static const struct snd_kcontrol_new wm8958_snd_controls[] = {
-- 
2.43.0

