Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572991EA0BD
	for <linux-sound@vger.kernel.org>; Wed,  7 Aug 2024 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037664; cv=none; b=kbGvb/nPIqTCw5Ql9id9B2UfH9SiTXUSxcWaIzjCnLT6MyieLRgtcY3OViej4wIIXmgvR30bceEoquV+rzNIYVorVtmqZvtKlMbz+P+vUqI4NMTGAhALoe+cgPrxH8n3RTHGFcfSbfNQ6vmx5XT/qiqARlbAcpfRwehRSa3vMeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037664; c=relaxed/simple;
	bh=jDLnbl6eGiWliWZ2rMZ1M09gDIB3NpINiTySbW9TmlQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7aqPiWRqiqzCJR/3H1TXQdyjn5MV8FWDfhDXs9AdG7cDj6sJfoNYBbWZ8ckSS+1t0kC9O3Gnqh6CKROsU+WebA9akMZ9OKc8ghoueiJsGZOdPpiq+j+is5H37Z8tD549jQOBFc7WKacfQy2WDrKYwJV+9wami888hBDLTXqhEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EPmEXv+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+KluprQ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EPmEXv+/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=M+KluprQ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EPmEXv+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+KluprQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EPmEXv+/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="M+KluprQ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D7F0C21D1F;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HjHSHH38oGZ2YkYvTxgcSCYRgEtXHLWPY339hQyGUg=;
	b=EPmEXv+/eum0eoH4ukK8YeMHgzU/ujBWyzyikXHOJPQJYh+YJ0csDf3g+Dhghi9SOGqXaw
	mXXHTx5FLIG+wBgebUucVOtCe/oSvLt1QL5qTZCuLh3sn1wul+4PbOdZf+CHDhFpowfYLp
	lBOcGTtn64L7RiB4/AppAbcMGy9NAhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HjHSHH38oGZ2YkYvTxgcSCYRgEtXHLWPY339hQyGUg=;
	b=M+KluprQMaqxC6te0CTQvoMISjoBdMRBKL1Ws8rMX/Qzk7p/C+pztWj0eMDqoJwsbaoDbF
	SScofG+8/Acm+HBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="EPmEXv+/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=M+KluprQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1723037658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HjHSHH38oGZ2YkYvTxgcSCYRgEtXHLWPY339hQyGUg=;
	b=EPmEXv+/eum0eoH4ukK8YeMHgzU/ujBWyzyikXHOJPQJYh+YJ0csDf3g+Dhghi9SOGqXaw
	mXXHTx5FLIG+wBgebUucVOtCe/oSvLt1QL5qTZCuLh3sn1wul+4PbOdZf+CHDhFpowfYLp
	lBOcGTtn64L7RiB4/AppAbcMGy9NAhg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1723037658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3HjHSHH38oGZ2YkYvTxgcSCYRgEtXHLWPY339hQyGUg=;
	b=M+KluprQMaqxC6te0CTQvoMISjoBdMRBKL1Ws8rMX/Qzk7p/C+pztWj0eMDqoJwsbaoDbF
	SScofG+8/Acm+HBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C119A13B03;
	Wed,  7 Aug 2024 13:34:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KOAFLtp3s2ZpVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Aug 2024 13:34:18 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 16/54] ALSA: i2c: pt2258: Use standard print API
Date: Wed,  7 Aug 2024 15:34:06 +0200
Message-ID: <20240807133452.9424-17-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240807133452.9424-1-tiwai@suse.de>
References: <20240807133452.9424-1-tiwai@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
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
X-Rspamd-Queue-Id: D7F0C21D1F
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01

Use the standard print API with dev_*() instead of the old house-baked
one.  It gives better information and allows dynamically control of
debug prints.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/i2c/other/pt2258.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/i2c/other/pt2258.c b/sound/i2c/other/pt2258.c
index c913f223892a..ba38c285241c 100644
--- a/sound/i2c/other/pt2258.c
+++ b/sound/i2c/other/pt2258.c
@@ -63,7 +63,7 @@ int snd_pt2258_reset(struct snd_pt2258 *pt)
 
       __error:
 	snd_i2c_unlock(pt->i2c_bus);
-	snd_printk(KERN_ERR "PT2258 reset failed\n");
+	dev_err(pt->card->dev, "PT2258 reset failed\n");
 	return -EIO;
 }
 
@@ -124,7 +124,7 @@ static int pt2258_stereo_volume_put(struct snd_kcontrol *kcontrol,
 
       __error:
 	snd_i2c_unlock(pt->i2c_bus);
-	snd_printk(KERN_ERR "PT2258 access failed\n");
+	dev_err(pt->card->dev, "PT2258 access failed\n");
 	return -EIO;
 }
 
@@ -161,7 +161,7 @@ static int pt2258_switch_put(struct snd_kcontrol *kcontrol,
 
       __error:
 	snd_i2c_unlock(pt->i2c_bus);
-	snd_printk(KERN_ERR "PT2258 access failed 2\n");
+	dev_err(pt->card->dev, "PT2258 access failed 2\n");
 	return -EIO;
 }
 
-- 
2.43.0

