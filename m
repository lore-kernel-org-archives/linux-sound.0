Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7573239478C
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788252419; cv=none; b=kdSllWFgXIZIEYb4MobhuE1T8BYmvlmART5VHDvqawxXvfSMOZB95qbXvSc1sXJYf5WLGAsynEKvE8JchlQY9gRHLeBDfP6/0LtFmU+oHmB2UgyaU1/VgAzWw8wUet9HUAQCIer+tez+3j23E8/h9xhgwxjI5N2gQAeB/5ipRT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788252419; c=relaxed/simple;
	bh=/8E37Xnx9YJaDh/U9Njjem3qyhhQUgKVn/5BMkzr+EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zev+nebfL0ZL/hRdhiWVHilWC0wAAoYaMNbxZqduxfTC/qM0Qf7cJNXxtEmP0nYiZSn/XF+qdOcRNQ2EGH4XXSlLnlb4+TtrB/NZn6qySyEr26eHjxAzX6KFgrjnnOXOTn8VOw+LenmCH561OjQ9OejYQa0BnQ/VPmyTapP1ACQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rP7mZBfk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rP7mZBfk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso51575065e9.1
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788252417; x=1788857217; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQKFjfjuFL+0WhYIMnVIEjkhiF4ZkpnIVufK+2MKp5o=;
        b=rP7mZBfkGza1vuXoFxFuEweNBGCTyGw1HdghBO7cVP1VHy7IT+mXHiOzcbvP25wirf
         bncMjOHSdrPVybxdwo0+fU8cd/OqxauxT1udv0KXmIeiDifIOFx1sea6pShGS7qYeCdf
         ZeudnB0GOLZQsdPGCzEg2PCoBQKaKYnUQjtfF0pYmh4NZ70Y+kaHXHnU2OQH/51DLPxj
         6FE/V2QXOuT5jSnI4wG5FWF5r8rx19oMRY3YtSELck4FlE1BZIUrN/Fs55Gfhf4ZAtJI
         cG+alw/f3apx+sOaJ562JfovPWJEHIfuVUbScFUCGHxrs9q+ciUu+2AFrImamvH4CaC1
         NpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788252417; x=1788857217;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQKFjfjuFL+0WhYIMnVIEjkhiF4ZkpnIVufK+2MKp5o=;
        b=mkiVRnIbmdYvu7892rfojFZBmHY/uWqhkNH6+EKjLZsg0dhZ/4Oc7g0b2MyviMtAN9
         5aurFMW9lbrElmeezHZnx/qJbbw7QL+byKz8P+8qrTz70nPUJ8ree1W1CGCmLPcLkPN3
         0PRoiwzEOkQrUgEcrR6R0YkRvK+MoQLgx63tNlV63GfvfdOq6KnV+N4GLps06PSeaIYL
         aJN7KFIJpHGdzzhwI8wJ/7qee6zVrSRokTZn6sRPS8qSL9pnoIgPGErsFi8E4Jsn2trZ
         lyK2PPZsXLJZYonO5Ot5yuyAA7E1Qnjt3FB9gr4yaX47lR6yLjmFOUocEAz4GGwzvgxS
         gjgw==
X-Forwarded-Encrypted: i=1; AHgh+RrSNagPQEDbqiJxUeIW9vD6HSZNL+/p7/P0e3w05GoclJtEJnRMsFxs7uXE7g2eaSOKwuuVGnlxS3l1DQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k5PUP1b7HAzFVFvuiJH9BN/ecpoxWLDdYOVhy09o+tu769H1SV
	q0jQEWDA1iIpSAYMhc0IQm28dSYONTJPLOFGvPSX2ByQ9kTK4zuVHbWG
X-Gm-Gg: AR+sD13AHIQ8IyV3FC4j0kpAzTfZCjLyaBWvaN1oxW74mBY1Arc1JRNe7Suf2jweNoV
	Yof6siooJDZyNDQhF0rmgPVEkeWbfIgiSBVDxPslUfeHLlQeaPe9+KtFHfZ54uTic82eZaSydfw
	GyWu/hm+M94mBRPP4MaZ9pX+KnpDsVB4zglOZnIG7ZdyfgEMZrlVyqFsavoQ/HJaXSKGemB1M1t
	IbFCIbc3Pw1hL7croxxAKzQhgEos3xnvcZChPuhRbh/mWMiutRNrnMD+nE7UJzb8e+Rl2WA+SvM
	L1v81QOEtDhyBLOb3ATFFX0ZGmyZUQzU5nkPtBhD8mnac2IJalc0Q0YF2ygx44OZYi1ZS5//LQg
	M6icTFcTv3MQqGyD/bIPsgHytSXmSsnQR4G+AYaF386nKgSsoqbhMEqAiSQT3/2USfNLLEtGdLC
	6BpCxm8P5WauovYNP90brMVcUt9SLPSu6jwzDyuo3+45pG49drfCx0gvZ5hA7eXylBy1ITGpP3p
	GWkV7ZmnV+30Vln5PrDPuh2jvHYwtgwCnFzomzZi03VwAXVPJHtmcf+OZEn02QdP5yS2bbvB3DA
	/Y+uCFC/S50II65bufHMZcWcAfaB+uxuP7TMSe0Ulv6XJHldb30TLmT0s9IPjHjK+oFv
X-Received: by 2002:a05:600c:3f10:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-49cd01972c9mr332759145e9.0.1788252416362;
        Tue, 01 Sep 2026 01:46:56 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a16a-7801-fd8c-4b37-36b4-e53a.310.pool.telefonica.de. [2a02:3100:a16a:7801:fd8c:4b37:36b4:e53a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm727447725e9.2.2026.09.01.01.46.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Sep 2026 01:46:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6.6.y 0/2] ALSA: aloop: fix trigger/close UAFs
Date: Tue,  1 Sep 2026 10:46:35 +0200
Message-Id: <20260901084637.66106-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026050445-detention-cussed-a8c0@gregkh>
References: <2026050445-detention-cussed-a8c0@gregkh>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport the two ordered aloop fixes for the trigger/close peer-runtime
races. Both carry Cc: stable and each fixes a separate syzbot-reported
UAF, but neither reached this tree.

826af7fa62e3 ("ALSA: aloop: Fix racy access at PCM trigger") covers the
peer lookup and state checks with cable->lock. e5c33cdc6f40 ("ALSA:
aloop: Fix peer runtime UAF during format-change stop") pins an in-flight
peer stop across snd_pcm_stop(), which still runs after that lock is
dropped, so it applies only on top of the first.

The failed-apply report for this branch named only the second fix.

The series applies to v6.6.155 and v6.6.156-rc1. Patch 1 omits
access-mode support absent from this tree; patch 2 matches the 6.12.y
backport by patch-id. The identical 6.1.y backport is submitted
separately. 6.12.y and newer already contain both fixes.

KASAN/QEMU functional A/B tests passed: 4096 captured frames matched
byte-for-byte; control notifications, mismatch handling, and 32
open/close iterations passed; no KASAN, Oops, or WARNING was reported.
As upstream, a prepared-but-idle capture remains PREPARED when
mismatched playback starts instead of being forced to DRAINING.

Cássio Gabriel (1):
  ALSA: aloop: Fix peer runtime UAF during format-change stop

Takashi Iwai (1):
  ALSA: aloop: Fix racy access at PCM trigger

 sound/drivers/aloop.c | 98 +++++++++++++++++++++++++++----------------
 1 file changed, 62 insertions(+), 36 deletions(-)

-- 
2.53.0
