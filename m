Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464700;
	b=CxuqzGNK7zLXeyXyK723k3OwyuvDX7fog8vWq3y4vCnDHyMYsRGlFyHJrao5fmgteRmS
	 MjGF60w7ITr7O37SeOgYplW+KiAZDp9c8vmLqUV1ELsiLK99Nh7N8pzz10xTMHPzTago0
	 ywDQ0q3GZ84cz4p5rWUsyKv5L5gTQvWSTD8KLJLaHZtIDMFz+5QeK37MoAcFiiBIboD7Y
	 IYUAtd5eBHv6XMDv1jfqUzpU2tUqEh+WHbvt/uhLatgWWHz+sdjmIFugNNCOgJYKbpCU5
	 ipBPSTnl9gbL0Y9fLUvtFgzYzGbD/O/1EqZZoNOb1emFfPXrayUlQM1DnJ0LJQO+N2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=qMrWcK2aPSDBNmQTxH45TNZAA3He4ru8kBtBJ6GQ59reicCQh2YVBTedzVdIbgLRH1Ag
	 ke512LbPcn8dD0x8zKybtR+wUW/tqgkh9WHM0PlR8SaTLGmaDLFN7gznnEKfFNKkzNUp+
	 zxZ6KlILW9+H3jGyHCISyJdu79ec2J3nlM88+DEbIvS6vT9O32cWhhPiq9qum5RvCiyi6
	 QommBU+7t/Y3Wp1p0abG2TOB+QtZDEficJ4anq8nr0/GSsx7VoECG0CSNkAVGKkFJnrPf
	 Y5meskHGZyEFbztOblw2ATKURCcPZ1BEHmvQyzhOThpJeKO5sceNG47VfApL9vX61Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAnRLJiM;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68680606A88E
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68680606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAnRLJiM
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e946155442so31899915ad.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464700; x=1795069500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=wAnRLJiMuzISvsspdYm6JW4tFfMNYWIHHCHGj22cXlZ+E0VxYAhyZ6To4OETqtuW2q
         vqt9T2SWrnuyXJCUmBS0ocllLBk6fegbW5sl3EPpr/CbAgzC0JP7ssqaoP/YuB1PF5Bd
         InE8Y5rbg1gUeBCHkdvxQ1v4d3dz4tITw4YMLHdjy4VkyiWkJ6xwfMxhjZsUmtmaqppq
         ETEXJPPcZ0/ClcVAZaCX9T76MRAkSvdtHkn0T53u9tT6kqv58KJvND6DH6fYx4aFl3Yr
         rVvEAyJcUTiG/HmRrg9OT7DJPRTNpbJIuEegWK1ooJ2TJwgDjKwjEA0twrcI1z9kcg1s
         UyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464700; x=1795069500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=i9sPncwn5EdGECiAabBWxCh0aAhBZNFbwMNIJadhEXffpHxQHNuqj07HpbAglBqqoc
         +JwqAiskbm806a64KW6m8FxTd4zz+Nd8tvJdTD9eOiHWxTK8eexPgJfefkyq08ZGX/KL
         5iaUVhs9hf7ocyM4Imxqz69fCSzSgJ9ymlKDftuZurE6QuaVis23iv4rv7wFth3vHbgj
         dERcLVc2MleC+GH74AHZtq131YlPAxn6/WZnhiT5MuyEXn5OwNlEXif6h80QU5pp5pjk
         CCkkhk9ozettU7FhXnyEoxfPNy48Ys7vOkMpR3/pNvURF6/Pumx1Zg/f/m4QeLZjPE1d
         nCnQ==
X-Gm-Message-State: APuU4Z+oEGjpj/FYr0WbFDPd4MYaY1ySKYJ5sAE05wx/AAOeeeo6dYW2
	DXy4ReQVo0ft/UJXj0SlCAhZ+UjUyFCfh/DHEgYVU/KY/LRytOPAzyf81P2c8w==
X-Gm-Gg: AYBFou1ICLaxdK7PKhoWKS6U35reCg8D0llISTCB22o6XzAAhbG7r9ORNh9P+c8j3+W
	THGORj/rQTekswrGXgO3pN963plFZR8RGT7nroOGyOAe1rqgGUz4WP0pn+eqsQQuxaBAxEhj2AD
	0K8+lHZ88og2RdbvCD9wFZagDShWLT+LSNCr4yW6B+ak0sgfy9KjF4ys9V4osDcfIS3VmWGPwN8
	UulArwn6RHE12P46rdECfA0IX5SS7dhdAARm+UmdrtwAkmdI/v9K+qjPIe/wr/7mcxJ/bIItn9n
	kc2MeVrvXm+k4j/h6EjOdau13KmctyCI2zhrbZMkJy1JOOx2Td0sJuBYaUxELgzvfme9t5wzzxB
	gMe4ALg/1s337gjosh8r5i/ea7X3Jx5ovBlGm++r/xNBhzrIOVzdZvgOOrGIw/F2Pu51+vJ0XGr
	vhnhrrfYKPQf2TUfTznlOs+ecN7J/MB3PG9PWfdufnEgT6MPXL2V5SaM87tbWSgOGowA1m2KsEe
	e6uk99234DT+MK+6woAHXJyrurbBsqM94I5HxbYGlsuU6v28faUVved9F3RI4iaZ/1za7VUPSUo
	8qp9dn4Abez/mKkqi7WuvhrT7MWf2Iekz0VdZzS+j0HpKdUFFdnPFVrtSTUZKrfzj8umfiFxGr8
	y/b8uM+/86v8VOnYDrH3eHTWUkseKXtGPIyCSC5ii2j3D64UP
X-Received: by 2002:a17:902:f54e:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2edd76d66f3mr54934855ad.14.1794464699653;
        Wed, 11 Nov 2026 22:24:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:59 -0800 (PST)
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
Subject: [PATCH v30 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 15:24:31 +0900
Message-ID: <20261112062446.159-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
