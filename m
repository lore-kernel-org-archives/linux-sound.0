Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450221256C
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 12:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799726; cv=none; b=UqduDc0U5FIx6ndAJ2rp5aDfkydDX7/K0qrmL4C8RL1T3Fnrd/om14oCCIubitUwmkkf9vuvee4sVb9LUMpjy9nI4gisnp0vgSPMHPXoEl9rWs6ey1cP/iTm9Zm7Ciia85NNjhCCDWbfBNTQXzwNJJujwTx73c4TkZDeIGa2K2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799726; c=relaxed/simple;
	bh=vlLMVEi4mc8JanxVJ4cRF3k2qZw2pWROuD5ZLWy8lr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVl1XqiIHtMWCG/9tMrKHBri4XAszjrepd6IRvTRlG8+sh0d9VeXy7mt2IktZw1krx/1rxL0gexUqqkxFftZ1T1B+w7wDkX1v1w9Ut9jRVf/afcGtvWkd1GYeeU9VvV8jJPTbsjlsBvP5y+G6FMxMKh5TsEl9SBbcmRbMA9JaWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rImEx5Mc; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rImEx5Mc"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso1969239eec.0
        for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 05:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779799724; x=1780404524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzFzYUS5xkTaeTcSd6mKOHfBy/NkiDE68cAiMBc0jmA=;
        b=rImEx5Mcot0CM/ji04s6rPw9luVBBdxpDCi9ozDxTlbjZo2tj0vQHy9Dmkne8YV9YI
         WNIh5/AvkJrw/NNFo9h5jTF949PDElLWVImjaHmHzCcF94hfj5PXmjkw0EEHqOtWQCOB
         aWI0/OlqdW23Syax8nmHGx9Al9712Q5x9D3LEmpDnX/PGaMpkhP9vgOvrwCigQAkaffx
         b5KdJIf3dR1/SztQZ8cgL9lkHpyC71ZKwAuD+KGn+mkKs892Fbsj/CM8jB6xJGTcbC0i
         qzYh3goIBJh8bTAkIMhLjUnpDOZkbxNzABJSwEbvUXqgrZvvucmXef0X161yhaCKDznR
         M1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799724; x=1780404524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzFzYUS5xkTaeTcSd6mKOHfBy/NkiDE68cAiMBc0jmA=;
        b=ofl/06kK2UgzG4xAyrZYZxWwWUKRmmKUz1Nov//UmnnSjdd0sF1M7gfoOPg+3ZPxrr
         lrava0n9ZTJeJIv9lFLup8z+ZyFrgJRkImSrPdK1lUkEL5cE3vdcp7zA55sg3w8TXt8H
         8t+aoSlKEXCeKo0lzgf2NN/Tujsy7RiTjAlFkXwToiSGU6EkyXR8UmNFNiNAXtG8ypSO
         UuRqm8ZtjMhdL84H4Je9M9fVTqk0sRjNS8frmoWQ+3q72hCpQteljs+dkASaepyP0D9J
         8NA9FJNPtrVhP3SxrbP1sRgHJDVsGko7KB2vnl/k7k/bU9GLYGm0iygTMQ8oa2kKBMnh
         /KRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rg++XKYazDlA+LL+ma2XiwCen5R2y2k+2BdjWKAwY8DQf2M8Eo00tBrufKCPScoRaxfcZZwMKnxiuaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0+YmrQHL0YbRmS8an8bgpCltVdLu6MY9hYqWOHIOLWYHVuhmR
	/StQFKjaeCU9uXMwxQ4Gpcla3xpZHsQrxQgsQs+Z80NU5L9R72J5j5OVgrgAlw==
X-Gm-Gg: Acq92OHo8phSWZsXWx5o+9iP7ucPtyxRjyA5okMn1VdKnYmJJ9X2oOh2nOTQXQ0iJVV
	YdE1btB/3OgQIqvzTzRAJVG671pP+GbAd8+v+jdh0/8NztlxK9ny55CTEtG9tRPWAdJxdrDGbH1
	R786TW8HEYT0AcKh95hmDkKjqel1I1797T+mdw4SeMsIXUsiBBWatDFrfJOooxmzhBy+qFoUxdy
	Qwki6q412LuZ7UwDYtARlSlivyG/jgpwnlxvabHZ0ArAV2PNkIeMhbyC+S9H3x4igZjCgWDCfpu
	gmPd8FNXmNjIPin/WU/khoxq5ZLUKGZKuYie9b1UEAEtpJC2mODNxgupdA1HmtKQXDfNDqz04ld
	n3Qu+8cKC/ZVm5WxWxRon2oVlsfdljitLtLdLk2WM9ShdfEwYqLII3e5GgCVU38IOEDxbugwxp7
	wEI1cnOH0gKf3gM9leSLJPedkoX0Udwu3gj1P8ze7ftBz5P8bL/025ZjNzJxxxPw089RqEtxAd5
	GzjfX1FmbwU
X-Received: by 2002:a05:7300:cd99:b0:304:188d:d0be with SMTP id 5a478bee46e88-30449156f8cmr7666135eec.16.1779799724191;
        Tue, 26 May 2026 05:48:44 -0700 (PDT)
Received: from [192.168.1.18] (177-4-162-74.user3p.v-tal.net.br. [177.4.162.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f20561sm9516837eec.10.2026.05.26.05.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:48:43 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 26 May 2026 09:48:27 -0300
Subject: [PATCH 2/2] ALSA: xen-front: Connect event channel after stream
 prepare
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-alsa-xen-event-channel-fixes-v1-2-91d3a6a50778@gmail.com>
References: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
In-Reply-To: <20260526-alsa-xen-event-channel-fixes-v1-0-91d3a6a50778@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
 Jaroslav Kysela <perex@perex.cz>
Cc: xen-devel@lists.xenproject.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6113;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=vlLMVEi4mc8JanxVJ4cRF3k2qZw2pWROuD5ZLWy8lr4=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFmi05ZMEt7+9+1C28rcdPNvQW7GF7lsFX6I7du/9n/a1
 hL3eJsPHaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjCRSi9Ghjn8jK6XEorLNIwL
 CjLqvO8kOe91Ldz1U6l0ZoHX0e9eZxgZVv2rZPjn22DTbf8/XWu/7PVUl10bTwQJJfHpFL+Xvb6
 aHwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The request channel must be connected from ALSA .open(), because hw-rule
queries and the stream open request use it. The event channel is
different: XENSND_EVT_CUR_POS handling uses ALSA runtime buffer and
period geometry, and the corresponding Xen stream parameters are not
submitted to the backend until .prepare() sends XENSND_OP_OPEN.

Currently .open() connects both channels. A backend current-position
event, or a stale event queued for an earlier stream instance, can
therefore reach xen_snd_front_alsa_handle_cur_pos() before
runtime->buffer_size and runtime->period_size are valid.

Add a per-channel connection helper, connect only the request channel in
.open(), connect the event channel after a successful stream prepare,
and disconnect it before stream close/free. Re-check the event-channel
state after taking ring_io_lock so disconnecting the event channel
synchronizes against a threaded IRQ that passed the initial lockless
state test. Keep defensive runtime geometry checks in the position
handler.

Fixes: 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound driver")
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/xen/xen_snd_front_alsa.c    | 17 ++++++++++++-----
 sound/xen/xen_snd_front_evtchnl.c | 20 +++++++++++++-------
 sound/xen/xen_snd_front_evtchnl.h |  2 ++
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
index dc626480123a..a6dd196f73d6 100644
--- a/sound/xen/xen_snd_front_alsa.c
+++ b/sound/xen/xen_snd_front_alsa.c
@@ -378,7 +378,7 @@ static int alsa_open(struct snd_pcm_substream *substream)
 
 	stream_clear(stream);
 
-	xen_snd_front_evtchnl_pair_set_connected(stream->evt_pair, true);
+	xen_snd_front_evtchnl_set_connected(&stream->evt_pair->req, true);
 
 	ret = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				  alsa_hw_rule, stream,
@@ -498,6 +498,8 @@ static int alsa_hw_free(struct snd_pcm_substream *substream)
 	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
 	int ret;
 
+	xen_snd_front_evtchnl_set_connected(&stream->evt_pair->evt, false);
+
 	ret = xen_snd_front_stream_close(&stream->evt_pair->req);
 	stream_free(stream);
 	return ret;
@@ -532,6 +534,7 @@ static int alsa_prepare(struct snd_pcm_substream *substream)
 			return ret;
 
 		stream->is_open = true;
+		xen_snd_front_evtchnl_set_connected(&stream->evt_pair->evt, true);
 	}
 
 	return 0;
@@ -571,20 +574,24 @@ void xen_snd_front_alsa_handle_cur_pos(struct xen_snd_front_evtchnl *evtchnl,
 {
 	struct snd_pcm_substream *substream = evtchnl->u.evt.substream;
 	struct xen_snd_front_pcm_stream_info *stream = stream_get(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t delta, new_hw_ptr, cur_frame;
 
-	cur_frame = bytes_to_frames(substream->runtime, pos_bytes);
+	if (!runtime->buffer_size || !runtime->period_size)
+		return;
+
+	cur_frame = bytes_to_frames(runtime, pos_bytes);
 
 	delta = cur_frame - stream->be_cur_frame;
 	stream->be_cur_frame = cur_frame;
 
 	new_hw_ptr = (snd_pcm_uframes_t)atomic_read(&stream->hw_ptr);
-	new_hw_ptr = (new_hw_ptr + delta) % substream->runtime->buffer_size;
+	new_hw_ptr = (new_hw_ptr + delta) % runtime->buffer_size;
 	atomic_set(&stream->hw_ptr, (int)new_hw_ptr);
 
 	stream->out_frames += delta;
-	if (stream->out_frames > substream->runtime->period_size) {
-		stream->out_frames %= substream->runtime->period_size;
+	if (stream->out_frames > runtime->period_size) {
+		stream->out_frames %= runtime->period_size;
 		snd_pcm_period_elapsed(substream);
 	}
 }
diff --git a/sound/xen/xen_snd_front_evtchnl.c b/sound/xen/xen_snd_front_evtchnl.c
index 09e4c1d05636..17a30452c0cc 100644
--- a/sound/xen/xen_snd_front_evtchnl.c
+++ b/sound/xen/xen_snd_front_evtchnl.c
@@ -94,6 +94,9 @@ static irqreturn_t evtchnl_interrupt_evt(int irq, void *dev_id)
 
 	guard(mutex)(&channel->ring_io_lock);
 
+	if (unlikely(channel->state != EVTCHNL_STATE_CONNECTED))
+		return IRQ_HANDLED;
+
 	prod = page->in_prod;
 	/* Ensure we see ring contents up to prod. */
 	virt_rmb();
@@ -430,8 +433,8 @@ int xen_snd_front_evtchnl_publish_all(struct xen_snd_front_info *front_info)
 	return ret;
 }
 
-void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair *evt_pair,
-					      bool is_connected)
+void xen_snd_front_evtchnl_set_connected(struct xen_snd_front_evtchnl *channel,
+					 bool is_connected)
 {
 	enum xen_snd_front_evtchnl_state state;
 
@@ -440,13 +443,16 @@ void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair
 	else
 		state = EVTCHNL_STATE_DISCONNECTED;
 
-	scoped_guard(mutex, &evt_pair->req.ring_io_lock) {
-		evt_pair->req.state = state;
+	scoped_guard(mutex, &channel->ring_io_lock) {
+		channel->state = state;
 	}
+}
 
-	scoped_guard(mutex, &evt_pair->evt.ring_io_lock) {
-		evt_pair->evt.state = state;
-	}
+void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair *evt_pair,
+					      bool is_connected)
+{
+	xen_snd_front_evtchnl_set_connected(&evt_pair->req, is_connected);
+	xen_snd_front_evtchnl_set_connected(&evt_pair->evt, is_connected);
 }
 
 void xen_snd_front_evtchnl_pair_clear(struct xen_snd_front_evtchnl_pair *evt_pair)
diff --git a/sound/xen/xen_snd_front_evtchnl.h b/sound/xen/xen_snd_front_evtchnl.h
index 8400261ac466..f6ebdb09c029 100644
--- a/sound/xen/xen_snd_front_evtchnl.h
+++ b/sound/xen/xen_snd_front_evtchnl.h
@@ -77,6 +77,8 @@ void xen_snd_front_evtchnl_free_all(struct xen_snd_front_info *front_info);
 int xen_snd_front_evtchnl_publish_all(struct xen_snd_front_info *front_info);
 
 void xen_snd_front_evtchnl_flush(struct xen_snd_front_evtchnl *evtchnl);
+void xen_snd_front_evtchnl_set_connected(struct xen_snd_front_evtchnl *channel,
+					 bool is_connected);
 
 void xen_snd_front_evtchnl_pair_set_connected(struct xen_snd_front_evtchnl_pair *evt_pair,
 					      bool is_connected);

-- 
2.54.0

