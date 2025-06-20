Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326928A712
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421554; cv=none; b=O3/saCGjA6CSj3KF891+ThApy0lSpITPOp7QvH1p3cSL+n/vwG3V5CWhcRAuBFbHRukhOzIKFica3keCC5sItZhGQpX5CXne63sQKxbR8M35GmZmToYWsgi9+y3F6t8EUWQfx3g6bbfkhgQxlmnCBhv/joNDgmUmLU3t4J7WhPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421554; c=relaxed/simple;
	bh=cGyfOYfunNwhlBLqjrLXazzxdmd+s27MfTzgF33hmio=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q5PcSlm53o6IZH0Ypz/XtLepAeM1HQq+8+aMTBChiHG2/dKDLJ38Hd6bHMFzDs2nBxsg+zcf/lBl28UkUfsrU/D0xnAei4ITX0jzk/CuqdKEVpOZwEkqCIVfSy4achXMZFCnD0HgeNPzQcMwAFmA6uBXjebd9GiCvl0iVPcoCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cGoBV5DS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JR+NCr8S; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZF0KY3Kl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xn4oeVhm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cGoBV5DS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JR+NCr8S";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZF0KY3Kl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xn4oeVhm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9D371F38D;
	Fri, 20 Jun 2025 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750421551; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DC0OZZ7DIHFx+P/JrS2+b16oOXHBoTcmLmRMHjX+Q4g=;
	b=cGoBV5DSUl+YXnGx6TMsELhmkiAtDsyWb9xCTom6drzD+IOKf6j0mOdhBkx7vE3igasMYT
	gFU22b+IFgwmysP3PSxwys9WTZHOYedA77aI2eH1G0PJb8ICNZRxB8MYvPn/fsRMC6zzBa
	xKB1zMEFFzgRAKZP3qM3MkSEIx/Y7EY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750421551;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DC0OZZ7DIHFx+P/JrS2+b16oOXHBoTcmLmRMHjX+Q4g=;
	b=JR+NCr8SRwCH/YBgO08tirdDlhKoWiYSUSzhi76NxLgqYRGvJ7DcmyOSDCkU+VeAUlv3ki
	n9oYPsT+2H+PTcAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZF0KY3Kl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Xn4oeVhm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750421549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DC0OZZ7DIHFx+P/JrS2+b16oOXHBoTcmLmRMHjX+Q4g=;
	b=ZF0KY3KlLUId5M4QuN7UxumKQ94mvOO5AUy1BuTZ6gTzr9H2H7m+chGmV3/j3meX4yJXfg
	ZpzhTC+zV4LU+fUU4F5StnUKmKPgWc9VC1kzfrJd+nu10GnGxqdQ8UV9AObiRQHwVIO7Yz
	A0/BmL3y8X+DG2wGBGoDGa0Wdqe3NtY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750421549;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DC0OZZ7DIHFx+P/JrS2+b16oOXHBoTcmLmRMHjX+Q4g=;
	b=Xn4oeVhm3zQJpLPozsnIr+EqaxOWlPc4hnb5vAOngIdCkzpl5OFOQnWIxGEwN/LbdW3J9P
	p12wxq1jVcSy3LBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B148C13736;
	Fri, 20 Jun 2025 12:12:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KesOKi1QVWjaIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Jun 2025 12:12:29 +0000
Date: Fri, 20 Jun 2025 14:12:29 +0200
Message-ID: <87bjqiwr0y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: joakim.zhang@cixtech.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	geans_chen@realsil.com.cn,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH V1 3/4] ALSA: hda: disable jackpoll_in_suspend when system shutdown
In-Reply-To: <20250619020844.2974160-4-joakim.zhang@cixtech.com>
References: <20250619020844.2974160-1-joakim.zhang@cixtech.com>
	<20250619020844.2974160-4-joakim.zhang@cixtech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E9D371F38D
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 19 Jun 2025 04:08:43 +0200,
joakim.zhang@cixtech.com wrote:
> 
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> When do reboot test, kernel panic when system shutdown since
> jackpoll delayed work tries to read registers via hda bus
> but the drivers are all shut down.
> 
> The root cause is that when system shutdown but codec may in
> runtime resume state, call runtime force suspend would trigger
> jackpoll delayed work active again, finally cause the kernel
> panic since it access registers with clocks/reset/power off.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  sound/pci/hda/hda_codec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
> index 12caa5b2e678..e3424ac7b5a7 100644
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -3026,6 +3026,7 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
>  	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
>  		snd_pcm_suspend_all(cpcm->pcm);
>  
> +	codec->bus->jackpoll_in_suspend = 0;
>  	pm_runtime_force_suspend(hda_codec_dev(codec));

This one should be better with codec->jackpoll_interval = 0, set
before cancel_work_sync().  Then it'll guarantee that the jackpoll
work won't be called any more.


thanks,

Takashi
