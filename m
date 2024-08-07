Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A0E1CCB32
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723022550; cv=none; b=fK76b0LEdXdm2jndjHfEzclK36wp94qzdF5Ge+t5RxmUTFtquRbKbqkybOtA/A0eTQCRjHwwGoKyKMODg6D9AYHcpRnNKBJRD9zxKsvh3FVlVZUBO9rDp6Sc54Qo331ifCrUwWgZ6s2sLWP0mB7fRIrlQTxFZ6NbySUkeShhBQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723022550; c=relaxed/simple;
	bh=vyE8aBP3FwiuN5A0MIChThEC720SOhXhBptgeAFMneQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBiPKQH/rbwrcqaic0ZSF74yQszKv5EMwxMWeNxQ3N9n940XzSUxYNyrVu4LyHmpslSzYIh7K4aD8hvML6F+e2a7w23LKyrSTMchScrGM/bfQHZf0IlhZHFl2x+HSIFQ3Fn3d4OAAfanHfDWOE8dOXyWtRRZx8/OoJ4DQcKIv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z5Cds+rE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/K/6Jc6t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z5Cds+rE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/K/6Jc6t; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z5Cds+rE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/K/6Jc6t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z5Cds+rE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/K/6Jc6t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71B3221B53;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuUC15iNxy0UJv9lS45Qheg7dGkio267cZXgDI0aZBY=;
	b=Z5Cds+rEmuWszEeDvCAB/ah3ilEw4WqHXoDOaRc1Z89MuzpR9BZ6gafGKxeLQi/u0+uClT
	Mk+pPWgZ/vpAxoS9uZLAewDfE/5rOqNzhN9i8g5o/VTN07rVPkQj7a5GI6PGZvaN1+H9/n
	oW3mbkcUKMqzWoEe4TRCBBiHZ7eifOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuUC15iNxy0UJv9lS45Qheg7dGkio267cZXgDI0aZBY=;
	b=/K/6Jc6t/A+JWR+PyOzrdLcxsLt6/dKhz7n6dN5dKPLnZNxYIYJgKpzmdst+BqqJnwATov
	J5yJyGkbDoTK7uCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723022547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuUC15iNxy0UJv9lS45Qheg7dGkio267cZXgDI0aZBY=;
	b=Z5Cds+rEmuWszEeDvCAB/ah3ilEw4WqHXoDOaRc1Z89MuzpR9BZ6gafGKxeLQi/u0+uClT
	Mk+pPWgZ/vpAxoS9uZLAewDfE/5rOqNzhN9i8g5o/VTN07rVPkQj7a5GI6PGZvaN1+H9/n
	oW3mbkcUKMqzWoEe4TRCBBiHZ7eifOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723022547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zuUC15iNxy0UJv9lS45Qheg7dGkio267cZXgDI0aZBY=;
	b=/K/6Jc6t/A+JWR+PyOzrdLcxsLt6/dKhz7n6dN5dKPLnZNxYIYJgKpzmdst+BqqJnwATov
	J5yJyGkbDoTK7uCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5985813B03;
	Wed,  7 Aug 2024 09:22:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QOe0FNM8s2ZxCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 09:22:27 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 5/6] ALSA: seq: Print MIDI 1.0 specific port in proc output
Date: Wed,  7 Aug 2024 11:23:00 +0200
Message-ID: <20240807092303.1935-6-tiwai@suse.de>
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
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.990];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.80
X-Spam-Flag: NO
X-Spam-Level: 

When a sequencer port assigned to a UMP Group that is specific to MIDI
1.0 among MIDI 2.0 client, mark it explicitly in the proc output, so
that user can see it easily.  This is an exceptional case where the
message isn't converted to MIDI 1.0 even if the client is running in
MIDI 2.0 mode.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 8c4ee5066afe..276b5b3f68dc 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2633,13 +2633,18 @@ static void snd_seq_info_dump_ports(struct snd_info_buffer *buffer,
 	list_for_each_entry(p, &client->ports_list_head, list) {
 		if (p->capability & SNDRV_SEQ_PORT_CAP_INACTIVE)
 			continue;
-		snd_iprintf(buffer, "  Port %3d : \"%s\" (%c%c%c%c) [%s]\n",
+		snd_iprintf(buffer, "  Port %3d : \"%s\" (%c%c%c%c) [%s]",
 			    p->addr.port, p->name,
 			    FLAG_PERM_RD(p->capability),
 			    FLAG_PERM_WR(p->capability),
 			    FLAG_PERM_EX(p->capability),
 			    FLAG_PERM_DUPLEX(p->capability),
 			    port_direction_name(p->direction));
+#if IS_ENABLED(CONFIG_SND_SEQ_UMP)
+		if (snd_seq_client_is_midi2(client) && p->is_midi1)
+			snd_iprintf(buffer, " [MIDI1]");
+#endif
+		snd_iprintf(buffer, "\n");
 		snd_seq_info_dump_subscribers(buffer, &p->c_src, 1, "    Connecting To: ");
 		snd_seq_info_dump_subscribers(buffer, &p->c_dest, 0, "    Connected From: ");
 	}
-- 
2.43.0

