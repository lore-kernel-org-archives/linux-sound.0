Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACD03C8C43
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030368; cv=none; b=afb2Jeg955BWFpuW5uv42uXVnJjTdpyepR4Ir3jTmNR9XsgopZBaGVaMEbLla76fiXk+mm1e3bHiiANZYzI5LjZPyij/XCfGVjk0dKTtZTRlYWoXLEefQQ2uomkfAT1SYw855L9jBS9gOuDTipcC4PXikDG8KIARuxPcJ0W1fMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030368; c=relaxed/simple;
	bh=ikiu3BkyKpzXSqjgcdamDQbEph0r12awAWaF43uXWa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJJA3148ECSx6eD8yjWUP88DQfMoNwyFfKf9QKZcz1KgZ49Wj7YtjsKNFDE0xaetUu3L3XJa8L9ETany9GP8IuuKdtTnfmGbVAXv4NkU5KmfwGc4/ZkNMVwHeNuflqFlOqO4v3oZm40Pzn1CYQmimDT6DQhJjdjGulyslMgu9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=wd0P9Cd9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8wILkwWe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h/m58XpL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ff5i0EKo; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wd0P9Cd9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8wILkwWe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h/m58XpL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ff5i0EKo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 07919800BD;
	Thu,  6 Aug 2026 15:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrXZOvjNuPz6AS2s2DV4alicScdT3Nig7cGMyNKGsO0=;
	b=wd0P9Cd9ofLSUeHYz4ZfevJRbgvHG/PXHI6Tvl4F3gGq1WG1tNAl2JXLK1qQ8dfjTM1I5u
	hURTKfUMrn3AgAruzYA/vDqv2aoCXJ6diZKOpsg5lq+jYaT8+XTn/RANgtJwEsrW2k3n6q
	v2erzXsRBucUmnhQXW13ojSCFaZHT74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrXZOvjNuPz6AS2s2DV4alicScdT3Nig7cGMyNKGsO0=;
	b=8wILkwWeB/u5oeSgT/V4DiJx5l0vjlonmTDKpf3BhQyFZyzA+StxPKcwzynRB5cp5s0dbe
	p055M2DOL9Wwv2BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786030357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrXZOvjNuPz6AS2s2DV4alicScdT3Nig7cGMyNKGsO0=;
	b=h/m58XpLwR/aV7LjJf8ue3EMkEsOOJLC4grUhQo/EMJ9jeMB5PCT2+0szpxT/N8baMJaVE
	XE8IaIyj18AvGaBvMljvg2y/Kt23DOR5Xc3KkkAVy8QKLCVttWfbEkfu5Zbkrw0EPe7v70
	7ah12/2JEV1SFkTFuYXgnidl3n4X/EA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786030357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qrXZOvjNuPz6AS2s2DV4alicScdT3Nig7cGMyNKGsO0=;
	b=Ff5i0EKopv3Wb4SqrRZNMdsKRApFjoj/KToWe0FaK49h0HuepU3ZcKLxsANUtAhHSytJkV
	2BtMwDjqQ3voyNBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 87296779D2;
	Thu,  6 Aug 2026 15:32:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wOvhHA2pdGpaFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 15:32:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 6/6] ALSA: portman2x4: Check card index validity at probe
Date: Thu,  6 Aug 2026 17:32:23 +0200
Message-ID: <20260806153227.1460166-7-tiwai@suse.de>
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
	BAYES_HAM(-3.00)[100.00%];
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

Although portman2x4 driver has a check of the given devptr->id value,
it doesn't check for a negative id, which is often given as "none" or
such value when bound via sysfs.  This may lead to OOB access for
index[] and other parameters.

Add a sanity check for the card index and warn/correct it if it's a
value out of the range.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/portman2x4.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/drivers/portman2x4.c b/sound/drivers/portman2x4.c
index dcc0899cfb99..03ed3c3c27fb 100644
--- a/sound/drivers/portman2x4.c
+++ b/sound/drivers/portman2x4.c
@@ -697,6 +697,12 @@ static int snd_portman_probe(struct platform_device *pdev)
 	p = platform_get_drvdata(pdev);
 	platform_set_drvdata(pdev, NULL);
 
+	if (dev < 0) {
+		dev_warn(&pdev->dev,
+			 "Invalid card index %d, using default 0\n", dev);
+		dev = 0;
+	}
+
 	if (dev >= SNDRV_CARDS)
 		return -ENODEV;
 	if (!enable[dev]) 
-- 
2.55.0

