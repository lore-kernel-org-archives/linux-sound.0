Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440353B38AD
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784555645; cv=none; b=ZGjV7LIzjT8UYTppTBIUiP2ZPJlrrEBB90++qRb0QXX6z/6mv0MhubhYWVZ0T480rzdzVPq+jBD9bKyyLnbNDFyJw6RK3iN1GE5eQqCiUkms2qO+/GrmoSLNerFpnjGqSF4du8XBe9Tf1GDE3N+5om4fbNmbr5j6pLzU1+6IJjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784555645; c=relaxed/simple;
	bh=Ez+9SZ8SsIunUaA7/ptekPRo2yryDLxgTJDT2NeH8iE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IqwF2vhLWSJF3ZaPMq05wDKRpx1M2W8lT5NVjeOHBngzg0N/PvESIJq/fiZsS112Ze6aFN3/wBeqy4anJGxMLgYrcu7h7aYkMk0laNcdnzRenpHfTGOqxKfFC2b90riMcjUFg8Uj3U0WPf6zPxdPl+f4vjRGtWJNFzvPaTrZjh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G4F1LqXY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7NFd2E5i; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=G4F1LqXY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7NFd2E5i; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G4F1LqXY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7NFd2E5i";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="G4F1LqXY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7NFd2E5i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4270D3E09;
	Mon, 20 Jul 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duh6GR//6DC3VwxZcKT/INpqt6rZqENnAv9GftJzZK8=;
	b=G4F1LqXYDL1S6JAnvZfZz9D7onVHbPtnJxrZnwYdvQGjcJybPIGbKhaNkhCRyEq2T/TjYw
	lb0TaMGLRd5Z0tadd0bnv4+ttThHkBHSPFuucgI+WCsjk9xrMoUkUNqYAzBMeSNLJiGs3x
	PKoT9Argrmwj76PswB9WWRP2k4Ni9C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duh6GR//6DC3VwxZcKT/INpqt6rZqENnAv9GftJzZK8=;
	b=7NFd2E5itv0WbxeL3u2u+eYU16kK129GMmYJmuPVrbbbPR3ZmQba/e7qxzKz62JhcWT9fa
	/n0Ck1zdSeN0H6AQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784555642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duh6GR//6DC3VwxZcKT/INpqt6rZqENnAv9GftJzZK8=;
	b=G4F1LqXYDL1S6JAnvZfZz9D7onVHbPtnJxrZnwYdvQGjcJybPIGbKhaNkhCRyEq2T/TjYw
	lb0TaMGLRd5Z0tadd0bnv4+ttThHkBHSPFuucgI+WCsjk9xrMoUkUNqYAzBMeSNLJiGs3x
	PKoT9Argrmwj76PswB9WWRP2k4Ni9C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784555642;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duh6GR//6DC3VwxZcKT/INpqt6rZqENnAv9GftJzZK8=;
	b=7NFd2E5itv0WbxeL3u2u+eYU16kK129GMmYJmuPVrbbbPR3ZmQba/e7qxzKz62JhcWT9fa
	/n0Ck1zdSeN0H6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B233779AB;
	Mon, 20 Jul 2026 13:54:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IJxSBXooXmr8KgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jul 2026 13:54:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ALSA: dummy: Properly shutdown the systimer at freeing
Date: Mon, 20 Jul 2026 15:53:54 +0200
Message-ID: <20260720135356.1779857-4-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720135356.1779857-1-tiwai@suse.de>
References: <20260720135356.1779857-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 

Add timer_shutdown_sync() call at the free callback for systimer
backend, in order to make sure that we can release the resources.

This is only for hardening, and there shouldn't be any actual issue
that requires this change for now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/dummy.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/drivers/dummy.c b/sound/drivers/dummy.c
index 3bc0289e3518..8836799727ea 100644
--- a/sound/drivers/dummy.c
+++ b/sound/drivers/dummy.c
@@ -350,7 +350,10 @@ static int dummy_systimer_create(struct snd_pcm_substream *substream)
 
 static void dummy_systimer_free(struct snd_pcm_substream *substream)
 {
-	kfree(substream->runtime->private_data);
+	struct dummy_systimer_pcm *dpcm = substream->runtime->private_data;
+
+	timer_shutdown_sync(&dpcm->timer);
+	kfree(dpcm);
 }
 
 static const struct dummy_timer_ops dummy_systimer_ops = {
-- 
2.55.0

