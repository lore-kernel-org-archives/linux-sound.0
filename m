Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928D351C2A
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777019294; cv=none; b=An/wX4OtkaPS+jYh1iBYtO3WeqSfIUIc3feLWRsxiuQihXDX+JuS5y3Ekjc+ELCFyTLmD2dcCG2l1HV0TgatARVVRlWMpXvALfm41/puSvWqL4xEaK3Z056oHz0yHsBXKZxayrMXrgP1AJ/GA3q0IUCtvz+ApEkU56mgwM01jKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777019294; c=relaxed/simple;
	bh=FG3TmL8HTif5FcHhDDhSGBPCVgBPrgAv2h5xnVWrx1w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RpU4gpUBz6QDQHa8YAt9vVMVNGzSYqs5SPP/AtG/M2/dBASb34XFDns8DipXFhYOjdkzWhbCaBaoWvl6sMrMXwJEkOAqJrhujC7wsDaffWf0z7K8hyXfPyQ0gkXFJhHiJqafAwMwC7HVKbZ3qWRU+40cL0xTr9jmO5pzpfPKG2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0R6sFtO8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9SxU4Rv5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0R6sFtO8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9SxU4Rv5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0R6sFtO8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9SxU4Rv5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0R6sFtO8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9SxU4Rv5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BE2D6A89F;
	Fri, 24 Apr 2026 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777019290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hk5xW90k4A8ViKHQB9c/1/inJgpnt4oHUFYS4zolsLk=;
	b=0R6sFtO8BQ6g/AhBI/sLy1NurL4pQm5aovohsuPHqMe97c1sE2GyrdtKiamqXYiYG4DoaW
	KcG2kU8SXAWSxlfI9agaFSI2VZCX6Ov4fn1dKDRAIh0Wtj5/SQea4fQDRo/ZX50xf+9Gjm
	6EhSU4ezmOl7PYLKTPNte4DiBuPNZ/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777019290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hk5xW90k4A8ViKHQB9c/1/inJgpnt4oHUFYS4zolsLk=;
	b=9SxU4Rv5wwEoZ89J9r4l/tCCS09H7bc02JuwiHInmO0POC0aAO0crMyBT9r3BzvtPijTyG
	ktaPP5PWU2vY8wDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777019290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hk5xW90k4A8ViKHQB9c/1/inJgpnt4oHUFYS4zolsLk=;
	b=0R6sFtO8BQ6g/AhBI/sLy1NurL4pQm5aovohsuPHqMe97c1sE2GyrdtKiamqXYiYG4DoaW
	KcG2kU8SXAWSxlfI9agaFSI2VZCX6Ov4fn1dKDRAIh0Wtj5/SQea4fQDRo/ZX50xf+9Gjm
	6EhSU4ezmOl7PYLKTPNte4DiBuPNZ/E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777019290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hk5xW90k4A8ViKHQB9c/1/inJgpnt4oHUFYS4zolsLk=;
	b=9SxU4Rv5wwEoZ89J9r4l/tCCS09H7bc02JuwiHInmO0POC0aAO0crMyBT9r3BzvtPijTyG
	ktaPP5PWU2vY8wDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 381BB593A4;
	Fri, 24 Apr 2026 08:28:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eJBrC5op62k5BQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Apr 2026 08:28:10 +0000
Date: Fri, 24 Apr 2026 10:28:09 +0200
Message-ID: <874il03gpy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaeyoung Chung <jjy600901@snu.ac.kr>
Cc: tiwai@suse.de,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	byoungyoung@snu.ac.kr,
	eulgyukim@snu.ac.kr
Subject: Re: [BUG] KASAN: slab-use-after-free in ALSA OSS read/poll race
In-Reply-To: <20260424071208.2388558-1-jjy600901@snu.ac.kr>
References: <20260423145330.210035-1-jjy600901@snu.ac.kr>
	<87a4ut3dfp.wl-tiwai@suse.de>
	<20260424071208.2388558-1-jjy600901@snu.ac.kr>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Flag: NO

On Fri, 24 Apr 2026 09:12:08 +0200,
Jaeyoung Chung wrote:
> 
> On Fri, Apr 24, 2026 at 12:26 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > Thanks for the report.  I see the point, and IMO, a better fix is to
> > protect runtime->oss.trigger access with the mutex.  We can change the
> > bit fields to bool as a separate patch, but it shouldn't be considered
> > as an ad hoc fix.
> >
> > Could you submit a proper patch after verifying that it fixes your
> > fuzzer?
> >
> >
> > thanks,
> >
> > Takashi
> 
> Hi Takashi,
> 
> Thank you for taking a look.
> 
> Since we are not very familiar with this subsystem, we are a bit cautious
> about preparing a patch ourselves.
> 
> If you could suggest a patch or a preferred fix direction, we would be
> happy to test it on our reproducer and report the results.

Does something below work?
Once after confirming, I'll submit a proper patch.


thanks,

Takashi

-- 8< --
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2155,10 +2155,16 @@ static int snd_pcm_oss_get_trigger(struct snd_pcm_oss_file *pcm_oss_file)
 
 	psubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
 	csubstream = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
-	if (psubstream && psubstream->runtime && psubstream->runtime->oss.trigger)
-		result |= PCM_ENABLE_OUTPUT;
-	if (csubstream && csubstream->runtime && csubstream->runtime->oss.trigger)
-		result |= PCM_ENABLE_INPUT;
+	if (psubstream && psubstream->runtime) {
+		guard(mutex)(&psubstream->runtime->oss.params_lock);
+		if (psubstream->runtime->oss.trigger)
+			result |= PCM_ENABLE_OUTPUT;
+	}
+	if (csubstream && csubstream->runtime) {
+		guard(mutex)(&csubstream->runtime->oss.params_lock);
+		if (csubstream->runtime->oss.trigger)
+			result |= PCM_ENABLE_INPUT;
+	}
 	return result;
 }
 
@@ -2832,6 +2838,17 @@ static int snd_pcm_oss_capture_ready(struct snd_pcm_substream *substream)
 						runtime->oss.period_frames;
 }
 
+static bool need_input_retrigger(struct snd_pcm_runtime *runtime)
+{
+	bool ret;
+
+	guard(mutex)(&runtime->oss.params_lock);
+	ret = runtime->oss.trigger;
+	if (ret)
+		runtime->oss.trigger = 0;
+	return ret;
+}
+
 static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 {
 	struct snd_pcm_oss_file *pcm_oss_file;
@@ -2864,11 +2881,11 @@ static __poll_t snd_pcm_oss_poll(struct file *file, poll_table * wait)
 			    snd_pcm_oss_capture_ready(csubstream))
 				mask |= EPOLLIN | EPOLLRDNORM;
 		}
-		if (ostate != SNDRV_PCM_STATE_RUNNING && runtime->oss.trigger) {
+		if (ostate != SNDRV_PCM_STATE_RUNNING &&
+		    need_input_retrigger(runtime)) {
 			struct snd_pcm_oss_file ofile;
 			memset(&ofile, 0, sizeof(ofile));
 			ofile.streams[SNDRV_PCM_STREAM_CAPTURE] = pcm_oss_file->streams[SNDRV_PCM_STREAM_CAPTURE];
-			runtime->oss.trigger = 0;
 			snd_pcm_oss_set_trigger(&ofile, PCM_ENABLE_INPUT);
 		}
 	}
