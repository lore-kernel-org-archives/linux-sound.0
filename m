Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAAB16A361
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 09:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975902; cv=none; b=pG9D1vtoiiX1QCZhILTI4gTrtHYz+IsQy4BEAjcG7u5EqfYHTMBZThk5MPq6iW6JE59V0JCqzW7UVvcH8u1CeqriogK6yxcWO1RIT2tLwntDunzKNihtxeuzXm9zgSs6mPNwKqNbbqjx20baV4uYVfZX+dPUzLHbxxSPg7r7LJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975902; c=relaxed/simple;
	bh=rzE/JUvZgE/VOhyxknjxM5+AicQ21BJ+1lBHmKB2KDo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTnNED8mw5xxP/tBzqRQtlPt+MHRESSXbbqOIDHkM7hmrGZGMjJMhv7eQJvvb8MnxfKb5VClcumneb/nZ5i0UxpYvi13Z7JvfJBQ5kddispbiksde7OvTdOozdO9YERzYVWb49Ml0wgvPCeXl+gcvhgpXSvMnx39D9pJVJ+ZLnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hLxUy1to; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=18cRwZqI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hLxUy1to; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=18cRwZqI; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hLxUy1to";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="18cRwZqI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hLxUy1to";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="18cRwZqI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 633ED22C47;
	Wed, 29 May 2024 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716975898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6j75WY8ydjJGdcnstn991c5NEP+bpyxv+aOuJHZL4k=;
	b=hLxUy1toB6rpps2EIPPVktVltNPA3IqovYPVe9RGuqsIx3bb0E1BaR13FrT8F7EHfARvn5
	wBxJSM9LMQkP8PjS31y4oPUS3OTZ1R+bYv3riuj1eXsLccykcMGb+fVmX5g4J+ZfeH3XVA
	ZfnWFR4UYWcvNuNE8kuSOpydsk2RCiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716975898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6j75WY8ydjJGdcnstn991c5NEP+bpyxv+aOuJHZL4k=;
	b=18cRwZqI/YmKkhG2Zs5E5TCAy2qfwzeWq/9z98xg9e06TQSkiRFFFEAuoT/3WOOhAHGmYT
	cQcGi277gQ6akzBw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hLxUy1to;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=18cRwZqI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1716975898; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6j75WY8ydjJGdcnstn991c5NEP+bpyxv+aOuJHZL4k=;
	b=hLxUy1toB6rpps2EIPPVktVltNPA3IqovYPVe9RGuqsIx3bb0E1BaR13FrT8F7EHfARvn5
	wBxJSM9LMQkP8PjS31y4oPUS3OTZ1R+bYv3riuj1eXsLccykcMGb+fVmX5g4J+ZfeH3XVA
	ZfnWFR4UYWcvNuNE8kuSOpydsk2RCiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1716975898;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6j75WY8ydjJGdcnstn991c5NEP+bpyxv+aOuJHZL4k=;
	b=18cRwZqI/YmKkhG2Zs5E5TCAy2qfwzeWq/9z98xg9e06TQSkiRFFFEAuoT/3WOOhAHGmYT
	cQcGi277gQ6akzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4602513A87;
	Wed, 29 May 2024 09:44:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id UGUDEBr5VmbffwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 May 2024 09:44:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: ump: Set default protocol when not given explicitly
Date: Wed, 29 May 2024 11:45:11 +0200
Message-ID: <20240529094515.12666-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240529094515.12666-1-tiwai@suse.de>
References: <20240529094515.12666-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.98
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 633ED22C47
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.98 / 50.00];
	BAYES_HAM(-2.97)[99.86%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

When an inquiry of the current protocol via UMP Stream Configuration
message fails by some reason, we may leave the current protocol
undefined, which may lead to unexpected behavior.  Better to assume a
valid protocol found in the protocol capability bits instead.

For a device that doesn't support the UMP v1.2 feature, it won't reach
to this code path, and USB MIDI GTB descriptor would be used for
determining the protocol, instead.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index 5bd7b77acb95..fb612559f8f0 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -966,6 +966,14 @@ int snd_ump_parse_endpoint(struct snd_ump_endpoint *ump)
 	if (err < 0)
 		ump_dbg(ump, "Unable to get UMP EP stream config\n");
 
+	/* If no protocol is set by some reason, assume the valid one */
+	if (!(ump->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK)) {
+		if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+			ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI2;
+		else if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI1)
+			ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI1;
+	}
+
 	/* Query and create blocks from Function Blocks */
 	for (blk = 0; blk < ump->info.num_blocks; blk++) {
 		err = create_block_from_fb_info(ump, blk);
-- 
2.43.0

