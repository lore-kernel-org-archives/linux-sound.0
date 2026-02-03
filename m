Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A43A783A
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 14:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770128147; cv=none; b=rMRC7/5F754jn97zBNiFZRsubeoooPlG5VYnG5aFziSHe3SACPqP4dvPkPd1wEwxeQGdEV4P90NNsQ9SBHTcF1vjLdwbPrI5PF3bhSJOplDs3+cChPpmD7iu4BFgohOmik1OXKw1bNFQNo6n2IBx+TQydfPVNJ64t3xYOGTdylc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770128147; c=relaxed/simple;
	bh=RORGCB6yPXgdM5Fy1ltWW67apB3vWgtPb0GLNtthJow=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TbCuFgHdzvG1/f+mzgLbc0f9sa42tlYlPDLxS6lGBHgX8AhRJT0i+uflWLv4zTXixSxlf2jlKKuvD0UX99MY+PxcY7SEbkdh3BbfY8gIZ2RTRIOh/ZGO2F8PvKbNeL1gyibhUF9T1XAAPgrQtH5xw31IlLAWdeMBz8nebu5T2YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q2s6F9h0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ysypdJAr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q2s6F9h0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ysypdJAr; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q2s6F9h0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ysypdJAr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q2s6F9h0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ysypdJAr"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3D0E95BCC3;
	Tue,  3 Feb 2026 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770128143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0VFeeqsnBd179AZ/4mfjMQTse+r4EK66+4kiwx6+uc=;
	b=q2s6F9h0hZXRsWdR+jYQDYz+OV+/xlvKgRFVsbRNQC/vXf8PqR4oC96QF06Bz3Zesd+12O
	dGuF4M1eg74eJOlNbui8V2ud2zzRMr0er81P9Mq1Zcv4VEIWz6OdHQXPJpwNDoCn3AA1pN
	7qE8EDVv6HTZOSV/rdTV6LQ8K6w1+pQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770128143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0VFeeqsnBd179AZ/4mfjMQTse+r4EK66+4kiwx6+uc=;
	b=ysypdJAr8y8kMrJ1ANVLYBiw2g/V3Cdhtz81AOtHIenMqPhIF+eiMK/2GBexzLvQv81ZIQ
	YBvaSY6lnDao5AAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q2s6F9h0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ysypdJAr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770128143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0VFeeqsnBd179AZ/4mfjMQTse+r4EK66+4kiwx6+uc=;
	b=q2s6F9h0hZXRsWdR+jYQDYz+OV+/xlvKgRFVsbRNQC/vXf8PqR4oC96QF06Bz3Zesd+12O
	dGuF4M1eg74eJOlNbui8V2ud2zzRMr0er81P9Mq1Zcv4VEIWz6OdHQXPJpwNDoCn3AA1pN
	7qE8EDVv6HTZOSV/rdTV6LQ8K6w1+pQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770128143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0VFeeqsnBd179AZ/4mfjMQTse+r4EK66+4kiwx6+uc=;
	b=ysypdJAr8y8kMrJ1ANVLYBiw2g/V3Cdhtz81AOtHIenMqPhIF+eiMK/2GBexzLvQv81ZIQ
	YBvaSY6lnDao5AAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 154663EA62;
	Tue,  3 Feb 2026 14:15:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MXQgBA8DgmkMVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Feb 2026 14:15:43 +0000
Date: Tue, 03 Feb 2026 15:15:38 +0100
Message-ID: <877bstlxpx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?wO7B+tDL?= <coregee2000@gmail.com>
Cc: syzkaller@googlegroups.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Kernel Bug] KASAN: slab-use-after-free Read in loopback_trigger
In-Reply-To: <87a4xply0d.wl-tiwai@suse.de>
References: <CAHPqNmzY=zVGq0r7g-ED0Rtmi-7udMW51AAb7rex5A0vcBJMjA@mail.gmail.com>
	<87a4xply0d.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 3D0E95BCC3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Tue, 03 Feb 2026 15:09:22 +0100,
Takashi Iwai wrote:
> 
> On Mon, 02 Feb 2026 07:27:45 +0100,
> ÀîÁúÐË wrote:
> > 
> > Dear Linux kernel developers and maintainers,
> > 
> > We would like to report a new kernel bug found by our tool. KASAN:
> > slab-use-after-free Read in loopback_trigger. Details are as follows.
> > 
> > Kernel commit: v6.18.2
> > Kernel config: see attachment
> > report: see attachment
> > 
> > We are currently analyzing the root cause and  working on a
> > reproducible PoC. We will provide further updates in this thread as
> > soon as we have more information.
> 
> Thanks for the report.  Judging from the stack trace, I believe it's
> the same bug that was reported recently:
>   https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com
> 
> I'm going to submit a fix patch.

FWIW, below is the patch.


Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: aloop: Fix racy access at PCM trigger

The PCM trigger callback of aloop driver tries to check the PCM state
and stop the stream of the tied substream in the corresponding cable.
Since both check and stop operations are performed outside the cable
lock, this may result in UAF when a program attempts to trigger
frequently while opening/closing the tied stream, as spotted by
fuzzers.

For addressing the UAF, this patch changes two things:
- It covers the most of code in loopback_check_format() with
  cable->lock spinlock, and add the proper NULL checks.  This avoids
  already some racy accesses.
- In addition, now we try to check the state of the capture PCM stream
  that may be stopped in this function, which was the major pain point
  leading to UAF.

Reported-by: syzbot+5f8f3acdee1ec7a7ef7b@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/69783ba1.050a0220.c9109.0011.GAE@google.com
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 62 +++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 26 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 64ef03b2d579..aa0d2fcb1a18 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -336,37 +336,43 @@ static bool is_access_interleaved(snd_pcm_access_t access)
 
 static int loopback_check_format(struct loopback_cable *cable, int stream)
 {
+	struct loopback_pcm *dpcm_play, *dpcm_capt;
 	struct snd_pcm_runtime *runtime, *cruntime;
 	struct loopback_setup *setup;
 	struct snd_card *card;
+	bool stop_capture = false;
 	int check;
 
-	if (cable->valid != CABLE_VALID_BOTH) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			goto __notify;
-		return 0;
-	}
-	runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-	cruntime = cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-							substream->runtime;
-	check = runtime->format != cruntime->format ||
-		runtime->rate != cruntime->rate ||
-		runtime->channels != cruntime->channels ||
-		is_access_interleaved(runtime->access) !=
-		is_access_interleaved(cruntime->access);
-	if (!check)
-		return 0;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
-		return -EIO;
-	} else {
-		snd_pcm_stop(cable->streams[SNDRV_PCM_STREAM_CAPTURE]->
-					substream, SNDRV_PCM_STATE_DRAINING);
-	      __notify:
-		runtime = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->
-							substream->runtime;
-		setup = get_setup(cable->streams[SNDRV_PCM_STREAM_PLAYBACK]);
-		card = cable->streams[SNDRV_PCM_STREAM_PLAYBACK]->loopback->card;
+	scoped_guard(spinlock_irqsave, &cable->lock) {
+		dpcm_play = cable->streams[SNDRV_PCM_STREAM_PLAYBACK];
+		dpcm_capt = cable->streams[SNDRV_PCM_STREAM_CAPTURE];
+
+		if (cable->valid != CABLE_VALID_BOTH) {
+			if (stream == SNDRV_PCM_STREAM_CAPTURE || !dpcm_play)
+				return 0;
+		} else {
+			if (!dpcm_play || !dpcm_capt)
+				return -EIO;
+			runtime = dpcm_play->substream->runtime;
+			cruntime = dpcm_capt->substream->runtime;
+			if (!runtime || !cruntime)
+				return -EIO;
+			check = runtime->format != cruntime->format ||
+			runtime->rate != cruntime->rate ||
+			runtime->channels != cruntime->channels ||
+			is_access_interleaved(runtime->access) !=
+			is_access_interleaved(cruntime->access);
+			if (!check)
+				return 0;
+			if (stream == SNDRV_PCM_STREAM_CAPTURE)
+				return -EIO;
+			else if (cruntime->state == SNDRV_PCM_STATE_RUNNING)
+				stop_capture = true;
+		}
+
+		setup = get_setup(dpcm_play);
+		card = dpcm_play->loopback->card;
+		runtime = dpcm_play->substream->runtime;
 		if (setup->format != runtime->format) {
 			snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_VALUE,
 							&setup->format_id);
@@ -389,6 +395,10 @@ static int loopback_check_format(struct loopback_cable *cable, int stream)
 			setup->access = runtime->access;
 		}
 	}
+
+	if (stop_capture)
+		snd_pcm_stop(dpcm_capt->substream, SNDRV_PCM_STATE_DRAINING);
+
 	return 0;
 }
 
-- 
2.52.0


