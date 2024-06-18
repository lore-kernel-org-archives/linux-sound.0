Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6595B156997
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 10:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718707992; cv=none; b=fTMNjLvpp/t4gFZBX0CGHPvqXsMo/IpAKBByUfHTDsrqJiCFB9twhCArjmBOEuvRq2CrmersoklSswYCxe853mncLDWaXb5935RkYRzfjdHDDBijjd+06bQVvQp5Ycuupzjr6SEUGCsTSyidJ3vYOTfNd4jtGkdXcOPvzHgpqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718707992; c=relaxed/simple;
	bh=1g+vO9Sh59HbqB2lOI1V9EKWvcMPtcE9sb2hKzBIIUs=;
	h=Date:Message-ID:From:To:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lydGGBzhH8cINH9uPQdxXydbACO0zBN6us034kNKF1O//SXuRndaMDCwU832PJp9ZgtYOA2u82qMDwkIC/aCvR5/++9QXMK/FKI76I3Wbjsbw5svfIBqCAAKJEUDDrVZ6jaiE6oc6ghuXrPJhRwyOMeFsC6d9+kuFKIwmQ2gI9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOopEu6s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C0fR5rS+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dOopEu6s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C0fR5rS+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOopEu6s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C0fR5rS+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dOopEu6s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C0fR5rS+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 835971F397
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 10:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718707987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gszMmr9nBpwoDFje8NSsTDJXUCARpGqW/N3jnVIEbro=;
	b=dOopEu6sz2na/iTxIN/iEnd/qviWe5zFM6nPd9ki/o+vP8EWBK283+kEpf5RZcRpl/EHL7
	VQQVgrKQOVMDJD8HbZXz/xduzyXuCg1VXAT7WYNLQ9/naIcMDuR/6tz9UkkG/EHMNH6X9/
	Di1UxBwfCrRes7wn8Bk5ZkbqvPCX9LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718707987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gszMmr9nBpwoDFje8NSsTDJXUCARpGqW/N3jnVIEbro=;
	b=C0fR5rS+x2gRPqJnrPbHemuPT8egMTl7TYiv3WI2L0Le1EjLpsk4R0REPI8VDQJ+O4fE/C
	U20opH23xmoQ66AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dOopEu6s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=C0fR5rS+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718707987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gszMmr9nBpwoDFje8NSsTDJXUCARpGqW/N3jnVIEbro=;
	b=dOopEu6sz2na/iTxIN/iEnd/qviWe5zFM6nPd9ki/o+vP8EWBK283+kEpf5RZcRpl/EHL7
	VQQVgrKQOVMDJD8HbZXz/xduzyXuCg1VXAT7WYNLQ9/naIcMDuR/6tz9UkkG/EHMNH6X9/
	Di1UxBwfCrRes7wn8Bk5ZkbqvPCX9LA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718707987;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gszMmr9nBpwoDFje8NSsTDJXUCARpGqW/N3jnVIEbro=;
	b=C0fR5rS+x2gRPqJnrPbHemuPT8egMTl7TYiv3WI2L0Le1EjLpsk4R0REPI8VDQJ+O4fE/C
	U20opH23xmoQ66AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CCF51369F
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 10:53:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +GP+GRNncWbCMwAAD6G6ig
	(envelope-from <tiwai@suse.de>)
	for <linux-sound@vger.kernel.org>; Tue, 18 Jun 2024 10:53:07 +0000
Date: Tue, 18 Jun 2024 12:53:33 +0200
Message-ID: <87cyoe7c9e.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Subject: Re: [PATCH 3/5] ALSA: emu10k1:  Drop NULL check for snd_ctl_remove()
In-Reply-To: <20240617100529.6667-4-tiwai@suse.de>
References: <20240617100529.6667-1-tiwai@suse.de>
	<20240617100529.6667-4-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 835971F397
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-sound@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Mon, 17 Jun 2024 12:05:25 +0200,
Takashi Iwai wrote:
> 
> Since snd_ctl_remove() accepts the NULL kcontrol argument now, we can
> drop the check in the caller side.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Grrr, this is utterly broken.  Scratch this one.
Sorry for the noise.


Takashi

> ---
>  sound/pci/emu10k1/emufx.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
> index 03efc317e05f..34f385b5cd46 100644
> --- a/sound/pci/emu10k1/emufx.c
> +++ b/sound/pci/emu10k1/emufx.c
> @@ -959,7 +959,6 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
>  {
>  	unsigned int i;
>  	struct emu10k1_ctl_elem_id id;
> -	struct snd_emu10k1_fx8010_ctl *ctl;
>  	struct snd_card *card = emu->card;
>  	int err;
>  	
> @@ -968,9 +967,7 @@ static int snd_emu10k1_del_controls(struct snd_emu10k1 *emu,
>  				       in_kernel);
>  		if (err < 0)
>  			return err;
> -		ctl = snd_emu10k1_look_for_ctl(emu, &id);
> -		if (ctl)
> -			snd_ctl_remove(card, ctl->kcontrol);
> +		snd_ctl_remove(card, snd_emu10k1_look_for_ctl(emu, &id));
>  	}
>  	return 0;
>  }
> -- 
> 2.43.0
> 
