Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86FC283FD8
	for <linux-sound@vger.kernel.org>; Tue, 24 Feb 2026 15:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948769; cv=none; b=ARX7hnEPntLaFo4Mct/k5mXwWS9Z5yOwg5RBFhLQKBUlntv8StPWex1CDOYMHH8N0Ir0479YhKKbyyHEf9nJa5EwqShuaVo4mUGbZoYK8XuJaRZ99xRTcEbofZfsx36ixjYMYjoxnm3OgKA2n6xKl5fvVbXQNtDxy4EirJbXVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948769; c=relaxed/simple;
	bh=0Qa01lLMz7kpASrX8cUnfyr8/WhbTegO0Njw42vnQ3U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkFsaNnSKb8VSRFtvPnkMnf+HCqbqRTwY7FZLyybfNZO8WXhK2Hg69HBEjiD6/hPO1gjHTeAZjzR5dvbLLSxgorZH77kIrY4yoFH8XL/sQlOjeeSGBSAaf7Xc56DiVNv/V5jXfFUP+N0Wh4J8jfSZ5aZaK69YW/tY6c2axjusDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qTkDXUwM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=25Vj3dH2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qTkDXUwM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=25Vj3dH2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qTkDXUwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="25Vj3dH2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qTkDXUwM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="25Vj3dH2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 11F2A5BCE9;
	Tue, 24 Feb 2026 15:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771948766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auE1789Y7AxPN2YmqKXC+pQ/TGGGbhytiPBCuvAmozs=;
	b=qTkDXUwM7Or8fAPgy7EahK+fU5TIBgzf8qNjz1NPupcqu9LQQjVfwkJwCEknnwWapG4jW/
	Upqoc63fJN1VModD/9truRhO1MX3RfF0SfuN8p6HwND2QFHxsTx8EpGo+Jwf4KOKCV9b3h
	j3yMYQUOYaV9pqRdJqSrjW2OooudR8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771948766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auE1789Y7AxPN2YmqKXC+pQ/TGGGbhytiPBCuvAmozs=;
	b=25Vj3dH24Br+bHf2QILsPEdtmfQCEweC7iS5Wt0R+CG/yNtq+aOnWbqiRAArktqTo8+mr4
	RN7lqqhmU/DmR5BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771948766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auE1789Y7AxPN2YmqKXC+pQ/TGGGbhytiPBCuvAmozs=;
	b=qTkDXUwM7Or8fAPgy7EahK+fU5TIBgzf8qNjz1NPupcqu9LQQjVfwkJwCEknnwWapG4jW/
	Upqoc63fJN1VModD/9truRhO1MX3RfF0SfuN8p6HwND2QFHxsTx8EpGo+Jwf4KOKCV9b3h
	j3yMYQUOYaV9pqRdJqSrjW2OooudR8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771948766;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auE1789Y7AxPN2YmqKXC+pQ/TGGGbhytiPBCuvAmozs=;
	b=25Vj3dH24Br+bHf2QILsPEdtmfQCEweC7iS5Wt0R+CG/yNtq+aOnWbqiRAArktqTo8+mr4
	RN7lqqhmU/DmR5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D96033EA68;
	Tue, 24 Feb 2026 15:59:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x7FYNN3KnWkgLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Feb 2026 15:59:25 +0000
Date: Tue, 24 Feb 2026 16:59:17 +0100
Message-ID: <875x7mf7ze.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	<tiwai@suse.com>,
	<broonie@kernel.org>,
	<perex@perex.cz>,
	<amade@asmblr.net>,
	<kuninori.morimoto.gx@renesas.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH v6] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <8cfa8e20-1b6a-4d8f-8914-e085e839d250@intel.com>
References: <20260223144937.524019-1-cezary.rojewski@intel.com>
	<87o6lexs08.wl-tiwai@suse.de>
	<8cfa8e20-1b6a-4d8f-8914-e085e839d250@intel.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Tue, 24 Feb 2026 16:46:55 +0100,
Cezary Rojewski wrote:
> 
> On 2026-02-24 1:09 PM, Takashi Iwai wrote:
> > On Mon, 23 Feb 2026 15:49:37 +0100,
> > Cezary Rojewski wrote:
> 
> ...
> 
> >> --- a/sound/core/init.c
> >> +++ b/sound/core/init.c
> > (snip)
> >> @@ -537,6 +542,9 @@ void snd_card_disconnect(struct snd_card *card)
> >>   		synchronize_irq(card->sync_irq);
> >>     	snd_info_card_disconnect(card);
> >> +#ifdef CONFIG_SND_CTL_DEBUG
> >> +	kfree(card->value_buf);
> >> +#endif
> >>   #ifdef CONFIG_SND_DEBUG
> >>   	debugfs_remove(card->debugfs_root);
> >>   	card->debugfs_root = NULL;
> > 
> > IMO, it's better to be put in snd_card_do_free() which is the place to
> > release the actual resources.
> 
> No problem, a question though - I've written the above to be cohesive
> as CONFIG_SND_DEBUG-part isn't part of snd_card_do_free() and what I'm
> adding is definitely also of debug-related capability. IIRC
> debugfs_remove() may invoke kfree() operations. Why isn't it part of
> snd_card_do_free() too?

The *_disconnect() is a stage to stop the operation and disconnect the
interfaces from user-space, so debugfs_remove() is invoked there.
You can do kfree() if all things are detached, but in general we do
the release in a later phase, as some objects may be still alive.

snd_card_do_free() is the actual destructor for the resources, where
all things can be safely freed.


Takashi
