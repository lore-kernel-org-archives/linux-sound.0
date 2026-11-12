Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461700;
	b=wAT4InQkWz/ltA6kVlUwqn6fJpANk1BFAaj+3RMlJAF9qNuOguspManrhWFtPimtT1xx
	 mn3P6fwDn1EmmIX+nZJshoGkzUNU1iM9JQGT0PrMNkti5uJHId3EORjac1SwOoelXHOGX
	 EiZslhNFDhlq0Sqd00BdRqsCptbg7q0bOE7+ZcpYDJFTAgTB5aM0s0m58yTB1ykua/sMS
	 RTZmKFwqyfO9e3HZ31fsxuMOJHJaNTWp/eKXhKprV+zO69f6zSZTDJ2sGhOKJkOwjeYFO
	 fGFbCmgfGTeGfqEuuOakpYNRUFaA2wIzHTgjRK1MZWD/v4EWAjPp1sr3EQJnwZv/htA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=376zbYp18AwKq+qVih9xNx5ANk67cD+/5CEI/Y97HNhv2UuY8AGlv8P+ytIhx4gqDTo7
	 EUOJecdISSFUYBJ/WJ66Jpl5vEiFRlRuOK/6C5Wdkg2FtpDedQqOOB6YEVMhB4NaUG3cx
	 K3mr6qXwJJoJzs8UUo+P2WfVWm1ZsuwMDsL5YoREOSERxM/TUfooNGgrECK/0CwdHrXZH
	 zZAbMUmlJLp+wnpQCT/fayHZypZV5ZyBlDut+k5+AYzFJ2HJw+dYLqVHLdjpp2dnK2vkr
	 CgkTBr1z2zcFBLSQ3vg6SybH91YOc73ppCG7gUO2seyKzudUS3J8gT1VZg4MO2Uun4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa3kF2US;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B1606A88C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 05:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 471B1606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa3kF2US
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3acec6677so5790419c88.1
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 21:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461699; x=1795066499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=Qa3kF2USmKyC/5Q3KK94fMaTXqGaTb3o04XoFeLwdpLzRw04MN3/VxM9g7nzqJApa3
         CwwK0ypdlI4ebXM2B2Jx6JnOSw+viS6jGFZMSimiCrcmauAZkBGQvsmXhRgeaAdxVyAi
         e4wtz5kLsy1bzqHFAoVlAOzDzqSVemP+cH0dLYJAoFWLzB86s7U9F3v+QhdYB8rJ+yFB
         mlTtuANbDb5Yi0OWqJxGGLFfXiVTqMv4lrGQwt3VeKqvO+dfoUn7yXJrsuUkqEfPopgQ
         pabKv613uDAat5NHEAHPbZe1sMJUXpBaRQtonnDD92HX4NcgwFn5GaGwi0FrB7rygki/
         RDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461699; x=1795066499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=J3ZFi20VPgJ7YntQ2LSjNucAJ+ENsI/ZR9J3rJ7BQe/gCTQn8Muq4JaHmeJRVi8WKt
         sbkLt6vD5g+hQ9zv2p3rE8gDFskLkOKWjUprdfk9M5yVGcl7UGy3EN69hClJPVvkPz4p
         j5yV0vaxAFU5W8eK4rrK42aItnqnUNuj98IVMSW6W/67eeoxwKlVXpcNVJFVxft+gX/D
         7huyglw8cxiWpLM69A/LY6cc2CeBFlCcbvOHnSb3b17LNlML4Wz5zxP/Bm7o7+Ez7nHT
         /a6IA0w4uns2lDwv/WLKY7zlbys8fwwUxVcxJt1rEbKjYhCbESnrhKBeDeYOAU6AQdw0
         1DaQ==
X-Gm-Message-State: APuU4Z+GWS114Fo/kJKc6MBf23vuOt8cD7u60l+2aEYeNvvJHHG9Tx6n
	AkN01+wwcAPN+/oyrgxchROtkhfk7CXrx3z8QQ/N9arx4NOBav5vbYReV/xIBw==
X-Gm-Gg: AYBFou2kp0p/+oGP6A92T3OnAh7EIRqdZ6BUCbpViqSrTDyRoUKVJHFNesjgr262Cx2
	VfiHrQ4eDJvxRxskgSlfTMI0H7t6Kh7RbIyPHspbLGXBbmRgvuh1K3W/q76vqHdF295t4NY4JgI
	nVSSpoih3T3kjJip5aTHd9yE57/WXFszLlUlNykdBxAmuAwGuGMO1qPTKcf5QgxbdJdBhMzbEcb
	ho0GUbtMRrDoGPEZRXAXz5DGNajEtBPk2QPLu200++9B63bds2hITLL0R/YmW5fFUGY5vucl7Wv
	ugHDxpUV2CgpOWF8yeKEb5sY9A1ijDs9KFvFMfu93BwbLLt054Smn3+xXZ0cnHWAJl9D9Jcj/oh
	48noy4CnC88SuJoSV/YrJXGPJRlK8hTxKCJt0+6G2S707pKC5y2B2hRFLVHJV/bHJ8++YxTz7ZQ
	i4iPDor9maNa9+NzFcLn1pnCaUo5zNUfqkPT/LwyHdZqy0nmfGw3KCtJDp7rPjK/XfDs0e5C7Rq
	bKMoKH6g9RJEeLxw3INBRgCmdYuJZ7XBgauntUdEiD1etHbkI37Tif53hbKUR98yawU3CGyyRzU
	fLDpzbekuofYWww5bpcwZLqCVytfufMRF9/5CHZ2LRl4Kr8DRlLUnpPOeQZ0BAUe32Vszlihyvz
	c8gsd0PyieCtVSK50jg1f3RmXkvnu0Gej98sgo7PSwNYc1R8h
X-Received: by 2002:a05:7022:e804:b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b3c03527f7mr4578437c88.40.1794461699106;
        Wed, 11 Nov 2026 21:34:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:58 -0800 (PST)
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
Subject: [PATCH v29 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 14:34:31 +0900
Message-ID: <20261112053446.73504-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
