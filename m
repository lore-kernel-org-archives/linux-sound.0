Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466184;
	b=fkfabf310PMO5hECEStCma/5AkZjYUvgKfI7bHEUERzwgBNKzYpOJMaEGiZIWlGfgiP7
	 Pi2kJ5dBvaMM5cGhQbIJi+JhJYg8OeBABFbWscnDPdL1yZGqtp9vguvgY/h8QaOHrRlxz
	 Za1RZREmMzyD1VDrVIKyVoCb+ZXreGhxApbmn6/YHpAL4hqkq11Qt/Q1AiE7f7Acvcn/e
	 36TGazn43YCTpwebCsFESGsGU4RFo8A4Zv6i90R7QuoJAkgTHuN7NqCdIzaubVbgM7NAa
	 0IrLM2KgDVkmUPkanVwCD4Hjru7RQFIv473y3J/kyC4861Zj7FbhrY8GjliQW1kIVbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=lscWXX/A8h0zGk9D6AAeQrPKk+XBUJ0CcFdV1Sekv8P7molTVuur2+IHhPjTHbf+W+C9
	 9hpd0rIV1X29AzkqtjG7Xqo8QrTkxyR9y1NcrW615JwOQQ9wPl5swyUjXMMMsbuFRyhL7
	 SrzImRF2b9TBqSrCuiR5J8+C7BGiUPHN4D+C2YKmerbE1D+2dTloyd/DvQeYluFXQjwaY
	 +ni/JBJGV55q0/MGhDx3pgPpUMs3v6AX5MjcKxjEgqCfViUyYeow4k3lv8Ruarnf1EW8Q
	 mMb2sodA+MXMKgGkB5/+eCCHBYiyW59CF5Qufetj1RgC/qIcUSGlLXwYG3zZ5Nd0XSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPeEKIzC;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D62A606A894
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 06:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D62A606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPeEKIzC
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a058315c79so2056851b3a.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 22:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466183; x=1795070983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=TPeEKIzC3PqINmM3ycLE9YPGZ/5qU0qGFTA0j/y9SwD2F+rZah/IHdWmVCykhyknwK
         J9Ym1q3wC6e8eevWqRUhB0qThnnahm//hb7R4TtfkfxLryPOI6EYKZnL6+6Ls9LLtxqJ
         2+gtN21rat6NTXLyyiZdRPP8CObKWuwo8RftamEqewpjhBBBkbzhDL/JD3GLBGqLpcHZ
         MzduxdSJ16OugBxfH30xhEyS5CAcZTYYqKz9+U9k/t5etalS9IwsBcR9Gk8vIvJ3qn4w
         zbKNJC2C68+EBfCDXCtuHWyDSA9dQ5ncS311VU96nilMOd3NqcRC9TUggfw67oa9xOB8
         t7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466183; x=1795070983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=TKMxtJpTzBeXZ4eb2/hkkRC4MGLUgrTA8QYetV9ph7/S22kl3pgusYRyCDOAvVJHJN
         tEjxVOTp2SMW3Kv5RPz/bPG3Zuke+Vs88tc1Wnyrl+aJO1N+y2q3OgpvI7JFBFkz9vUj
         Vdc7nx2XPHQ5YNqVx30/F2TmaDaxjvsau+Vr8BP80KOT/9jnDsy8HK6FW1F7e8yFfWfI
         htAK+NiSE55SvF4rFyB8XsguzsTbi+LsQs3WJB52w4sAswPS9tlv8HY1CcXcxYF26MkY
         nMABEOUgRfGXXb0GuwUCa7/KkNH9PH0JpLc30jtva2b51YDNPs4bVA2zRZ1OqfDpNNqm
         TsKQ==
X-Gm-Message-State: APuU4Z9m62Ltho0LsAojZg1k5BwfaZ6ck0GVb5HnVRwPvqH0JnfsT/bn
	qJ/h9UR2U3CUK9DLmSpgSfUwUqHSz/+xLoiEQh5/lSCODgMHhMyozTYCOutRnA==
X-Gm-Gg: AYBFou36kbrXOBFxzohhtxWpUTJ7waaoMFn6eRnXOADT3kCAIcsosLFErFzXHHe2hwL
	yNkeHKzijJGdE/Kz9w0FHe/KQEotS39BlA9CKqwlhH2OC/LbqGlq5KIQXCAVrxTWnpikN7Z7TkY
	KpTV1nBuQBOdKlq/fHk9ePMNwdAS+PdIkxfny0XhVa8TRtNavFdin97LYedRko5oQT8F+qWrLDr
	Ma1aTGdf1Q5fh0XcAQ57YPnsxgOb1NLlpuj8rLyOJWOEWYcxYPaBnDlemXa0w1UB7oYpcV7DgOZ
	dBBcF6++P7janiTvrOFmwAQDClGis/I5kxbM4q9OUQCdBogY3QU0RFpEsJ5utBRiZ1ZHkaefl4d
	ISI/160FLMeLRheqC3rNiUyX6fcKhdZodaulwu6fZ+IRVl4dbsB2LF8uVtRS3eALrdLTbL4xobO
	SHSzPPSlnYnRG7rTUrFQ6Cb591afomIF+l/K70tLUZCsFmUvOtgP8IyRuIxZpWS6iLbXI2PO217
	e/RQHyu3wC8RtPR/E76cE0vwldBBlQ+OCWqNMnrpn8kRr+GjYmUpcAS5ESlIG0/eLMwY7eEWFGm
	Qc52BKTuNS1X8prRb5e2j19ygA+k2hIEULr2QEqZOcCGiFm7XCdB5kG0FUxfPmk4RPjf0rziXQv
	k3IRu/taiaJGdCqmKVlTYgCFmJ9NvhrDLn628hdPwZJfjDXs=
X-Received: by 2002:a05:6a00:170b:b0:8b6:59a:2ae with SMTP id d2e1a72fcca58-8bc1d819c34mr4549542b3a.52.1794466182900;
        Wed, 11 Nov 2026 22:49:42 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:42 -0800 (PST)
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
Subject: [PATCH v31 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 15:49:14 +0900
Message-ID: <20261112064929.11211-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
