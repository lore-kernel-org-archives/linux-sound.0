Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B931BC95
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769783352; cv=none; b=uJXiaej9Phdoe7y0sBZ+EZ27/Dm9ZORzXuoW7QNC/AUoORWjQ41QjPsug8pPmqhNfss4+EuEAE5w4Uj1mrbo5rZfukdksNPyxSqqBGzlwloUCtuhU7TYGENWjMrdxsGzzZ0r8d0cXGD2IjNxkLgWhFLJj1ps1N5U9iex/EP6xkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769783352; c=relaxed/simple;
	bh=h29aTaXTI086pwIQJfczPv7PEwLE2hK/lmevBcraaAA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qlRYIwjYlrpDVPGbWZVEQ5c7nqldrYr0AZ+HPooNh7NMBTvsPM92+EEEvKInVaI+lr7xoru3YAQlEet79prEx82osCt7SdKnF4GuMdAaoTvpkbIFrAOX/OD5+ujtRFZs0+7DX4XOeskigfWShxpsGkfxiaqf2VWY12qd/4IZ/6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r3fPgie+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wxlvAeCU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=r3fPgie+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wxlvAeCU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r3fPgie+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wxlvAeCU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="r3fPgie+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wxlvAeCU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3E2123473D;
	Fri, 30 Jan 2026 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769783349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC/nrSEzBnuICWz/QHrvX6JFmmJ3JYBRVJBD5vYPrT8=;
	b=r3fPgie+zE7+634hDss16SzEUxTD9xpxv8aqJKhyVlVJcWc/i+p78JnzJdzQ2QcIA45jxm
	mTnYiJSJuCjPiP6z0MnbAz1nH1Xx18Fjo6uNCqODOCHOWFUeFLfadMUp9N6fCiZZ7O9p3/
	eUVddei1o/UBCfk3ODHhBwLpesD5y38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769783349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC/nrSEzBnuICWz/QHrvX6JFmmJ3JYBRVJBD5vYPrT8=;
	b=wxlvAeCUGUPPdD9NAeH/6vU/STDabG/LTgW1QbL0l706yurqO/cRJJB0FmkIUCMueo8pbD
	WJqNmpB4YjgdonAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769783349; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC/nrSEzBnuICWz/QHrvX6JFmmJ3JYBRVJBD5vYPrT8=;
	b=r3fPgie+zE7+634hDss16SzEUxTD9xpxv8aqJKhyVlVJcWc/i+p78JnzJdzQ2QcIA45jxm
	mTnYiJSJuCjPiP6z0MnbAz1nH1Xx18Fjo6uNCqODOCHOWFUeFLfadMUp9N6fCiZZ7O9p3/
	eUVddei1o/UBCfk3ODHhBwLpesD5y38=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769783349;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eC/nrSEzBnuICWz/QHrvX6JFmmJ3JYBRVJBD5vYPrT8=;
	b=wxlvAeCUGUPPdD9NAeH/6vU/STDabG/LTgW1QbL0l706yurqO/cRJJB0FmkIUCMueo8pbD
	WJqNmpB4YjgdonAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9ED63EA61;
	Fri, 30 Jan 2026 14:29:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LbvVNzTAfGm2TwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 30 Jan 2026 14:29:08 +0000
Date: Fri, 30 Jan 2026 15:29:08 +0100
Message-ID: <87ikcjxjgr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	kuninori.morimoto.gx@renesas.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
	<60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 30 Jan 2026 15:12:58 +0100,
Mark Brown wrote:
> > +	struct snd_ctl_elem_value original;
> 
> > +	ret = kctl->get(kctl, &original);
> > +	if (ret)
> > +		return ret;
> 
> > +	retcmp = memcmp(&original.value.bytes.data[0], &control->value.bytes.data[0],
> > +			sizeof(original.value.bytes.data[0]));
> > +	if (retcmp)
> > +		retcmp = 1;
> 
> original was just allocated from the stack so who knows what values it
> had originally, and the get() is only going to write the part of the
> value that has data since the normal get() path has a memset() in the
> core.  Similarly with the new value coming in from userspace there's no
> requirement for userspace to set anything that isn't part of the value
> being written to any particular value.  This means we're liable to get
> spurious mismatches.

Yes, and if I understand correctly, the above memcmpy() just compare
the single byte from original and the result?  Then it'll lead to
false-positive outputs.

We'll need to query the control info and check the relevant values
for each info->type and count.

Also, better to name it snd_ctl_put_verify() instead of
snd_ctl_write_verify(); it's an equivalent with snd_ctl_put() having
an additional verification.


thanks,

Takashi
