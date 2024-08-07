Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B821E484A
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037662; cv=none; b=Cv4lP8VgKzAG9hym0k1y8QJnL1TEqcP8/Atk72f7iBbN5n5EIIlUMk7bbJJz27DDK0oHyKhbLAeOfY2Wg+n9pxuNlEeiIia+BQST4ghgzRfBaOkXsinexsXbQsZXcTX7m6gPWDeJfUuzse7VwDqyjPBgEL/COi1W+7C/fV0MRFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037662; c=relaxed/simple;
	bh=7OY+GB7w/cZjzPh6L3sSavsFXypccq+sMHlL5Zhug0g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVpTY0KUPcD7sCOu8vyUpDS6lHzWrKeSBRwLhiuY00QjmCCl/i5YLVJmuEl1FlIbbWkRiPHCDSpIzgcWsR3rwIAJekTZKQIIEZEI70Dhf+aJVa+VjxsHuQ2EDLdO7qcK/9igbxfudpn2bCst7Hql5JcLxFNrl22Y/zwBTN1YCSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WVrvt3N8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mK8HXFE1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WVrvt3N8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mK8HXFE1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WVrvt3N8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mK8HXFE1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WVrvt3N8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mK8HXFE1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B69E1F8AB;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78sCkMOxEqzqhNLqNB8SMe5cC6RQdERGVBm1QofqEis=;
	b=WVrvt3N88A+lkdyzqEvzhGFsP3MVOnUF4LYkZ0lpTcO5nLhr1S2wp/l5fLJV18Sfei7rvm
	QgNpOCd//wvaZJN9tmSNSNqZ/jVisbbmct/UfEc2VjXoAFAVl1kW+Yy7BgKXcqmo8FkNA/
	sqjYGqDhT44HQx799upt6j9mJsJ0Br0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78sCkMOxEqzqhNLqNB8SMe5cC6RQdERGVBm1QofqEis=;
	b=mK8HXFE1+S+qmirjzE9JnqzAReNhWqEBQaUraBEcDLEt3iYfvoeGmVO0Exp6PDd66SCpvA
	rVRoR358bp3eEaBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WVrvt3N8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mK8HXFE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78sCkMOxEqzqhNLqNB8SMe5cC6RQdERGVBm1QofqEis=;
	b=WVrvt3N88A+lkdyzqEvzhGFsP3MVOnUF4LYkZ0lpTcO5nLhr1S2wp/l5fLJV18Sfei7rvm
	QgNpOCd//wvaZJN9tmSNSNqZ/jVisbbmct/UfEc2VjXoAFAVl1kW+Yy7BgKXcqmo8FkNA/
	sqjYGqDhT44HQx799upt6j9mJsJ0Br0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=78sCkMOxEqzqhNLqNB8SMe5cC6RQdERGVBm1QofqEis=;
	b=mK8HXFE1+S+qmirjzE9JnqzAReNhWqEBQaUraBEcDLEt3iYfvoeGmVO0Exp6PDd66SCpvA
	rVRoR358bp3eEaBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 71E6713A7D;
	Wed,  7 Aug 2024 13:34:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uPafGtl3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:17 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 06/54] ALSA: opl3: Use standard print API
Date: Wed,  7 Aug 2024 15:33:56 +0200
Message-ID: <20240807133452.9424-7-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 8B69E1F8AB
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Some debug prints are cleaned up with a macro, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_lib.c   | 18 +++----
 sound/drivers/opl3/opl3_midi.c  | 95 ++++++++++++++-------------------
 sound/drivers/opl3/opl3_oss.c   | 12 +++--
 sound/drivers/opl3/opl3_synth.c |  4 +-
 4 files changed, 56 insertions(+), 73 deletions(-)

diff --git a/sound/drivers/opl3/opl3_lib.c b/sound/drivers/opl3/opl3_lib.c
index 6c1f1cc092d8..4e57e3b2f118 100644
--- a/sound/drivers/opl3/opl3_lib.c
+++ b/sound/drivers/opl3/opl3_lib.c
@@ -92,7 +92,7 @@ static int snd_opl3_detect(struct snd_opl3 * opl3)
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, OPL3_IRQ_RESET);
 	signature = stat1 = inb(opl3->l_port);	/* Status register */
 	if ((stat1 & 0xe0) != 0x00) {	/* Should be 0x00 */
-		snd_printd("OPL3: stat1 = 0x%x\n", stat1);
+		dev_dbg(opl3->card->dev, "OPL3: stat1 = 0x%x\n", stat1);
 		return -ENODEV;
 	}
 	/* Set timer1 to 0xff */
@@ -108,7 +108,7 @@ static int snd_opl3_detect(struct snd_opl3 * opl3)
 	/* Reset the IRQ of the FM chip */
 	opl3->command(opl3, OPL3_LEFT | OPL3_REG_TIMER_CONTROL, OPL3_IRQ_RESET);
 	if ((stat2 & 0xe0) != 0xc0) {	/* There is no YM3812 */
-		snd_printd("OPL3: stat2 = 0x%x\n", stat2);
+		dev_dbg(opl3->card->dev, "OPL3: stat2 = 0x%x\n", stat2);
 		return -ENODEV;
 	}
 
@@ -289,9 +289,6 @@ void snd_opl3_interrupt(struct snd_hwdep * hw)
 
 	opl3 = hw->private_data;
 	status = inb(opl3->l_port);
-#if 0
-	snd_printk(KERN_DEBUG "AdLib IRQ status = 0x%x\n", status);
-#endif
 	if (!(status & 0x80))
 		return;
 
@@ -365,7 +362,8 @@ EXPORT_SYMBOL(snd_opl3_new);
 int snd_opl3_init(struct snd_opl3 *opl3)
 {
 	if (! opl3->command) {
-		printk(KERN_ERR "snd_opl3_init: command not defined!\n");
+		dev_err(opl3->card->dev,
+			"snd_opl3_init: command not defined!\n");
 		return -EINVAL;
 	}
 
@@ -405,14 +403,14 @@ int snd_opl3_create(struct snd_card *card,
 	if (! integrated) {
 		opl3->res_l_port = request_region(l_port, 2, "OPL2/3 (left)");
 		if (!opl3->res_l_port) {
-			snd_printk(KERN_ERR "opl3: can't grab left port 0x%lx\n", l_port);
+			dev_err(card->dev, "opl3: can't grab left port 0x%lx\n", l_port);
 			snd_device_free(card, opl3);
 			return -EBUSY;
 		}
 		if (r_port != 0) {
 			opl3->res_r_port = request_region(r_port, 2, "OPL2/3 (right)");
 			if (!opl3->res_r_port) {
-				snd_printk(KERN_ERR "opl3: can't grab right port 0x%lx\n", r_port);
+				dev_err(card->dev, "opl3: can't grab right port 0x%lx\n", r_port);
 				snd_device_free(card, opl3);
 				return -EBUSY;
 			}
@@ -432,8 +430,8 @@ int snd_opl3_create(struct snd_card *card,
 		opl3->command = &snd_opl2_command;
 		err = snd_opl3_detect(opl3);
 		if (err < 0) {
-			snd_printd("OPL2/3 chip not detected at 0x%lx/0x%lx\n",
-				   opl3->l_port, opl3->r_port);
+			dev_dbg(card->dev, "OPL2/3 chip not detected at 0x%lx/0x%lx\n",
+				opl3->l_port, opl3->r_port);
 			snd_device_free(card, opl3);
 			return err;
 		}
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index e2b7be67f0e3..9bee454441b0 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -11,6 +11,13 @@
 #include "opl3_voice.h"
 #include <sound/asoundef.h>
 
+#ifdef DEBUG_MIDI
+#define opl3_dbg(opl3, fmt, ...) \
+	dev_dbg(((struct snd_opl3 *)(opl3))->card->dev, fmt, ##__VA_ARGS__)
+#else
+#define opl3_dbg(opl3, fmt, ...) do {} while (0)
+#endif
+
 static void snd_opl3_note_off_unsafe(void *p, int note, int vel,
 				     struct snd_midi_channel *chan);
 /*
@@ -107,14 +114,17 @@ static void snd_opl3_calc_pitch(unsigned char *fnum, unsigned char *blocknum,
 
 
 #ifdef DEBUG_ALLOC
-static void debug_alloc(struct snd_opl3 *opl3, char *s, int voice) {
+static void debug_alloc(struct snd_opl3 *opl3, char *s, int voice)
+{
 	int i;
-	char *str = "x.24";
+	const char *str = "x.24";
+	char buf[MAX_OPL3_VOICES + 1];
 
-	printk(KERN_DEBUG "time %.5i: %s [%.2i]: ", opl3->use_time, s, voice);
 	for (i = 0; i < opl3->max_voices; i++)
-		printk(KERN_CONT "%c", *(str + opl3->voices[i].state + 1));
-	printk(KERN_CONT "\n");
+		buf[i] = str[opl3->voices[i].state + 1];
+	buf[i] = 0;
+	dev_dbg(opl3->card->dev, "time %.5i: %s [%.2i]: %s\n",
+		opl3->use_time, s, voice, buf);
 }
 #endif
 
@@ -203,9 +213,10 @@ static int opl3_get_voice(struct snd_opl3 *opl3, int instr_4op,
 	for (i = 0; i < END; i++) {
 		if (best[i].voice >= 0) {
 #ifdef DEBUG_ALLOC
-			printk(KERN_DEBUG "%s %iop allocation on voice %i\n",
-			       alloc_type[i], instr_4op ? 4 : 2,
-			       best[i].voice);
+			dev_dbg(opl3->card->dev,
+				"%s %iop allocation on voice %i\n",
+				alloc_type[i], instr_4op ? 4 : 2,
+				best[i].voice);
 #endif
 			return best[i].voice;
 		}
@@ -302,10 +313,8 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 
 	opl3 = p;
 
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "Note on, ch %i, inst %i, note %i, vel %i\n",
-		   chan->number, chan->midi_program, note, vel);
-#endif
+	opl3_dbg(opl3, "Note on, ch %i, inst %i, note %i, vel %i\n",
+		 chan->number, chan->midi_program, note, vel);
 
 	/* in SYNTH mode, application takes care of voices */
 	/* in SEQ mode, drum voice numbers are notes on drum channel */
@@ -358,10 +367,8 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		spin_unlock_irqrestore(&opl3->voice_lock, flags);
 		return;
 	}
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "  --> OPL%i instrument: %s\n",
-		   instr_4op ? 3 : 2, patch->name);
-#endif
+	opl3_dbg(opl3, "  --> OPL%i instrument: %s\n",
+		 instr_4op ? 3 : 2, patch->name);
 	/* in SYNTH mode, application takes care of voices */
 	/* in SEQ mode, allocate voice on free OPL3 channel */
 	if (opl3->synth_mode == SNDRV_OPL3_MODE_SEQ) {
@@ -422,10 +429,8 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 		}
 	}
 
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "  --> setting OPL3 connection: 0x%x\n",
-		   opl3->connection_reg);
-#endif
+	opl3_dbg(opl3, "  --> setting OPL3 connection: 0x%x\n",
+		opl3->connection_reg);
 	/*
 	 * calculate volume depending on connection
 	 * between FM operators (see include/opl3.h)
@@ -457,9 +462,7 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 
 	/* Program the FM voice characteristics */
 	for (i = 0; i < (instr_4op ? 4 : 2); i++) {
-#ifdef DEBUG_MIDI
-		snd_printk(KERN_DEBUG "  --> programming operator %i\n", i);
-#endif
+		opl3_dbg(opl3, "  --> programming operator %i\n", i);
 		op_offset = snd_opl3_regmap[voice_offset][i];
 
 		/* Set OPL3 AM_VIB register of requested voice/operator */ 
@@ -537,9 +540,7 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 	/* Set output sound flag */
 	blocknum |= OPL3_KEYON_BIT;
 
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "  --> trigger voice %i\n", voice);
-#endif
+	opl3_dbg(opl3, "  --> trigger voice %i\n", voice);
 	/* Set OPL3 KEYON_BLOCK register of requested voice */ 
 	opl3_reg = reg_side | (OPL3_REG_KEYON_BLOCK + voice_offset);
 	opl3->command(opl3, opl3_reg, blocknum);
@@ -593,9 +594,7 @@ void snd_opl3_note_on(void *p, int note, int vel, struct snd_midi_channel *chan)
 			bank = 0;
 			prg = extra_prg - 1;
 		}
-#ifdef DEBUG_MIDI
-		snd_printk(KERN_DEBUG " *** allocating extra program\n");
-#endif
+		opl3_dbg(opl3, " *** allocating extra program\n");
 		goto __extra_prg;
 	}
 	spin_unlock_irqrestore(&opl3->voice_lock, flags);
@@ -624,9 +623,7 @@ static void snd_opl3_kill_voice(struct snd_opl3 *opl3, int voice)
 	}
 
 	/* kill voice */
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "  --> kill voice %i\n", voice);
-#endif
+	opl3_dbg(opl3, "  --> kill voice %i\n", voice);
 	opl3_reg = reg_side | (OPL3_REG_KEYON_BLOCK + voice_offset);
 	/* clear Key ON bit */
 	opl3->command(opl3, opl3_reg, vp->keyon_reg);
@@ -660,10 +657,8 @@ static void snd_opl3_note_off_unsafe(void *p, int note, int vel,
 
 	opl3 = p;
 
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "Note off, ch %i, inst %i, note %i\n",
-		   chan->number, chan->midi_program, note);
-#endif
+	opl3_dbg(opl3, "Note off, ch %i, inst %i, note %i\n",
+		 chan->number, chan->midi_program, note);
 
 	if (opl3->synth_mode == SNDRV_OPL3_MODE_SEQ) {
 		if (chan->drum_channel && use_internal_drums) {
@@ -703,10 +698,8 @@ void snd_opl3_note_off(void *p, int note, int vel,
  */
 void snd_opl3_key_press(void *p, int note, int vel, struct snd_midi_channel *chan)
 {
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "Key pressure, ch#: %i, inst#: %i\n",
-		   chan->number, chan->midi_program);
-#endif
+	opl3_dbg(p, "Key pressure, ch#: %i, inst#: %i\n",
+		 chan->number, chan->midi_program);
 }
 
 /*
@@ -714,10 +707,8 @@ void snd_opl3_key_press(void *p, int note, int vel, struct snd_midi_channel *cha
  */
 void snd_opl3_terminate_note(void *p, int note, struct snd_midi_channel *chan)
 {
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "Terminate note, ch#: %i, inst#: %i\n",
-		   chan->number, chan->midi_program);
-#endif
+	opl3_dbg(p, "Terminate note, ch#: %i, inst#: %i\n",
+		 chan->number, chan->midi_program);
 }
 
 static void snd_opl3_update_pitch(struct snd_opl3 *opl3, int voice)
@@ -803,10 +794,8 @@ void snd_opl3_control(void *p, int type, struct snd_midi_channel *chan)
   	struct snd_opl3 *opl3;
 
 	opl3 = p;
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "Controller, TYPE = %i, ch#: %i, inst#: %i\n",
-		   type, chan->number, chan->midi_program);
-#endif
+	opl3_dbg(opl3, "Controller, TYPE = %i, ch#: %i, inst#: %i\n",
+		 type, chan->number, chan->midi_program);
 
 	switch (type) {
 	case MIDI_CTL_MSB_MODWHEEL:
@@ -837,10 +826,8 @@ void snd_opl3_control(void *p, int type, struct snd_midi_channel *chan)
 void snd_opl3_nrpn(void *p, struct snd_midi_channel *chan,
 		   struct snd_midi_channel_set *chset)
 {
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "NRPN, ch#: %i, inst#: %i\n",
-		   chan->number, chan->midi_program);
-#endif
+	opl3_dbg(p, "NRPN, ch#: %i, inst#: %i\n",
+		 chan->number, chan->midi_program);
 }
 
 /*
@@ -849,7 +836,5 @@ void snd_opl3_nrpn(void *p, struct snd_midi_channel *chan,
 void snd_opl3_sysex(void *p, unsigned char *buf, int len,
 		    int parsed, struct snd_midi_channel_set *chset)
 {
-#ifdef DEBUG_MIDI
-	snd_printk(KERN_DEBUG "SYSEX\n");
-#endif
+	opl3_dbg(p, "SYSEX\n");
 }
diff --git a/sound/drivers/opl3/opl3_oss.c b/sound/drivers/opl3/opl3_oss.c
index 7645365eec89..6d39b2b77b80 100644
--- a/sound/drivers/opl3/opl3_oss.c
+++ b/sound/drivers/opl3/opl3_oss.c
@@ -193,14 +193,14 @@ static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
 		return -EINVAL;
 
 	if (count < (int)sizeof(sbi)) {
-		snd_printk(KERN_ERR "FM Error: Patch record too short\n");
+		dev_err(opl3->card->dev, "FM Error: Patch record too short\n");
 		return -EINVAL;
 	}
 	if (copy_from_user(&sbi, buf, sizeof(sbi)))
 		return -EFAULT;
 
 	if (sbi.channel < 0 || sbi.channel >= SBFM_MAXINSTR) {
-		snd_printk(KERN_ERR "FM Error: Invalid instrument number %d\n",
+		dev_err(opl3->card->dev, "FM Error: Invalid instrument number %d\n",
 			   sbi.channel);
 		return -EINVAL;
 	}
@@ -220,13 +220,15 @@ static int snd_opl3_load_patch_seq_oss(struct snd_seq_oss_arg *arg, int format,
 static int snd_opl3_ioctl_seq_oss(struct snd_seq_oss_arg *arg, unsigned int cmd,
 				  unsigned long ioarg)
 {
+	struct snd_opl3 *opl3;
+
 	if (snd_BUG_ON(!arg))
 		return -ENXIO;
+	opl3 = arg->private_data;
 	switch (cmd) {
 		case SNDCTL_FM_LOAD_INSTR:
-			snd_printk(KERN_ERR "OPL3: "
-				   "Obsolete ioctl(SNDCTL_FM_LOAD_INSTR) used. "
-				   "Fix the program.\n");
+			dev_err(opl3->card->dev,
+				"OPL3: Obsolete ioctl(SNDCTL_FM_LOAD_INSTR) used. Fix the program.\n");
 			return -EINVAL;
 
 		case SNDCTL_SYNTH_MEMAVL:
diff --git a/sound/drivers/opl3/opl3_synth.c b/sound/drivers/opl3/opl3_synth.c
index 97d30a833ac8..10f622b439a0 100644
--- a/sound/drivers/opl3/opl3_synth.c
+++ b/sound/drivers/opl3/opl3_synth.c
@@ -158,10 +158,8 @@ int snd_opl3_ioctl(struct snd_hwdep * hw, struct file *file,
 		return 0;
 #endif
 
-#ifdef CONFIG_SND_DEBUG
 	default:
-		snd_printk(KERN_WARNING "unknown IOCTL: 0x%x\n", cmd);
-#endif
+		dev_dbg(opl3->card->dev, "unknown IOCTL: 0x%x\n", cmd);
 	}
 	return -ENOTTY;
 }
-- 
2.43.0

