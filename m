Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2052156C72
	for <linux-sound@vger.kernel.org>; Fri, 29 Nov 2024 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732873558; cv=none; b=HzVFHe80wsFEChdnGTwjkJ6LJag82xheQRoc+kHIU5ADol7wYcfx6Z2gV+jppfx40L+uluUtOg84zrSgdb66GY1WhU7vG3LTWX+YKTfubtbY2AeykwhajDvSrsdceQi6KVUVYd+fupplxWdyvX1gASN8hfRsrWeoknXO3/0rNgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732873558; c=relaxed/simple;
	bh=ivfUApLR6y5upfzvSJDwWqEE/43gK3LZcgwcryDcdiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDdONztuAGVZNuD8gJEZ58o5L8h24JkYxoRxVmpZP4adIj1QIjxUk6lpWDK+5wRmnmBrRVRTMQJ6ErGDxllmlkIxvVkR6Ep2Z/9MbrSw2ZTqp8YnbPlu0vjwKTIUUaOL0FdNQDMEgnfMLU8+TTs27ZE+0b5rVGRGSWSfd0irSFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wy2oybX9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dka+QMJ6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kubeSnCv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dzmFFoSi; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wy2oybX9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dka+QMJ6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kubeSnCv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dzmFFoSi"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EDDD621197;
	Fri, 29 Nov 2024 09:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnPxhE32wh8sVeA/MZq9xGWpc5WI4wBFt4knHOdEZE8=;
	b=wy2oybX9b4NAovmnnShYgKMDKFZGGeiJfMP7wmdCljT7H075XoVodAY4iqVXz8ruGdDTEl
	5suPVauQuYHuk99pVRyb8LRejEQRUNdVNTnxVpKoHutJvBpFA1rPCq0wxpjg9uIBcJb9UY
	NdBsIyOIPd1H9vyGBMAe09JxKRaGKcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnPxhE32wh8sVeA/MZq9xGWpc5WI4wBFt4knHOdEZE8=;
	b=dka+QMJ6PexnBPlT+9YBDpz9KuFlnYwauXYO6/sKf1kqoBbNmfSnCKZ/QJPuR8wSyneSl0
	NKI/U3vf+vjyYJBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kubeSnCv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dzmFFoSi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732873554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnPxhE32wh8sVeA/MZq9xGWpc5WI4wBFt4knHOdEZE8=;
	b=kubeSnCv2pleZ1ZTRzTddNSPqtTlKAWwUAnktjyeo1x8QpfWVYtbEi1g37G07cbLA3ZmSH
	pcrPMwkhq+Qq91uqopHL+vEkOMcNXkk5INtJ7EXhZvcQT4QS7NcJEG6cJaQbc2ul+8ohwn
	JLPAsH9zQ1THsxIL3rusyWPNCwEkdQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732873554;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnPxhE32wh8sVeA/MZq9xGWpc5WI4wBFt4knHOdEZE8=;
	b=dzmFFoSigrYV9P17CTKh4gIn6fmAJlA8vVdBi7JDsNfTyEsXr/vrwfq6vtqcoIJ4upXlFz
	Kw7EZClPYUcExCBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D438013AA5;
	Fri, 29 Nov 2024 09:45:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2NieMlKNSWd5VgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Nov 2024 09:45:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/3] ALSA: ump: Update legacy substream names upon FB info update
Date: Fri, 29 Nov 2024 10:45:44 +0100
Message-ID: <20241129094546.32119-4-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241129094546.32119-1-tiwai@suse.de>
References: <20241129094546.32119-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EDDD621197
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_COUNT_TWO(0.00)[2];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The legacy rawmidi substreams should be updated when UMP FB Info or
UMP FB Name are received, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 7b00a957e548..d2b810eb84bc 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -37,6 +37,7 @@ static int process_legacy_output(struct snd_ump_endpoint *ump,
 				 u32 *buffer, int count);
 static void process_legacy_input(struct snd_ump_endpoint *ump, const u32 *src,
 				 int words);
+static void update_legacy_names(struct snd_ump_endpoint *ump);
 #else
 static inline int process_legacy_output(struct snd_ump_endpoint *ump,
 					u32 *buffer, int count)
@@ -47,6 +48,9 @@ static inline void process_legacy_input(struct snd_ump_endpoint *ump,
 					const u32 *src, int words)
 {
 }
+static inline void update_legacy_names(struct snd_ump_endpoint *ump)
+{
+}
 #endif
 
 static const struct snd_rawmidi_global_ops snd_ump_rawmidi_ops = {
@@ -861,6 +865,7 @@ static int ump_handle_fb_info_msg(struct snd_ump_endpoint *ump,
 		fill_fb_info(ump, &fb->info, buf);
 		if (ump->parsed) {
 			snd_ump_update_group_attrs(ump);
+			update_legacy_names(ump);
 			seq_notify_fb_change(ump, fb);
 		}
 	}
@@ -893,6 +898,7 @@ static int ump_handle_fb_name_msg(struct snd_ump_endpoint *ump,
 	/* notify the FB name update to sequencer, too */
 	if (ret > 0 && ump->parsed) {
 		snd_ump_update_group_attrs(ump);
+		update_legacy_names(ump);
 		seq_notify_fb_change(ump, fb);
 	}
 	return ret;
@@ -1262,6 +1268,14 @@ static void fill_substream_names(struct snd_ump_endpoint *ump,
 	}
 }
 
+static void update_legacy_names(struct snd_ump_endpoint *ump)
+{
+	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
+
+	fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
+	fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
+}
+
 int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 				  char *id, int device)
 {
@@ -1298,10 +1312,7 @@ int snd_ump_attach_legacy_rawmidi(struct snd_ump_endpoint *ump,
 	rmidi->ops = &snd_ump_legacy_ops;
 	rmidi->private_data = ump;
 	ump->legacy_rmidi = rmidi;
-	if (input)
-		fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
-	if (output)
-		fill_substream_names(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
+	update_legacy_names(ump);
 
 	ump_dbg(ump, "Created a legacy rawmidi #%d (%s)\n", device, id);
 	return 0;
-- 
2.43.0

