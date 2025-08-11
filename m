Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0D22332E
	for <linux-sound@vger.kernel.org>; Mon, 11 Aug 2025 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906989; cv=none; b=Z1gA7CuUacEbfx2ucQaz/TB1ZGGXmujGR9teQwiMfRgRINWl0I5JPTub4owMzXSC6flrD8IxuveKaR65FDKCa6z8tdR2Tlbvik+Os79FzgBPKXTn6u+WB5Xqz6ipcVIFZemyDL5G6tS9olVBrr4GRNIRgc9B0wLk4HWYJpapoOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906989; c=relaxed/simple;
	bh=ECbNsNJVE+djvHwVcl9VvRPxL5asBkp8XkNBkKn2PBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sboNbo84a2AmvH0mOPLG/XPMx4Kk2KshRRh8maOWoj7Regaac0dq3jVuyfhWP1tORWRHFpPNkVezvMyRsMACBz5PWFkM/ddSnzbGunM1jP5vmJkgbyW7V1MaZP5qkYsq53WskPPEw3U4oiUwM5LD0ZVa+f7WNuSpqVsbalXqn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DC2qtfmm; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=j5JjIPtf; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vjOmWtei; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CAonoOwR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DC2qtfmm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="j5JjIPtf";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vjOmWtei";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CAonoOwR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E84E25BE56;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906899; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFR1Hfwh9RFuMa8CfARDg6YaqrUryXjJOo6KMF2jup4=;
	b=DC2qtfmmmPCXPbYtSAa9neYEUl/j5GqSA7DGQfsWG81j7QoFlMnLEumnbN45anaVsUDPfU
	JQW3eqLP8Kp2puC9Dlz1jpd86Lt0szkAgfQrrtNe7SCDfPu3rtpRLxp9P9IdP4gswKsa8V
	rCMDTV1bVj/cQhy4wPztqRKuznEglAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFR1Hfwh9RFuMa8CfARDg6YaqrUryXjJOo6KMF2jup4=;
	b=j5JjIPtfgL858hLh9rbwkJSQ8kw3pAc4pwl1Y6kmzMphZ05i31sUCLhOqKHtqO5kZYLufl
	Acg1cYZXWWEltZCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vjOmWtei;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CAonoOwR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754906898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFR1Hfwh9RFuMa8CfARDg6YaqrUryXjJOo6KMF2jup4=;
	b=vjOmWteihRV8rKJ6RSdVBL2sCB5jzgeSPRh48Nsebzj7QEbK5b9XvrlLZWKALU56h08dLQ
	NZoE5bj6s9h+ORNnvXzNCpniRai2vV2pzeLaMijDaFzSKPX10xt175sBoDP+5KgPsvyR9t
	VuRuwrcnZ8RlGRFM8PmWRwrRXiVB/q4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754906898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OFR1Hfwh9RFuMa8CfARDg6YaqrUryXjJOo6KMF2jup4=;
	b=CAonoOwR3NWR7a6mfT3wEtExviWrDhjbblLsA5p0uyhmOGustcLxBZ+V/wozpmudZPitgg
	V0KfJGqoLSU4eZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A836413A9B;
	Mon, 11 Aug 2025 10:08:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GHT2JxLBmWiVBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 11 Aug 2025 10:08:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>
Subject: [PATCH 24/25] ALSA: hda/common: Use guard() for spinlocks
Date: Mon, 11 Aug 2025 12:07:58 +0200
Message-ID: <20250811100807.7962-25-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811100807.7962-1-tiwai@suse.de>
References: <20250811100807.7962-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E84E25BE56
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_RATELIMIT(0.00)[to_ip_from(RLs9qncch5cpanyka9neihc978)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

Replace the manual spin lock/unlock pairs with guard() for code
simplification.

Only code refactoring, and no behavior change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/common/codec.c      | 10 ++-----
 sound/hda/common/controller.c | 53 +++++++++++++++--------------------
 2 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 1aff14686c47..d2094f1f6995 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -1749,9 +1749,9 @@ int snd_hda_lock_devices(struct hda_bus *bus)
 	struct snd_card *card = bus->card;
 	struct hda_codec *codec;
 
-	spin_lock(&card->files_lock);
+	guard(spinlock)(&card->files_lock);
 	if (card->shutdown)
-		goto err_unlock;
+		return -EINVAL;
 	card->shutdown = 1;
 	if (!list_empty(&card->ctl_files))
 		goto err_clear;
@@ -1766,13 +1766,10 @@ int snd_hda_lock_devices(struct hda_bus *bus)
 				goto err_clear;
 		}
 	}
-	spin_unlock(&card->files_lock);
 	return 0;
 
  err_clear:
 	card->shutdown = 0;
- err_unlock:
-	spin_unlock(&card->files_lock);
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(snd_hda_lock_devices);
@@ -1785,9 +1782,8 @@ void snd_hda_unlock_devices(struct hda_bus *bus)
 {
 	struct snd_card *card = bus->card;
 
-	spin_lock(&card->files_lock);
+	guard(spinlock)(&card->files_lock);
 	card->shutdown = 0;
-	spin_unlock(&card->files_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hda_unlock_devices);
 
diff --git a/sound/hda/common/controller.c b/sound/hda/common/controller.c
index a5693c9ca400..b1cfd9bd4dcb 100644
--- a/sound/hda/common/controller.c
+++ b/sound/hda/common/controller.c
@@ -245,31 +245,29 @@ static int azx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		snd_pcm_trigger_done(s, substream);
 	}
 
-	spin_lock(&bus->reg_lock);
+	scoped_guard(spinlock, &bus->reg_lock) {
+		/* first, set SYNC bits of corresponding streams */
+		snd_hdac_stream_sync_trigger(hstr, true, sbits, sync_reg);
 
-	/* first, set SYNC bits of corresponding streams */
-	snd_hdac_stream_sync_trigger(hstr, true, sbits, sync_reg);
-
-	snd_pcm_group_for_each_entry(s, substream) {
-		if (s->pcm->card != substream->pcm->card)
-			continue;
-		azx_dev = get_azx_dev(s);
-		if (start) {
-			azx_dev->insufficient = 1;
-			snd_hdac_stream_start(azx_stream(azx_dev));
-		} else {
-			snd_hdac_stream_stop(azx_stream(azx_dev));
+		snd_pcm_group_for_each_entry(s, substream) {
+			if (s->pcm->card != substream->pcm->card)
+				continue;
+			azx_dev = get_azx_dev(s);
+			if (start) {
+				azx_dev->insufficient = 1;
+				snd_hdac_stream_start(azx_stream(azx_dev));
+			} else {
+				snd_hdac_stream_stop(azx_stream(azx_dev));
+			}
 		}
 	}
-	spin_unlock(&bus->reg_lock);
 
 	snd_hdac_stream_sync(hstr, start, sbits);
 
-	spin_lock(&bus->reg_lock);
+	guard(spinlock)(&bus->reg_lock);
 	/* reset SYNC bits */
 	snd_hdac_stream_sync_trigger(hstr, false, sbits, sync_reg);
 	snd_hdac_stream_timecounter_init(hstr, sbits, start);
-	spin_unlock(&bus->reg_lock);
 	return 0;
 }
 
@@ -964,19 +962,18 @@ int snd_hda_codec_load_dsp_prepare(struct hda_codec *codec, unsigned int format,
 
 	azx_dev = azx_get_dsp_loader_dev(chip);
 	hstr = azx_stream(azx_dev);
-	spin_lock_irq(&bus->reg_lock);
-	if (hstr->opened) {
-		chip->saved_azx_dev = *azx_dev;
-		saved = true;
+	scoped_guard(spinlock_irq, &bus->reg_lock) {
+		if (hstr->opened) {
+			chip->saved_azx_dev = *azx_dev;
+			saved = true;
+		}
 	}
-	spin_unlock_irq(&bus->reg_lock);
 
 	err = snd_hdac_dsp_prepare(hstr, format, byte_size, bufp);
 	if (err < 0) {
-		spin_lock_irq(&bus->reg_lock);
+		guard(spinlock_irq)(&bus->reg_lock);
 		if (saved)
 			*azx_dev = chip->saved_azx_dev;
-		spin_unlock_irq(&bus->reg_lock);
 		return err;
 	}
 
@@ -1007,11 +1004,10 @@ void snd_hda_codec_load_dsp_cleanup(struct hda_codec *codec,
 		return;
 
 	snd_hdac_dsp_cleanup(hstr, dmab);
-	spin_lock_irq(&bus->reg_lock);
+	guard(spinlock_irq)(&bus->reg_lock);
 	if (hstr->opened)
 		*azx_dev = chip->saved_azx_dev;
 	hstr->locked = false;
-	spin_unlock_irq(&bus->reg_lock);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_load_dsp_cleanup);
 #endif /* CONFIG_SND_HDA_DSP_LOADER */
@@ -1072,10 +1068,10 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
 		if (!pm_runtime_active(chip->card->dev))
 			return IRQ_NONE;
 
-	spin_lock(&bus->reg_lock);
+	guard(spinlock)(&bus->reg_lock);
 
 	if (chip->disabled)
-		goto unlock;
+		return IRQ_NONE;
 
 	do {
 		status = azx_readl(chip, INTSTS);
@@ -1107,9 +1103,6 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
 		}
 	} while (active && ++repeat < 10);
 
- unlock:
-	spin_unlock(&bus->reg_lock);
-
 	return IRQ_RETVAL(handled);
 }
 EXPORT_SYMBOL_GPL(azx_interrupt);
-- 
2.50.1

