Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0CE20330
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719238779; cv=none; b=cVtJmj9uXoIGol5tC/CSF9VnBGo764K5QquMUGJu/Dy2LeyMLoS1hQGgvAzKB2PcTJP7ysFxtrDlQD76TsrQedAxOpzqBM/SpD0Cmghk7esL6H7QnP7vhV9hKvT6HqjqYoCi5ZoIuHSGHq9tneKNiTO3ebK0MbRYgPas3QsSNL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719238779; c=relaxed/simple;
	bh=0Pf9xKLiETUzkQdhBKRGs8BtLOu81PuMM9ZAYXiHels=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNx7h4lGX2xMGxAkAoF4NHYKLaKOzvQIqLHRLn7isya3YG5Oo9CoaCL8jIVUtq8f7wOGxjDVdTqKT02OX0VQ2R4BGLjwOadTL5avItSw/FsnVwYVTF+uN7+jfVOUPcdXcApIBB8tyuUir/mWVR5Bksj009LoULYd7GfhW6kvqdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hnafHua4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nnE8UpN1; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sh/hyV90; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i9wB5N/S; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hnafHua4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nnE8UpN1";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sh/hyV90";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i9wB5N/S"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 322ED1F82A;
	Mon, 24 Jun 2024 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719238776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ipTfxwrHgAqpehkBjduHrbuqBFE+DQpk0FxlOd1BOI=;
	b=hnafHua4oo9fXXzbcJhMwoVUJ/qKdMWhThJsW13Kp9SDehCLTgcZ9oHBtkWXq4lQwZgosM
	+GH8LS8hKixPVzQUCFrQVPu7wuQuOJ9bvYPBHEG+H1ndAD1xH070o6ka78gbF6vZukxn8i
	hYEHZlthjc+o4d+0jr5xxH1Ci02FcyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719238776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ipTfxwrHgAqpehkBjduHrbuqBFE+DQpk0FxlOd1BOI=;
	b=nnE8UpN1rRPpnT5r+sj9lV9iJxfwPqM3diL2MXdGQdTouXG/Hn75SdocmilMGrq6k2aaU2
	fM2SGGBsMNMpEbDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719238775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ipTfxwrHgAqpehkBjduHrbuqBFE+DQpk0FxlOd1BOI=;
	b=sh/hyV90lqZVSXyu5YLKpkdi8n5Qf7olnKWRd15Rz3uzr6BHFeEyMRdN2wuRRNh4QnrHu1
	ld/1eEUHOYcENFX1FCk6HCRJYN/wpg/4gEsOpCXIcrArvWewS/Hsf8Cthl5SzH3B2iLgeV
	7vX549mPuzJrFcT5V1vExv5o3QK0kFw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719238775;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ipTfxwrHgAqpehkBjduHrbuqBFE+DQpk0FxlOd1BOI=;
	b=i9wB5N/SDoVwjB15nd0XMxx7+UepyxqNkVR9KGDSgrS/gTYveKIAmiHMIZYdf3kDVE2YkE
	ZYUDacefWLHDfPCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EC2D51384C;
	Mon, 24 Jun 2024 14:19:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Pst5OHaAeWaGBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Jun 2024 14:19:34 +0000
Date: Mon, 24 Jun 2024 16:20:02 +0200
Message-ID: <87wmmeo225.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aivaz <reichaivaz@gmail.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	kailang@realtek.com,
	Aivaz Latypov <pngdrift@mail.ru>
Subject: Re: [PATCH v2] ALSA: hda/relatek: Enable Mute LED on HP Laptop 15-gw0xxx
In-Reply-To: <CAGRy+7BMH-4Kwp5mqCiDcjjQKJ2Q7gMwF=ZJO02hj+DyV1gkFA@mail.gmail.com>
References: <CAGRy+7BMH-4Kwp5mqCiDcjjQKJ2Q7gMwF=ZJO02hj+DyV1gkFA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.26 / 50.00];
	BAYES_HAM(-2.96)[99.84%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,mail.ru];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,vger.kernel.org,realtek.com,mail.ru];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.26
X-Spam-Level: 

On Mon, 24 Jun 2024 11:16:36 +0200,
Aivaz wrote:
> 
> This HP Laptop uses ALC236 codec with COEF 0x07
> controlling the mute LED. Enable existing quirk for this device.
> 
> Signed-off-by: Aivaz Latypov <reichaivaz@gmail.com>

First off, your mailer broke spaces and line breaks, so the patch
can't be applied cleanly at all.  Please fix your mailer set up, or
better to use git-send-email for submission.

Also, the name in From line and Signed-off-by line are different.
Please try to align both.


thanks,

Takashi

> ---
>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index f4454abadc8d..51225c5770ea 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10067,6 +10067,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>   SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
>   SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> + SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>   SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx",
> ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>   SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
>   SND_PCI_QUIRK(0x103c, 0x87e5, "HP ProBook 440 G8 Notebook PC",
> ALC236_FIXUP_HP_GPIO_LED),
> --
> 2.45.2
