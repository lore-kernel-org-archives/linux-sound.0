Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE472218AC7
	for <linux-sound@vger.kernel.org>; Mon, 17 Feb 2025 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786209; cv=none; b=Bgfza0QdbwpDGLFCMJEGCEMCIdt//hguHFUEIT5e53wMgqPTyCzpDeNb3FGKy4j5ZZ2t/s7NUGdTTucs5257gQO+hXIiIXZ726cwfQ64Gkl0dKxVEnG/HcVRA01JZ3C4oLL76DVV6Yjf8m5OvSYqGJSv1t332812ofFH6KZxXg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786209; c=relaxed/simple;
	bh=HVlQJmgV5MkWp4kLGUHbfu1mVTtxEQG2OKSopRuRmcQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CABgXkQzpSrCN42QBa8SkQ3y/1b+uXDTrz1rh/DlegL28vnBP47fyP4EQmOop094J8HhyECkXloa/XGauf0VdwXkFXqGSkhGAHEVhXutktWFX7iF5kI5S3bWZg7Ge8fQVpDWFRI1sAOCb1pYrjQZV6cTNBsuHdEHJivevizHkLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YKdhX/JO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fClxtXpR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YKdhX/JO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fClxtXpR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YKdhX/JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fClxtXpR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YKdhX/JO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fClxtXpR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D1C8E1F74B;
	Mon, 17 Feb 2025 09:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739786205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyYuE1j+82EEkh97CH8UQPjhPBRJy+Xz2H9xT/hXeBY=;
	b=YKdhX/JOi408z+KGRbsjKhPkpxGpKmvrLhvGryhrwA2znMtArclNQtUZuX0/hsOhe8chi6
	HZRDtY9AL1uvE5J4MRQ4V4gnJMnYLUeDdt9Gylwp1gmqv7QW3z0YD6VB8ojN58k5tBQ9q/
	u8cQP/y7HKVsf/4xYQlh7jpN54pEYc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739786205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyYuE1j+82EEkh97CH8UQPjhPBRJy+Xz2H9xT/hXeBY=;
	b=fClxtXpR83duHh88GfOMjFM/yZ4svKVcBnUrIc/f3M7urpkNnYuYCSGROnZoOHVh+6Jjzi
	RugBx5cItyh6wIDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739786205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyYuE1j+82EEkh97CH8UQPjhPBRJy+Xz2H9xT/hXeBY=;
	b=YKdhX/JOi408z+KGRbsjKhPkpxGpKmvrLhvGryhrwA2znMtArclNQtUZuX0/hsOhe8chi6
	HZRDtY9AL1uvE5J4MRQ4V4gnJMnYLUeDdt9Gylwp1gmqv7QW3z0YD6VB8ojN58k5tBQ9q/
	u8cQP/y7HKVsf/4xYQlh7jpN54pEYc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739786205;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyYuE1j+82EEkh97CH8UQPjhPBRJy+Xz2H9xT/hXeBY=;
	b=fClxtXpR83duHh88GfOMjFM/yZ4svKVcBnUrIc/f3M7urpkNnYuYCSGROnZoOHVh+6Jjzi
	RugBx5cItyh6wIDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A9FC133F9;
	Mon, 17 Feb 2025 09:56:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qeigGt0Hs2dVRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Feb 2025 09:56:45 +0000
Date: Mon, 17 Feb 2025 10:56:44 +0100
Message-ID: <87ldu499nn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: John Veness <john-linux@pelago.org.uk>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Add quirk for HP ProBook 450 G4 mute LED
In-Reply-To: <5eb4305d-48b2-43a4-a30e-2bbe8d409146@pelago.org.uk>
References: <5eb4305d-48b2-43a4-a30e-2bbe8d409146@pelago.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 17 Feb 2025 00:21:57 +0100,
John Veness wrote:
> 
> Allows the LED on the dedicated mute button on the HP ProBook 450 G4 laptop
> to change colour correctly.
> 
> Signed-off-by: John Veness <john-linux@pelago.org.uk>
> ---
> I have only tested this with 6.13, but I expect it could be applied to older
> stable kernels too. The HP ProBook 450 G4 laptop was released in 2017. 

It's fine to put Cc to stable in the patch, then.

But, your patch seems inapplicable, likely because your mailer
converted tabs to spaces.  Could you fix the mailer setup and
resubmit?


thanks,

Takashi

> 
>  sound/pci/hda/patch_conexant.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
> index 4985e72b9..34874039a 100644
> --- a/sound/pci/hda/patch_conexant.c
> +++ b/sound/pci/hda/patch_conexant.c
> @@ -1090,6 +1090,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
>         SND_PCI_QUIRK(0x103c, 0x814f, "HP ZBook 15u G3", CXT_FIXUP_MUTE_LED_GPIO),
>         SND_PCI_QUIRK(0x103c, 0x8174, "HP Spectre x360", CXT_FIXUP_HP_SPECTRE),
>         SND_PCI_QUIRK(0x103c, 0x822e, "HP ProBook 440 G4", CXT_FIXUP_MUTE_LED_GPIO),
> +       SND_PCI_QUIRK(0x103c, 0x8231, "HP ProBook 450 G4", CXT_FIXUP_MUTE_LED_GPIO),
>         SND_PCI_QUIRK(0x103c, 0x828c, "HP EliteBook 840 G4", CXT_FIXUP_HP_DOCK),
>         SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
>         SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
> -- 
> 2.48.1
> 
