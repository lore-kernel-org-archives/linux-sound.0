Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C36647AF66
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030360; cv=none; b=BIgF3WN1LGTMq7GH11vSg7xNP4U/nVqsvdMNjTz/UQ3IzUyG5MD4Q4nv+VekF7YGQyEdvx4YwBclwOApIwbVbT65f0eMpUFqm1Upu1qedVhs1MsLoubIsUJ2UWrA2bVXrHZgKfSGa+SgIUlYQt7s7ieNqw4LFozPciyHERdqaUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030360; c=relaxed/simple;
	bh=vJ795IAA4wSxQ0rLko4jYqlU7jiFIf2JicQIiP+aRUc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwZ5Xr+pDxrGP7Usdb6KsqzMnSFgcS21AHf91KTe72Kim7wz2ZWcVwPvEfXtj2W/c68QmLFWc3pgxhUG9cSWp7rV27cO0nbCM+TrFobOQmzhVrKjI3A1ENZKj2J07ZYloIUoQk61B1JUJMXMHpN+HJRuxDZVnvuU8wyViKQjtWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oXOLZ1RK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TEUpmgbz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w0UTpfYW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ttpyZmKj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oXOLZ1RK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TEUpmgbz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w0UTpfYW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ttpyZmKj"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5A7C23E14;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr5sQS8G2bIC9C3p1Q7GuKVgfl/Sso8t8hE6lS8AJYg=;
	b=oXOLZ1RKW+sZnlQhHzkuETyEzn6e7hAit7WvqAzygxQMdZjj33PcxaOoyaz1tJmvL22MEF
	p//nWSuzwRvYgC6pciz8mRwPUdYLHxb8wQxR6sj1a3EPBnob4n4pYJ2r+RdFw39mVY2y8r
	vpUugMlh7FoT/nAo2R0XCljfy5LYtFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr5sQS8G2bIC9C3p1Q7GuKVgfl/Sso8t8hE6lS8AJYg=;
	b=TEUpmgbz4GTQ9QuCwStAxu00EbvS3UhxumTadAuQcCRunR7IZ6vnIjPkNqDbC3S5TyF1xV
	cSGP/qgwOPUfQoCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w0UTpfYW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ttpyZmKj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr5sQS8G2bIC9C3p1Q7GuKVgfl/Sso8t8hE6lS8AJYg=;
	b=w0UTpfYW5cnpwCPoSc3Cyr2Yy6DrswQjNN4M2VXCHDG0HD+lozL3Klxu3SVkbaQjOAI7fS
	9SuSQhxIywTx4vjOcuWNiqNm6hd680SagktBJIWdd0kNUrMVTb7h9LvKO78YVCWeOMYiwL
	eGgCUzsISIXNqEa7EFBkhGNF4qKHWS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cr5sQS8G2bIC9C3p1Q7GuKVgfl/Sso8t8hE6lS8AJYg=;
	b=ttpyZmKj9hwZINC8qkG79dDfS4Nn5+0nWwVuRJuAgoNdzfAQS5fV84rTePjMg9VDxXQZnH
	LDQGHE4bb3o51MBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 26792779C5;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4M30Bw2pdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 4/6] ALSA: virmidi: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:21 +0200
Message-ID: <20260806153227.1460166-5-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806153227.1460166-1-tiwai@suse.de>
References: <20260806153227.1460166-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.01
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5A7C23E14
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_NONE(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

virmidi driver blindly trusts that the given devptr->id value is
within the proper card index range at probe.  It's OK for the devices
the driver itself creates at the module probe time, but if the device
is bound manually via sysfs interface, this could be -1 as "none", and
this leads to OOB access for index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/virmidi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/virmidi.c b/sound/drivers/virmidi.c
index a204f42d1026..70e16105f1c4 100644
--- a/sound/drivers/virmidi.c
+++ b/sound/drivers/virmidi.c
@@ -75,6 +75,12 @@ static int snd_virmidi_probe(struct platform_device *devptr)
 	int idx, err;
 	int dev = devptr->id;
 
+	if (dev < 0 || dev >= SNDRV_CARDS) {
+		dev_warn(&devptr->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	err = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
 				sizeof(struct snd_card_virmidi), &card);
 	if (err < 0)
-- 
2.55.0

