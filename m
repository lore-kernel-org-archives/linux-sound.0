Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793064155;
	b=IW6Iksq51NA9u+0ygR+d/98FFNTSCH42h3OJRYq0qP3yHxbbR0G/e9lOAdKLqCcDvrgc
	 qREy1qqDqR8aMJf3g4kc2TfjvNMbpDUTXZ2qmySLyMf9UqSVhL8GQhPf+10rRD086v/Vf
	 2KdngK5p/DEPkVQJyMgyhmXncJ8TK1wGdZMICOzE8+/OP0Pg7zX50tJyb3Wx4qooi8gWc
	 w4bdaVIzODkCG1vD8gLTtR4MbwXdhbUQOQg6ogOGXNHirZu1Fj/clbISZHCJxV/fcvvew
	 LKPT1jR7nbb7oOssxwDRubpWpcpuoMqgnjTpN5OaLg6hSn1UGJzQZOmQpg9YyjZs6Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793064155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3v062WaNqqHrG8TV7QOmtJEfeFfDWBddTs8mnJTpAC0=;
	b=usjbhmstsfIoNpLU5vGI/h3YMcl2RvAiCIKNQCcnG1gBH0B8LMJ4Az2g438FKYWehTW+
	 ImIcpTMsQFpKENvidOfbxt+Snvh3y/slsTGoVMXNnZ9+TirkKQdyccr7uJ1yWUnvGDyGG
	 ccyQVzvZcPzWmv48eMOjj5Ed9OkpGUCSfbhm7fwB71bq/QxX/BwaZYepZZFExwWCJ7yIu
	 q/d2KP61YuEwaEiTuVu32jSYVVg5fJ1mKcQTCvoIMX9CMuJnrF6WXmVq64dWylsq0QS+Y
	 yIFP4lt0NcDiVE6t7eiU+8H1YD3M2062nK3DlVz3XHxyR/Jd5ABk06BikKDS2tNoz8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKrI6TWf;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217C2606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 01:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217C2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dKrI6TWf
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35f1f76ea84so6030049eec.1
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 18:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793064154; x=1793668954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3v062WaNqqHrG8TV7QOmtJEfeFfDWBddTs8mnJTpAC0=;
        b=dKrI6TWfjMwv27rDwdAKpACbXRnFm0cV//UKLzx3lLzKIo7YDfu1+47HlAnzL/q8aV
         c9fFcytFEgOunSwctjlgJY5sulwhTzbcLus6gq22/GKxdUG/hDtsJn6piRTQcgOFtkr2
         58cvf/jb/x9Ni9aTcHbLP8tROFeaCToLyLmoE0CSA9BJQZF0HNt4l2xWbu3jTmW/SnY6
         IPn97ReWrF7Up4tKDnZ42SR5Ek9nO/oKwQL0lw8itf/niAmaJozo6pWeHDO4FpBmKHr1
         Dp3PIZ36D+NuF5st18YVa76RItL/3RXWWMMGLkIWbuW36NUooTETWY4/ZZcM+Y9tQnlB
         cY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793064154; x=1793668954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3v062WaNqqHrG8TV7QOmtJEfeFfDWBddTs8mnJTpAC0=;
        b=ylS+UBA5EEnu7HXgGY3BwIV4xROUCvZfTPYyNC15zAMS7ggWbLmGpHQwXNHsEUkodt
         AMJk43gLYb8G35TBewaOLOAGmZLufDG/IztqkhvyK4NoyzjHnR8nJOQNRN6UUHVN+NMG
         CeHu0hNxUJgqtV3sLPxkm7SvjHEj3gdvTUPAqQrGOdEKhVhNEd6YxQ0mbtuHVP88qvA7
         jbYMF9gSJmWM43+Y5IB5tFgrLONaVWsyt/CmxTJTazAv+s7VKle/AmIeWm9665CI7UMr
         AJ6rGtnKQwMBOpmR49gfHBJAcZddoimN/vVWHepm3vi4UiI3voYO+rYiB6mAMlqbfRrK
         wmLg==
X-Forwarded-Encrypted: i=1; AKwUvBwg95rgGbB4H53Zulld/UuVtoPvttPrrDqDTm7UtORofMcbSFerTolsjOvwjW6oAfR+nPV7EyP4YQQkUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKxFDV9aiFMWE0Bq18VjfQ96/e+QwIo1z11H51LhYm7+5UJQh3S
	hMld6sIET6hxI+fmRWKvP2vIW70q/FVsNNOhTKYajV9HjuMm3/MkDpWT
X-Gm-Gg: AYBFou0M5NvZ28cizRnjZZogwRSrcRuvrKbvcdXdhBBo1URpk4BwtDQRQATRHWa5jsX
	3cRMmJE32JQtPgbEKikz3rLOaitc9c91WLhFoXy2n56eIecUxCSwqSJRhHOmcG6v9RXDRAZE2Uq
	NAARvUPpu5Sn8H6eJYQM65dBwQECNSxwPuuq1c3ZoDBOXiB92h9gjykaqJDXQYhAMyZtyi6nWxS
	4Qqf94ISVCYSJKMu+k3hvJdYLJ9T/9F+5llfMKWCsje88kz50+hWRFnTPurJk0zLqDSk200B3Kp
	zh3djF5VPxFoRzLQWlhCwPKT0MaLiFckq8xtnbIC70/Jv+qq7HZODBcEeeI9leI84Y1P4zynWtX
	8MulHCrmo9XC3IEimrI77yNRvvlkKvT0TeZ5Z4klF9bVyzFmPRfZdF+6xpiXnupXEzT9pUrkyPg
	ShBkpT3IznvZRSbGB5LZK881z7TWgTM9+XfE3EMCBxPXOUVp3eYpH4lJb6KOk8E0WceMBfoFpBK
	IZw0pQmg6GfjKLHxD3SI/l/2DxT348J2CKmqEpXMTBh2///yAU216y5jJWLfNtHp1r0YzJNePm8
	cn8QIztGKIcw7HeTtqtYOFy6Caw5G8uDQNzNf5xkJYA43MDQyqmiasyaoyU8T12tLai2Kg==
X-Received: by 2002:a05:693c:20ca:10b0:35e:ebb1:8e5a with SMTP id 5a478bee46e88-369e86165bdmr12131853eec.26.1793064153891;
        Mon, 26 Oct 2026 18:22:33 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec864fsm34844823eec.24.2026.10.26.18.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:22:33 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: ivan.orlov0322@gmail.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH] ALSA: pcmtest: Honor the enable parameter
Date: Tue, 27 Oct 2026 10:22:27 +0900
Message-ID: <20261027012228.3797565-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enable module parameter is declared and documented as "Enable
pcmtest soundcard.", but nothing reads it. Loading the module with
enable=0 still creates the card.

Return -ENODEV from mod_init() when enable is false, as the pcsp driver
does.

Fixes: 315a3d57c64c ("ALSA: Implement the new Virtual PCM Test Driver")
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64: enable=0
now fails with -ENODEV and creates no card, and the pcmtest selftest
still passes.

 sound/drivers/pcmtest.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 422fdb10f237..66bee8a2ce34 100644
--- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -712,6 +712,9 @@ static int __init mod_init(void)
 {
 	int err = 0;
 
+	if (!enable)
+		return -ENODEV;
+
 	buf_allocated = setup_patt_bufs();
 	if (!buf_allocated)
 		return -ENOMEM;
-- 
2.43.0

