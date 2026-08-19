Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A210F3403EF;
	Wed, 19 Aug 2026 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787147258; cv=none; b=I0pE7RN4B6CZUslHrBepsfy9BsukIVM/dKYedD3qmA4iP5nrmg3JgdFTeBw9Z/0RBknqb9dQAQpJbuxYu4x32z/Sp4VEU36OeDRVq//QVRC4zbfGv1MkZ6gnbSj+fljZVq7j2Jr06ia2FfTBQ1z0qiGCPPaJccJy2gSmTetv1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787147258; c=relaxed/simple;
	bh=3KvPvk1PMw4K/TR5Pr3Ix264KE9+Y5d3IkS3uDudRfs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAzNwE4bbw8D1A1+n8ZM9qkfSsi8aC3u/K0p8NNEl1mNWiadmrfrLd8Sv73kg5uhaO6xINAEkonnltShfgi983EHUz/qcY3MBhwuQg5F1Z7i8TA/4ZPrtTYg/5fc4aPPhjAzomoPb+B3FWVefnSJgjH9PwOBpYUuWdPebkXF4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EZ8Mjwxz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CAHXTRbF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LfdYuSYS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7ssOztTr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EZ8Mjwxz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CAHXTRbF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LfdYuSYS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7ssOztTr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBFB584B25;
	Wed, 19 Aug 2026 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787147248; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joEUBSAldN+J+jKGZQMrQn2g9nQJ8ZC41u8sqh4FUKk=;
	b=EZ8MjwxzCeVfX4i5jy6ktFEyH3gf39yz0prEbF8lkCMTi01QvK5AJ5zzWCWyC8L+a2Zw5H
	HYFumgxC2IEIl7JINJLGs2X0LzgPIlFaITFMlgLGlN0TQP7vpbi9oYG98kocovZqynL8IA
	iuTAMuQqjeSJ+9+Gescop27nLKCWAxc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787147248;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joEUBSAldN+J+jKGZQMrQn2g9nQJ8ZC41u8sqh4FUKk=;
	b=CAHXTRbFNSsU9fqSNTc0q1FQ2WpR0UFUL78XVQ6dSJmFghnQRdyxvjGh8R8H5CGfXKYvMe
	3uqCo27gk1SnSKCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787147243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joEUBSAldN+J+jKGZQMrQn2g9nQJ8ZC41u8sqh4FUKk=;
	b=LfdYuSYSHeWk/gkFqdW0l9Wy4gklk52BOYpsOxYRHy+c9872pLKS732PNkqcJvcxjZgxuK
	cI05NyBeZChTnzrrOe/KcxA856rCDjwiNMoQk5hWtZzagzSmjRxoUBZU9mHB+JwvfKWNLa
	trV91wM2HvmBXNuD1XQQm42d6ekS2h8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787147243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=joEUBSAldN+J+jKGZQMrQn2g9nQJ8ZC41u8sqh4FUKk=;
	b=7ssOztTrJHHlfPzjiMThJQGX3SXRTHdRbn1p1TbHpIFriQ3252wdiOJiR/8MGyHssjL6aT
	Hb3uHpyAhH93BqDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 84C6A2F81;
	Wed, 19 Aug 2026 13:47:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BlA1H+uzhWoXXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Aug 2026 13:47:23 +0000
Date: Wed, 19 Aug 2026 15:47:23 +0200
Message-ID: <878q62nrx0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ice1712: Fix missing snd_card_free() at probe error
In-Reply-To: <87ik56nuf6.wl-tiwai@suse.de>
References: <20260819084959.10649-1-vulab@iscas.ac.cn>
	<87ik56nuf6.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.973];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,iscas.ac.cn:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 

On Wed, 19 Aug 2026 14:53:17 +0200,
Takashi Iwai wrote:
> 
> On Wed, 19 Aug 2026 10:49:59 +0200,
> Haotian Zhang wrote:
> > 
> > snd_ice1712_probe() performs multiple initialization steps after
> > snd_card_new(), but directly returns on failures from later steps
> > without releasing the ALSA card, causing resource leaks when
> > probing fails.
> > 
> > Route all initialization failures after snd_card_new() to a
> > common error path and call snd_card_free() before returning
> > the original error code.
> > 
> > Fixes: ca642da4b33d ("ALSA: ice1712: Allocate resources with device-managed APIs")
> > Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> 
> Actually, this was rather a forgotten replacement of snd_card_new()
> with snd_devm_card_new(), as implemented in a similar code ice1724.c.
> But the error handling before the registration is still needed (it was
> fixed later for ice1724.c, too), so it'll be something like below.

On the second thought, a more elegant alternative would be to use the
auto-cleanup with snd_card_unref.  A totally untested patch below.


Takashi

-- 8< --
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2523,7 +2523,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 			     const struct pci_device_id *pci_id)
 {
 	static int dev;
-	struct snd_card *card;
+	struct snd_card *card __free(snd_card_unref) = NULL;
 	struct snd_ice1712 *ice;
 	int pcm_dev = 0, err;
 	const struct snd_ice1712_card_info * const *tbl, *c;
@@ -2535,8 +2535,8 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 		return -ENOENT;
 	}
 
-	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-			   sizeof(*ice), &card);
+	err = snd_devm_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
+				sizeof(*ice), &card);
 	if (err < 0)
 		return err;
 	ice = card->private_data;
@@ -2640,6 +2640,7 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 	pci_set_drvdata(pci, card);
+	card = NULL; /* probe succeeded, don't release as error */
 	dev++;
 	return 0;
 }
