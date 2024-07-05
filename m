Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E32145A0D
	for <linux-sound@vger.kernel.org>; Fri,  5 Jul 2024 07:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720165307; cv=none; b=RMEJ/VM7oL055vEgajSfDrtA02i8IuOiKrxwNwa8Ar0y2nnxIGkq7vBmqDCP/kUX7njwNPfGRjlc/fomADPW/LuZMiUkg2WpdkJYe2GTNCvY3VEze5yQUx7WSOzQnvy6LWUTUhW+keobu4It4hHP6o2vIr4zTHHOgrZ44UwBrps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720165307; c=relaxed/simple;
	bh=mjaiMsyCahfYaktI90xmcFTr/jT3IafuxaqdP/XZ8ko=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C84Pe101dutW4kHpX933LGtjTAjzirBXpwvtdjWZhHG7aoyl2V/WrnAO2K5RR6Zm/dt7kybPvX52IDQy4JMNmxRkOc6UbxR5rdN6EqPP8TwkJLqAp0NsJWM1bG705ob/Fu0DOItCnlVmCD7bvmULuIwV82JL5imj9zw3/V6trh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DZaCNCpD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QDCDGH+o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DZaCNCpD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=QDCDGH+o; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZaCNCpD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QDCDGH+o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DZaCNCpD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QDCDGH+o"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 301C51F826;
	Fri,  5 Jul 2024 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720165304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaZHvIiOnoS0NX7yVBbvH4Ajkq1bzpTjo+7FGe1/hDQ=;
	b=DZaCNCpDAFtW6livbIuMAQbpaJUkosuyJFGJSq6aYhigyAfOWMB2TPWaLCIEy1jmK3seDX
	GwO0qTiif2iUxdFJyhseOUkdiZ4osry0G2cD7LpIf+KbTgE6MPLspLRAbWRg3yZogMg+vj
	9UA4wp4TCFct05M8eXF++NhCHyFTv/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720165304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaZHvIiOnoS0NX7yVBbvH4Ajkq1bzpTjo+7FGe1/hDQ=;
	b=QDCDGH+oQexZ0ug7USm/ys96dbp4tlZsxdV1kxTx6v7pY3Ss9CAaYls601q8ATQsoQBsmt
	ud7fROY16xEg1uBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DZaCNCpD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QDCDGH+o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720165304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaZHvIiOnoS0NX7yVBbvH4Ajkq1bzpTjo+7FGe1/hDQ=;
	b=DZaCNCpDAFtW6livbIuMAQbpaJUkosuyJFGJSq6aYhigyAfOWMB2TPWaLCIEy1jmK3seDX
	GwO0qTiif2iUxdFJyhseOUkdiZ4osry0G2cD7LpIf+KbTgE6MPLspLRAbWRg3yZogMg+vj
	9UA4wp4TCFct05M8eXF++NhCHyFTv/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720165304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JaZHvIiOnoS0NX7yVBbvH4Ajkq1bzpTjo+7FGe1/hDQ=;
	b=QDCDGH+oQexZ0ug7USm/ys96dbp4tlZsxdV1kxTx6v7pY3Ss9CAaYls601q8ATQsoQBsmt
	ud7fROY16xEg1uBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 071E813889;
	Fri,  5 Jul 2024 07:41:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p7qNALijh2bQLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jul 2024 07:41:44 +0000
Date: Fri, 05 Jul 2024 09:42:13 +0200
Message-ID: <871q48i8tm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: Fix missing export of snd_pcm_set_sync_per-card()
In-Reply-To: <bffd90be-2e2b-49c5-977f-b248e3c60f55@perex.cz>
References: <20240705063555.17220-1-tiwai@suse.de>
	<bffd90be-2e2b-49c5-977f-b248e3c60f55@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 301C51F826
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 

On Fri, 05 Jul 2024 09:38:28 +0200,
Jaroslav Kysela wrote:
> 
> On 05. 07. 24 8:35, Takashi Iwai wrote:
> > The recent change for the PCM sync API forgot to export a new API
> > function that is currently used in emu10k1 driver.
> > 
> > This patch adds the missing export.
> > 
> > Fixes: d712c58c55d9 ("ALSA: pcm: optimize and clarify stream synchronization ID API")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202407051343.1Sz8AKFt-lkp@intel.com/
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >   sound/core/pcm_lib.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> > index e48a84f8e977..66683656fb13 100644
> > --- a/sound/core/pcm_lib.c
> > +++ b/sound/core/pcm_lib.c
> > @@ -547,6 +547,7 @@ void snd_pcm_set_sync_per_card(struct snd_pcm_substream *substream,
> >   	strncpy(params->sync + 4, id, len);
> >   	memset(params->sync + 4 + len, 0, 12 - len);
> >   }
> > +EXPORT_SYMBOL_GPL(snd_pcm_set_sync_per_card);
> >     /*
> >    *  Standard ioctl routine
> 
> 
> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
> 
> Thank you for this quick fix. I may also add this to the original
> patch set, if you like.

Note that the v7 patch set has been already merged, so only an
incremental fix is necessary in anyway.


thanks,

Takashi
