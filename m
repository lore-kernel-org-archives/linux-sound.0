Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2483A63FD
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 14:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770127812; cv=none; b=ACtZv2XYJK52DgaMI4ePTemIi26pg8P9RDG5jgiqyy93WFEAbsxT8jNauYFP8p3NLpxTjH9rXLYGTmPPXB4l8fB1MJWMxyurZwr/loxZjBAaw+G9lrscytSZUHzRVAQoR/DVjnQBNC7WvpLFnN9pp8muCuIcNWtPXPoyr3xLMVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770127812; c=relaxed/simple;
	bh=suDTwqyLHeYCtwfyTf/F6BIbwmo+cWYFMhQ+n75eGTg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=R2vBhrY+IL0SaqGhsu9VAQbA/HrsJ7FnJx1VRgT/Au34VrxOv9EE8NOocHRyAwkv90hfc9rd0Sof5q/mBxD5r/fB3l4/TEDgv8gQloaptzXvjkHoHfb4iODMigk7lu04eKq+DSmAjsS4Yp9lyuO3uIvm47TrHzcPhrRaai08gvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o85SAKCA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0zXJ9Ar9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wjWn6ZSO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iS+MSdFa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o85SAKCA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0zXJ9Ar9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wjWn6ZSO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iS+MSdFa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8B1E03E6D0;
	Tue,  3 Feb 2026 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770127808; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GbgLEJZGjjzPnOh0lwEIiI9ES0zF1u1yPKTLRS2LdWc=;
	b=o85SAKCAMdgKO+1aA7fv3squAnTgpUy3LDbk5OdyLKIizfgpeh1RbagOiiqxPFTQDbhXTL
	L5gf+g3LBu1NasdV9IJKN4OKMjWnzzC+PV+USf5nBv2+6TdIMjfV4EheRBwH6zl//6CEbJ
	3U23737YsS2nMPeJR6DPl/wLD0xrBAQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770127808;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GbgLEJZGjjzPnOh0lwEIiI9ES0zF1u1yPKTLRS2LdWc=;
	b=0zXJ9Ar9q/8UFOffVtUw1yGSzNiHS40DmzaGCjGrpkooiS5Htak/CLLZbP8z1F4wKXQEKr
	spV8Q7aUEm4kJPDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wjWn6ZSO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=iS+MSdFa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770127807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GbgLEJZGjjzPnOh0lwEIiI9ES0zF1u1yPKTLRS2LdWc=;
	b=wjWn6ZSOUayFkiBBFtDU97XGIpJo1DwLRWiaGqAtN+raBhaB3gv12hFm1W2h3peBSIJJCh
	eFCVUgXjPqgsbS49Ciodrf16pZHjkNMYWaMV6ohRmQjxsGxPJxWkmE9tVLqFqK7xjgPwyC
	8HiKSkCn0HJbvMb3qfg936iW8GtRhHQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770127807;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=GbgLEJZGjjzPnOh0lwEIiI9ES0zF1u1yPKTLRS2LdWc=;
	b=iS+MSdFabkwD/4aUzz2WC5kZFHrUI+w/j3/3SPMInrlBlnPpKOGz5vPn8O3j4IjvaW63MP
	7kFUxSDBr1lMWGDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 72FE33EA62;
	Tue,  3 Feb 2026 14:10:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Iu+JG78BgmkcewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Feb 2026 14:10:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: aloop: Fix racy access at PCM trigger
Date: Tue,  3 Feb 2026 15:09:59 +0100
Message-ID: <20260203141003.116584-1-tiwai@suse.de>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8B1E03E6D0
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

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

