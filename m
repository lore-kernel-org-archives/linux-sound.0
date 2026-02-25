Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7643D242D76
	for <linux-sound@vger.kernel.org>; Wed, 25 Feb 2026 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009574; cv=none; b=BBpgy6rDclJorps3M4U9QCsH+FLpvt6Ati+uiz3Al/GmzmFFvxtjlxobX1bE/bTOxC7+quU5oMic3UwkdSGz1Si7KplJxksz5ULyQ2C3B9CkDJrnDMSKYlM0WzSvUbdSFkiNPnXs34kzc3PAeWxk6mVAt9YJb3RxH9p4eSUgIY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009574; c=relaxed/simple;
	bh=btn5qr5THU32z0VUqYzowt+PipcMP2XprBPJ2FVWnTY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBPjpAFgMJOo7tFAKZJhfuNa+ogOEuxbAEzIhMdARUmCFvXqJfud4QcaadzIKrLlVRme/FZS3ygEeW9hxHKIGRJVc6NIXCb4rKok1e+DSpUJjI3VA+RhnJfQoL5dOpYpr6BthyxY04jHRpzdxGxJhvyvu1664b7loSHYB+HCPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0HRx0VPO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uy7D7pga; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0HRx0VPO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uy7D7pga; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0HRx0VPO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uy7D7pga";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0HRx0VPO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uy7D7pga"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BA9EF3F706;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpdNiXqiJgZ9CaBu8KuNNPMB1IAfVJ4yrNKvz8zDztg=;
	b=0HRx0VPOxbQz2sf+gtHbfZ35GIxc5SH57aj33JCu6M4n7U2RDSVRwoBmh7+V+dw2v9oID8
	pw/n8WW0QILfCY+VhzpUhiQYssetzuKJ7JrrYO0jSR9VU1njE+kA2G3lK9MaKxGiGYlZI8
	XOVsSlia63ScgeSQmWcfjnyYcsfNt58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpdNiXqiJgZ9CaBu8KuNNPMB1IAfVJ4yrNKvz8zDztg=;
	b=uy7D7pgaFjvR7NAXrpV87NdUxgqwb7qO5dHOueQIfEvSZ8XUYdQsSKK1RRfVmbF1+pbCq1
	FNYE/3JhM69FEFBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0HRx0VPO;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=uy7D7pga
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772009555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpdNiXqiJgZ9CaBu8KuNNPMB1IAfVJ4yrNKvz8zDztg=;
	b=0HRx0VPOxbQz2sf+gtHbfZ35GIxc5SH57aj33JCu6M4n7U2RDSVRwoBmh7+V+dw2v9oID8
	pw/n8WW0QILfCY+VhzpUhiQYssetzuKJ7JrrYO0jSR9VU1njE+kA2G3lK9MaKxGiGYlZI8
	XOVsSlia63ScgeSQmWcfjnyYcsfNt58=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772009555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mpdNiXqiJgZ9CaBu8KuNNPMB1IAfVJ4yrNKvz8zDztg=;
	b=uy7D7pgaFjvR7NAXrpV87NdUxgqwb7qO5dHOueQIfEvSZ8XUYdQsSKK1RRfVmbF1+pbCq1
	FNYE/3JhM69FEFBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 97D713EA69;
	Wed, 25 Feb 2026 08:52:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eK3tI1O4nmlTcgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Feb 2026 08:52:35 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/4] ALSA: usb-audio: Use inclusive terms
Date: Wed, 25 Feb 2026 09:52:31 +0100
Message-ID: <20260225085233.316306-5-tiwai@suse.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225085233.316306-1-tiwai@suse.de>
References: <20260225085233.316306-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BA9EF3F706

Replace the remaining with inclusive terms; it's only this function
name we overlooked at the previous conversion.

Fixes: 53837b4ac2bd ("ALSA: usb-audio: Replace slave/master terms")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 2e70dbc479b4..bf4401aba76c 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -160,8 +160,8 @@ int snd_usb_endpoint_implicit_feedback_sink(struct snd_usb_endpoint *ep)
  * This won't be used for implicit feedback which takes the packet size
  * returned from the sync source
  */
-static int slave_next_packet_size(struct snd_usb_endpoint *ep,
-				  unsigned int avail)
+static int synced_next_packet_size(struct snd_usb_endpoint *ep,
+				   unsigned int avail)
 {
 	unsigned int phase;
 	int ret;
@@ -228,7 +228,7 @@ int snd_usb_endpoint_next_packet_size(struct snd_usb_endpoint *ep,
 	}
 
 	if (ep->sync_source)
-		return slave_next_packet_size(ep, avail);
+		return synced_next_packet_size(ep, avail);
 	else
 		return next_packet_size(ep, avail);
 }
-- 
2.53.0

