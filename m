Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5916C9463
	for <linux-sound@vger.kernel.org>; Thu, 28 Nov 2024 17:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732813469; cv=none; b=pZ5dmtclDB8SP/GpXnK3dT3o+mQDKsNOcdWQSiD4YqReIdrLTzR6cBMMj+pSII9lz4nrAd3gAw0JGWYckRT0/ssdh3Q53Ruy57WfDgCUFNZXQlstqxWlyh/5HbK1RCJ3wbVAo9wSqpykaEFmW8pLByATZmULOXxaCDTSbZOviFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732813469; c=relaxed/simple;
	bh=AXvgM5t6cwbs1QrH/jHvgT9/5DrsmYib5rXZS56HR7I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=rTACFYGMT9XsGPStcXBSusmczppuLJmQzRNKIvoMl6yWjzmWfz6yRlsRPTyehT5KIzFBtLCvy5PBiRrLjNNLhMeGXUsapxhDFYElWgHs0jOEausf5QuNaVox6+tZZBHwuODqwgXtWgeQs+WmNkjORvuLKec/FwwHvSFN6IxvrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FnkeuKaD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fWk0Lx0D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FnkeuKaD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fWk0Lx0D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FnkeuKaD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fWk0Lx0D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FnkeuKaD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fWk0Lx0D"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6A2C41F441;
	Thu, 28 Nov 2024 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732813465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fVUslh5PwAe9xHSv2y1D2i/+4wBDM2Vwqhz+Ga0yGjw=;
	b=FnkeuKaDhVZRin9g7mmm3QlTLonr01/KnQ3G0gMK8Qk8mx8dkmPvgL4qmOWPGGMkdw7bek
	YpLHgoe/WbjKzYcKEmsLxKGPoBlhno9LutMwjW47+CYqQ6vTjG+8lr+wnLfHMpklFxnyGE
	kZiZtgyFYUhvDehdWHmRWGiwD8083kE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732813465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fVUslh5PwAe9xHSv2y1D2i/+4wBDM2Vwqhz+Ga0yGjw=;
	b=fWk0Lx0DQN0X3G8pIVLZyGSmfXWxhL5PCxAj6K3hfE42efPvTCyz4paTW5VJmK+iqHlaIO
	J2KJrwxAuC99dvAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FnkeuKaD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fWk0Lx0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732813465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fVUslh5PwAe9xHSv2y1D2i/+4wBDM2Vwqhz+Ga0yGjw=;
	b=FnkeuKaDhVZRin9g7mmm3QlTLonr01/KnQ3G0gMK8Qk8mx8dkmPvgL4qmOWPGGMkdw7bek
	YpLHgoe/WbjKzYcKEmsLxKGPoBlhno9LutMwjW47+CYqQ6vTjG+8lr+wnLfHMpklFxnyGE
	kZiZtgyFYUhvDehdWHmRWGiwD8083kE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732813465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=fVUslh5PwAe9xHSv2y1D2i/+4wBDM2Vwqhz+Ga0yGjw=;
	b=fWk0Lx0DQN0X3G8pIVLZyGSmfXWxhL5PCxAj6K3hfE42efPvTCyz4paTW5VJmK+iqHlaIO
	J2KJrwxAuC99dvAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CB7713690;
	Thu, 28 Nov 2024 17:04:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gsp8EJmiSGcCSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 28 Nov 2024 17:04:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: seq: ump: Fix seq port updates per FB info notify
Date: Thu, 28 Nov 2024 18:04:22 +0100
Message-ID: <20241128170423.23351-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6A2C41F441
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

update_port_infos() is called when a UMP FB Info update notification
is received, and this function is supposed to update the attributes of
the corresponding sequencer port.  However, the function had a few
issues and it brought to the incorrect states.  Namely:

- It tried to get a wrong sequencer info for the update without
  correcting the port number with the group-offset 1
- The loop exited immediately when a sequencer port isn't present;
  this ended up with the truncation if a sequencer port in the middle
  goes away

This patch addresses those bugs.

Fixes: 4a16a3af0571 ("ALSA: seq: ump: Handle FB info update")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_ump_client.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/core/seq/seq_ump_client.c b/sound/core/seq/seq_ump_client.c
index e5d3f4d206bf..e956f17f3792 100644
--- a/sound/core/seq/seq_ump_client.c
+++ b/sound/core/seq/seq_ump_client.c
@@ -257,12 +257,12 @@ static void update_port_infos(struct seq_ump_client *client)
 			continue;
 
 		old->addr.client = client->seq_client;
-		old->addr.port = i;
+		old->addr.port = ump_group_to_seq_port(i);
 		err = snd_seq_kernel_client_ctl(client->seq_client,
 						SNDRV_SEQ_IOCTL_GET_PORT_INFO,
 						old);
 		if (err < 0)
-			return;
+			continue;
 		fill_port_info(new, client, &client->ump->groups[i]);
 		if (old->capability == new->capability &&
 		    !strcmp(old->name, new->name))
@@ -271,7 +271,7 @@ static void update_port_infos(struct seq_ump_client *client)
 						SNDRV_SEQ_IOCTL_SET_PORT_INFO,
 						new);
 		if (err < 0)
-			return;
+			continue;
 		/* notify to system port */
 		snd_seq_system_client_ev_port_change(client->seq_client, i);
 	}
-- 
2.43.0

