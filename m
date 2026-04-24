Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1E3AEF54
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 11:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029747; cv=none; b=OPESyTsr58JoPtxHqYSyfyED8wO7bch2jqBby1KD0Ehlgxvkno8fqar5uQKWv7NM3sKT+iLl0OEeng83gza1SiZ1Wr2ojNsO7LxIZQ7/FyYxGIFntLVG5X7wlIpKpvoyyD7mucIdBXVTwlEf1unf+p5KbeWsweqkTXEBdOPGBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029747; c=relaxed/simple;
	bh=4B0HfsdpBg2t2cPZRTuR4kl7M0U9FdwaHSMihcp/XGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myZ0S+Tts627rGhxhZ1hTEAdCQ/y90hDgzrkjrHfUiWPUFL1ySVx1TdUBDsW5C3gh45ReTE+0k0o24ZbEzmT3LEWL3IADw3w5S1RYt6FkbASXytSdIOn438os60wibcl+yww5VGrkhpdKlSIRRH6l2ho97tBg9UhZHs5XfBqLOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v/6zI/Mp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XzoXC+4U; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=v/6zI/Mp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XzoXC+4U; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v/6zI/Mp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XzoXC+4U";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v/6zI/Mp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XzoXC+4U"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B3CCE5BD8A;
	Fri, 24 Apr 2026 11:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777029742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CpYIeNCqXD8EhNglZ8h+8L8yDFGg2WXIhRIATMAtm5Q=;
	b=v/6zI/MpiBKWcpXeptjxNmXNsC+pQApfDz13vXVlWttolIf8o0uPPOVtdKCUki11I2lg1W
	OqwfDljH/Zr1zQl7s2WemoORaZY+KuFt8FyfGmdLTCfGPI+XAq4HvG4PClgY6HhGY6PcXB
	5pH18ViSlkRSrojN/I9JAw3S1REDMOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777029742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CpYIeNCqXD8EhNglZ8h+8L8yDFGg2WXIhRIATMAtm5Q=;
	b=XzoXC+4U0uUCujYuwXVpxrr5iRlEu/UOhMLPr1xk7fSt2RPM+F+K8Seu88ffxu3KPNBf0p
	iDbH8u52T/r7K6CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777029742; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CpYIeNCqXD8EhNglZ8h+8L8yDFGg2WXIhRIATMAtm5Q=;
	b=v/6zI/MpiBKWcpXeptjxNmXNsC+pQApfDz13vXVlWttolIf8o0uPPOVtdKCUki11I2lg1W
	OqwfDljH/Zr1zQl7s2WemoORaZY+KuFt8FyfGmdLTCfGPI+XAq4HvG4PClgY6HhGY6PcXB
	5pH18ViSlkRSrojN/I9JAw3S1REDMOc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777029742;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=CpYIeNCqXD8EhNglZ8h+8L8yDFGg2WXIhRIATMAtm5Q=;
	b=XzoXC+4U0uUCujYuwXVpxrr5iRlEu/UOhMLPr1xk7fSt2RPM+F+K8Seu88ffxu3KPNBf0p
	iDbH8u52T/r7K6CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8F360593A4;
	Fri, 24 Apr 2026 11:22:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LOawIW5S62l0NQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 24 Apr 2026 11:22:22 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jaeyoung Chung <jjy600901@snu.ac.kr>
Subject: [PATCH] ALSA: pcm: oss: Fix data race at accessing runtime.oss.trigger
Date: Fri, 24 Apr 2026 13:21:55 +0200
Message-ID: <20260424112205.123703-1-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Currently the runtime.oss.trigger field may be accessed concurrently
without protection, which may lead to the data race.  And, in this
case, it may lead to more severe problem because it's a bit field; as
writing the data, it may overwrite other bit fields as well, which
confuses the operation completely, as spotted by fuzzing.

Fix it by covering runtime.oss.trigger bit fled also with the existing
params_lock mutex in both snd_pcm_oss_get_trigger() and
snd_pcm_oss_poll().

Reported-and-tested-by: Jaeyoung Chung <jjy600901@snu.ac.kr>
Closes: https://lore.kernel.org/20260423145330.210035-1-jjy600901@snu.ac.kr
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/pcm_oss.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index a140a0d9abb8..33fd34f0d615 100644
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
-- 
2.53.0

