Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7151C058
	for <linux-sound@vger.kernel.org>; Thu,  1 Oct 2026 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867453; cv=none; b=CTF+KMijZt8RyAPfjcZL46RPklOxxkpRF8C/W/f1gsoEpoPf3bmb6GScXG35aj5xZKEue95y4Opw7sC7wU2etqDWz7/JmLaLNGugXYC/SGY/t5PAUn1Yg088g2mU+m/OMllnStc0+n9MttdTDXV8BxorF4TAyNR5bsVPLhaNPFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867453; c=relaxed/simple;
	bh=Bt3aKEYelf/FUeejRkbCAyy9uJAZE+kEmGKyY20sTC4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmg0f8wDYaf2orquIforaR9e6mhgxmGmgb5LlL14lwrz7qus4CwLUelnZfaYMq7289O8a9QJQC5sjsVM6+lLIFgtMrdYZVcW8kmWH04WZYQ1i7DMmagOxEUlFVgpZF9mzZF4BovzLVpLvj32lvP70i8uJSCT+Efwby7CDx9i8L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LzLySmfi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xwptg30b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hRHq7fFG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QwkbrXxM; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LzLySmfi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xwptg30b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hRHq7fFG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QwkbrXxM"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D41F41FCF6;
	Thu,  1 Oct 2026 15:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790867446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS1HEbMzyH5fteyA1fF11dZ4Kzt/+w7SjtgaM4JPRtU=;
	b=LzLySmfi9yP+RVKvG1lWs0dRpkd7ywZZtSwOjE5P8ltubkG4r9ZFx+jso1EhvaeBpdZoc/
	Uux7TRs2Ot5Nn64gNczbzgvKuHfHDEOne656E8Czn/fEjHtdAE2pSK9ZNRGW+FSeqVEgDc
	E6eONE8wFqHJiALIvL/KKy1PDe9DHAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790867446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS1HEbMzyH5fteyA1fF11dZ4Kzt/+w7SjtgaM4JPRtU=;
	b=Xwptg30b5xIwVQa4U2OdoMLSugV45Ac+2w0lRKxVH9soNUhUfIWl2WZqcoNAPJFh+5iezQ
	vrmi0U/1kNbZDHBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hRHq7fFG;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QwkbrXxM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790867441; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS1HEbMzyH5fteyA1fF11dZ4Kzt/+w7SjtgaM4JPRtU=;
	b=hRHq7fFG07xPCnA+w8NvwtYkQxit7MsU9DKI6n5Y8bEmuMcs2Ui9gYJ/lFZv84jZ0WVAke
	xJjZO6a5EwB5g3S6mV1bN02IfNVTuJFcUQcPL0qMjxPcClTtUNmt4kN98W+Q5kT+dqkNHQ
	Hm8X1myqmOFTa274nzxTVluNwN9kulQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790867441;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS1HEbMzyH5fteyA1fF11dZ4Kzt/+w7SjtgaM4JPRtU=;
	b=QwkbrXxMi3cSMFmpEfJltMXIdshWeG0YO1S79gktQoh7O8Sfo/KootzUBoUuJms2tUX/Vn
	ZFkyIX6FMMCLDhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95A1B13B8A;
	Thu,  1 Oct 2026 15:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PlFQEvF3vmrKHwAAD6G6ig:T2
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 15:10:41 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 2/2] ALSA: ice1712: Fix the error handling via auto-cleanup at probe
Date: Thu,  1 Oct 2026 17:10:36 +0200
Message-ID: <20261001151039.592033-2-tiwai@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001151039.592033-1-tiwai@suse.de>
References: <20261001151039.592033-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D41F41FCF6
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:email,suse.de:dkim];
	ARC_NA(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-Spam-Level: 

We used the auto-cleanup via snd_card_unref() for errors at probe of
ice1712 driver, but this may be problematic in a subtle way when an
error happens at snd_card_register(); since snd_card_unref() skips the
snd_card_disconnect() call, it may miss some resource clearance.

For fixing the issue, use the new __free(snd_card_free) instead, which
does call snd_card_free() explicitly at errors for avoiding such a
pitfall.

Fixes: d736eba9c453 ("ALSA: ice1712: Fix the card leak at probe error with the auto-cleanup")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/ice1712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index d6bfd8fb20e6..1fad8c418132 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2523,7 +2523,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 			     const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card __free(snd_card_unref) = NULL;
+	struct snd_card *card __free(snd_card_free) = NULL;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
 	const struct snd_ice1712_card_info * const *tbl, *c;
-- 
2.55.0

