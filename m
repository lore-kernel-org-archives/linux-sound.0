Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A37313E0D;
	Wed, 19 Aug 2026 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144015; cv=none; b=SfND7PG7EXJysB9UGllICOXyWCUxk6C7KzHdWQEaB6kKcfUTyqSxLYD2//HN8Fn1sOgzaI2K4qxf0I6jK1WGSN8pZY81RZkyreZ5bI6AkGjWuGegBKWX+vZYXGa6aYqSw8BJSX9dmyrXHu3JNbr/0D27gV6+Wnx0pULLzpVBcCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144015; c=relaxed/simple;
	bh=McOAoKxzrJDvJKlFZjwU+dISHDvj1Ut/8uUbpe8dOnw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W54IJRCjNKXqT1msnPPQAsGC1tvp4WgfJW2xCdkUlxZ4ZTtfFNAzymcz+BNrj+k4GLImg/6fiz0Qi7enMz6XXBcOdQKDCJcKoN40REjF8dl41tEbq/k+84Jq6561vfZ+GqQ4eVcgRwBHz6lkWsDeVa8Y/ivFjvMVWgt05waaOcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XgGu8ggv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8LgzWZy/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mj+c1ewk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AwwGidsq; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XgGu8ggv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8LgzWZy/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mj+c1ewk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AwwGidsq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5437584ABD;
	Wed, 19 Aug 2026 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787144002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynh+eSOFPu9DI/Kbgw+bPdVrpA96Zrl8Vbgpt2bGtxA=;
	b=XgGu8ggvIRROREiSrTLklrZ3GHKgHx2jX2EHgnxqtEUXURVkrLoSKCztx43qHf9XhFxgVc
	Ve8Qnmec85UV18KlrVAl/ameCu0Sp2ggy9I/pNsdzau/z6wfGkzYTBLUSNFzUcc9V+ldlB
	O9/5r3NASUgLkUKM1N2/FfOl/9TSI4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787144002;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynh+eSOFPu9DI/Kbgw+bPdVrpA96Zrl8Vbgpt2bGtxA=;
	b=8LgzWZy/fNNkiaV7xFWFO8NjJNtGQwMO6c959gEq8hlYAFecp8zBaUKDuJifgvg/JN3TFo
	OUE1WEgCnhDImVAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787143998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynh+eSOFPu9DI/Kbgw+bPdVrpA96Zrl8Vbgpt2bGtxA=;
	b=mj+c1ewk6ljxi7Cp5Bff7ievb4fqJGfXaqxxMlFvBL1D7wqVCuHC5/QswUg+8JvzgO3YrV
	VYipqGf1qVaWCCjuAjveLI6fwADckZTiwarR6M97Xrq78S2bCH5mfx+98GYvSuyuqvW2sc
	+9HGh+D3/WVe5x5ZBhHMTC5Qak0FopE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787143998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ynh+eSOFPu9DI/Kbgw+bPdVrpA96Zrl8Vbgpt2bGtxA=;
	b=AwwGidsqM/HA0ljuJQXsc5RicfGtE+2F43oZGbx4VCCQ4aIVl84N0DdXuDLY/YQBep6T7c
	fYOpRShIvXQOnNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2BE332F81;
	Wed, 19 Aug 2026 12:53:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fDpgCT6nhWqWJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Aug 2026 12:53:18 +0000
Date: Wed, 19 Aug 2026 14:53:17 +0200
Message-ID: <87ik56nuf6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ice1712: Fix missing snd_card_free() at probe error
In-Reply-To: <20260819084959.10649-1-vulab@iscas.ac.cn>
References: <20260819084959.10649-1-vulab@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Wed, 19 Aug 2026 10:49:59 +0200,
Haotian Zhang wrote:
> 
> snd_ice1712_probe() performs multiple initialization steps after
> snd_card_new(), but directly returns on failures from later steps
> without releasing the ALSA card, causing resource leaks when
> probing fails.
> 
> Route all initialization failures after snd_card_new() to a
> common error path and call snd_card_free() before returning
> the original error code.
> 
> Fixes: ca642da4b33d ("ALSA: ice1712: Allocate resources with device-managed APIs")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Actually, this was rather a forgotten replacement of snd_card_new()
with snd_devm_card_new(), as implemented in a similar code ice1724.c.
But the error handling before the registration is still needed (it was
fixed later for ice1724.c, too), so it'll be something like below.


thanks,

Takashi

-- 8< --
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2519,8 +2519,8 @@ static int snd_ice1712_create(struct snd_card *card,
 
 static struct snd_ice1712_card_info no_matched;
 
-static int snd_ice1712_probe(struct pci_dev *pci,
-			     const struct pci_device_id *pci_id)
+static int __snd_ice1712_probe(struct pci_dev *pci,
+			       const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
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
@@ -2644,6 +2644,12 @@ static int snd_ice1712_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_ice1712_probe(struct pci_dev *pci,
+			     const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_ice1712_probe(pci, pci_id));
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int snd_ice1712_suspend(struct device *dev)
 {
