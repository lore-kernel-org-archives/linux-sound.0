Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116D24C676
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756479670; cv=none; b=l+kZZKY+KYgIuEJlxj1uLC0H5gaLuy26IQiXEhubF+xCT+GQ4GITdrDknegZ4/ATzpoM6U3t3zQNQDzy1j92603dNcSkVcEKt29JkUSNMRlbUDUjbsbhOwYomAhgIecFHUazjMOxnVU4aXi+sVvQadO/WOr6gSg8+IdqVxDbM5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756479670; c=relaxed/simple;
	bh=HA0F6dYbYHUx8H7FPKbrvFRsploVzHFZ29nCGaWThEA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ef0DR7/gum1cJW3lmpMdyhcdJp44RyrDSgdcjQvSU/B1RJsIdUI86chkbuHApeq46v8tvrdGAB7+Gtibiu2GVLooQuRi8q82ohNxZoFhQb+JV0/Now2hmBx1LiElg5vhaYyH132tYMSzt6KTjRPmBwURfeG5Z5oQVPkLGDBjLBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UCarJ5tv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NsTYNj1M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UCarJ5tv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NsTYNj1M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UCarJ5tv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NsTYNj1M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UCarJ5tv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NsTYNj1M"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1F4B5C247;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ms+/4rNPmioRKyj/rCY2j9yjMnUa8065dPcI+IdX4g=;
	b=UCarJ5tvaNyZtTuwxnn1ytwphWKbCVi3cFOl8Q2W6V0sWl1FkbeUa9HIPdJXg/ZfiuQy6E
	pOQcUDOzhatmaagwnCmeGnnTo/jn/x9n/u+Aazm1If/xUGJcbgwaZE8slqyDAYLRP1cS5O
	AQSxMo6gXwMOjvv3jpMyQm/KYtC5TdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ms+/4rNPmioRKyj/rCY2j9yjMnUa8065dPcI+IdX4g=;
	b=NsTYNj1MiDWiJNMTRqykjh8lN5NsWRiHnYxM2rDE2crv6xmVSvPVnzw2+a8ng/82Gx9b/6
	Dmh2ral6QV7qtNCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756479632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ms+/4rNPmioRKyj/rCY2j9yjMnUa8065dPcI+IdX4g=;
	b=UCarJ5tvaNyZtTuwxnn1ytwphWKbCVi3cFOl8Q2W6V0sWl1FkbeUa9HIPdJXg/ZfiuQy6E
	pOQcUDOzhatmaagwnCmeGnnTo/jn/x9n/u+Aazm1If/xUGJcbgwaZE8slqyDAYLRP1cS5O
	AQSxMo6gXwMOjvv3jpMyQm/KYtC5TdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756479632;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ms+/4rNPmioRKyj/rCY2j9yjMnUa8065dPcI+IdX4g=;
	b=NsTYNj1MiDWiJNMTRqykjh8lN5NsWRiHnYxM2rDE2crv6xmVSvPVnzw2+a8ng/82Gx9b/6
	Dmh2ral6QV7qtNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 99EBD13326;
	Fri, 29 Aug 2025 15:00:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wO5yJJDAsWjjHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Aug 2025 15:00:32 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 11/13] ALSA: mts64: Use guard() for spin locks
Date: Fri, 29 Aug 2025 17:00:22 +0200
Message-ID: <20250829150026.6379-12-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829150026.6379-1-tiwai@suse.de>
References: <20250829150026.6379-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Clean up the code using guard() for spin locks.

Merely code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/mts64.c | 57 +++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 38 deletions(-)

diff --git a/sound/drivers/mts64.c b/sound/drivers/mts64.c
index bbeebbe467ea..fe50b48c10e7 100644
--- a/sound/drivers/mts64.c
+++ b/sound/drivers/mts64.c
@@ -432,9 +432,8 @@ static int snd_mts64_ctl_smpte_switch_get(struct snd_kcontrol* kctl,
 {
 	struct mts64 *mts = snd_kcontrol_chip(kctl);
 
-	spin_lock_irq(&mts->lock);
+	guard(spinlock_irq)(&mts->lock);
 	uctl->value.integer.value[0] = mts->smpte_switch;
-	spin_unlock_irq(&mts->lock);
 
 	return 0;
 }
@@ -445,14 +444,12 @@ static int snd_mts64_ctl_smpte_switch_put(struct snd_kcontrol* kctl,
 					  struct snd_ctl_elem_value *uctl)
 {
 	struct mts64 *mts = snd_kcontrol_chip(kctl);
-	int changed = 0;
 	int val = !!uctl->value.integer.value[0];
 
-	spin_lock_irq(&mts->lock);
+	guard(spinlock_irq)(&mts->lock);
 	if (mts->smpte_switch == val)
-		goto __out;
+		return 0;
 
-	changed = 1;
 	mts->smpte_switch = val;
 	if (mts->smpte_switch) {
 		mts64_smpte_start(mts->pardev->port,
@@ -462,9 +459,7 @@ static int snd_mts64_ctl_smpte_switch_put(struct snd_kcontrol* kctl,
 	} else {
 		mts64_smpte_stop(mts->pardev->port);
 	}
-__out:
-	spin_unlock_irq(&mts->lock);
-	return changed;
+	return 1;
 }
 
 static const struct snd_kcontrol_new mts64_ctl_smpte_switch = {
@@ -515,9 +510,8 @@ static int snd_mts64_ctl_smpte_time_get(struct snd_kcontrol *kctl,
 	struct mts64 *mts = snd_kcontrol_chip(kctl);
 	int idx = kctl->private_value;
 
-	spin_lock_irq(&mts->lock);
+	guard(spinlock_irq)(&mts->lock);
 	uctl->value.integer.value[0] = mts->time[idx];
-	spin_unlock_irq(&mts->lock);
 
 	return 0;
 }
@@ -528,16 +522,14 @@ static int snd_mts64_ctl_smpte_time_put(struct snd_kcontrol *kctl,
 	struct mts64 *mts = snd_kcontrol_chip(kctl);
 	int idx = kctl->private_value;
 	unsigned int time = uctl->value.integer.value[0] % 60;
-	int changed = 0;
 
-	spin_lock_irq(&mts->lock);
+	guard(spinlock_irq)(&mts->lock);
 	if (mts->time[idx] != time) {
-		changed = 1;
 		mts->time[idx] = time;
+		return 1;
 	}
-	spin_unlock_irq(&mts->lock);
 
-	return changed;
+	return 0;
 }
 
 static const struct snd_kcontrol_new mts64_ctl_smpte_time_hours = {
@@ -600,9 +592,8 @@ static int snd_mts64_ctl_smpte_fps_get(struct snd_kcontrol *kctl,
 {
 	struct mts64 *mts = snd_kcontrol_chip(kctl);
 
-	spin_lock_irq(&mts->lock);
+	guard(spinlock_irq)(&mts->lock);
 	uctl->value.enumerated.item[0] = mts->fps;
-	spin_unlock_irq(&mts->lock);
 
 	return 0;
 }
@@ -611,18 +602,16 @@ static int snd_mts64_ctl_smpte_fps_put(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *uctl)
 {
 	struct mts64 *mts = snd_kcontrol_chip(kctl);
-	int changed = 0;
 
 	if (uctl->value.enumerated.item[0] >= 5)
 		return -EINVAL;
-	spin_lock_irq(&mts->lock);
+	guard(spinlock_irq)(&mts->lock);
 	if (mts->fps != uctl->value.enumerated.item[0]) {
-		changed = 1;
 		mts->fps = uctl->value.enumerated.item[0];
+		return 1;
 	}
-	spin_unlock_irq(&mts->lock);
 
-	return changed;
+	return 0;
 }
 
 static const struct snd_kcontrol_new mts64_ctl_smpte_fps = {
@@ -687,15 +676,14 @@ static int snd_mts64_rawmidi_open(struct snd_rawmidi_substream *substream)
 static int snd_mts64_rawmidi_close(struct snd_rawmidi_substream *substream)
 {
 	struct mts64 *mts = substream->rmidi->private_data;
-	unsigned long flags;
 
 	--(mts->open_count);
 	if (mts->open_count == 0) {
 		/* We need the spinlock_irqsave here because we can still
 		   have IRQs at this point */
-		spin_lock_irqsave(&mts->lock, flags);
-		mts64_device_close(mts);
-		spin_unlock_irqrestore(&mts->lock, flags);
+		scoped_guard(spinlock_irqsave, &mts->lock) {
+			mts64_device_close(mts);
+		}
 
 		msleep(500);
 
@@ -710,29 +698,24 @@ static void snd_mts64_rawmidi_output_trigger(struct snd_rawmidi_substream *subst
 {
 	struct mts64 *mts = substream->rmidi->private_data;
 	u8 data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&mts->lock, flags);
+	guard(spinlock_irqsave)(&mts->lock);
 	while (snd_rawmidi_transmit_peek(substream, &data, 1) == 1) {
 		mts64_write_midi(mts, data, substream->number+1);
 		snd_rawmidi_transmit_ack(substream, 1);
 	}
-	spin_unlock_irqrestore(&mts->lock, flags);
 }
 
 static void snd_mts64_rawmidi_input_trigger(struct snd_rawmidi_substream *substream,
 					    int up)
 {
 	struct mts64 *mts = substream->rmidi->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&mts->lock, flags);
+	guard(spinlock_irqsave)(&mts->lock);
 	if (up)
 		mts->mode[substream->number] |= MTS64_MODE_INPUT_TRIGGERED;
 	else
  		mts->mode[substream->number] &= ~MTS64_MODE_INPUT_TRIGGERED;
-	
-	spin_unlock_irqrestore(&mts->lock, flags);
 }
 
 static const struct snd_rawmidi_ops snd_mts64_rawmidi_output_ops = {
@@ -819,7 +802,7 @@ static void snd_mts64_interrupt(void *private)
 	if (!mts)
 		return;
 
-	spin_lock(&mts->lock);
+	guard(spinlock)(&mts->lock);
 	ret = mts64_read(mts->pardev->port);
 	data = ret & 0x00ff;
 	status = ret >> 8;
@@ -828,13 +811,11 @@ static void snd_mts64_interrupt(void *private)
 		mts->current_midi_input_port = mts64_map_midi_input(data);
 	} else {
 		if (mts->current_midi_input_port == -1) 
-			goto __out;
+			return;
 		substream = mts->midi_input_substream[mts->current_midi_input_port];
 		if (mts->mode[substream->number] & MTS64_MODE_INPUT_TRIGGERED)
 			snd_rawmidi_receive(substream, &data, 1);
 	}
-__out:
-	spin_unlock(&mts->lock);
 }
 
 static void snd_mts64_attach(struct parport *p)
-- 
2.50.1

