Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEF233064A
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302915; cv=none; b=g82wwhrngHwKk97H9p3Obq+BZIMUgNnpaM9HxESCKjJzQ9dS5bMyi/fr2iMU8ljVFLITa3hmzuzHPwQxp99HfY7YyP8FvxcM3ZwrFOaO5hrtmfHvbmLAc25Qbi0mrVkwp73wyEE1js7vXfpbqReoOYsjo2/k3yfeEsPt4euayUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302915; c=relaxed/simple;
	bh=oAvst4+8s1KLzkzKIZUuFW9XPW9ZSZItW3PSVaUaLVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BsU9R4v2Le9ZBGZV94WefCo3KrN79/FinNmHTjfpp1fwcgD2Tt2UZ5iB+EV1SVPbWz0+uQ7o026E8SqNY8aQOPvuoN3JqhV6gvEURJqu+44ZyhNciOErF4vB4il66Fm7FNVOiINL4oXRa+AKqXy3S47MB78M9ev3nxNw4haV+Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NMswLVNV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KjMm/mH1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NMswLVNV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KjMm/mH1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NMswLVNV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KjMm/mH1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NMswLVNV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KjMm/mH1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BB7B5BD28;
	Mon, 27 Apr 2026 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777302910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3z+5h1XhEekJKvv/3xuLzHGo+E7n/vHH4h0N8z82KKk=;
	b=NMswLVNVf0Sd7jZR1BUq4JbRZ4HzIO26eyQHrDxsRWc0DRzLkiiHuneuNjLxsZo5ufIQuC
	PseHht8ASHYjcd1uyszgngw7+pAUMeZpNUsQivGZaz3YB2R0ezq/uFnSACOvTN0YZinLmz
	kQq+4anHIIw8K+t6Y4ZgBQb1GTCnt4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777302910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3z+5h1XhEekJKvv/3xuLzHGo+E7n/vHH4h0N8z82KKk=;
	b=KjMm/mH16eZFSvBzWy9VcB53XjHjya9QgS0z4JyOEUUuff7YCREqajt3QGulkjD+p+0dAP
	CJI2AM0mfZLS0YDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777302910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3z+5h1XhEekJKvv/3xuLzHGo+E7n/vHH4h0N8z82KKk=;
	b=NMswLVNVf0Sd7jZR1BUq4JbRZ4HzIO26eyQHrDxsRWc0DRzLkiiHuneuNjLxsZo5ufIQuC
	PseHht8ASHYjcd1uyszgngw7+pAUMeZpNUsQivGZaz3YB2R0ezq/uFnSACOvTN0YZinLmz
	kQq+4anHIIw8K+t6Y4ZgBQb1GTCnt4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777302910;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3z+5h1XhEekJKvv/3xuLzHGo+E7n/vHH4h0N8z82KKk=;
	b=KjMm/mH16eZFSvBzWy9VcB53XjHjya9QgS0z4JyOEUUuff7YCREqajt3QGulkjD+p+0dAP
	CJI2AM0mfZLS0YDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AAB0593B0;
	Mon, 27 Apr 2026 15:15:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id I6HmGH5972mRRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 15:15:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix potential leak of pd at parsing UAC3 streams
Date: Mon, 27 Apr 2026 17:15:04 +0200
Message-ID: <20260427151508.12544-1-tiwai@suse.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

At parsing UAC3 streams, we allocate a PD object at each time, and
either assign or free it.  But there is a case where the PD object may
be leaked; namely, in __snd_usb_parse_audio_interface() loop, when an
audioformat shares the same endpoint with others, it's put to a link
and returns from snd_usb_add_audio_stream(), but the PD is forgotten
afterwards.  Overall, the treatment of PD object in the parser code is
a bit flaky, and we should be more careful about the object ownership.

This patch tries to fix the above case and improve the code a bit.
The pd object is now managed with the auto-cleanup in the loop, and
the ownership is updated when the pd object gets assigned to the
stream, which guarantees the release of the leftover object.

Fixes: 7edf3b5e6a45 ("ALSA: usb-audio: AudioStreaming Power Domain parsing")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c |  2 +-
 sound/usb/stream.c | 58 ++++++++++++++++++----------------------------
 sound/usb/stream.h |  3 ++-
 3 files changed, 25 insertions(+), 38 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7b803ad58487..0b4ecc2c6bcc 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -125,7 +125,7 @@ static int add_audio_stream_from_fixed_fmt(struct snd_usb_audio *chip,
 
 	snd_usb_audioformat_set_sync_ep(chip, fp);
 
-	err = snd_usb_add_audio_stream(chip, stream, fp);
+	err = snd_usb_add_audio_stream(chip, stream, fp, NULL);
 	if (err < 0)
 		return err;
 
diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 6c51226f771b..f8f56ace5652 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -79,7 +79,7 @@ static void snd_usb_audio_pcm_free(struct snd_pcm *pcm)
 static void snd_usb_init_substream(struct snd_usb_stream *as,
 				   int stream,
 				   struct audioformat *fp,
-				   struct snd_usb_power_domain *pd)
+				   struct snd_usb_power_domain **pdptr)
 {
 	struct snd_usb_substream *subs = &as->substream[stream];
 
@@ -105,10 +105,11 @@ static void snd_usb_init_substream(struct snd_usb_stream *as,
 	if (fp->channels > subs->channels_max)
 		subs->channels_max = fp->channels;
 
-	if (pd) {
-		subs->str_pd = pd;
+	if (pdptr && *pdptr) {
+		subs->str_pd = *pdptr;
+		*pdptr = NULL; /* assigned */
 		/* Initialize Power Domain to idle status D1 */
-		snd_usb_power_domain_set(subs->stream->chip, pd,
+		snd_usb_power_domain_set(subs->stream->chip, subs->str_pd,
 					 UAC3_PD_STATE_D1);
 	}
 
@@ -492,11 +493,14 @@ snd_pcm_chmap_elem *convert_chmap_v3(struct uac3_cluster_header_descriptor
  * if not, create a new pcm stream. note, fp is added to the substream
  * fmt_list and will be freed on the chip instance release. do not free
  * fp or do remove it from the substream fmt_list to avoid double-free.
+ *
+ * pdptr is optional and can be NULL.  When it's non-NULL and the PD gets
+ * assigned to the stream, *pdptr is cleared to NULL upon return.
  */
-static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
-				      int stream,
-				      struct audioformat *fp,
-				      struct snd_usb_power_domain *pd)
+int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
+			     int stream,
+			     struct audioformat *fp,
+			     struct snd_usb_power_domain **pdptr)
 
 {
 	struct snd_usb_stream *as;
@@ -529,7 +533,7 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 		err = snd_pcm_new_stream(as->pcm, stream, 1);
 		if (err < 0)
 			return err;
-		snd_usb_init_substream(as, stream, fp, pd);
+		snd_usb_init_substream(as, stream, fp, pdptr);
 		return add_chmap(as->pcm, stream, subs);
 	}
 
@@ -558,7 +562,7 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	else
 		strscpy(pcm->name, "USB Audio");
 
-	snd_usb_init_substream(as, stream, fp, pd);
+	snd_usb_init_substream(as, stream, fp, pdptr);
 
 	/*
 	 * Keep using head insertion for M-Audio Audiophile USB (tm) which has a
@@ -576,21 +580,6 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 	return add_chmap(pcm, stream, &as->substream[stream]);
 }
 
-int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
-			     int stream,
-			     struct audioformat *fp)
-{
-	return __snd_usb_add_audio_stream(chip, stream, fp, NULL);
-}
-
-static int snd_usb_add_audio_stream_v3(struct snd_usb_audio *chip,
-				       int stream,
-				       struct audioformat *fp,
-				       struct snd_usb_power_domain *pd)
-{
-	return __snd_usb_add_audio_stream(chip, stream, fp, pd);
-}
-
 static int parse_uac_endpoint_attributes(struct snd_usb_audio *chip,
 					 struct usb_host_interface *alts,
 					 int protocol, int iface_no)
@@ -1113,8 +1102,7 @@ snd_usb_get_audioformat_uac3(struct snd_usb_audio *chip,
 		}
 	}
 
-	if (pd)
-		*pd_out = pd;
+	*pd_out = pd;
 
 	return fp;
 }
@@ -1129,7 +1117,6 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 	struct usb_interface_descriptor *altsd;
 	int i, altno, err, stream;
 	struct audioformat *fp = NULL;
-	struct snd_usb_power_domain *pd = NULL;
 	bool set_iface_first;
 	int num, protocol;
 
@@ -1171,6 +1158,12 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 		if (snd_usb_apply_interface_quirk(chip, iface_no, altno))
 			continue;
 
+		/* pd may be allocated at snd_usb_get_audioformat_uac3() and
+		 * assigned at snd_usb_add_audio_stream(); otherwise it'll be
+		 * freed automatically by cleanup at each loop.
+		 */
+		struct snd_usb_power_domain *pd __free(kfree) = NULL;
+
 		/*
 		 * Roland audio streaming interfaces are marked with protocols
 		 * 0/1/2, but are UAC 1 compatible.
@@ -1226,23 +1219,16 @@ static int __snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 			*has_non_pcm = true;
 		if ((fp->fmt_type == UAC_FORMAT_TYPE_I) == non_pcm) {
 			audioformat_free(fp);
-			kfree(pd);
 			fp = NULL;
-			pd = NULL;
 			continue;
 		}
 
 		snd_usb_audioformat_set_sync_ep(chip, fp);
 
 		dev_dbg(&dev->dev, "%u:%d: add audio endpoint %#x\n", iface_no, altno, fp->endpoint);
-		if (protocol == UAC_VERSION_3)
-			err = snd_usb_add_audio_stream_v3(chip, stream, fp, pd);
-		else
-			err = snd_usb_add_audio_stream(chip, stream, fp);
-
+		err = snd_usb_add_audio_stream(chip, stream, fp, &pd);
 		if (err < 0) {
 			audioformat_free(fp);
-			kfree(pd);
 			return err;
 		}
 
diff --git a/sound/usb/stream.h b/sound/usb/stream.h
index d92e18d5818f..61b9a133da01 100644
--- a/sound/usb/stream.h
+++ b/sound/usb/stream.h
@@ -7,7 +7,8 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip,
 
 int snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 			     int stream,
-			     struct audioformat *fp);
+			     struct audioformat *fp,
+			     struct snd_usb_power_domain **pdptr);
 
 #endif /* __USBAUDIO_STREAM_H */
 
-- 
2.54.0

