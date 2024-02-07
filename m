Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634D480028
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707321122; cv=none; b=dOYHZi1rtY1sjOnThpdVRCa2UGnIsAZj+3bzbqzEbVKLl9A6NE0T2ttB7/hsK6oLcuXGZr2EZn5vZu6uUTOFZchR7WLOGTROpUkBUeLb1nWaOPS6//2H1IHBuEtq36Oo/5D5i5QJu5tBl9Bn1c1rMqtYHq0vyDRkaXACOihYPHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707321122; c=relaxed/simple;
	bh=nsJtj8qhVFL+3mtj5ZAonAaccXag+Af7+CVM+BsJ28c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FlQakqq2vAc0EjASi8YQeVuMqpjwSixSLNFzXkI5LqAltEuceDRbzSCEXfxZndnJ9PNhP0p+2msznQj7lPHvbMX4acXDhn0xncVT8xq7oqG51efT8QWGw8AIdAue8QOVhTmUvkfSI8SO71b9CnfLxmACj+z6PihkXBue+k7Nni0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ykBMsk8D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QjTiXAo6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ykBMsk8D; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QjTiXAo6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ykBMsk8D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QjTiXAo6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ykBMsk8D";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QjTiXAo6"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9132522309;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4O/ZYs/He7pfI6AUNXbDMCwWsBjBwN7YH7BvPFY86sk=;
	b=ykBMsk8D6HXVj82O/YFSDLxJJvQ/tYL4m5rSevN1rDyE4b63PXXDj9Q4Mr9ywGOtnepeOo
	qSUuH0yiSuBxxEPogz4XeF+k1EB/bUZhUs4cPklqPdiIN+nXHVKdc1qdywvLPwBKLXOQ1Z
	gdd7hD9Ahv69RRDB8p0Ubdb62c9mo5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4O/ZYs/He7pfI6AUNXbDMCwWsBjBwN7YH7BvPFY86sk=;
	b=QjTiXAo6CELLoOYAqii3wCFar/jl/OCHZ46h/yDEfxV/czuNR0cJdyyU6NQBM/eUsxVNFy
	QW8PRf0zYW99e9Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707321118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4O/ZYs/He7pfI6AUNXbDMCwWsBjBwN7YH7BvPFY86sk=;
	b=ykBMsk8D6HXVj82O/YFSDLxJJvQ/tYL4m5rSevN1rDyE4b63PXXDj9Q4Mr9ywGOtnepeOo
	qSUuH0yiSuBxxEPogz4XeF+k1EB/bUZhUs4cPklqPdiIN+nXHVKdc1qdywvLPwBKLXOQ1Z
	gdd7hD9Ahv69RRDB8p0Ubdb62c9mo5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707321118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4O/ZYs/He7pfI6AUNXbDMCwWsBjBwN7YH7BvPFY86sk=;
	b=QjTiXAo6CELLoOYAqii3wCFar/jl/OCHZ46h/yDEfxV/czuNR0cJdyyU6NQBM/eUsxVNFy
	QW8PRf0zYW99e9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 734FF13A41;
	Wed,  7 Feb 2024 15:51:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sIClGh6nw2UsRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 15:51:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 04/29] ALSA: als300: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  7 Feb 2024 16:51:15 +0100
Message-Id: <20240207155140.18238-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240207155140.18238-1-tiwai@suse.de>
References: <20240207155140.18238-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ykBMsk8D;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QjTiXAo6
X-Spamd-Result: default: False [4.61 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_NONE(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_ONE(0.00)[1];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.08)[63.34%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 4.61
X-Rspamd-Queue-Id: 9132522309
X-Spam-Level: ****
X-Spam-Flag: NO
X-Spamd-Bar: ++++

Use the	new DEFINE_SIMPLE_DEV_PM_OPS() instead of SIMPLE_DEV_PM_OPS()
for code-simplification.  We need no longer CONFIG_PM_SLEEP ifdefs.
Just a cleanup, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/als300.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index c70aff060120..c7c481203ef8 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -654,7 +654,6 @@ static int snd_als300_create(struct snd_card *card,
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int snd_als300_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -677,11 +676,7 @@ static int snd_als300_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(snd_als300_pm, snd_als300_suspend, snd_als300_resume);
-#define SND_ALS300_PM_OPS	&snd_als300_pm
-#else
-#define SND_ALS300_PM_OPS	NULL
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(snd_als300_pm, snd_als300_suspend, snd_als300_resume);
 
 static int snd_als300_probe(struct pci_dev *pci,
                              const struct pci_device_id *pci_id)
@@ -739,7 +734,7 @@ static struct pci_driver als300_driver = {
 	.id_table = snd_als300_ids,
 	.probe = snd_als300_probe,
 	.driver = {
-		.pm = SND_ALS300_PM_OPS,
+		.pm = &snd_als300_pm,
 	},
 };
 
-- 
2.35.3

