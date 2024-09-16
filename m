Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AEB20B22
	for <linux-sound@vger.kernel.org>; Mon, 16 Sep 2024 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726471194; cv=none; b=hZTKsSuaA7HXfNdIVA+bZkFFVAr8iQ/nxsvCyjKlA1Gk11DUaEu/H4GtBOuYKOmbbPp/3aH1kYLA+uylMlZSXyu7hbHuWKopAbWCsfCOjnfcxuTy428nIX576Uy97F7ljlSdV8yujPnw/j3Sl28wzTncbHU1OwSl7ZD1NfHa3ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726471194; c=relaxed/simple;
	bh=QOo23gY4QvitEu/rr6FvfP9upGsCXdym1UJigOT3XN0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g1L3sayvruWU/s6l8ux28djYMwYbpO2UiAdElS4buzrxgTgpUibFKGpwOLIDGh4GtxwyAAUiRsz3c211P/5qXU4A7nZMCy93uu6j8wVm2D5Ff6vNrjHhxUe5yxQC8KgCZHpVh6Gu86NiXd2d4y0EzpDFO7dGPzmI1Mt17XouLpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q4MCnYsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H4aIUubC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=q4MCnYsJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=H4aIUubC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q4MCnYsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H4aIUubC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="q4MCnYsJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="H4aIUubC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67FC121B6E;
	Mon, 16 Sep 2024 07:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726471190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bza3YDIt+YwfG3U4Jh4DzQxInnAwW9kMJootNogkXgw=;
	b=q4MCnYsJMirsbIZBLEjZaGSkBJYFUpzJ8fBQArqjiwmUXVBBtMvaFrbx/sqpn3LmewpHjG
	3zt944GeB2Z08/vvlYOZ7v1yYQfIYF+2y+MW8J82NoNM2QUfCK1RQLF2RMp5Ik6gpnQbaj
	i8jP480sl7PPiQlzlIhvBTvE3uyttiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726471190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bza3YDIt+YwfG3U4Jh4DzQxInnAwW9kMJootNogkXgw=;
	b=H4aIUubCdmQGWKNs/b+PRNml98rqfk9DAf3xUL2D98o/+S7+I3Hma86K+PViAhwkr/alkz
	bUalbjD+cOeQt/CA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=q4MCnYsJ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=H4aIUubC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1726471190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bza3YDIt+YwfG3U4Jh4DzQxInnAwW9kMJootNogkXgw=;
	b=q4MCnYsJMirsbIZBLEjZaGSkBJYFUpzJ8fBQArqjiwmUXVBBtMvaFrbx/sqpn3LmewpHjG
	3zt944GeB2Z08/vvlYOZ7v1yYQfIYF+2y+MW8J82NoNM2QUfCK1RQLF2RMp5Ik6gpnQbaj
	i8jP480sl7PPiQlzlIhvBTvE3uyttiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726471190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bza3YDIt+YwfG3U4Jh4DzQxInnAwW9kMJootNogkXgw=;
	b=H4aIUubCdmQGWKNs/b+PRNml98rqfk9DAf3xUL2D98o/+S7+I3Hma86K+PViAhwkr/alkz
	bUalbjD+cOeQt/CA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E6971397F;
	Mon, 16 Sep 2024 07:19:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nIv4DRbc52YcKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Sep 2024 07:19:50 +0000
Date: Mon, 16 Sep 2024 09:20:39 +0200
Message-ID: <87zfo883p4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] ALSA: emu10k1: Refactor copy_to_user() usage in snd_emu10k1_fx8010_ioctl()
In-Reply-To: <c288ff88-4bb2-4d51-8fd5-2c626c3963b7@web.de>
References: <c288ff88-4bb2-4d51-8fd5-2c626c3963b7@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 67FC121B6E
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 15 Sep 2024 16:24:25 +0200,
Markus Elfring wrote:
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 15 Sep 2024 16:16:45 +0200
> 
> Assign values from selected expressions where copy_to_user() calls
> are involved to additional local variables so that the number of
> kfree() calls can be reduced accordingly.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

This doesn't look like an improvement.  With the refactoring, it's
rather harder to read.


thanks,

Takashi

> ---
>  sound/pci/emu10k1/emufx.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
> index 03efc317e05f..2f20878a78c9 100644
> --- a/sound/pci/emu10k1/emufx.c
> +++ b/sound/pci/emu10k1/emufx.c
> @@ -2496,12 +2496,12 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, un
>  		if (!info)
>  			return -ENOMEM;
>  		snd_emu10k1_fx8010_info(emu, info);
> -		if (copy_to_user(argp, info, sizeof(*info))) {
> +
> +		{
> +			unsigned long ctu = copy_to_user(argp, info, sizeof(*info));
>  			kfree(info);
> -			return -EFAULT;
> +			return ctu ? -EFAULT : 0;
>  		}
> -		kfree(info);
> -		return 0;
>  	case SNDRV_EMU10K1_IOCTL_CODE_POKE:
>  		if (!capable(CAP_SYS_ADMIN))
>  			return -EPERM;
> @@ -2517,12 +2517,12 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, un
>  		if (IS_ERR(icode))
>  			return PTR_ERR(icode);
>  		res = snd_emu10k1_icode_peek(emu, icode);
> -		if (res == 0 && copy_to_user(argp, icode, sizeof(*icode))) {
> +
> +		{
> +			bool ctu = res == 0 && copy_to_user(argp, icode, sizeof(*icode));
>  			kfree(icode);
> -			return -EFAULT;
> +			return ctu ? -EFAULT : res;
>  		}
> -		kfree(icode);
> -		return res;
>  	case SNDRV_EMU10K1_IOCTL_PCM_POKE:
>  		ipcm = memdup_user(argp, sizeof(*ipcm));
>  		if (IS_ERR(ipcm))
> @@ -2535,12 +2535,12 @@ static int snd_emu10k1_fx8010_ioctl(struct snd_hwdep * hw, struct file *file, un
>  		if (IS_ERR(ipcm))
>  			return PTR_ERR(ipcm);
>  		res = snd_emu10k1_ipcm_peek(emu, ipcm);
> -		if (res == 0 && copy_to_user(argp, ipcm, sizeof(*ipcm))) {
> +
> +		{
> +			bool ctu = res == 0 && copy_to_user(argp, ipcm, sizeof(*ipcm));
>  			kfree(ipcm);
> -			return -EFAULT;
> +			return ctu ? -EFAULT : res;
>  		}
> -		kfree(ipcm);
> -		return res;
>  	case SNDRV_EMU10K1_IOCTL_TRAM_SETUP:
>  		if (!capable(CAP_SYS_ADMIN))
>  			return -EPERM;
> --
> 2.46.0
> 
