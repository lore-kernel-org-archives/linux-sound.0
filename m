Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EEF2D6629
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142328; cv=none; b=J0e6B8Wj7eV/B6MEi5jrrl3WonUK8edcSnxqdnPEcMoPU1BsQltklMYlT28pA2lTA/YO9QiICCPLFnn3c4Wlz1zkdNwMuWkuLvA3puneArdAdu7e/ICkEkCqX7+JF4+HGBI7chDOEa7HLNp9+ECIeOAzPccCEcI3ObvgETRBunM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142328; c=relaxed/simple;
	bh=MpSw7qNMG4DiXxD+z8Aj0VBLx5TJtu0GswjkYpRLapU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W1IYrpvrtN/WKuwJbObtd0BVz+FHr+s4JUFl5S9+FP9WJa4vzddEPxOz9m1OqixXnsxkbMM3DeFjhw8T7pBi9mCT+NjiMvQUbJlXziCI+gYy47lW+F50kA18WcDpp22VhhjhQtN0MUIrFG8fheEuBgswYdb2l6xHDxXvi8penWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ty4vLvcC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nm22T+ei; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ty4vLvcC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nm22T+ei; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ty4vLvcC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nm22T+ei";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ty4vLvcC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nm22T+ei"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 04716211AB;
	Thu, 10 Jul 2025 10:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz006CcwxEAb+b22g/Qo5CTSeMWsELvAD2PfhgtScaE=;
	b=Ty4vLvcC+gGybiHhwTVMECy3nNDBQwZRjHRaMcwA4fCppY2k9jaIrKSF1tW7AosMd88lke
	M/xKBeL6dQUU3JthuOpsUqXsKv6a1zyS5yaSzwubA4fOSZinZxzvs238zWihJKLgDMdeVP
	8QwuZ2ic1/jvhzkNib1Q/2/ti9lQzBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz006CcwxEAb+b22g/Qo5CTSeMWsELvAD2PfhgtScaE=;
	b=nm22T+eiLJMJN6Tv5xG10C+e/fLyjiwM1OSCl4hmKwHQJs7GTo3gbY95zmrn0HAfafEeXK
	S7qpibcnNi8TY3AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752142066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz006CcwxEAb+b22g/Qo5CTSeMWsELvAD2PfhgtScaE=;
	b=Ty4vLvcC+gGybiHhwTVMECy3nNDBQwZRjHRaMcwA4fCppY2k9jaIrKSF1tW7AosMd88lke
	M/xKBeL6dQUU3JthuOpsUqXsKv6a1zyS5yaSzwubA4fOSZinZxzvs238zWihJKLgDMdeVP
	8QwuZ2ic1/jvhzkNib1Q/2/ti9lQzBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752142066;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz006CcwxEAb+b22g/Qo5CTSeMWsELvAD2PfhgtScaE=;
	b=nm22T+eiLJMJN6Tv5xG10C+e/fLyjiwM1OSCl4hmKwHQJs7GTo3gbY95zmrn0HAfafEeXK
	S7qpibcnNi8TY3AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF11713A70;
	Thu, 10 Jul 2025 10:07:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YMw+NfGQb2jZWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 10 Jul 2025 10:07:45 +0000
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: [PATCH 069/103] ALSA: korg1212: Use safer strscpy() instead of strcpy()
Date: Thu, 10 Jul 2025 12:06:51 +0200
Message-ID: <20250710100727.22653-70-tiwai@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710100727.22653-1-tiwai@suse.de>
References: <20250710100727.22653-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLsqo7dymd5dgmoaprf5rep8is)];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -2.80

Use a safer function strscpy() instead of strcpy() for copying to
arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 56dea5b10828..0a66d5cfc090 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2249,7 +2249,7 @@ static int snd_korg1212_create(struct snd_card *card, struct pci_dev *pci)
 
 	korg1212->pcm->private_data = korg1212;
         korg1212->pcm->private_free = snd_korg1212_free_pcm;
-        strcpy(korg1212->pcm->name, "korg1212");
+        strscpy(korg1212->pcm->name, "korg1212");
 
         snd_pcm_set_ops(korg1212->pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_korg1212_playback_ops);
         
@@ -2298,8 +2298,8 @@ snd_korg1212_probe(struct pci_dev *pci,
 	if (err < 0)
 		goto error;
 
-	strcpy(card->driver, "korg1212");
-	strcpy(card->shortname, "korg1212");
+	strscpy(card->driver, "korg1212");
+	strscpy(card->shortname, "korg1212");
 	sprintf(card->longname, "%s at 0x%lx, irq %d", card->shortname,
 		korg1212->iomem, korg1212->irq);
 
-- 
2.50.0

