Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23D2473C67
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030361; cv=none; b=pHnwEnxFJtJrJzd/jgUhqAN4Av/71LV40GraSdI/rzLZ6HcqUS7ubtI1GQoGQdBB30z8dTnsNJWAylcohmaYVSXKRHIcO+ORN47L/FyAQ1BzRSUoe8jK6uVFjr4GNwAL+k/jExUB8H0hzCuq/itqmkq6yAiObOhTbe6VTDw+rOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030361; c=relaxed/simple;
	bh=XuZv4ecXu8aGsTpdzheBNdZ+/gLpyWyrQ4lU0oeTa3E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXd1YrSX+an2+7/XAxhp6mDwG+xs4iNT7ayNCRLejuXNdVX/rBDAM19Xq1KuuJw3rZ7lfQlvZOEQ7VXG8PcuKxC8yxg0FA8wr46m/ddxfpiO+RGSgd+pWpxt9sAy4tX+ccOT0u2t2IYyi370h3MJVQZK7GzLuGawPptdljMz8OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HKprBvz8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P7oUIE4o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vb2NnIEF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KU6cehRa; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HKprBvz8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P7oUIE4o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vb2NnIEF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KU6cehRa"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D5E59800C6;
	Thu,  6 Aug 2026 15:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbJHAzY9yniFE0ov0+YT3Ii0mfaY/u/fPese2CEcbPA=;
	b=HKprBvz8u5Mgut+SmWVGtvwpvt19Dw8u6aNIimKFwXbgyOER2SF3SbnGNym4Vg0MraJpq1
	Sj0PtHILHZjR60qHOBiGO87mDGR0FYxAg0oKk2wLfGgo7iwK8sZ0OCo/PkBuFVj2+I+ZcY
	kgaSb9uKB+XPR3zZkBtnogR51Qh03Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbJHAzY9yniFE0ov0+YT3Ii0mfaY/u/fPese2CEcbPA=;
	b=P7oUIE4omhpm1OUMRFV09K+hUeVC7kItjrxRlsm6fE76Ezo9aQ+y0I1mShK2JUNMJu5pcU
	4pGTmeYNZAqR6AAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vb2NnIEF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KU6cehRa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbJHAzY9yniFE0ov0+YT3Ii0mfaY/u/fPese2CEcbPA=;
	b=vb2NnIEFUAGMglpGkLfpHfRDR5xbuqz/U75VZ1OKuypSXXYhtjfxt7NOYbrn3+apiLMe6p
	bacoTXRRroJOTx55BbLE84nRjRFn3uXlPOa0G6HARvrs2BV+72JQWLWCLdMi6TMPs+aRek
	g23WJCcHAysBLFmEV3Tglx2H43MikMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EbJHAzY9yniFE0ov0+YT3Ii0mfaY/u/fPese2CEcbPA=;
	b=KU6cehRavBnPiTGSSKtV6LOr3/HnmUueglhtF4pPdlpOc486NsqIou+CxXvTw6AqkfM25k
	H5ywNKHQsj/r4RBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3582779BF;
	Thu,  6 Aug 2026 15:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8ISIKgypdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:28 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 1/6] ALSA: aloop: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:18 +0200
Message-ID: <20260806153227.1460166-2-tiwai@suse.de>
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
X-Rspamd-Queue-Id: D5E59800C6
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

aloop driver blindly trusts that the given devptr->id value is within
the proper card index range at probe.  It's OK for the devices the
driver itself creates at the module probe time, but if the device is
bound manually via sysfs interface, this could be -1 as "none", and
this leads to OOB access for index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index d520d83c2577..92ef821ddbeb 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1914,6 +1914,12 @@ static int loopback_probe(struct platform_device *devptr)
 	int dev = devptr->id;
 	int err;
 
+	if (dev < 0 || dev >= SNDRV_CARDS) {
+		dev_warn(&devptr->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	err = snd_devm_card_new(&devptr->dev, index[dev], id[dev], THIS_MODULE,
 				sizeof(struct loopback), &card);
 	if (err < 0)
-- 
2.55.0

