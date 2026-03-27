Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F4778F4A
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604230; cv=none; b=fI76nZbUbdQ4I6txMbus4mwXPUpw5g3JBIVgFZJ9fXIo4/xxQHSVwEtfY9CpwYqTvOfmOIOqeHlAR1dXz3QEH9sNwaXQDu8RMYd+HM9xSmlIZoQRJn5Nu5aOiHXjrUkJ/YXWsNeFAnvJNTta+xjl4SN/22C9HBYzFIUvNmxzUGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604230; c=relaxed/simple;
	bh=A2YfSgboACAEXS/Lk3taJnCLR5PJpUzz5QqhFLEUDlE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qUvY3CBO343O46q89kesJwfU6t1tOVPiBc698AFr8cgR5kUk0e7rfg2Bs8iELqMSLuUX9LCFN0eKlCGKa09qaD4Rd5u919mEs+br6WP3aC0fDeajcOYdL2hH5qqWY/yUXx6zICcntBrmJqmPC2sB6bRg3H0LZw4vcLzcQF5muqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H1qIA9b+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXd+zd99; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H1qIA9b+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nXd+zd99; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H1qIA9b+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXd+zd99";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H1qIA9b+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nXd+zd99"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7F3E5BCD1;
	Fri, 27 Mar 2026 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/gjkV83vxCQQLwfrVAY79W3y3zbdSQaeqmt7PyRNgQ=;
	b=H1qIA9b+UzBvZc7F6Z6DCAEkQ6t7AVEn86Z3okjDpGhg6/C5VfWRDGjLS+UDEC4s5NQBBG
	kXR1hXjsa0Dk8Jh62kTxsaLOIYNphWvGKnE5urQwYIVkkNB/3fqwIfuZFyUzVisP81vujU
	vroIi1uRCd+lrv+RNDheqZUJ3DWAZcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/gjkV83vxCQQLwfrVAY79W3y3zbdSQaeqmt7PyRNgQ=;
	b=nXd+zd99TZVTnjb+FP7jjDdZaj2oAXcFfG9bAo8lGwjmx2IPTHGxD52buOdziDvB170K8Q
	WEyuKxfUaPX48hAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604227; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/gjkV83vxCQQLwfrVAY79W3y3zbdSQaeqmt7PyRNgQ=;
	b=H1qIA9b+UzBvZc7F6Z6DCAEkQ6t7AVEn86Z3okjDpGhg6/C5VfWRDGjLS+UDEC4s5NQBBG
	kXR1hXjsa0Dk8Jh62kTxsaLOIYNphWvGKnE5urQwYIVkkNB/3fqwIfuZFyUzVisP81vujU
	vroIi1uRCd+lrv+RNDheqZUJ3DWAZcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604227;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4/gjkV83vxCQQLwfrVAY79W3y3zbdSQaeqmt7PyRNgQ=;
	b=nXd+zd99TZVTnjb+FP7jjDdZaj2oAXcFfG9bAo8lGwjmx2IPTHGxD52buOdziDvB170K8Q
	WEyuKxfUaPX48hAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9452C4A0A2;
	Fri, 27 Mar 2026 09:37:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NX8PI8NPxmmXJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:37:07 +0000
Date: Fri, 27 Mar 2026 10:37:07 +0100
Message-ID: <87jyuxsjek.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Odin Brodersen <Odin_B@yahoo.com>
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 16AKP10 (17aa:391d)
In-Reply-To: <576093558.279836.1774201077202@yahoo.com>
References: <576093558.279836.1774201077202@yahoo.com>
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
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[yahoo.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Sun, 22 Mar 2026 18:37:52 +0100,
Odin Brodersen wrote:
> 
> The Lenovo Yoga 7 2-in-1 16AKP10 (subsystem ID 17aa:391d) shares the
> same ALC287 codec and bass speaker pin layout as the Yoga 7 2-in-1
> 14AKP10 (17aa:391c), which already has a quirk entry. Without this
> fixup the kernel picks up the PCI SSID 17aa:38b5 (PCIe bridge) instead
> of the codec SSID, leaving the bass speaker pin (Node 0x17) inactive
> and the master volume uncontrollable.
> 
> Apply the existing ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN fixup to
> 17aa:391d to match the behaviour of the 14-inch sibling.
> 
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=221210
> Tested-by: Odin Brodersen <Odin_B@yahoo.com>
> 
> Signed-off-by: Odin Brodersen <Odin_B@yahoo.com>

Unfortunately the patch doesn't seem to have reached to the public ML
(neither linux-sound ML nor alsa-devel ML) by some reason, and more
importantly, the code change appears to be based on the old kernel
tree.  Please try to rebase to the latest Linux tree and resubmit
properly.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7576,6 +7576,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
>  	HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> +	HDA_CODEC_QUIRK(0x17aa, 0x391d, "Lenovo Yoga 7 2-in-1 16AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
>  	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
> --
> 2.43.0
> 
