Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F393F418A2D
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931337; cv=none; b=uog1BXA/PYEQN6T6JODWkG07apqdlIE0D2fU4Gw1biFKq9A/UsGaw+vY4Gxb7r7wSlyS+cEX/wSfkOlTokzhMKmCOIxZSC+9eHqCNWqt8gkItgJg+RsiNLUQ9E4fvOt5dNAq8mL4ep60DtYYlygY8sMiQh72B/ek0UR123lbZxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931337; c=relaxed/simple;
	bh=YxDSIRJg7e4yhDXAbTtepkwceu1WBS9q/uasc+tiiFs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0Xz6Yex9YLxiaW7uD5RX3SEVyEXLjB5hHY+ZWILjMZIa87uuYJqutBEfEANBxI3gUvASxJwRNMo3La9RvjL3ijJtUDoxuWoWqr6jhmW1EJz78yO8IXnxkvZAovNZ8ec+ElsxEoanf5k0rx2mTF4F/P1UGcLnYkyrrNXZfxNIXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gqZ73drq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mucG+u+C; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uo2iDbyR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BpRu3tXa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gqZ73drq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mucG+u+C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uo2iDbyR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BpRu3tXa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A71E11FE46;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vq8yZfTw2R4BXMBhP0b4jiuYQb8j5rvXWGoM9UaebB4=;
	b=gqZ73drqu4HD0mp/DNUWb6/Qjj8WdRMAV1uUhJO0+EQMtO/wo+J4nqJ5VDXjJC1kSOs+GH
	gTQzHo2apXtTThP/fIxIT91armyqfPruK6lkG/x8i2gJnH3V37fNYWI8Q70Lzn3WeHWy3C
	n51UgRbmqt0APpxZhhN+ANfqjxio0Yw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931329;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vq8yZfTw2R4BXMBhP0b4jiuYQb8j5rvXWGoM9UaebB4=;
	b=mucG+u+Cltuf3NOn4JJ+YT75XW73GpDoiZ8UdszZ+CPbdsW6UCImyuNg9xWAgBx55HD86v
	8qbJlnNrCvyNIlCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790931325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vq8yZfTw2R4BXMBhP0b4jiuYQb8j5rvXWGoM9UaebB4=;
	b=uo2iDbyRnnSH2Jqv8Q+0FR/QAfuIg32AidgaLcI+fcE2IfutNtXv/cG3x0LIfo62sJMCNl
	AIX8pH1IiEC1DBkgJsBN0vBnvSaxaxzHE+9mSHQqF1h3gCKptA7bu1zJPBWlrtzhiqz0n/
	U6hX7DevVx+PK8kD5cdOFIfVYdZXBUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790931325;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vq8yZfTw2R4BXMBhP0b4jiuYQb8j5rvXWGoM9UaebB4=;
	b=BpRu3tXaXuQ8wh9Tv56vZZrn6ij5yLKLmXbOKy9AsMBC8JCfgKt9eCAhRluoIEZ9DUN/5G
	dHfbvBvNylPnDeBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E83413BFD;
	Fri,  2 Oct 2026 08:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfPyB31xv2ppWAAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Fri, 02 Oct 2026 08:55:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH v2 01/32] ALSA: galaxy: Use auto-cleanup for probe card error handling
Date: Fri,  2 Oct 2026 10:54:39 +0200
Message-ID: <20261002085517.693510-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002085517.693510-1-tiwai@suse.de>
References: <20261002085517.693510-1-tiwai@suse.de>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 

Instead of the manual call of snd_card_free_on_error(), use the
auto-cleanup feature.

Merely a code cleanup, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/galaxy/galaxy.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/isa/galaxy/galaxy.c b/sound/isa/galaxy/galaxy.c
index b0f1562d0fc0..aa31744ed582 100644
--- a/sound/isa/galaxy/galaxy.c
+++ b/sound/isa/galaxy/galaxy.c
@@ -478,11 +478,11 @@ static void snd_galaxy_free(struct snd_card *card)
 		galaxy_set_config(galaxy, galaxy->config);
 }
 
-static int __snd_galaxy_probe(struct device *dev, unsigned int n)
+static int snd_galaxy_probe(struct device *dev, unsigned int n)
 {
 	struct snd_galaxy *galaxy;
 	struct snd_wss *chip;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	u8 type;
 	int err;
 
@@ -595,14 +595,10 @@ static int __snd_galaxy_probe(struct device *dev, unsigned int n)
 		return err;
 
 	dev_set_drvdata(dev, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	return 0;
 }
 
-static int snd_galaxy_probe(struct device *dev, unsigned int n)
-{
-	return snd_card_free_on_error(dev, __snd_galaxy_probe(dev, n));
-}
-
 static struct isa_driver snd_galaxy_driver = {
 	.match		= snd_galaxy_match,
 	.probe		= snd_galaxy_probe,
-- 
2.55.0

