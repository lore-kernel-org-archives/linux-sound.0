Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01C36AB46
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604837; cv=none; b=uBnSTX2j25JsXFWifI/y93YXjDLDe7erNR9PLGQ2El7FyxGgcCS9IrgbFpHqzzGRYnKBumIOg62/0/kwClPEQybLRzc6g5jkVAT2J525zpVxTQz59kntiWmFh1qw9IzAzmGVQPUicnFdFWgoyYU2T282D+FEHoyXDLk29FjVh74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604837; c=relaxed/simple;
	bh=jKGxyMfPgTpe8Z56ygKN5Ku9yDpKfGJJRgZv3f3sAm4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n3/T1YDG1bBy4+A/uP+AlyP0mopyavhzVCSZ0JHwWm3ucZtjBVpjtW9if/lci+2xg/0UooJ19s5IH8/tIFvcTUcRzm9Mje1qFPOJKFa9n7qfZ0icGHWXE2y8RPDwRcZiXirgS2lb/mgpJeczIuyn7ugZ1Q2tZYy/Hd9F5YelwcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A1nGP0b3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HNYlsXlz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A1nGP0b3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HNYlsXlz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A1nGP0b3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HNYlsXlz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A1nGP0b3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HNYlsXlz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 06F485BCF9;
	Fri, 27 Mar 2026 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T74hnurPTb6YOKXOUIRLRUi4z9sIxIR6yJhOjEGs7qY=;
	b=A1nGP0b3LwVRDd+AAlng3eJ/bn8Z/2JuByZltk/DXeWAVUdtHMjvSOpFHP1Usm8q9/AqkH
	Vo7PINrBccwjwj35C46zSet/6nUcTY0hUT9qjD1QtzgGjrqyZ0PpsyXovhEpJVKOc6WjEI
	oog5CfIpQG5Yk0AicQSZklgLD7mFU6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T74hnurPTb6YOKXOUIRLRUi4z9sIxIR6yJhOjEGs7qY=;
	b=HNYlsXlz7WRd42c2eH4v0pY+juSfbMAdMKtos8KNdiFH8qwyRKujSL5EKBmPNtyw7OycVB
	27D4FdIqMvfuREDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774604835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T74hnurPTb6YOKXOUIRLRUi4z9sIxIR6yJhOjEGs7qY=;
	b=A1nGP0b3LwVRDd+AAlng3eJ/bn8Z/2JuByZltk/DXeWAVUdtHMjvSOpFHP1Usm8q9/AqkH
	Vo7PINrBccwjwj35C46zSet/6nUcTY0hUT9qjD1QtzgGjrqyZ0PpsyXovhEpJVKOc6WjEI
	oog5CfIpQG5Yk0AicQSZklgLD7mFU6Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774604835;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T74hnurPTb6YOKXOUIRLRUi4z9sIxIR6yJhOjEGs7qY=;
	b=HNYlsXlz7WRd42c2eH4v0pY+juSfbMAdMKtos8KNdiFH8qwyRKujSL5EKBmPNtyw7OycVB
	27D4FdIqMvfuREDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D4C2A4A0A2;
	Fri, 27 Mar 2026 09:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5NSuMiJSxmm6MQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:47:14 +0000
Date: Fri, 27 Mar 2026 10:47:14 +0100
Message-ID: <87cy0psixp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Odin Brodersen <Odin_B@yahoo.com>
Cc: alsa-devel@alsa-project.org,
	perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga 7 2-in-1 16AKP10 (17aa:391d)
In-Reply-To: <976868857.398937.1774391091126@yahoo.com>
References: <976868857.398937.1774391091126@yahoo.com>
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

On Tue, 24 Mar 2026 23:24:45 +0100,
Odin Brodersen wrote:
> 
> Hi Takashi,
> 
> I'm submitting this patch directly as my alsa-devel submission is awaiting
> moderator approval (first post from a Yahoo address).

You don't need to submit to alsa-devel ML but only to linux-sound ML
for kernel patches.  Bu

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
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=221210
> Tested-by: Odin Brodersen <Odin_B@yahoo.com>
> 
> Signed-off-by: Odin Brodersen <Odin_B@yahoo.com>
> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7576,6 +7576,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
> 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
> 	HDA_CODEC_QUIRK(0x17aa, 0x391c, "Lenovo Yoga 7 2-in-1 14AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> +	HDA_CODEC_QUIRK(0x17aa, 0x391d, "Lenovo Yoga 7 2-in-1 16AKP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
> 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
> 	SND_PCI_QUIRK(0x17aa, 0x38b7, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
> --
> 2.43.0

Hmm, have you created a patch properly by git-format-patch or such?
It looks malformed and doesn't apply cleanly.  Try to apply this post
on your side via git-am.

At best, test posting patches locally at first, and once after you
confirmed that everything works, try to resubmit.


thanks,

Takashi
