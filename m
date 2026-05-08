Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A243D1CD5
	for <linux-sound@vger.kernel.org>; Fri,  8 May 2026 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236761; cv=none; b=XY20aHXiYN6pFLhffXsMuYwSfaKNEoCg9zc5SI9lc98IBbqpYJJJqgZqCQCoxebe1ArqK+94AIwRl6YQbtwNag1MXtmN3jJEltW3TpDd/4uWpLh3rQ+VtdiQskasWnA1rPziDevTOsotacQyNxxxtbVoSWXVTk2m5BapTybjsbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236761; c=relaxed/simple;
	bh=hgD0CGh4ly4OvpPUJGHRau/Dkr3Aayaonu/8yfXXpu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DSXhT4dPnlPime5+5UdxW6d9YcY6A7Pq+6Y3JsK2KMHI9m12o5Yjl5rPuB+W146tEsIPiiv8CpYNBuDrgYsKx7OTJVQ7H4rudGulKo+S+pRYHLakyfFyTcB/Ba+dfx+aPifbGTfaUF5UGglQVGN7uJRhx9vp88TBFBKHMsa1tAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUn7Xotu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUn7Xotu"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b4650d5f5cso6929985ad.0
        for <linux-sound@vger.kernel.org>; Fri, 08 May 2026 03:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778236759; x=1778841559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLQoiR5rrh3hqy6OvnSB4BV7IM1W5VVe7Onht99maeg=;
        b=FUn7XotuHqFNnpQ9zw0pzeSC83ZT3HShmDlCmAxYj9GRlpB9iqhYD0BvIjv0eO7i0X
         XNt9rz/yBdcijOTmjsZz8oX41xRcHQVwbmu+c8LT/KWUPZVa7eo5arxo2TBqEKxAT92H
         NScPQ0OmpP7G2MOGQCa6eeVbh7c1u9xWMcy4PXfPhAD5/JxGqmpEtLpiCaFFnCol+KyU
         qumjrUbtZO5bXkD5CQSYLvFq/f3RBX/GoeP47wO5LR8zA4i2fbgWSfUGhRTxu1kQVv02
         Pal5CW0NPB2cyWsQg8YK45mzd8QDqaT2f/+YXqXrnz54otA/L7sC/J2aezs1cbIpPAFt
         3zaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778236759; x=1778841559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLQoiR5rrh3hqy6OvnSB4BV7IM1W5VVe7Onht99maeg=;
        b=g7klxNPMc+vGgzBPANWr+Ahn2ileyJCSHlD/5uQL7xoD9EDSSEw8Kxvh5PwqVyjUge
         +g36son02GtaC5aQqoVGcrJKAW9t53ubBDIsi8ojBUAcIW7nyqgMJZV4mH9cuqPrm3hg
         NcHV3T7tH0Ag7GEMXGTb9qlqOcLyGB4Pa7BojAsVKOAt53gp+QV+N3CnxvjCG2rUW+YV
         Sx+5On4WCIxPRzR6633XcEyDNL3fWwCPGVtP4NERYZKu1IWPiIQqLKnhKaWCwH6e4Y6I
         1jZZB5eDsWs9m+s5qMOSoFqIk6kc2aOf7dEg4bYthgKvYkutGtR+9tmLmOrom9RwC8tn
         3uYg==
X-Forwarded-Encrypted: i=1; AFNElJ/MEwoli0nMEXxPW3bgsXktWe/4cXqFkujfpfjROzwTC2gADVKNeeKKLE3zP0xwjo4meheuudwMvLbboA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+DAEfsU+M5SHESTeAWbCMQKOOzB/uAt6sG0Ln77VajjkTPtJ
	ri3KJo7gJZNXKuC7BQ3wWUOBX1gjsoEnoSmfhjwEJ/lDRo3gzy6Pdd0F
X-Gm-Gg: Acq92OE0tHtR+2YL00ybYoIkfkDWNbJzR9K6CuY07lc5BFowBk7jb9TshBLYDOZYYJ+
	JHaVLKHcX1xKGSPYoe7ax9Wx/CQwMifZNqKW4MpR+aOf+BuPlL8Rg8x7AvEi2CpYJx0yDybOhtl
	UHKaA9pSMyS3zi3vzf7oPUeSG+htSIgtnme9U6Qm8gtxNPGF0e1oEeNgpzhlA+S5SV0uCmo7TAY
	dnvJnQiPgnvnIO7b1oofDB3wukO3ksRq3EKxKgwKWYpXvx+cLSvSMgQBQHJS9wsaZdrfXOb4+XM
	GSz0kxarWDWPL0N6I8J9aK/gyBA+mF69KJ5EZi8JAO0bnewePxhUtkMgM7ZC2KAO6CQvwZ9HovU
	kln90Zwbl3o0SnYtiI0Zz88F73z+oFrK0e+7CmXkA1KvDhws00MslKozpur41AcnxqwdjDz/jU8
	Tse/y5LEAxcaD93pG8JdGRjrwWlaepBnhbt4KmAEh9ngAP/MQry1G2dlnv9wOC7jPIjVEr+2kM9
	XjVx3A=
X-Received: by 2002:a17:903:1d2:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2ba7908bfb1mr124730905ad.13.1778236758762;
        Fri, 08 May 2026 03:39:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d27109sm18309345ad.1.2026.05.08.03.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 03:39:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: peter.ujfalusi@gmail.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	jarkko.nikula@bitmer.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/7] ASoC: ti: ams-delta: Use guard() for spin locks
Date: Fri,  8 May 2026 17:38:35 +0700
Message-ID: <20260508103837.138142-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508103837.138142-1-phucduc.bui@gmail.com>
References: <20260508103837.138142-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/ams-delta.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index ba173d9fcba9..6dd0d051a757 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -264,10 +264,10 @@ static void cx81801_timeout(struct timer_list *unused)
 {
 	int muted;
 
-	spin_lock(&ams_delta_lock);
-	cx81801_cmd_pending = 0;
-	muted = ams_delta_muted;
-	spin_unlock(&ams_delta_lock);
+	scoped_guard(spinlock, &ams_delta_lock) {
+		cx81801_cmd_pending = 0;
+		muted = ams_delta_muted;
+	}
 
 	/* Reconnect the codec DAI back from the modem to the CPU DAI
 	 * only if digital mute still off */
@@ -373,11 +373,11 @@ static void cx81801_receive(struct tty_struct *tty, const u8 *cp, const u8 *fp,
 			continue;
 		/* Complete modem response received, apply config to codec */
 
-		spin_lock_bh(&ams_delta_lock);
-		mod_timer(&cx81801_timer, jiffies + msecs_to_jiffies(150));
-		apply = !ams_delta_muted && !cx81801_cmd_pending;
-		cx81801_cmd_pending = 1;
-		spin_unlock_bh(&ams_delta_lock);
+		scoped_guard(spinlock_bh, &ams_delta_lock) {
+			mod_timer(&cx81801_timer, jiffies + msecs_to_jiffies(150));
+			apply = !ams_delta_muted && !cx81801_cmd_pending;
+			cx81801_cmd_pending = 1;
+		}
 
 		/* Apply config pulse by connecting the codec to the modem
 		 * if not already done */
@@ -426,10 +426,10 @@ static int ams_delta_mute(struct snd_soc_dai *dai, int mute, int direction)
 	if (ams_delta_muted == mute)
 		return 0;
 
-	spin_lock_bh(&ams_delta_lock);
-	ams_delta_muted = mute;
-	apply = !cx81801_cmd_pending;
-	spin_unlock_bh(&ams_delta_lock);
+	scoped_guard(spinlock_bh, &ams_delta_lock) {
+		ams_delta_muted = mute;
+		apply = !cx81801_cmd_pending;
+	}
 
 	if (apply)
 		gpiod_set_value(gpiod_modem_codec, !!mute);
-- 
2.43.0

