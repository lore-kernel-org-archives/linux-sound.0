Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935396F307
	for <linux-sound@vger.kernel.org>; Fri, 28 Jun 2024 11:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719575131; cv=none; b=P0nBL4GIg/Fao1luhRLSKGHlfWgd0YiTLbJlS+QReQjDSZU3TrfUhMikp1IqvNBtZVpkibxSzMja9l8u9tmHEE1NT8H3PlESzdt2oZAhAFYT3dGCe5OeLxdQ1uCdvuSBCkE2mBzDgrJ/t8bteUiNrxT79vOyhuTO7QNFLicllX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719575131; c=relaxed/simple;
	bh=3zwUtbKot+F9wAFW5Dc2BfKZm6+XI2ncRd7DomKn+Go=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U26iiojivg+IxuwgFGPJ4zyzYyIR2XWjZ8XynCmNwRhRVCTbzwrMVWIwe4P71zi/yUyrOpl/t5BWEpDxl5IauDeHkXVpwxLUvDW9ydEDKnUN8nwSpXxmYuLpwRJ1w/GEFhBMzlDy15S2BmLOmu7bhajMYfDmLEB5FRLrKzn8ol4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ode0nlTS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ScgPbkeU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ode0nlTS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ScgPbkeU; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ode0nlTS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ScgPbkeU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ode0nlTS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ScgPbkeU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CEA551F449;
	Fri, 28 Jun 2024 11:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719575127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/p+vavbtBLrZ5vZyfPznaQTj9i2Go1WHR6c5cNcxPw=;
	b=Ode0nlTSgoMbdoxzZDPvfEX3rjoxgb+mDDKzRuhPhAdMo+bqon1urxUWMtU3Caar6LoOep
	o7y+uyrGfrJg0WliGUj5CWUy49x94ac7KeJzTdeibmT1W8+dK2KaSOVosVnyjMcE6ombDP
	IQzvOhUzSQYf+kLZdr8hmJvYgKwAqZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719575127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/p+vavbtBLrZ5vZyfPznaQTj9i2Go1WHR6c5cNcxPw=;
	b=ScgPbkeUUaIRWmZlFHE9ngQSmEkm9Y3mC+aFUxDrPs+Zddt5YDjX8X+Wy4B1tHiirRBV9S
	uITF1Ns6gHUF9AAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1719575127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/p+vavbtBLrZ5vZyfPznaQTj9i2Go1WHR6c5cNcxPw=;
	b=Ode0nlTSgoMbdoxzZDPvfEX3rjoxgb+mDDKzRuhPhAdMo+bqon1urxUWMtU3Caar6LoOep
	o7y+uyrGfrJg0WliGUj5CWUy49x94ac7KeJzTdeibmT1W8+dK2KaSOVosVnyjMcE6ombDP
	IQzvOhUzSQYf+kLZdr8hmJvYgKwAqZo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1719575127;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/p+vavbtBLrZ5vZyfPznaQTj9i2Go1WHR6c5cNcxPw=;
	b=ScgPbkeUUaIRWmZlFHE9ngQSmEkm9Y3mC+aFUxDrPs+Zddt5YDjX8X+Wy4B1tHiirRBV9S
	uITF1Ns6gHUF9AAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA7C513375;
	Fri, 28 Jun 2024 11:45:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cthXKFeifmaqYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Jun 2024 11:45:27 +0000
Date: Fri, 28 Jun 2024 13:45:55 +0200
Message-ID: <87pls1b898.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: Dell OptiPlex 5080: `Unstable LPIB (352800 >= 176400); disabling LPIB delay counting`
In-Reply-To: <a653c2f1-9095-4b21-aa22-c26504ef3efc@molgen.mpg.de>
References: <a653c2f1-9095-4b21-aa22-c26504ef3efc@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-2.99)[99.95%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4]
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 

On Fri, 28 Jun 2024 13:11:18 +0200,
Paul Menzel wrote:
> 
> Dear Linux folks,
> 
> 
> On a Dell OptiPlex 5080/032W55, BIOS 1.17.1 12/18/2022 Linux 6.6.12
> and 6.6.35 sometimes log (`sound/pci/hda/hda_intel.c`):
> 
>     snd_hda_intel 0000:00:1f.3: Unstable LPIB (352800 >= 176400);
> disabling LPIB delay counting
> 
> Is there a problem with the system? The value seems exactly double of
> the limit.

It was about the PCM position reporting and the hardware report is
somewhat flaky, so the driver gave up to take the LPIB register value
for delay calculation.  The position itself is reported by other ways,
hence it's no serious issue and in most cases you can ignore it.


Takashi
