Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458130;
	b=wUWa1NfMpkPFsO3QDpTOsHUIZFYZciyDeLpwVFj6i0zscYnyUpcscqlJlkMREOZYiaFh
	 2hRx5KBWDSjc0chqtpSpuNtZxVKrKaW/WOfA29tPYmk+MeUSrmFTvEoea1o9sQFi77HlE
	 mxT5hxu0MBI0TK/GyRp1NhaDPn0f6oI1GQdxUxqvnPWH00OJbivhvkfo0ZeeY3wAFc46E
	 VAyb66q5U2uxi9SMAJepiBTmd57ELWk+0csdu3ozBasjSQZ/zBUADjkskHWJ1P8BRMSJ4
	 UODBqkRWv6nARQCH/8MV/rTiS/moyNr+LQiUAgm6oEbtJxUp7yehldMOlBCAX5d8Dgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=4SmVU6PlvIEA5FZswZpZGwd+gmh1Scc5vuoQwce7slA3T4Vr6v9LMChdlTG84l0URuq2
	 HlU3qFjEGbnyt8g5tqlYFiy2Gtgb53MZPeWBrh+3QSVpyizi6ceAV0lC2i4o7JDKrP9pg
	 Ztu2zCh40PosjqrVkTuD8tfAOvM3SKXMoW6l22EwN2FChdWQI63l8hEDDEMxtK0MT3HR0
	 1RG+Q61qRZ4jjZbkNJOYA5ViSIt0FzbMWb512PlJ8tSQKCtePifd+72Ae4+OwAJYGKRnz
	 DwVB75weOL+EgmMemx2jzN8g/db8snbgNnr4vffDvqInErewQJkoCWwk84hKK+eHweQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcCF1K6I;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46807606A894
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 04:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46807606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcCF1K6I
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b179528d56so969404a91.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458129; x=1795062929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=EcCF1K6Izk8f6rPi48OSrMcAcUtq69C6Kzv2CQNZ0IJYlg38DiZa47nP0T1LJxkJYp
         w6H+q9e1kU6u8fvgkHXD1PeSdHxEeB9VeqGe4q/7K5h84CN6WMOWTbPA2pxzZ4qdFeOB
         1UTYRyljJo1tyvkQ3Aw36IFYDGh1wsJV2q8UkVu9hVNzK8rBVEz1MSfEd1CvjuE7VR03
         SVdoXwL1ddr1UcCyBKXwgdGU5jlRyRTLJNrjwVO8548KI+HOfQnihLNFhn5bxyp6ui7X
         Es/IAJzxY28bDRomKXa5K9mWAXNkxtLNfwFqK2RLdzD22clRJTjLbUmymvvwHxczaWYb
         Ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458129; x=1795062929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=PG2nhleek4aPvDFhi+698EUhfHvPMucYn1IZC4Ga1rf+A+Q3jUejkfQr8iGiTQNwFp
         jf2PSSZS1yevKxbYbT7z10cIUvKaNdV0Cvubl3iYGvSmJtjEmDKXZ/xl8/iAFTM6MmOw
         JPp5OgXgwIwzF0huTCK2+nXJ4wGZ8UZ89aK/b1lHuAPThn7qqkpN5bvQbjb+XJ6CcjFm
         PFZtq4N52gLvzO+K0QFphNi24D/JW40+JNn8wySyxKYb1DAP8ZtdECqiYeffIt6D7TP2
         k4zOnPQkE1Kd+DmLIp7XkYxOJ86dXH8nsdsa11Sk+pLJo5YcYULPZkTxGYLPgpD5oint
         fdyQ==
X-Gm-Message-State: APuU4Z9b4mnGRSCff9Xrdk9su28Z1zWvmHQM+yc/0FIY/pi6gP5w5lqq
	mMEjSoj9AJdsOvHXuHme/KW0wxmbDAC82PmQ1Kw/Gcj+A3PXyJTQIgYu3rXoWA==
X-Gm-Gg: AYBFou1ojYb9+5wYWvMFphRr2YwYaCYTpRkw2n0ag0cD9Z9OQTFvAiSoU2fDxqAc0T5
	rzvDP2UdOx17KuqpgS7IW8026K57X7aVl0qX40+Y1hY0d0aFSb5vJ7eQZn5xjPIe5iIJc2FiRIA
	drLTv2mO+0nnoDq4ec+veyMS/5WOus6O9atwGD+7Wd3OMYekFQj9QF3lkpnfgzFju6AuJxleVl9
	iOsRYXvJaKkDF1Mh9+vs65uKw2fv5N6bf3ztBmZLbXFTGw0BZibzBstBLGoCt22hH9TN3XVIA3L
	Wco7sFdiStCaQf1XmX/6bBFpTUUBLGMT77iCaYJgcsgXSEzE21PKcr/sWyQjAMXfOHkYMVC586o
	oUyBFaGlVRXFs7h7T8G/hlZa4b1Ox4yqsitAGfsoiOIJtndIlTEazGNoFhVY72aMOZGV+rt7BpO
	AgAzVDxgLZB54hjTwQ+6KLWfOnuHXC4hR98PlSMUZF+dPvjkgvfGDgHJ3eMUP3opLnJk2Hw1CTG
	9HMNWwWkLeP39zORx3dbEbAAQ962YtxcDBseQDGQh53TSY7Cf2u+E3fyU4C3+2CaP4ZYmv5Bcdx
	1pOcinlCPISMBdT3t8lIRF4ncXZO4g09EMn4E/BDFmgZGAB79XihqXzsYoMj1RqvYOj4R+I6N1W
	LyRONIInYh57tfLzFLeMp+1ap8UcZdDWNXxWGNe7Sbej85l0s
X-Received: by 2002:a17:90b:3901:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b182f6384bmr3693962a91.46.1794458128581;
        Wed, 11 Nov 2026 20:35:28 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:28 -0800 (PST)
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
Subject: [PATCH v28 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 13:35:01 +0900
Message-ID: <20261112043516.37010-3-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Handle capture DRAINING separately in the state update: a full buffer is
still readable capture data, while progress beyond the buffer capacity
is an overrun. Playback continues to finish draining when its buffer is
empty.

Refresh capture availability after the unlocked copy and application
pointer commit while DRAINING. A final tail can arrive during the copy;
subtracting only the copied frames from the earlier snapshot can
otherwise finish draining with unread samples left in the ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -215,8 +215,14 @@
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
-		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (avail >= runtime->buffer_size) {
+				snd_pcm_drain_done(substream);
+				return -EPIPE;
+			}
+		} else if (avail > runtime->buffer_size) {
+			/* A full capture buffer remains readable while draining. */
+			__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	} else {
@@ -1919,6 +1925,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
@@ -2405,7 +2435,11 @@
 		offset += frames;
 		size -= frames;
 		xfer += frames;
-		avail -= frames;
+		if (!is_playback &&
+		    runtime->state == SNDRV_PCM_STATE_DRAINING)
+			avail = snd_pcm_avail(substream);
+		else
+			avail -= frames;
 		if (is_playback &&
 		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
