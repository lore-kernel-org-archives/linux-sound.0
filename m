Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18333EDAD7
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776948730; cv=none; b=UcPn/7y1XFQXrXmtRb/uGCpP8G9RmgyrnomnKSOwEQxOYWf5MAsrREnVdupaJQCiBHjSWjg4edFphQd6uQGJ+iBUwnjkpdUfOCQTCk8KPrVCq7s0z4wtiWLrTuxy1cs36YfGCsd5Hv6gp/3GBuyoaseovgKkEwSiKDSzxnJhIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776948730; c=relaxed/simple;
	bh=Jg5SR7o1VcWMJNB5wdQqpvyhrEnCSnyB6mn3nEk4jeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JjnXp/7yybNH3MpeIaGItlN4ZBlGL2/HrcSXmkyUiIYMxqWuAJYNVxVfPJ6RjPKteIfMd5DaUhep3EE3YuaehjIJ3Bk1GptSTN2dfZug9X9fRSMHH1bjaCp0YbQkRQVVPR8/ZNzMPXHxXqHwq3RggRA0KxAMYpPmQd9NU7U1hA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9WO+nV2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9WO+nV2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b23fcf90b2so63468485ad.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948729; x=1777553529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kvrsh829buHJ1xDv00U40C6X+HtmBnUZPS87U4o6y9M=;
        b=V9WO+nV243wyzVLxMrD5RsD0T5GSU8TxGAmuZE6+K5NrKvT/x3JkGzkXhAd9u82L+F
         J8DrVrtBw+0RqoDk3ezx9Qx51ZpjlruYSM3iGZjEFOrb+ZyWEbyCivXiQ2EOYxOgFw79
         YYsfiE2yjKXoHUq+OjEZ8CUKh2UEgHyA3ZGhztuWAXd8L6vgt13MG2lJinbC9T8udvRt
         t+mDvO7GvDw08CbgHMJ56Po8ulg1pvGZjoab7/SwOui8HSDExlkPqTZikKtGzKkEODSA
         VmjsO7Kzou6QPaWyXB6ZkA0GF3lQC+yWjSQbrX6Y2lkyGeR1YMGjDdgzCh6rXUeHK4ir
         2HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948729; x=1777553529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvrsh829buHJ1xDv00U40C6X+HtmBnUZPS87U4o6y9M=;
        b=U+ZNFjA2A1HVZtu8KRccu7qTqLutMwy6mjpuxV2vLm4z6yt7hIgb+ShBs0pRvipwM3
         wG+V0HDqV8YWMwSJkB+GYlng/EBo9/uEsJUM1HG5dOD5LAmaRqjJUN9jgKpTZ1wjenew
         XD25Xp6V1M5/ZtGYEMSRGJKMjnka3MRLNbm8zDKi6GV8Fu7ifOLs6Vfd00+Z9PmwTTyQ
         cfwuzLRBB39GptSAX7jrr+L+epqds8TYEq8wsuVZcBjDR29Ghnf6oPa4UHykFvrFrpmi
         b8FUNzdrw7kZiFmXDWfSUkcUG5Y34oiXRTna3LXveuAumw0qRKm/e4phWjqSf1k31RO6
         mqVg==
X-Forwarded-Encrypted: i=1; AFNElJ853nUslYuXLRU0wZedUSSEsXD3ySJYfbz50W8TmhhV8c7gqiADgewN0vUkBjL212/dvxzd6/SNEpHY/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0PpADCBjfoGVObuxvDeM/UfB1Ax9xi9RkYcELkP4TVhY5HzK
	uYaWdwRwJYoZKJwC1Q5ywNtO7azKrAshAXWsoubtc46qiz2YmNmYma8b
X-Gm-Gg: AeBDieuq0zaMdwLQeRgbV4QgcIB+DDzMmPV+j5TSASdfcBqTORuD/QMqbVcfcqAEivL
	mhWDk9uSOAU+NfbffHfwyCa2TcgGDYclU3Zse63uTAwsc1gaeP42AkqeGSB2p/glZym1Rmc3gTF
	b0lTx8Bm121+2Sohy/7GtLTUHJ7lOq+FGo2ZMLwrMbO18pll5b0xEMATc/bcI/xXO1TnC4G39Ok
	FEa7BT1aMdc9rPv+pe1vpbp97+spHUtQiSck00pw4htNdK4AcKuYPbOod9s7A20yje2LPfQDdlE
	Ln+dYYY6Km94BP/TgwZs4UArVPMy9oXwK3/e4HbgifiTDkaZqShrWPcvKFslf3jTqXZ8SdNYaPl
	XlBvp39nCYGdiUYbCXrhlnHHizxaV6iNJtmL/MU4UAIi0F7buqiRBiGOYVRLnQk6K2yOMQ2+fhJ
	Wbi0MKOXCBGorNktKvVQVpun1iiWIEvQvfHzQjo59j4jw8YfOIF8jm28+k4w7GtcJnjI8O
X-Received: by 2002:a17:903:2986:b0:2b2:4c58:5ba7 with SMTP id d9443c01a7336-2b5f9f43679mr290188045ad.30.1776948728813;
        Thu, 23 Apr 2026 05:52:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab3c067sm193432875ad.76.2026.04.23.05.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:52:08 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: apple: mca: Use guard() for mutex locks
Date: Thu, 23 Apr 2026 19:51:54 +0700
Message-ID: <20260423125154.156257-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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
 sound/soc/apple/mca.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 39269cc7def6..492165c0e1ea 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -307,7 +307,7 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	struct mca_cluster *be_cl;
 	int stream, i;
 
-	mutex_lock(&mca->port_mutex);
+	guard(mutex)(&mca->port_mutex);
 	for (i = 0; i < mca->nclusters; i++) {
 		be_cl = &mca->clusters[i];
 
@@ -316,12 +316,10 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 
 		for_each_pcm_streams(stream) {
 			if (be_cl->clocks_in_use[stream]) {
-				mutex_unlock(&mca->port_mutex);
 				return true;
 			}
 		}
 	}
-	mutex_unlock(&mca->port_mutex);
 	return false;
 }
 
@@ -765,9 +763,8 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 		       cl->base + REG_PORT_CLOCK_SEL);
 	writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
 		       cl->base + REG_PORT_DATA_SEL);
-	mutex_lock(&mca->port_mutex);
-	cl->port_driver = fe_cl->no;
-	mutex_unlock(&mca->port_mutex);
+	scoped_guard(mutex, &mca->port_mutex)
+		cl->port_driver = fe_cl->no;
 	cl->port_started[substream->stream] = true;
 
 	return 0;
@@ -788,9 +785,8 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 		 */
 		writel_relaxed(0, cl->base + REG_PORT_ENABLES);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
-		mutex_lock(&mca->port_mutex);
-		cl->port_driver = -1;
-		mutex_unlock(&mca->port_mutex);
+		scoped_guard(mutex, &mca->port_mutex)
+			cl->port_driver = -1;
 	}
 }
 
-- 
2.43.0

