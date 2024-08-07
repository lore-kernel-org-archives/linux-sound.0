Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C2F1CB32E
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022556; cv=none; b=Go0KE/efq5YMYHVO95RHC27juTXDTyqefnunxFaMeWBLkpXOSgoBSo0AFjLB/mFfymciPBc00xIpqWf8OPG2UsWN/Bt3BqW0XG+yqtU/mbuc28fK+vbu7t7Gswj2Llj2mYNCSv77C0fVgKvQEEZdJZEcOrzPzsIY/hZpp/EOdNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022556; c=relaxed/simple;
	bh=aS3/yB9v9uoY4qCAruAXiTkABcm7q5ALKRfXDXbsVaE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OetkVUlZ4VOPCWJ4l5A8T+HzPQ0WEWDwL7asfnL/qH+ZcEZ0Cq53I6eTlTWABmG9YTL/14DVsJft3ZRxoWuNZb1D2/skHEgO5546xhzDAlFgv8tw75/DfAiwjkTyTYLRJDKrAOXvAP2dK28zyQqnh6d4f1LVk6h3nZ1raLNPWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kT1QfNKi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GHQRi+RH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WEh6DeF9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kx5KPZbU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kT1QfNKi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GHQRi+RH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WEh6DeF9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kx5KPZbU"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F24711F7E5;
	Wed,  7 Aug 2024 09:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0eoPUyUsp2BG3zonGffIZLQOZGMryxqP0XXISZ4wTY=;
	b=kT1QfNKi45ZuV3Xsf/sorRSh7USV8rkTISkzQa0MAMprvNL2Q4I6RwIcR3YkKQMhhlil32
	ks9+ZffelYJ/WerKXrWufFyjtPZlY11fuTSGqOeqZlE6iUGTgmmHCYQHkjMIXB1TLSaiMT
	pJjiEFLGOOfM8CFhc4lulagF81zv+hU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0eoPUyUsp2BG3zonGffIZLQOZGMryxqP0XXISZ4wTY=;
	b=GHQRi+RHWYtnwNQmjHTe40uK0t8549oNGgn/1CBebb6nsfb1a+8qRtxnKS6qqRtAJmEmzh
	9Elp1Nyzf7IrZzCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WEh6DeF9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Kx5KPZbU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0eoPUyUsp2BG3zonGffIZLQOZGMryxqP0XXISZ4wTY=;
	b=WEh6DeF9u0VgeyEC5EHbK9gMTNKdaZGc/e4OLNZAGRNXNIjWguvgB744+UINQEvNmic3OO
	7Cz9JXPnS7GgUC5tSV6u3sFsQUt/L0ZHN/8dZsj2/BqO37Bf9mM36thxQcf03/2qqMqtpk
	oIpUaODZBiJpLVB60hRWRY0PDeJmrE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0eoPUyUsp2BG3zonGffIZLQOZGMryxqP0XXISZ4wTY=;
	b=Kx5KPZbU9etzmADhgMyz3Hjj7PWBm2Jrn5rVF7rBycCUepJ+VavfyqOcCk923+D1JREzBH
	ynz3fB30FC8e4wAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D5B8A13B03;
	Wed,  7 Aug 2024 09:22:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QAQLM9I8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:26 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/6] ALSA: ump: Choose the protocol when protocol caps are changed
Date: Wed,  7 Aug 2024 11:22:56 +0200
Message-ID: <20240807092303.1935-2-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
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
X-Rspamd-Queue-Id: F24711F7E5
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

When the protocol capability bits are changed via Endpoint Info update
notification, we should check the validity of the current protocol and
reset it if needed, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/ump.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/core/ump.c b/sound/core/ump.c
index c7c3581bbbbc..4502de891adf 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -657,6 +657,17 @@ static int ump_append_string(struct snd_ump_endpoint *ump, char *dest,
 		format == UMP_STREAM_MSG_FORMAT_END);
 }
 
+/* Choose the default protocol */
+static void choose_default_protocol(struct snd_ump_endpoint *ump)
+{
+	if (ump->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK)
+		return;
+	if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI2)
+		ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI2;
+	else
+		ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI1;
+}
+
 /* handle EP info stream message; update the UMP attributes */
 static int ump_handle_ep_info_msg(struct snd_ump_endpoint *ump,
 				  const union snd_ump_stream_msg *buf)
@@ -678,6 +689,10 @@ static int ump_handle_ep_info_msg(struct snd_ump_endpoint *ump,
 
 	ump_dbg(ump, "EP info: version=%x, num_blocks=%x, proto_caps=%x\n",
 		ump->info.version, ump->info.num_blocks, ump->info.protocol_caps);
+
+	ump->info.protocol &= ump->info.protocol_caps;
+	choose_default_protocol(ump);
+
 	return 1; /* finished */
 }
 
@@ -1040,12 +1055,7 @@ int snd_ump_parse_endpoint(struct snd_ump_endpoint *ump)
 		ump_dbg(ump, "Unable to get UMP EP stream config\n");
 
 	/* If no protocol is set by some reason, assume the valid one */
-	if (!(ump->info.protocol & SNDRV_UMP_EP_INFO_PROTO_MIDI_MASK)) {
-		if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI2)
-			ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI2;
-		else if (ump->info.protocol_caps & SNDRV_UMP_EP_INFO_PROTO_MIDI1)
-			ump->info.protocol |= SNDRV_UMP_EP_INFO_PROTO_MIDI1;
-	}
+	choose_default_protocol(ump);
 
 	/* Query and create blocks from Function Blocks */
 	for (blk = 0; blk < ump->info.num_blocks; blk++) {
-- 
2.43.0

