Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7BE3DA5B6
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014823; cv=none; b=BQ7g3ENAEAijTy1ScvrRb/4BIwYhxp1PY0t39IIX6PsdCzVQ5BhtIQsQq+bItbw8YDp9AtES46cr101md2P0FVjFqeKq9zoAOSCMD30BO3M+BrMX+P/8F0HlwyBkps1pGearVoj/UXun0UUpSjv9N3cl1DZ0rZSz5bqmohQjvQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014823; c=relaxed/simple;
	bh=nEFpy+G4y7OTXuSAMf8XryZBv33bYBcgE6MJ7KeAnkE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hlGK92ncKlw1yiavoELoXpqgjMuyAT+RoYR12PDpoIaQfs/y0WRIB43z/K1bc0yR8nTUiKHqtdEI9H2Xb+i8USlh5Qw57hJAMGvVLySJnM955/qnhSIIl7EwIWgYFP1G2cU9gQhnPUydicat1rxQabqN9yFOHsuJXeR5TNhoIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OB9Hg+hX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I1opvN3a; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OB9Hg+hX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=I1opvN3a; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OB9Hg+hX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I1opvN3a";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OB9Hg+hX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="I1opvN3a"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5E24D77D45;
	Tue, 14 Jul 2026 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784014820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azVcRkmhqIDjDax9Ua1GEC0un9Lsh2B75J8TleX2T1s=;
	b=OB9Hg+hXZK3mD2bchNz+dLEr8l/J8vtlNNRCERuddHvgMBxiG9rfL+e8K8PwsC8KD3cq9Z
	DH/pizw75s8rCKJTyXlyfCUtIm2qSBLe3LCyTDUsgqiBG10FVS7tNcw1nK6fH1892H7rR/
	I7FFqdWUfIVnXJj628Wp61Ir7fU+WFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784014820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azVcRkmhqIDjDax9Ua1GEC0un9Lsh2B75J8TleX2T1s=;
	b=I1opvN3a6gQHWkfp0brrpaWCAkV4BZ6B1mZ5lugDtQ7G3weRKPHceGZt5GjHSyQYXNTMFA
	TZEI/OlY+bG1rMBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OB9Hg+hX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=I1opvN3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784014820; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azVcRkmhqIDjDax9Ua1GEC0un9Lsh2B75J8TleX2T1s=;
	b=OB9Hg+hXZK3mD2bchNz+dLEr8l/J8vtlNNRCERuddHvgMBxiG9rfL+e8K8PwsC8KD3cq9Z
	DH/pizw75s8rCKJTyXlyfCUtIm2qSBLe3LCyTDUsgqiBG10FVS7tNcw1nK6fH1892H7rR/
	I7FFqdWUfIVnXJj628Wp61Ir7fU+WFs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784014820;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=azVcRkmhqIDjDax9Ua1GEC0un9Lsh2B75J8TleX2T1s=;
	b=I1opvN3a6gQHWkfp0brrpaWCAkV4BZ6B1mZ5lugDtQ7G3weRKPHceGZt5GjHSyQYXNTMFA
	TZEI/OlY+bG1rMBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1629779AE;
	Tue, 14 Jul 2026 07:40:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K9DTNePnVWpwfQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jul 2026 07:40:19 +0000
Date: Tue, 14 Jul 2026 09:40:19 +0200
Message-ID: <87tsq2yq70.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Gordon Chen <chengordon326@gmail.com>,
	perex@perex.cz,
	tiwai@suse.com,
	kees@kernel.org,
	jussi@sonarnerd.net,
	hulianqin@vivo.com,
	i@rong.moe,
	g@b4.vu,
	cryolitia@uniontech.com,
	pav@iki.fi,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mathias.nyman@linux.intel.com
Subject: Re: [PATCH] usb-audio: Fix boot-time crackling for Generic USB Audio device
In-Reply-To: <5ed9e0a3-e8ac-4295-b876-dcda8b96ca1e@kylinos.cn>
References: <20260713081048.189281-1-zhangheng@kylinos.cn>
	<18c1dc0246121271.5ea4dc9a201e9dce.cafe1c196d712416@GordonMsi>
	<5ed9e0a3-e8ac-4295-b876-dcda8b96ca1e@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5E24D77D45
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,kernel.org,sonarnerd.net,vivo.com,rong.moe,b4.vu,uniontech.com,iki.fi,vger.kernel.org,linux.intel.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 14 Jul 2026 03:58:08 +0200,
Zhang Heng wrote:
> 
> > On Mon, Jul 13, 2026 at 04:10:48PM +0800, Zhang Heng wrote:
> >> +		/* Generic USB Audio (0x1e0b:d01e): use SIA for consistent scheduling */
> >> +		if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e))
> >> +			u->urb->transfer_flags |= URB_ISO_ASAP;
> > Not a maintainer, just a bystander who was Cc'd -- two small notes on the
> > form of the patch, plus one question I can't answer myself.
> > 
> > A per-device usb_id comparison in the endpoint.c fast path seems like the
> > kind of thing the quirk_flags_table in quirks.c exists to avoid. Would a
> > QUIRK_FLAG_ISO_ASAP (set in the table, tested here as
> > chip->quirk_flags & QUIRK_FLAG_ISO_ASAP) work for you? It keeps endpoint.c
> > device-agnostic, and the next device with the same symptom becomes a
> > one-line table entry rather than another if.
> First of all, let me clarify: this issue occurs when there is startup music,
> but it plays normally after entering the system. There is a heavy creaking
> sound when the system is turned on here. Based on the information from dmesg
> and syslog, there are a large number of xhci hcd frame synchronization
> failures. I tried adding URB_ISO_ASAP here, and it will be much better,
> with only a little noise.

OK, but it still makes sense to deal URB_ISO_ASAP workaround more
generically.

> >> +	if (ep->chip->usb_id == USB_ID(0x1e0b, 0xd01e) &&
> >> +	    ep->type == SND_USB_ENDPOINT_TYPE_SYNC)
> >> +		ep->skip_packets = 4;
> > The block immediately above this one already does exactly
> > "type == SND_USB_ENDPOINT_TYPE_SYNC -> skip_packets = 4"; adding the ID to
> > that condition would avoid the duplicate if. Also, the changelog doesn't
> > say what this hunk contributes on its own -- is URB_ISO_ASAP alone
> > insufficient, and if so, what does skipping the first 4 sync packets fix
> > that ASAP doesn't? Right now the two changes are indistinguishable in the
> > commit message, and skip_packets = 4 reads as belt-and-braces.
> As mentioned above, there is still a bit of noise when only adding
> URB_ISO_ASAP,
> 
> but skip-packets=4 can solve this problem.

Well, one missing thing is to understand why this fixes.
Originally, the skip_packets=4 for Playback Design devices was
introduced for bogus feedback packets at the start of the stream long
time ago.  But that's the only known device that needs it.  Does your
device send also 4 bogus packets?

The skip_packets=16 for M-Audio devices are rather for avoiding the
latency.  And, speaking of latency, I have a patch for the lowlatency
support of implicit fb mode, but never had a test environment.
Could you check the patch below and see the patch below has any
positive/negative influence?  Just to be sure.


thanks,

Takashi

-- 8< --
index 682b6c1fe76b..6d144e39a849 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -265,6 +265,7 @@ int snd_usb_init_pitch(struct snd_usb_audio *chip,
 	return 0;
 }
 
+/* stop both data and sync endpoints */
 static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
 {
 	bool stopped = 0;
@@ -280,6 +281,24 @@ static bool stop_endpoints(struct snd_usb_substream *subs, bool keep_pending)
 	return stopped;
 }
 
+/* only start sync endpoint */
+static int start_sync_endpoint(struct snd_usb_substream *subs)
+{
+	int err;
+
+	if (subs->sync_endpoint &&
+	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
+		err = snd_usb_endpoint_start(subs->sync_endpoint);
+		if (err < 0) {
+			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+/* start both data and sync endpoints */
 static int start_endpoints(struct snd_usb_substream *subs)
 {
 	int err;
@@ -295,14 +314,9 @@ static int start_endpoints(struct snd_usb_substream *subs)
 		}
 	}
 
-	if (subs->sync_endpoint &&
-	    !test_and_set_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags)) {
-		err = snd_usb_endpoint_start(subs->sync_endpoint);
-		if (err < 0) {
-			clear_bit(SUBSTREAM_FLAG_SYNC_EP_STARTED, &subs->flags);
-			goto error;
-		}
-	}
+	err = start_sync_endpoint(subs);
+	if (err < 0)
+		goto error;
 
 	return 0;
 
@@ -656,12 +670,16 @@ static int lowlatency_playback_available(struct snd_pcm_runtime *runtime,
 		return false;
 	if (in_free_wheeling_mode(runtime))
 		return false;
-	/* implicit feedback mode has own operation mode */
-	if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
-		return false;
 	return true;
 }
 
+/* return true if it's a normal playback (not in implicit fb) */
+static bool is_normal_lowlatency_playback(struct snd_usb_substream *subs)
+{
+	return subs->lowlatency_playback &&
+		!snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint);
+}
+
 /*
  * prepare callback
  *
@@ -709,9 +727,11 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 	runtime->delay = 0;
 
 	subs->lowlatency_playback = lowlatency_playback_available(runtime, subs);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
-	    !subs->lowlatency_playback) {
-		ret = start_endpoints(subs);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (!subs->lowlatency_playback)
+			ret = start_endpoints(subs);
+		else if (snd_usb_endpoint_implicit_feedback_sink(subs->data_endpoint))
+			ret = start_sync_endpoint(subs);
 		/* if XRUN happens at starting streams (possibly with implicit
 		 * fb case), restart again, but only try once.
 		 */
@@ -1539,7 +1559,7 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 		frame_limit = subs->frame_limit + ep->max_urb_frames;
 		transfer_done = subs->transfer_done;
 
-		if (subs->lowlatency_playback &&
+		if (is_normal_lowlatency_playback(subs) &&
 		    runtime->state != SNDRV_PCM_STATE_DRAINING) {
 			unsigned int hwptr = subs->hwptr_done / stride;
 
@@ -1625,7 +1645,8 @@ static int prepare_playback_urb(struct snd_usb_substream *subs,
 			subs->trigger_tstamp_pending_update = false;
 		}
 
-		if (period_elapsed && !subs->running && subs->lowlatency_playback) {
+		if (period_elapsed && !subs->running &&
+		    is_normal_lowlatency_playback(subs)) {
 			subs->period_elapsed_pending = 1;
 			period_elapsed = 0;
 		}
@@ -1677,7 +1698,7 @@ static int snd_usb_pcm_playback_ack(struct snd_pcm_substream *substream)
 	struct snd_usb_substream *subs = substream->runtime->private_data;
 	struct snd_usb_endpoint *ep;
 
-	if (!subs->lowlatency_playback || !subs->running)
+	if (!is_normal_lowlatency_playback(subs) || !subs->running)
 		return 0;
 	ep = subs->data_endpoint;
 	if (!ep)
@@ -1705,6 +1726,7 @@ static int snd_usb_substream_playback_trigger(struct snd_pcm_substream *substrea
 					      prepare_playback_urb,
 					      retire_playback_urb,
 					      subs);
+		/* start EPs for both normal and implicit-fb modes */
 		if (subs->lowlatency_playback &&
 		    cmd == SNDRV_PCM_TRIGGER_START) {
 			if (in_free_wheeling_mode(substream->runtime))
