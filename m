Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C871CCB32
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022556; cv=none; b=JhIz2BHZnbjDaq9OdCM3b7Lzh7Ipn2QWFrhwjB01GgNHOkEsCGNABhQfdH+jZL8r3+6IkktAsdCzjSZMnLwbJboq6DKCVCDx4P9Kv2FYJzo1LwIpoihtUc8qAAt851tbYu0O3Q52mTSqpIfpOJ7m4w9gTQGGp7JmkFqsjQaiqpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022556; c=relaxed/simple;
	bh=2amv0icxh21dt9Kjg5jknaSTxsqOwc0JbZ7GPL1Rvzo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3iVrq6EWUwnxZdZRRoHgSy64MUsoLi951Iwht954C4NXhz9E8oO6F0YZ/Nc/nhh4ZIlog6i2JFHwCD66ahfboX1EByrXzjN1e+sTj2NUsgW49xs3h1tUYPDgU8ZK4UuTQS7sLFwsAHXOaAQo8CDZBQF7L+ibztE2nABAi1ki4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UOdOxngt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xDMAF24/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UOdOxngt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xDMAF24/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UOdOxngt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDMAF24/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UOdOxngt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDMAF24/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 546A01FB8C;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a31aY18qeTZBenAT4ZlqDeqKX2diP/JyYobOC9ngbZQ=;
	b=UOdOxngtF/VT7wFVSkRPJMy1WQ07r+l35cA2/hkVoQa7fTNS6BLkmgIzkkgJz3RQTDL8RV
	Q/S5RhNMQn8UVNM5rvKNEtF9A1CCGjygMufgNgNwCjGDqhYGe+ZDJtV8AYhfPFlPtPrTZ1
	ED+HAshjVZG0LjNbzlbI0pKFA1ffE28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a31aY18qeTZBenAT4ZlqDeqKX2diP/JyYobOC9ngbZQ=;
	b=xDMAF24/P4bx6A9B40IB7ErY8UXrRQ5vshISlsddeZBcgUDDnr3jOi9S4OBmJ1mmDEJqSQ
	cZyxOzA2VxiieQBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a31aY18qeTZBenAT4ZlqDeqKX2diP/JyYobOC9ngbZQ=;
	b=UOdOxngtF/VT7wFVSkRPJMy1WQ07r+l35cA2/hkVoQa7fTNS6BLkmgIzkkgJz3RQTDL8RV
	Q/S5RhNMQn8UVNM5rvKNEtF9A1CCGjygMufgNgNwCjGDqhYGe+ZDJtV8AYhfPFlPtPrTZ1
	ED+HAshjVZG0LjNbzlbI0pKFA1ffE28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a31aY18qeTZBenAT4ZlqDeqKX2diP/JyYobOC9ngbZQ=;
	b=xDMAF24/P4bx6A9B40IB7ErY8UXrRQ5vshISlsddeZBcgUDDnr3jOi9S4OBmJ1mmDEJqSQ
	cZyxOzA2VxiieQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B96D13297;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CH9mDdM8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/6] ALSA: usb-audio: Update UMP group attributes for GTB blocks, too
Date: Wed,  7 Aug 2024 11:22:59 +0200
Message-ID: <20240807092303.1935-5-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807092303.1935-1-tiwai@suse.de>
References: <20240807092303.1935-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [0.20 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.991];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: 0.20

When a FB is created from a GTB instead of UMP FB Info inquiry, we
missed the update of the corresponding UMP Group attributes.
Export the call of updater and let it be called from the USB driver.

Fixes: 0642a3c5cacc ("ALSA: ump: Update substream name from assigned FB names")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h | 1 +
 sound/core/ump.c    | 9 +++++----
 sound/usb/midi2.c   | 2 ++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 7484f62fb234..532c2c3ea28e 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -123,6 +123,7 @@ static inline int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 
 int snd_ump_receive_ump_val(struct snd_ump_endpoint *ump, u32 val);
 int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol);
+void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump);
 
 /*
  * Some definitions for UMP
diff --git a/sound/core/ump.c b/sound/core/ump.c
index 4502de891adf..243ecdbb2a6e 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -525,7 +525,7 @@ static void snd_ump_proc_read(struct snd_info_entry *entry,
 }
 
 /* update dir_bits and active flag for all groups in the client */
-static void update_group_attrs(struct snd_ump_endpoint *ump)
+void snd_ump_update_group_attrs(struct snd_ump_endpoint *ump)
 {
 	struct snd_ump_block *fb;
 	struct snd_ump_group *group;
@@ -578,6 +578,7 @@ static void update_group_attrs(struct snd_ump_endpoint *ump)
 		}
 	}
 }
+EXPORT_SYMBOL_GPL(snd_ump_update_group_attrs);
 
 /*
  * UMP endpoint and function block handling
@@ -863,7 +864,7 @@ static int ump_handle_fb_info_msg(struct snd_ump_endpoint *ump,
 	if (fb) {
 		fill_fb_info(ump, &fb->info, buf);
 		if (ump->parsed) {
-			update_group_attrs(ump);
+			snd_ump_update_group_attrs(ump);
 			seq_notify_fb_change(ump, fb);
 		}
 	}
@@ -895,7 +896,7 @@ static int ump_handle_fb_name_msg(struct snd_ump_endpoint *ump,
 				buf->raw, 3);
 	/* notify the FB name update to sequencer, too */
 	if (ret > 0 && ump->parsed) {
-		update_group_attrs(ump);
+		snd_ump_update_group_attrs(ump);
 		seq_notify_fb_change(ump, fb);
 	}
 	return ret;
@@ -1065,7 +1066,7 @@ int snd_ump_parse_endpoint(struct snd_ump_endpoint *ump)
 	}
 
 	/* initialize group attributions */
-	update_group_attrs(ump);
+	snd_ump_update_group_attrs(ump);
 
  error:
 	ump->parsed = true;
diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
index 4fb43d9743d7..692dfc3c182f 100644
--- a/sound/usb/midi2.c
+++ b/sound/usb/midi2.c
@@ -877,6 +877,8 @@ static int create_gtb_block(struct snd_usb_midi2_ump *rmidi, int dir, int blk)
 		}
 	}
 
+	snd_ump_update_group_attrs(rmidi->ump);
+
 	usb_audio_dbg(umidi->chip,
 		      "Created a UMP block %d from GTB, name=%s, flags=0x%x\n",
 		      blk, fb->info.name, fb->info.flags);
-- 
2.43.0

