Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458126;
	b=XOk7Ne1t2pM/wG9sAk7tycWcxMkIzn3IkjX5D9spmnErmyTjKsHBUjp+Q78kIgAi39m8
	 khbVoGVIkqIYXMpANhyRhVvN747rOAZAidE54KXYwHSmH9sg1Bi3LqsLXjUe6Y6qteRmf
	 tCFwDF6639NpeZ0rxh9FSF6GobuRaDZbtAi2L2VJdJ2G965NixoapJbmMyz2yt3GoF03f
	 IaYWYFvbfAQRF7v8LFpTU9ruYaBj5yg1tplv8GlcfMgUwywHSZT/4IIfz+LK9uC/upvHS
	 g7uuAs7kVLOSbwkL1X+icfoKkBW81EQKorczLT0ka3+jtnAYYznsxXmyvqIKLHaThrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=YLHHHCw6cVGE36MXcjnWFrQJ9OAF04tyVTcTrRKrHvk3+d0rc11gBJkLi0x6hbuhGvKI
	 5OxIfcTcmdOQOMMC7SieYrpV22Wr9LbAChpnu2LH2M+JplYB9LiOkbGaWczsfigkiL/Ce
	 aZBnjqss14EqnH0AQXwZgnTozNC8UKXPvqPJoQnZeONbys1xxSvO2ZBh5Gy3UZZLeYIsE
	 akXmZwWhDqeNRus9PU44r4qEKEkoFMqn6jVbM5yOEVaDhoKITZaNrSPAv4qOIcGUAaAEl
	 Pp4f+JPIoZj16vqJH8/mXW8aJRwAuedSkGwP6XWHAcGFQyiq5iHGax6BIEpH7oCnrTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTvywWgH;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B8A606A323
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3B8A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTvywWgH
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso2897393a91.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458125; x=1795062925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=yTvywWgHaB992/+07jJ8uPgYTmnXdgn6Z8/+qEQyE+82utOKU56zTXNXGPaeE95+aj
         lZAZYLzRF8bw4BE1idhj02EZBEVmoPHxfeyCoyqDI9Egq9qgm8EbZyrUXAsDfuptHLyj
         3zX2KSAPP/wTp0BT0wVYjhLidnoODgAlfK0H6+fea9DZtGF+J734WV+Oy0ue3NMorXIz
         ddVyVfZ65PEXS5YNiy+UpwZ8RQcd42nZoMJlO3k8Ia2NEr03mqdsWrisod8M5QLzhopI
         qrH6i41uE4VOSkm3oPWTD4eCnq1EYni3Wlg2npbtpf09c/0PQGb9lGyuymwRruqn/Xu3
         pQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458125; x=1795062925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=cCCmWi5ullsv5NADprXKx3JKucTRq2ivbd2pDdcoyPsFoRiJVYjJI7htIPwleK3q+m
         DLXNQMkxjUAcxO/M2oQypkJFgW0B3WKcsElrUWiP1B06z3I2dCCpWatEkjsjPbKWnv08
         awoq1W/ZEeHCwj/L99Rag9www9lFiCxiymeicHHFzSHwIh4H5hI3zBU5taPKr5N9NAFH
         JK1XG/EbOvMUf0SR0zzrkoUXp45mk95o100TQw2J1oUAmfCGRy26Ds9r3DsM4VinoPDz
         XYadcXFhjWcjJ5Y2g1gD40moEL2oFfXJc3FqsIyCRVgxiHPgZRTK5v2Gdz2TA2AQsWZz
         t4uQ==
X-Gm-Message-State: APuU4Z9F13Vs7dEQswAxQtPklhYhnERR83gSBR5iQpgCxPuKA9xGCWeG
	Lvy6rf4G3qX+ix2ysTtTvGsbpgA3DEP5jqlAFD0S2QIQsJeKLfi8rv2qWum1Aw==
X-Gm-Gg: AYBFou2t6CK+qIrzwA9aUkPtmpKh4pdtNIKhJyctpT4gon0DHTQxmZ641NWtSG02tdN
	bjEz67rL1qAmSYP5QkSnSeZV90lDrDDpqS0amKgvPcc3/nYBgPm3BJXMTYT+PfjOiRl4l2LNs64
	P7wWoACEbbeFyw7LyH5p36n6r0iITB3SvchnVZLtSsasVfuHF2LyVycxxqH975/o5Wld7+a7SL8
	S4uoXrD0dUITZJAlpCJmLpHfJezoKFHNRYSQ6oF62UVEnlLyDMG4GNfdiko90PqInXqgrkebiAN
	4HIrArkvXZ3G4hYDhQbnXRIDYL6im9vTBQGtS220cZTtoGqcw5DVTeMFGE3tQNkNSFM9eVlA5ul
	3ht7kaPT20kG5W2epc0t5OAG66ZOkJj95QXkg9YARXYHDQry/8ot+155jL/9XcM4IT/jZoYXs2A
	Xh/uIjnaWMauT0MbrBLdmuXcPsdOICM4QUMAlJRm59bJ+AlnnyI31Pfw1OqLkxqNeEV7ZVQGRg9
	PxM3wRDgjmpty14BWVJ0Vj2GnrJ177RmDuJ9OV5HuARpEN5JoUCwTSzBDr7vO0muRRei0QC9epd
	llAvuxGErDJLVQrVbon4d7B8M6iWbVCwTiAlVgD8bAxr0ozjYqr8I+sW+/I1K12TSp8wdN9YBnL
	6cy6V7b6DlQXfTVKVvdP4t5o9B7nV+NefkxOzvUSAhxJE0fQ=
X-Received: by 2002:a17:90a:ec83:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b182f61eb7mr4107773a91.59.1794458125200;
        Wed, 11 Nov 2026 20:35:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:24 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v28 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 13:35:00 +0900
Message-ID: <20261112043516.37010-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
staged-capture policy sampling.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

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
