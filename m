Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4379B3AC0E7
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 07:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777361875; cv=none; b=OpkWTlxJguIzeh3dW7fMIdbZOEnaX4GYvyVjSFTL5m8z6E8l9MdWFZfjjtboMl8PU3PADiwlkrANnAc6gFPTnvUHWEEJGu9A2gr+OzJzg8FTIIYRaMt4DGGjubw5tIj4uh4b6/8RFu+Ls7jjbF8FldQLOGje0S9ZLbRGSLkOKHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777361875; c=relaxed/simple;
	bh=cypE6I5Oks+J1cXo64H9AjkzHnHUJ7VyGIZOIAVE1+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WFEBH64K0zuCHG1rrnK8xxyguh+4CG/8R6GsCPC9zPYM0WNk04sotMqomePz1K3v9AOB/wqKj4cZikwbBIcUN2RoDlbGqsEhWdcm5bBzywhSLv4MtfjlP2QYgVkNhGm16T5V5qy/RIqL6fTvnLSEzIlfDVOf4o/KhuvipsKHIzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=NDw91MTx; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="NDw91MTx"
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A6F8D3F2B7
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 07:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1777361865;
	bh=wUycbjX4hyf+V/tl18Y+01ZB1hiYdyYUcYNBoEP2xzI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NDw91MTx5v8YAlKcN9SA0m3X0Fh4Fv3l1XL/Mhy/d9LJx5HZNmD26jyhmrNzNKeed
	 LfM5/R2n4sfFCofn0jUFUOzRwuc+83E1ZoMcSpDZZorAovgSikbgpskskWZXRjCUsF
	 2xQWmg6Cni2PoLP1Oaz6HxKV3BlUijz5+dXorp1Hc6Aaou8ezPw4TBPD5Lb76DaBqD
	 jiTOMVP3biOsVQDh+3rlooTEOwAOoYXvMb18NScoRK5/6EC0bhoiD9Wl2HavIDKWkP
	 f4Pgo6gm7K4nBh6Ce1+o7g7RzT8dUw0RKvOKdSqe+T50ug5bBm7AXUfFtxNkfBeQmR
	 g9KXc5JIp0FEH4k0jzggzxoHM9iyVwUDBfLqQLMD1lfEVU+Ewc3Hy5iEm2lcpIqkgG
	 dkBpg2GHThG3oL+5jyixNrZdvjXa87o+xIbNIqq36o/15VsH+mDJD8SvzVLHqhU6JD
	 i4q/yBCzHhVotlL9KQUwuWqN0RZyomtn5bGLWRpkTxG/vC0GmjDdiPz2Loi71IY3uK
	 IRtie8IXpOlttu23swWCgsgi1nXwhfemTqaO95DdWC8xaY29DcKxejyC5naNpQ7FyF
	 IsrZ+qaregmeGAWW2KS/e2k+vQ/NhPm5yLXIIC9XF0ZwlwWKVNkUy59Lz/9RGtPyqV
	 ciJ0VX27Ym1dlBjWB3gdaFjM=
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7948640854so5791372a12.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 00:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777361864; x=1777966664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUycbjX4hyf+V/tl18Y+01ZB1hiYdyYUcYNBoEP2xzI=;
        b=JY6+a//BCTkiCJJAMFv2sxXqsQakNTVIOsVK/xKcMwzbWgx7nLbUpPtN1uVzdVzqhf
         ULNVm1cMMvh7LP+E9m64f2vJREth78jhpPGL1Tg4ErgqAVJnBsO5r1DxnGWL2igSAE9b
         mhrh+Bd5evwg4fyu4DhzqGPrCmiwe0hHND4Bmj/04PMThYepgEpzZu2sH58Y7EXKlr8+
         6u7rlOyUlPlYOtRbgvAKxUPB2NF4RQcTqtwzSZRS0JAaIgQ67uw9Jjpi7d73HCoeM4Rj
         +PJnsaOnI25CBRyMKyJYZyVCvZW6MPDcIqtZ/ampRsut3vc5nDO7gAZ4XNuDcziIkyu2
         zMKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ujML6/gLMpRiSS1v9GwfnVywM/5VuA+uuPMixoeTFcZc0qwlZboDS3rP1IYSos5hwJTkTeuLL1gZDew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/vCnOMiGzYYXnDWDYOMSFKgBek2ZGCrpObw8UCTGHLs0LFqP
	Wbd2STrZSF2dWDdECi7mEKadP/FLhSDONmIJ3MwzPDi7IYGiNDXclNLRdn/8QwULlj637lKGmq9
	7fCn9nkBj8cNTwL+/b3oXni7nQzfkq/c/tw7SDTgEvcTscbuk2Zf6b6/9eosj2La2Cx1cqHgQWa
	Xxi25d
X-Gm-Gg: AeBDietKmlOZ6pPgS0iMzgi7eg9fZhptaW2lKYYfEfA9N1L9J9Gg2UQdIPv+JtTOutu
	e47ls3MqY2uG4Urrjr+GQPUJ8K35O3vi7tNT4w1yFDyg94QqNUeflwPTD2/ONk7QLRDdosimMez
	B8JICSuXmXdRIVDhSKw4oGthzQ8E0dcB38XvZgW1PSI7Lvm3Nv9fTZ7Ef2kYiRsZZMnqAN4VMDY
	+qGaL+Eo8xSgoN+bLGdxAt5E3eMoIowNzBcK1OfT4lNEXGQm0yxWiH0Ndr5/tbZ7XVcaQoPKw9N
	/a6hZ0nfOZheWaZhUZodpeeo0Pb/BrTbNyUBCh94h0/uxf8XrGDRfMWsieZK54OvujnS/z5oBLK
	82bZIU+Gybdf0nkRIGYOU/9ksF72oIdAXGlIncfT0cL/LceVYHhS963+aNwRVhiv+8oNcEvMDgd
	FNx7zyYAgjDlJy1KKTiP8BXM9DmVj/ZQ==
X-Received: by 2002:a05:6a20:3ca2:b0:39c:39de:3cd2 with SMTP id adf61e73a8af0-3a39c10bc3bmr2487056637.22.1777361864128;
        Tue, 28 Apr 2026 00:37:44 -0700 (PDT)
X-Received: by 2002:a05:6a20:3ca2:b0:39c:39de:3cd2 with SMTP id adf61e73a8af0-3a39c10bc3bmr2487028637.22.1777361863796;
        Tue, 28 Apr 2026 00:37:43 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc6015691sm1383931a12.18.2026.04.28.00.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:37:43 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1320-sdw: don't poll PDE state on power-down
Date: Tue, 28 Apr 2026 15:37:26 +0800
Message-ID: <20260428073726.1611777-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rt1320_pde23_event(PRE_PMD) writes REQ_POWER_STATE=PS3 then polls
ACTUAL_POWER_STATE. DAPM fires PRE_PMD while the SoundWire data port
is still streaming — the codec cannot reach PS3 until the port stops,
so the poll always times out during playback. This blocks
snd_ctl_elem_write() for 2-3s making mute unresponsive.

Remove the poll from PRE_PMD in rt1320_pde23_event() and
rt1320_pde11_event(). The codec transitions to PS3 on its own once the
data port becomes inactive. Keep the POST_PMU poll — on power-up the
domain must reach PS0 before audio can flow.

Fixes: f465d10cd731 ("ASoC: rt1320: Add support for version C")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 sound/soc/codecs/rt1320-sdw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 192faa431b5e9..e42e8b6de853e 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -2000,7 +2000,6 @@ static int rt1320_pde11_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt1320->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11,
 				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
-		rt1320_pde_transition_delay(rt1320, FUNC_NUM_MIC, RT1320_SDCA_ENT_PDE11, ps3);
 		break;
 	default:
 		break;
@@ -2028,7 +2027,6 @@ static int rt1320_pde23_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt1320->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23,
 				RT1320_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
-		rt1320_pde_transition_delay(rt1320, FUNC_NUM_AMP, RT1320_SDCA_ENT_PDE23, ps3);
 		break;
 	default:
 		break;
-- 
2.43.0

