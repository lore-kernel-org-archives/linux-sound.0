Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80515B147
	for <linux-sound@vger.kernel.org>; Tue,  6 Aug 2024 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722927593; cv=none; b=Tg+U23GYlbSccYERMmxCLLZUSSav5anVNPqZgG5cXODJv2P7xe+2A0lcMYlrNH8ymA9ruqnTQltMhJyzQgcXlNo3dG+93E64v/naA7p5HXKanYmBfjHqiSQFR16X+0pOqCI3q33F1H1DVFkAhT1FnPLCvbwIJpod8B/FQL2oijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722927593; c=relaxed/simple;
	bh=wijU06uVxFElgrh73a0ri7qqmuvTf596+pMZaVNoGbQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=mI1D0tMdjLLQ13DLKNkgavzPzXzyp3EqyWqyfXl+KARcEtkOJm5mmC0iBTXh8k/WX38GCD2RTYDOJGV173IV5vwHuGy7hjozR3zzi+vTalla/4E8If1W263FP99dRiK1h6/Xg98BQz1QXDFep3oYXegBiSZXous++ptp06jW1os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EPvzRG4z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IytD/SZz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=manlGtwJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xdBc6sZf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EPvzRG4z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IytD/SZz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="manlGtwJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xdBc6sZf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 56A8321C51;
	Tue,  6 Aug 2024 06:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722927589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JyilrOz/v46rmGf6NKEQ5wVGnPClFxaigcBnOIDesjM=;
	b=EPvzRG4zaO9Rdp2xE5dpKITYzEElAbt3ih0B6G31kcBK9SlhJ4wcmegcMZF3b57ZSnSnPL
	myeGGVkEggKY0G+Jkp3dzbCklfavxLT3j37rSUQIrPyp81rknWu+doVSjbNWz3gkuvQH68
	3AqDyCU+1T40XTYBCziPwZtyR/mfviY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722927589;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JyilrOz/v46rmGf6NKEQ5wVGnPClFxaigcBnOIDesjM=;
	b=IytD/SZznOuuM37cQ4/aTEpLm0Vbe2j5D7+hk9jhOeiUleRdxnRvkXY2QZqu8ZswIKfmfo
	C/SUKStB4d3XZwCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=manlGtwJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xdBc6sZf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722927588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JyilrOz/v46rmGf6NKEQ5wVGnPClFxaigcBnOIDesjM=;
	b=manlGtwJNc0ujY1+dol8qb6usQXr6nPEu7wuQcAg1Q2NWHGD8gcQsh20GqE+1jxSiJfrCx
	8Eni21xkglLK++eWkQb1kTsD7GLMjRQEFvCT1piFwRn7q2RjrUF1qD4u3faUOM9AmZchg2
	NAf510EAUZC4W2anQZa7Sz5RxFxly1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722927588;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=JyilrOz/v46rmGf6NKEQ5wVGnPClFxaigcBnOIDesjM=;
	b=xdBc6sZfELSjG6rVsfQN89uRQ/IZ++dSnSuLXpPzJUOG2zo8io9+B7FeNm+HHw1f/ppfgF
	+7HqdFQEl4NGIQBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 370C313770;
	Tue,  6 Aug 2024 06:59:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id APbQC+TJsWZhUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 06:59:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: Handle MIDI 1.0 Function Block in MIDI 2.0 protocol
Date: Tue,  6 Aug 2024 09:00:23 +0200
Message-ID: <20240806070024.14301-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 56A8321C51

The UMP v1.1 spec says in the section 6.2.1:
"If a UMP Endpoint declares MIDI 2.0 Protocol but a Function Block
represents a MIDI 1.0 connection, then may optionally be used for
messages to/from that Function Block."

It implies that the driver can (and should) keep MIDI 1.0 CVM
exceptionally for those FBs even if UMP Endpoint is running in MIDI
2.0 protocol, and the current driver lacks of it.

This patch extends the sequencer port info to indicate a MIDI 1.0
port, and tries to send/receive MIDI 1.0 CVM as is when this port is
the source or sink.  The sequencer port flag is set by the driver at
parsing FBs and GTBs although application can set it to its own
user-space clients, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/ump.h              |  1 +
 include/uapi/sound/asequencer.h  |  2 ++
 sound/core/seq/seq_ports.c       |  2 ++
 sound/core/seq/seq_ports.h       |  2 ++
 sound/core/seq/seq_ump_client.c  |  4 +++-
 sound/core/seq/seq_ump_convert.c | 11 ++++++-----
 sound/core/ump.c                 | 10 +++++++++-
 7 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/include/sound/ump.h b/include/sound/ump.h
index 7f68056acdff..7484f62fb234 100644
--- a/include/sound/ump.h
+++ b/include/sound/ump.h
@@ -18,6 +18,7 @@ struct snd_ump_group {
 	unsigned int dir_bits;		/* directions */
 	bool active;			/* activeness */
 	bool valid;			/* valid group (referred by blocks) */
+	bool is_midi1;			/* belongs to a MIDI1 FB */
 	char name[64];			/* group name */
 };
 
diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index 39b37edcf813..bc30c1f2a109 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -461,6 +461,8 @@ struct snd_seq_remove_events {
 #define SNDRV_SEQ_PORT_FLG_TIMESTAMP	(1<<1)
 #define SNDRV_SEQ_PORT_FLG_TIME_REAL	(1<<2)
 
+#define SNDRV_SEQ_PORT_FLG_IS_MIDI1	(1<<3)	/* Keep MIDI 1.0 protocol */
+
 /* port direction */
 #define SNDRV_SEQ_PORT_DIR_UNKNOWN	0
 #define SNDRV_SEQ_PORT_DIR_INPUT	1
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index ca631ca4f2c6..535290f24eed 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -362,6 +362,8 @@ int snd_seq_set_port_info(struct snd_seq_client_port * port,
 			port->direction |= SNDRV_SEQ_PORT_DIR_OUTPUT;
 	}
 
+	port->is_midi1 = !!(info->flags & SNDRV_SEQ_PORT_FLG_IS_MIDI1);
+
 	return 0;
 }
 
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index b111382f697a..20a26bffecb7 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -87,6 +87,8 @@ struct snd_seq_client_port {
 	unsigned char direction;
 	unsigned char ump_group;
 
+	bool is_midi1;	/* keep MIDI 1.0 protocol */
+
 #if IS_ENABLED(CONFIG_SND_SEQ_UMP)
 	struct snd_seq_ump_midi2_bank midi2_bank[16]; /* per channel */
 #endif
diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index 637154bd1a3f..e5d3f4d206bf 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -189,6 +189,8 @@ static void fill_port_info(struct snd_seq_port_info *port,
 	port->ump_group = group->group + 1;
 	if (!group->active)
 		port->capability |= SNDRV_SEQ_PORT_CAP_INACTIVE;
+	if (group->is_midi1)
+		port->flags |= SNDRV_SEQ_PORT_FLG_IS_MIDI1;
 	port->type = SNDRV_SEQ_PORT_TYPE_MIDI_GENERIC |
 		SNDRV_SEQ_PORT_TYPE_MIDI_UMP |
 		SNDRV_SEQ_PORT_TYPE_HARDWARE |
@@ -223,7 +225,7 @@ static int seq_ump_group_init(struct seq_ump_client *client, int group_index)
 		return -ENOMEM;
 
 	fill_port_info(port, client, group);
-	port->flags = SNDRV_SEQ_PORT_FLG_GIVEN_PORT;
+	port->flags |= SNDRV_SEQ_PORT_FLG_GIVEN_PORT;
 	memset(&pcallbacks, 0, sizeof(pcallbacks));
 	pcallbacks.owner = THIS_MODULE;
 	pcallbacks.private_data = client;
diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index d9dacfbe4a9a..90656980ae26 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -595,12 +595,13 @@ int snd_seq_deliver_from_ump(struct snd_seq_client *source,
 	type = ump_message_type(ump_ev->ump[0]);
 
 	if (snd_seq_client_is_ump(dest)) {
-		if (snd_seq_client_is_midi2(dest) &&
-		    type == UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE)
+		bool is_midi2 = snd_seq_client_is_midi2(dest) &&
+			!dest_port->is_midi1;
+
+		if (is_midi2 && type == UMP_MSG_TYPE_MIDI1_CHANNEL_VOICE)
 			return cvt_ump_midi1_to_midi2(dest, dest_port,
 						      event, atomic, hop);
-		else if (!snd_seq_client_is_midi2(dest) &&
-			 type == UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE)
+		else if (!is_midi2 && type == UMP_MSG_TYPE_MIDI2_CHANNEL_VOICE)
 			return cvt_ump_midi2_to_midi1(dest, dest_port,
 						      event, atomic, hop);
 		/* non-EP port and different group is set? */
@@ -1254,7 +1255,7 @@ int snd_seq_deliver_to_ump(struct snd_seq_client *source,
 		return 0; /* group filtered - skip the event */
 	if (event->type == SNDRV_SEQ_EVENT_SYSEX)
 		return cvt_sysex_to_ump(dest, dest_port, event, atomic, hop);
-	else if (snd_seq_client_is_midi2(dest))
+	else if (snd_seq_client_is_midi2(dest) && !dest_port->is_midi1)
 		return cvt_to_ump_midi2(dest, dest_port, event, atomic, hop);
 	else
 		return cvt_to_ump_midi1(dest, dest_port, event, atomic, hop);
diff --git a/sound/core/ump.c b/sound/core/ump.c
index e39e9cda4912..c7c3581bbbbc 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -538,6 +538,7 @@ static void update_group_attrs(struct snd_ump_endpoint *ump)
 		group->active = 0;
 		group->group = i;
 		group->valid = false;
+		group->is_midi1 = false;
 	}
 
 	list_for_each_entry(fb, &ump->block_list, list) {
@@ -548,6 +549,8 @@ static void update_group_attrs(struct snd_ump_endpoint *ump)
 			group->valid = true;
 			if (fb->info.active)
 				group->active = 1;
+			if (fb->info.flags & SNDRV_UMP_BLOCK_IS_MIDI1)
+				group->is_midi1 = true;
 			switch (fb->info.direction) {
 			case SNDRV_UMP_DIR_INPUT:
 				group->dir_bits |= (1 << SNDRV_RAWMIDI_STREAM_INPUT);
@@ -1156,6 +1159,7 @@ static int process_legacy_output(struct snd_ump_endpoint *ump,
 	struct snd_rawmidi_substream *substream;
 	struct ump_cvt_to_ump *ctx;
 	const int dir = SNDRV_RAWMIDI_STREAM_OUTPUT;
+	unsigned int protocol;
 	unsigned char c;
 	int group, size = 0;
 
@@ -1168,9 +1172,13 @@ static int process_legacy_output(struct snd_ump_endpoint *ump,
 		if (!substream)
 			continue;
 		ctx = &ump->out_cvts[group];
+		protocol = ump->info.protocol;
+		if ((protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI2) &&
+		    ump->groups[group].is_midi1)
+			protocol = SNDRV_UMP_EP_INFO_PROTO_MIDI1;
 		while (!ctx->ump_bytes &&
 		       snd_rawmidi_transmit(substream, &c, 1) > 0)
-			snd_ump_convert_to_ump(ctx, group, ump->info.protocol, c);
+			snd_ump_convert_to_ump(ctx, group, protocol, c);
 		if (ctx->ump_bytes && ctx->ump_bytes <= count) {
 			size = ctx->ump_bytes;
 			memcpy(buffer, ctx->ump, size);
-- 
2.43.0

