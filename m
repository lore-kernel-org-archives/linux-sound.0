Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413FF47ACF4
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030360; cv=none; b=F7+u1jNVosLKS7T5+g2rEc0Grzl8nLu29ZbY8mlukmDYQFJ2OmE3ymJ8lPA7BDKO5dsmZlAtdeMAVjxyVKvTe6f+rS2idbU0SY0+eB4GAJ67NiKWSZYfCeol5YduIoLJkgakd/jA746xVfdzj+Fvn2k6BW6gU/jyeJX8rMVCv9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030360; c=relaxed/simple;
	bh=2OxgjxAXcSyVQVO5tZ6TxUQIm9yCqPF83PMZm+Oae8o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ID9SELz3aqPA8ysqCxfV7jw/BxW4vLl4FGhsBzbPkeyILA1eURVbd6BiUowXqAaEZWUlXnIcugzdH4iAy+pKFyaAn10ppMmu6mwMm26cQk51hOXOEnNVHdK6S5XbJcIsWw+TsIh+MjYn1O0hWLNTbQ+NwdoyIovDxeLiuk+BWJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1zAJUa0o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HPHlQ6+G; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DCPqGjc7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m7TwfNjD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1zAJUa0o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HPHlQ6+G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DCPqGjc7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m7TwfNjD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 23E2C3E12;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpGACdrSlTKxM3RRsZyvnwq6MUjvDUVMYfAjsRQzuk8=;
	b=1zAJUa0oZr73U4oKO7qdITY67ZvfA9bdf/J6QbCs+hx3OEAvDtOlgnlaYyh/WBsgJvzJDm
	qNuORqzr/wi+ffwuDVIZbSShMfKMniaenVpC8lBwzVaSgF4kjs25xC9ExYxWz5qOiVKFzy
	w2PdeT9+evkb0ZMN3DVSbV3yA1hcGtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpGACdrSlTKxM3RRsZyvnwq6MUjvDUVMYfAjsRQzuk8=;
	b=HPHlQ6+Gr2owRu7fgsO95BRYZmloFTSKwEQZktGmRx0fvVn0d664m0odccf6kMIRf0NKid
	Y6GH2/LIaO1OI/CA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpGACdrSlTKxM3RRsZyvnwq6MUjvDUVMYfAjsRQzuk8=;
	b=DCPqGjc7rZSL7EcweZZyKVfiRM46Y0c7l1Ldre1oKovVupbqnFxlv4+FWxq22J0WP3vFsg
	cssfsOoJGwmZLhMGXabglR5PiKItnNWT6JKkNIUHjIyuX7mz4svggSV4Ip55iEVUXKMHZw
	lq4/xDQl6A8eH/YOC/sqB71eTOOr0Wk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpGACdrSlTKxM3RRsZyvnwq6MUjvDUVMYfAjsRQzuk8=;
	b=m7TwfNjDfictMOfeSQU6KWVYEDcmtSPuuEsulRLUOpDYNJVqB11xat5m2nQK5bRx99W6pp
	VlclYIPJM5j0QIAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05EDC779C3;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2D8uAA2pdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 3/6] ALSA: serial-u16550: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:20 +0200
Message-ID: <20260806153227.1460166-4-tiwai@suse.de>
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
X-Spam-Score: -2.80
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-0.999];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]

serial-u16550 driver blindly trusts that the given devptr->id value is
within the proper card index range at probe.  It's OK for the devices
the driver itself creates at the module probe time, but if the device
is bound manually via sysfs interface, this could be -1 as "none", and
this leads to OOB access for index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/serial-u16550.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/serial-u16550.c b/sound/drivers/serial-u16550.c
index 3c28961091b1..cc9c325df910 100644
--- a/sound/drivers/serial-u16550.c
+++ b/sound/drivers/serial-u16550.c
@@ -846,6 +846,12 @@ static int snd_serial_probe(struct platform_device *devptr)
 	int err;
 	int dev = devptr->id;
 
+	if (dev < 0 || dev >= SNDRV_CARDS) {
+		dev_warn(&devptr->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	switch (adaptor[dev]) {
 	case SNDRV_SERIAL_SOUNDCANVAS:
 		ins[dev] = 1;
-- 
2.55.0

