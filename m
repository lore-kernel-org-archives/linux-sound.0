Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062071;
	b=wPc49+efosdeO4CsXUSXraRGFJ57aOmxh8Mj96SLVgxIpe9M1hMQAoWZVUTpyWEOrzES
	 jafzr8jQBOLz7/w+kPxCxoVwjAh08CXapnrVcYc+DrGZXeoVO6J8W9WPDIAzTIO08isca
	 omwZpL2zx7bEqwDH3QZNaGqg5w5jVPUeicMSRm9PB81F58qwsG4HV3FKczpLqQM/EFxw4
	 T2C+sQTw2DljBEYYT8pb6Lcve1g9AEXTIU/L9jK8v90RLJmUPOzjgUQ5i0lG6w9cR3ntB
	 BpPIT6cJXK/I73bkdJ4V1+SBIHvSHxgdSo69xJgpwCGHwNCRuGy6M1zIJYWTXkdDLag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=com6wQk38gbY8kqvKN+5T2SRok0cwbR6+b1sFfV0Ll0KIURIATp1SNGwm/XbvedPDJ2d
	 a3ymn2virsOydO00EUF3T3niW/2mF22wwlQWHmYrnBgvrlvkfcxLrf82viTqF3wvIIL1j
	 FGalCKRnhzcqALiEk1QqTCAK5GFHU0rGp5f4Ks8YQuB9YCLDSFiyq9tGUtHkloS6v0s7R
	 1DHsFcDShxZ7vH6oq85vWqcUxAVtw9QM1mJHsB6NqYDm8KcB/enYLJtfXHMbNNhnUN6Gw
	 swXoPRVAbb/Mu1xgZgNmgMB7TgieE3P/rrfgIg+UeyAhskm3PQAK/6mBXSgxsxvKVNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy8hJ+ou;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6E8606D821
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 14:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6E8606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uy8hJ+ou
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2583005eec.0
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 06:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062071; x=1794666871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=uy8hJ+ouE33Mb9klB09Dl11PkCB34KQuwLsOOMICYNWvhhXLIA2Kbbq6QiieOCYj7C
         4eguE5aCXm+w74x70kWaWpIeVBkwNq10UIN76NP0MgiclIbRU/2bBeAICVwQZOwKKmPL
         Tta/EUuDSir3csCHLluQyk864Qx4TG534ALWvYfCQI1QQTsftFlF0d5dnD3UXIDOjfNw
         lQSd2SqnfQYxhzY8qAzIODtD3KkcwFz9AInGmWwZT6KiULdQsQP8hL8JuTxY91kJOJYY
         mjWNa24STMk5DLF7gzA3vY8WQftSlF7H4yg7rhU1kg3qlqkOaCT3XaehnSN2b5JDr3/7
         NMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062071; x=1794666871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=h4H8AyubtLZIsLk2chCaa6ZVfrmOJ/gtlIJLDEvnhuLHhwfd4KAoCdPxKkEIh+bDF0
         XsPEZ5DhZvkTdDTkp4wqYru0KULR+TGfgPX7MWp6TBbkjmxM6ciX+AwPDkaFx9q7CqlY
         2WCN0tiEsZD7HoQEemZyKdot+arX0O1CQx37lZJtY/bUo6veKrOvNECCs0lWx+ck6HHz
         +SC/c8EhT7gi+NTytlj5P8+51Ka9sxItgxoyJpYRrqeTPvHst4hZl0ZEvbs2e/5Tjp7w
         WYlM6mGB2bi8LiLwirIDLKW65Ch+8gybkqqWveObSh4BVN3qAq3MgTMTJNdDPj8AAd4Y
         QWug==
X-Gm-Message-State: APuU4Z86N1voMse9qc5TG7uDgVZ5ApqfpVwkujs5wqbDx0polqqSrfeN
	P4Bd7S9g83YKkv1jX1gKLISTL1WLMCGV3JfSGSMdRkyD8CMxinTaU+pHE3YHGKee
X-Gm-Gg: AYBFou2SGjz6+oSfKyDnyRpjKRhb4HyB2qoFpwtTHmxI4wKDV2vPWxjEWXsqb4UcjnY
	rdnSbGWdy3VXw25//YTP/t+ezuB1c9DrejZktDdeCL24wPgNql2+kTQtYDHWkQ6c/IVr33TFyCJ
	Yn/pvPkfTXBbbm1ZUWUVUpTX3lANg5zhpcOGGGMk3YgzdDEt8SiLNuQ+t5h1Tc2ZK6llUnPTHR6
	VVc23PXifvq21aA+w9rqfyEBXmBZD7ObqFa95JLpsXWAztRFGeAeWJUKLIoRUNKL15UonAEUpJi
	D4UGihqvAlQPpAAkyauHV9W6DkhXDC6h7eh8z/xk6EG9uewr8MaJ+fgAiA4BzxoS+GP0V8VvFjC
	uHk9FZVN8uuec6ssc7ZHWMxJCsMwuJa8bOqtgnL3290XeDRIzkl4nzWopAqZv3GN+3aC4/zCsL2
	p3w+MjNOEvS5Hw5BHESIM6+w2m53xcMsHyQyX5M8TNyx030fHANlyVmWDKDWF3ABPWJ5JI8u8nh
	07p1KgYUOkDP6Kf3xd1V9m3a3BuyN/Y8jL4qxEIW/CEhWCJwhJef5XQZqIzLrCuc3eBAs6AAym5
	mzMoUTVybz/bGWvtamZrxSP7FvHhaqzJZkI/1z/ebuZ6qQp8/zs1p3lZSefrOfggO/Ao2vMR6OR
	LnK6VsSjUb6ougO9y3m0Q0O+onw0SjwyacYt5ZoqVVMlo7g==
X-Received: by 2002:a05:7301:d813:b0:36f:6b99:f94d with SMTP id 5a478bee46e88-36f75b1f80cmr6584172eec.20.1794062070524;
        Sat, 07 Nov 2026 06:34:30 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:29 -0800 (PST)
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
Subject: [PATCH v20 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat,  7 Nov 2026 23:34:11 +0900
Message-ID: <20261107143422.29319-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.
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
