Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910449;
	b=xebCFsaR2V8s1LO+U/B+qbhxWHltuVzmp6DPJy8yNi7yz72SxIuONL+kzskLg+Ca1dOd
	 gwMcuFe91ntjRUGQNu9QHzarWx8UI2TU/EQrl734zPpUz+Vcudihvu7JSivEIJyBWEndr
	 nR+IhhyxVcXb0/DueYUZ2sHl7vXUFDKJ4NYMgH3OnbfhalT563wVOls6JjDAbI7y/OxgA
	 wYxkBW1kt93zWE6biCX6dUs0+XJ2ssLcwEdteudu+nW5UhYM75hhQZUyugtQG1yBs3aD9
	 0ZGz8dQTzFm02LTcR45lLfnP/AtY/oB47W9RA5wYrte7MxVopTkzizOmJjPFyPnCWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=mLUsWgRm32f2HJr/xVrx8a0dkEsDjxFftYYieLx9j0NtYnB20ldFkCS2JVDD4tDP7WR5
	 bbPd9L1Fi5nhRs1t3uzmq7oHV68wpZ2hiqOSgpShx352fvwklGUt8eu2E8Mvk69h63mj+
	 DI85Cb2ojqQo8QINSTspASoDaCK88vYjWbfRE1f2ek1/YubVxOrmrpnAvj9G5ay73e/Xk
	 N5iiwxLES9/Ns1uLV13Ly/ezUKfvaiPbDZNDlOcQVtQtWNvlS+WYJMDo0B/b8W4JyRORA
	 Gq1hGViQRhGIQX1+UROl3TNqYnIbuG81Z5xdtTMNop0J3ZxW5dfXCwA2vWgrUEqDHnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pVDjVEHf;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699A606A31B
	for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 06:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E699A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pVDjVEHf
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9eb579c0eso10857425ad.3
        for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 23:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792910448; x=1793515248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=pVDjVEHfM95BkznBoGTv8lsNxfPvO+wdDgVBA58PQFLJ53R6rCw6MHXpld0Qe/sqEF
         MUrPa2BZpTETIImt0K8JcjuPA4mnBIpDdx/GCfWt3uYNWGc12hHgqLVVHPLVcG7QkpWl
         jjYOp1rMikRXBbF0MJ/WlYdowgTD5qwLeB3CQ1jEwvN19iVofxhC5eRzcOS3O1kTu6a3
         iuYHeLYdLFc9PvnqJ3xfXsFh91epinQzDgCsE75dOCPSoTQ307M4lBJt4n3nwGbuNWgm
         FSpKqLb4eCAVaPnqNBfW2DhvZ4fh4QITZTICvBDucGRxEASY0oIzudji7sqegqfM4n9k
         XcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792910448; x=1793515248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=EwmedvMhnhgqpP1Rwy8DzD5+j5R2xJGJ/fHVDXQzBHngMWFNhR7SOFiXkkhgYlpn8a
         y6DdlT1SC4exMTWKkjTbDbbLHqTq2z6jTVUNcvTGjsON0MvGs9mR49A/piP9xnTKpnrs
         Haq8QX/fygSlTmEjR8oMUbfQrIqfB3rdfdUP/26uOMJqXyZkmVP93zIB7R50JlZiw2gV
         E31QdK1YxGoWmYKWzTLO0YG9wCduC+doib16+hQjjH+iJtnsR49Vp1eDUv0nSRYV1MF8
         ukEOKb0FBW5mJmNUOxW1k7oA1w7OyuVzyZI/YZ7Dr/s1Ax/v7xt480syXglxvN5LL+2q
         CFQg==
X-Gm-Message-State: AFq9FYK/6q4SzDxdmCLXdFq8eN48SQsObmceMm3SBhEZ9GFjDA8O8bml
	qEGVL/+dZCAS+1c4nOUjnOCtqW5x2ro7wTXkdHZQ7fIj6mUDZ5inU8x6f2psfCU/
X-Gm-Gg: AYBFou3AfJtyHmxDF4sXBQYv4iySNzorHgDT2GyUxrsGzYVuNH5hfW0w/RuAFfmBH9s
	DkGeLqRiCDOI8/xqMSnOeNNZpzvbp3ZPYZZnDqgSv0IsW0MlxRefnb9UK6KgDxePJA6XsDKPtU1
	2BwyrDuXuD+iHWMXLK3o6YWagcuvVdAv8IY2XWC73vbWX8fuq0G6puMwXQflgdpog7FfZ0mE4t7
	23aouxUVliNwVIZQXUlmvq/X+o9pvNmwl46syu/SoKPP9c3UaM3sGzt0nAREbvWPiuCjtGua/CX
	sCr64kbwz6ac5cpC1wu9lH7I5CN3PXfdVf9cfsbOYOvodj0W+oWxH9iFCYH8tCbXQySxPPLdzLu
	lBlOCGpd2Xmi5OYPR+ZbfpHdSnsqe/wU16n3AgidX4FA87Iy+SdaL7kHwlojUH6uioseFn06CvY
	MeJoZL7kCfTCpStE4OGt9Vm8fzMEg5ibJeEFcswcBj35E3A3gHxRaroUP8h+OdOxcCHySyNz0Kd
	6tf32VjL4MBu8rMyMbhfa67idCmP2EXvoFqH3bw1DyUcwfv4uGyPKb49Lc5WZspQmSC3mdZe+3n
	aXL1lqE4tOIw/xKZoWDudRuRjRTpCAfFR52Q5K7YjcrgPMYnfbcV4uUDQ3mEwBlMfAVSRVyt
X-Received: by 2002:a17:90b:3805:b0:3a8:f70f:2437 with SMTP id 98e67ed59e1d1-3adeb131135mr2666671a91.50.1792910448307;
        Sat, 24 Oct 2026 23:40:48 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebbb2fb2sm4462670a91.1.2026.10.24.23.40.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 23:40:47 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v4 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sun, 25 Oct 2026 15:40:37 +0900
Message-ID: <20261025064038.81674-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025064038.81674-1-mynameisjune111@gmail.com>
References: <20261025064038.81674-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in the following patch.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
