Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C088D322A08
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478811; cv=none; b=g4IJPStvVHFc8GKCD2PVYgc99+jp5Np8gSjDX3IXtSa9/d69b9qKjhFkgNC7n+3665vLVv2mawadeqBShEddTorap7P+2/YKoKGoDe9imJqaCRGa0LfCvrLI+qID7EoKOvIGHxbTibNwKuJGsx2LIgA/chqX3fvIJ2oQK4123L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478811; c=relaxed/simple;
	bh=+xuD3D0pjB+l8PF3+fhUL++c5ZzWorsBbGaopisu8Mk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NCW0GQ61XbyOsXCaewny2+/eHTnUzMqViYyKB0Y2WalDkCgqqdyZbG8rtDrSJXitsjglS3pgvWThyG0AFkT+PAu7HI9jGYyexTvNGE5OtMl4BgGfqhfQGjGq0sv/CGrV9n/rZe77b+oloSx0DBQVdncfP95uDcFAjpDXsyYZmIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jfGB9bdo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ij1mY+O8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=jfGB9bdo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ij1mY+O8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jfGB9bdo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ij1mY+O8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jfGB9bdo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ij1mY+O8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3A8885C23D;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBYGM4hOZFgigz//QqryoMOkbijVv6PnMDokEHgO17Y=;
	b=jfGB9bdo1VqPhY6yzsaH8rYGzSPN1CoKTAdbjFkkWlM3Fw27CPA0zpP4/5dJlVkPllDBTu
	EMKTca2xLP+QVtirkBEY33dj+1e5LRa0BW0l+MWEFi4uJ7fPxi16pLGrIOLIspGH1Qfxz+
	dyEit1jw3sNIgOSfldHCLYCcIADcpjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBYGM4hOZFgigz//QqryoMOkbijVv6PnMDokEHgO17Y=;
	b=Ij1mY+O8vcp+W3HDusA4DlsiHp1bTspmpr3lrrZZuGT0PRLeSpiapO/BYAaKCSswXa1WDm
	RyUM6JmfxLAfIYDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=jfGB9bdo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ij1mY+O8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756478642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBYGM4hOZFgigz//QqryoMOkbijVv6PnMDokEHgO17Y=;
	b=jfGB9bdo1VqPhY6yzsaH8rYGzSPN1CoKTAdbjFkkWlM3Fw27CPA0zpP4/5dJlVkPllDBTu
	EMKTca2xLP+QVtirkBEY33dj+1e5LRa0BW0l+MWEFi4uJ7fPxi16pLGrIOLIspGH1Qfxz+
	dyEit1jw3sNIgOSfldHCLYCcIADcpjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756478642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mBYGM4hOZFgigz//QqryoMOkbijVv6PnMDokEHgO17Y=;
	b=Ij1mY+O8vcp+W3HDusA4DlsiHp1bTspmpr3lrrZZuGT0PRLeSpiapO/BYAaKCSswXa1WDm
	RyUM6JmfxLAfIYDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2151513A72;
	Fri, 29 Aug 2025 14:44:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QDX8BrK8sWi6GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 14:44:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 43/61] ALSA: mixart: Use guard() for mutex locks
Date: Fri, 29 Aug 2025 16:43:18 +0200
Message-ID: <20250829144342.4290-44-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829144342.4290-1-tiwai@suse.de>
References: <20250829144342.4290-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3A8885C23D
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLe1mc1hwayk397878n5a1j337)];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01

Replace the manual mutex lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart.c       | 48 +++++++---------------
 sound/pci/mixart/mixart_core.c  | 71 +++++++++++++++------------------
 sound/pci/mixart/mixart_mixer.c | 46 ++++++++++-----------
 3 files changed, 70 insertions(+), 95 deletions(-)

diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index cdc0ba5dd1ad..c6319e75beab 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -603,7 +603,7 @@ static int snd_mixart_hw_params(struct snd_pcm_substream *subs,
 	/*  set up format for the stream */
 	format = params_format(hw);
 
-	mutex_lock(&mgr->setup_mutex);
+	guard(mutex)(&mgr->setup_mutex);
 
 	/* update the stream levels */
 	if( stream->pcm_number <= MIXART_PCM_DIGITAL ) {
@@ -618,10 +618,8 @@ static int snd_mixart_hw_params(struct snd_pcm_substream *subs,
 
 	/* set the format to the board */
 	err = mixart_set_format(stream, format);
-	if(err < 0) {
-		mutex_unlock(&mgr->setup_mutex);
+	if (err < 0)
 		return err;
-	}
 
 	if (subs->runtime->buffer_changed) {
 		struct mixart_bufferinfo *bufferinfo;
@@ -641,7 +639,6 @@ static int snd_mixart_hw_params(struct snd_pcm_substream *subs,
 				bufferinfo[i].available_length,
 				subs->number);
 	}
-	mutex_unlock(&mgr->setup_mutex);
 
 	return 0;
 }
@@ -712,7 +709,7 @@ static int snd_mixart_playback_open(struct snd_pcm_substream *subs)
 	int err = 0;
 	int pcm_number;
 
-	mutex_lock(&mgr->setup_mutex);
+	guard(mutex)(&mgr->setup_mutex);
 
 	if ( pcm == chip->pcm ) {
 		pcm_number = MIXART_PCM_ANALOG;
@@ -734,25 +731,21 @@ static int snd_mixart_playback_open(struct snd_pcm_substream *subs)
 		dev_err(chip->card->dev,
 			"snd_mixart_playback_open C%d/P%d/Sub%d in use\n",
 			chip->chip_idx, pcm_number, subs->number);
-		err = -EBUSY;
-		goto _exit_open;
+		return -EBUSY;
 	}
 
 	/* get pipe pointer (out pipe) */
 	pipe = snd_mixart_add_ref_pipe(chip, pcm_number, 0, 0);
 
-	if (pipe == NULL) {
-		err = -EINVAL;
-		goto _exit_open;
-	}
+	if (pipe == NULL)
+		return -EINVAL;
 
 	/* start the pipe if necessary */
 	err = mixart_set_pipe_state(chip->mgr, pipe, 1);
 	if( err < 0 ) {
 		dev_err(chip->card->dev, "error starting pipe!\n");
 		snd_mixart_kill_ref_pipe(chip->mgr, pipe, 0);
-		err = -EINVAL;
-		goto _exit_open;
+		return -EINVAL;
 	}
 
 	stream->pipe        = pipe;
@@ -773,10 +766,7 @@ static int snd_mixart_playback_open(struct snd_pcm_substream *subs)
 		}
 	}
 
- _exit_open:
-	mutex_unlock(&mgr->setup_mutex);
-
-	return err;
+	return 0;
 }
 
 
@@ -791,7 +781,7 @@ static int snd_mixart_capture_open(struct snd_pcm_substream *subs)
 	int err = 0;
 	int pcm_number;
 
-	mutex_lock(&mgr->setup_mutex);
+	guard(mutex)(&mgr->setup_mutex);
 
 	if ( pcm == chip->pcm ) {
 		pcm_number = MIXART_PCM_ANALOG;
@@ -815,25 +805,21 @@ static int snd_mixart_capture_open(struct snd_pcm_substream *subs)
 		dev_err(chip->card->dev,
 			"snd_mixart_capture_open C%d/P%d/Sub%d in use\n",
 			chip->chip_idx, pcm_number, subs->number);
-		err = -EBUSY;
-		goto _exit_open;
+		return -EBUSY;
 	}
 
 	/* get pipe pointer (in pipe) */
 	pipe = snd_mixart_add_ref_pipe(chip, pcm_number, 1, 0);
 
-	if (pipe == NULL) {
-		err = -EINVAL;
-		goto _exit_open;
-	}
+	if (pipe == NULL)
+		return -EINVAL;
 
 	/* start the pipe if necessary */
 	err = mixart_set_pipe_state(chip->mgr, pipe, 1);
 	if( err < 0 ) {
 		dev_err(chip->card->dev, "error starting pipe!\n");
 		snd_mixart_kill_ref_pipe(chip->mgr, pipe, 0);
-		err = -EINVAL;
-		goto _exit_open;
+		return -EINVAL;
 	}
 
 	stream->pipe        = pipe;
@@ -854,10 +840,7 @@ static int snd_mixart_capture_open(struct snd_pcm_substream *subs)
 		}
 	}
 
- _exit_open:
-	mutex_unlock(&mgr->setup_mutex);
-
-	return err;
+	return 0;
 }
 
 
@@ -868,7 +851,7 @@ static int snd_mixart_close(struct snd_pcm_substream *subs)
 	struct mixart_mgr *mgr = chip->mgr;
 	struct mixart_stream *stream = subs->runtime->private_data;
 
-	mutex_lock(&mgr->setup_mutex);
+	guard(mutex)(&mgr->setup_mutex);
 
 	dev_dbg(chip->card->dev, "snd_mixart_close C%d/P%d/Sub%d\n",
 		chip->chip_idx, stream->pcm_number, subs->number);
@@ -890,7 +873,6 @@ static int snd_mixart_close(struct snd_pcm_substream *subs)
 	stream->status    = MIXART_STREAM_STATUS_FREE;
 	stream->substream = NULL;
 
-	mutex_unlock(&mgr->setup_mutex);
 	return 0;
 }
 
diff --git a/sound/pci/mixart/mixart_core.c b/sound/pci/mixart/mixart_core.c
index a047ed0f84e9..f7396ee4f6d7 100644
--- a/sound/pci/mixart/mixart_core.c
+++ b/sound/pci/mixart/mixart_core.c
@@ -226,17 +226,16 @@ int snd_mixart_send_msg(struct mixart_mgr *mgr, struct mixart_msg *request, int
 
 	init_waitqueue_entry(&wait, current);
 
-	mutex_lock(&mgr->msg_lock);
-	/* send the message */
-	err = send_msg(mgr, request, max_resp_size, 1, &msg_frame);  /* send and mark the answer pending */
-	if (err) {
-		mutex_unlock(&mgr->msg_lock);
-		return err;
+	scoped_guard(mutex, &mgr->msg_lock) {
+		/* send the message */
+		err = send_msg(mgr, request, max_resp_size, 1, &msg_frame);  /* send and mark the answer pending */
+		if (err)
+			return err;
+
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&mgr->msg_sleep, &wait);
 	}
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(&mgr->msg_sleep, &wait);
-	mutex_unlock(&mgr->msg_lock);
 	timeout = schedule_timeout(MSG_TIMEOUT_JIFFIES);
 	remove_wait_queue(&mgr->msg_sleep, &wait);
 
@@ -253,9 +252,9 @@ int snd_mixart_send_msg(struct mixart_mgr *mgr, struct mixart_msg *request, int
 	resp.data = resp_data;
 	resp.size = max_resp_size;
 
-	mutex_lock(&mgr->msg_lock);
-	err = get_msg(mgr, &resp, msg_frame);
-	mutex_unlock(&mgr->msg_lock);
+	scoped_guard(mutex, &mgr->msg_lock) {
+		err = get_msg(mgr, &resp, msg_frame);
+	}
 
 	if( request->message_id != resp.message_id )
 		dev_err(&mgr->pci->dev, "RESPONSE ERROR!\n");
@@ -280,17 +279,16 @@ int snd_mixart_send_msg_wait_notif(struct mixart_mgr *mgr,
 
 	init_waitqueue_entry(&wait, current);
 
-	mutex_lock(&mgr->msg_lock);
-	/* send the message */
-	err = send_msg(mgr, request, MSG_DEFAULT_SIZE, 1, &notif_event);  /* send and mark the notification event pending */
-	if(err) {
-		mutex_unlock(&mgr->msg_lock);
-		return err;
+	scoped_guard(mutex, &mgr->msg_lock) {
+		/* send the message */
+		err = send_msg(mgr, request, MSG_DEFAULT_SIZE, 1, &notif_event);  /* send and mark the notification event pending */
+		if (err)
+			return err;
+
+		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&mgr->msg_sleep, &wait);
 	}
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	add_wait_queue(&mgr->msg_sleep, &wait);
-	mutex_unlock(&mgr->msg_lock);
 	timeout = schedule_timeout(MSG_TIMEOUT_JIFFIES);
 	remove_wait_queue(&mgr->msg_sleep, &wait);
 
@@ -311,9 +309,8 @@ int snd_mixart_send_msg_nonblock(struct mixart_mgr *mgr, struct mixart_msg *requ
 	int err;
 
 	/* just send the message (do not mark it as a pending one) */
-	mutex_lock(&mgr->msg_lock);
+	guard(mutex)(&mgr->msg_lock);
 	err = send_msg(mgr, request, MSG_DEFAULT_SIZE, 0, &message_frame);
-	mutex_unlock(&mgr->msg_lock);
 
 	/* the answer will be handled by snd_struct mixart_msgasklet()  */
 	atomic_inc(&mgr->msg_processed);
@@ -420,7 +417,7 @@ irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
 	struct mixart_msg resp;
 	u32 msg;
 
-	mutex_lock(&mgr->lock);
+	guard(mutex)(&mgr->lock);
 	/* process interrupt */
 	while (retrieve_msg_frame(mgr, &msg)) {
 
@@ -530,19 +527,19 @@ irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
 			fallthrough;
 		case MSG_TYPE_ANSWER:
 			/* answer or notification to a message we are waiting for*/
-			mutex_lock(&mgr->msg_lock);
-			if( (msg & ~MSG_TYPE_MASK) == mgr->pending_event ) {
-				wake_up(&mgr->msg_sleep);
-				mgr->pending_event = 0;
+			scoped_guard(mutex, &mgr->msg_lock) {
+				if ((msg & ~MSG_TYPE_MASK) == mgr->pending_event) {
+					wake_up(&mgr->msg_sleep);
+					mgr->pending_event = 0;
+				}
+				/* answer to a message we did't want to wait for */
+				else {
+					mgr->msg_fifo[mgr->msg_fifo_writeptr] = msg;
+					mgr->msg_fifo_writeptr++;
+					mgr->msg_fifo_writeptr %= MSG_FIFO_SIZE;
+					snd_mixart_process_msg(mgr);
+				}
 			}
-			/* answer to a message we did't want to wait for */
-			else {
-				mgr->msg_fifo[mgr->msg_fifo_writeptr] = msg;
-				mgr->msg_fifo_writeptr++;
-				mgr->msg_fifo_writeptr %= MSG_FIFO_SIZE;
-				snd_mixart_process_msg(mgr);
-			}
-			mutex_unlock(&mgr->msg_lock);
 			break;
 		case MSG_TYPE_REQUEST:
 		default:
@@ -556,8 +553,6 @@ irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
 	/* allow interrupt again */
 	writel_le( MIXART_ALLOW_OUTBOUND_DOORBELL, MIXART_REG( mgr, MIXART_PCI_OMIMR_OFFSET));
 
-	mutex_unlock(&mgr->lock);
-
 	return IRQ_HANDLED;
 }
 
diff --git a/sound/pci/mixart/mixart_mixer.c b/sound/pci/mixart/mixart_mixer.c
index 2727f3345795..f4081d323340 100644
--- a/sound/pci/mixart/mixart_mixer.c
+++ b/sound/pci/mixart/mixart_mixer.c
@@ -344,7 +344,8 @@ static int mixart_analog_vol_info(struct snd_kcontrol *kcontrol, struct snd_ctl_
 static int mixart_analog_vol_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	if(kcontrol->private_value == 0) {	/* playback */
 		ucontrol->value.integer.value[0] = chip->analog_playback_volume[0];
 		ucontrol->value.integer.value[1] = chip->analog_playback_volume[1];
@@ -352,7 +353,6 @@ static int mixart_analog_vol_get(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 		ucontrol->value.integer.value[0] = chip->analog_capture_volume[0];
 		ucontrol->value.integer.value[1] = chip->analog_capture_volume[1];
 	}
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return 0;
 }
 
@@ -362,7 +362,7 @@ static int mixart_analog_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	int changed = 0;
 	int is_capture, i;
 
-	mutex_lock(&chip->mgr->mixer_mutex);
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	is_capture = (kcontrol->private_value != 0);
 	for (i = 0; i < 2; i++) {
 		int new_volume = ucontrol->value.integer.value[i];
@@ -385,7 +385,6 @@ static int mixart_analog_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	}
 	if (changed)
 		mixart_update_analog_audio_level(chip, is_capture);
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return changed;
 }
 
@@ -409,10 +408,9 @@ static int mixart_audio_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 {
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
 
-	mutex_lock(&chip->mgr->mixer_mutex);
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->analog_playback_active[0];
 	ucontrol->value.integer.value[1] = chip->analog_playback_active[1];
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return 0;
 }
 
@@ -420,7 +418,8 @@ static int mixart_audio_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 {
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
 	int i, changed = 0;
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	for (i = 0; i < 2; i++) {
 		if (chip->analog_playback_active[i] !=
 		    ucontrol->value.integer.value[i]) {
@@ -431,7 +430,6 @@ static int mixart_audio_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_ele
 	}
 	if (changed) /* update playback levels */
 		mixart_update_analog_audio_level(chip, 0);
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return changed;
 }
 
@@ -825,7 +823,8 @@ static int mixart_pcm_vol_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	int *stored_volume;
 	int is_capture = kcontrol->private_value & MIXART_VOL_REC_MASK;
 	int is_aes = kcontrol->private_value & MIXART_VOL_AES_MASK;
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	if(is_capture) {
 		if(is_aes)	stored_volume = chip->digital_capture_volume[1];	/* AES capture */
 		else		stored_volume = chip->digital_capture_volume[0];	/* analog capture */
@@ -836,7 +835,6 @@ static int mixart_pcm_vol_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	}
 	ucontrol->value.integer.value[0] = stored_volume[0];
 	ucontrol->value.integer.value[1] = stored_volume[1];
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return 0;
 }
 
@@ -849,7 +847,8 @@ static int mixart_pcm_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 	int is_aes = kcontrol->private_value & MIXART_VOL_AES_MASK;
 	int* stored_volume;
 	int i;
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	if (is_capture) {
 		if (is_aes)	/* AES capture */
 			stored_volume = chip->digital_capture_volume[1];
@@ -878,7 +877,6 @@ static int mixart_pcm_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 		else
 			mixart_update_playback_stream_level(chip, is_aes, idx);
 	}
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return changed;
 }
 
@@ -903,12 +901,12 @@ static int mixart_pcm_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
 	int idx = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id); /* index */
 	snd_BUG_ON(idx >= MIXART_PLAYBACK_STREAMS);
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	if(kcontrol->private_value & MIXART_VOL_AES_MASK)	/* AES playback */
 		idx += MIXART_PLAYBACK_STREAMS;
 	ucontrol->value.integer.value[0] = chip->digital_playback_active[idx][0];
 	ucontrol->value.integer.value[1] = chip->digital_playback_active[idx][1];
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return 0;
 }
 
@@ -920,7 +918,8 @@ static int mixart_pcm_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	int idx = snd_ctl_get_ioffidx(kcontrol, &ucontrol->id); /* index */
 	int i, j;
 	snd_BUG_ON(idx >= MIXART_PLAYBACK_STREAMS);
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	j = idx;
 	if (is_aes)
 		j += MIXART_PLAYBACK_STREAMS;
@@ -934,7 +933,6 @@ static int mixart_pcm_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_
 	}
 	if (changed)
 		mixart_update_playback_stream_level(chip, is_aes, idx);
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return changed;
 }
 
@@ -985,10 +983,10 @@ static int mixart_update_monitoring(struct snd_mixart* chip, int channel)
 static int mixart_monitor_vol_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->monitoring_volume[0];
 	ucontrol->value.integer.value[1] = chip->monitoring_volume[1];
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return 0;
 }
 
@@ -997,7 +995,8 @@ static int mixart_monitor_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
 	int changed = 0;
 	int i;
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	for (i = 0; i < 2; i++) {
 		if (chip->monitoring_volume[i] !=
 		    ucontrol->value.integer.value[i]) {
@@ -1007,7 +1006,6 @@ static int mixart_monitor_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_
 			changed = 1;
 		}
 	}
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return changed;
 }
 
@@ -1029,10 +1027,10 @@ static const struct snd_kcontrol_new mixart_control_monitor_vol = {
 static int mixart_monitor_sw_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	ucontrol->value.integer.value[0] = chip->monitoring_active[0];
 	ucontrol->value.integer.value[1] = chip->monitoring_active[1];
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return 0;
 }
 
@@ -1041,7 +1039,8 @@ static int mixart_monitor_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 	struct snd_mixart *chip = snd_kcontrol_chip(kcontrol);
 	int changed = 0;
 	int i;
-	mutex_lock(&chip->mgr->mixer_mutex);
+
+	guard(mutex)(&chip->mgr->mixer_mutex);
 	for (i = 0; i < 2; i++) {
 		if (chip->monitoring_active[i] !=
 		    ucontrol->value.integer.value[i]) {
@@ -1074,7 +1073,6 @@ static int mixart_monitor_sw_put(struct snd_kcontrol *kcontrol, struct snd_ctl_e
 		}
 	}
 
-	mutex_unlock(&chip->mgr->mixer_mutex);
 	return (changed != 0);
 }
 
-- 
2.50.1

