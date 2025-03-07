Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870E11E1DE2
	for <linux-sound@vger.kernel.org>; Fri,  7 Mar 2025 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741336981; cv=none; b=TtkG8zaozTjVNbBbCdQunsA5U+aBUkgIh8D0VyREOk/4fRj/ju4xIHoLWWnwFeMq4iTK1hdGiK7/LnwFJSNIwvXU20qsCMSCdkiMzsaz1GjSQlt2qKun7nL8PH8yv50TlGJA6BQBWL/uK0en5KmmOziMeyP+P6TQmvRXOxvhDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741336981; c=relaxed/simple;
	bh=8K78VgVfkfPbzUrkbnJDLzi9mNz6dq3DMt03stZU3K0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAJTup/K2NKfAXrXZt2sb7b5v6gNeW8OMXhGXSVEIVXQynlaCEjcMxmw6Dq5oYReXX78sOohA3SCS0i/UAVrtHYF+CuKDYJKU4GyEk65ro8nj+xQgmVBc71vYcTLcjry+WVT31lNOcnpkalUkENJGFuWR1b3dbu2CH9QLCo3Gx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TRgYEAwZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CDgFXvnc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TRgYEAwZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CDgFXvnc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TRgYEAwZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CDgFXvnc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TRgYEAwZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CDgFXvnc"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C05FD1F441;
	Fri,  7 Mar 2025 08:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741336970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAKWhpa1brzHDcmcVdfUD1MD5TO/8Xx+eVXxsC8VaWU=;
	b=TRgYEAwZ6YuF5atFIM8gvBvfjGkOhGuZfFyoGZsLaNodMjahvMWUcrpeUqgB1+qDpk0nno
	ZeGGARnNgjHDhANnzMsNbQDeFOvrHzoQunfYNnA7OJH9wgvPR0aOr4fyZ02XsRuW2gID5q
	G2z9mzlfPdTJ36jbFKohevu0OwVvXHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741336970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAKWhpa1brzHDcmcVdfUD1MD5TO/8Xx+eVXxsC8VaWU=;
	b=CDgFXvncHCXtU+GjBez2rnUcjtUYOacBDPc3X7RtYZCukLGV3IY7jzbmeXGk0OF7M/ELbM
	DPld8yzKC+h3psAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TRgYEAwZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CDgFXvnc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741336970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAKWhpa1brzHDcmcVdfUD1MD5TO/8Xx+eVXxsC8VaWU=;
	b=TRgYEAwZ6YuF5atFIM8gvBvfjGkOhGuZfFyoGZsLaNodMjahvMWUcrpeUqgB1+qDpk0nno
	ZeGGARnNgjHDhANnzMsNbQDeFOvrHzoQunfYNnA7OJH9wgvPR0aOr4fyZ02XsRuW2gID5q
	G2z9mzlfPdTJ36jbFKohevu0OwVvXHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741336970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAKWhpa1brzHDcmcVdfUD1MD5TO/8Xx+eVXxsC8VaWU=;
	b=CDgFXvncHCXtU+GjBez2rnUcjtUYOacBDPc3X7RtYZCukLGV3IY7jzbmeXGk0OF7M/ELbM
	DPld8yzKC+h3psAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A895713A53;
	Fri,  7 Mar 2025 08:42:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cNHrJ4qxymfhOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 07 Mar 2025 08:42:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: seq: Avoid client data changes during proc reads
Date: Fri,  7 Mar 2025 09:42:43 +0100
Message-ID: <20250307084246.29271-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250307084246.29271-1-tiwai@suse.de>
References: <20250307084246.29271-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C05FD1F441
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

The proc read of each client should protect against the concurrent
data changes to keep the data consistent; although they are supposed
to be safe and won't crash things, it doesn't guarantee the
consistency between the read values.  Take client->ioctl_mutex for
protecting against the concurrent changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/seq_clientmgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index 659494e00c51..fe7cd0649c98 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -2706,6 +2706,7 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 			continue;
 		}
 
+		mutex_lock(&client->ioctl_mutex);
 		snd_iprintf(buffer, "Client %3d : \"%s\" [%s %s]\n",
 			    c, client->name,
 			    client->type == USER_CLIENT ? "User" : "Kernel",
@@ -2723,6 +2724,7 @@ void snd_seq_info_clients_read(struct snd_info_entry *entry,
 			snd_iprintf(buffer, "  Input pool :\n");
 			snd_seq_info_pool(buffer, client->data.user.fifo->pool, "    ");
 		}
+		mutex_unlock(&client->ioctl_mutex);
 		snd_seq_client_unlock(client);
 	}
 }
-- 
2.43.0

