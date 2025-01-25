Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB8523B0
	for <linux-sound@vger.kernel.org>; Sat, 25 Jan 2025 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737806753; cv=none; b=jArLkVg2AUoMY0eNPRUKlInNCkRsQ/YEurcCErplflDa0ruKN0wbM2xwiwBVSunuqADT9Ut20o83kU4be3b6y7HqadnPveYfOYAwePu3LAbOJdkOSuYpX2OVOvPeCn1NTCboHpinPTieBcDTzvo/k2C5UhfS4xwIhxxkT9Y+JiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737806753; c=relaxed/simple;
	bh=uIcZaaxcvJOdBSoEhVvayj/k/plwnAiIgS+WyHVo/88=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAIQX57JhKEZgEMz04E3f/3j/Z2m1n+Q6iV9cNu10u1P2Gv0XcVI5dZUPcCGpPW/TJ+oZeCVF0ugHGEz9tMOyI/Xr0vvqhcZa03fYOsEcGiuPGs1LTHRoeHJmy1gcvaz1L373+gtZQ4YljbJHZHXf0/rzKSkuvV7Wii/XHQG69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=02uUCTrI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hXf0iIHr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=02uUCTrI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hXf0iIHr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="02uUCTrI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hXf0iIHr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="02uUCTrI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hXf0iIHr"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58E8121160;
	Sat, 25 Jan 2025 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737806744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UimsOpUNFyLNcGrmj52kLWZ+1YGFc302Z96VC6AQXoE=;
	b=02uUCTrIeysg9rU7qhiayW+enZDb16Edks/UpaO7pI4GLd1eiVLGvC3Ei3O5AfnVuo5vDr
	Jhe/TbP2Y52uM9xBp6kYcMrz7KAIZ1VhCX3G8JB6bqDZ1MewblRdxj6pm5tMCnyMS0Bzmz
	Z778wGYC5YUf1uyhnpd/jaIOSz0AKX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737806744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UimsOpUNFyLNcGrmj52kLWZ+1YGFc302Z96VC6AQXoE=;
	b=hXf0iIHr053ckJCRix2CTH9+88wbvBNuH/zy/94mvptqzel/K1DX4ugiK0Onh/KPqgFzpP
	iqeuFgFVFpZr4hCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1737806744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UimsOpUNFyLNcGrmj52kLWZ+1YGFc302Z96VC6AQXoE=;
	b=02uUCTrIeysg9rU7qhiayW+enZDb16Edks/UpaO7pI4GLd1eiVLGvC3Ei3O5AfnVuo5vDr
	Jhe/TbP2Y52uM9xBp6kYcMrz7KAIZ1VhCX3G8JB6bqDZ1MewblRdxj6pm5tMCnyMS0Bzmz
	Z778wGYC5YUf1uyhnpd/jaIOSz0AKX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737806744;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UimsOpUNFyLNcGrmj52kLWZ+1YGFc302Z96VC6AQXoE=;
	b=hXf0iIHr053ckJCRix2CTH9+88wbvBNuH/zy/94mvptqzel/K1DX4ugiK0Onh/KPqgFzpP
	iqeuFgFVFpZr4hCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 37E5613882;
	Sat, 25 Jan 2025 12:05:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P0xnDJjTlGcbPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 25 Jan 2025 12:05:44 +0000
Date: Sat, 25 Jan 2025 13:05:43 +0100
Message-ID: <87ikq314ko.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samantha Glocker <iam@anislandsomewhere.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: possible issue with ALSA: hda/realtek: Use codec SSID matching for Lenovo devices
In-Reply-To: <CAGPQRHYXcbWTiKpCANEQ1mq9aUHM=v82T231fw7Ld=C-NM4+Bw@mail.gmail.com>
References: <CAGPQRHYd48U__UKYj2jJnT4+dnNNoWRBi+wj6zPRn=JpNMBUrg@mail.gmail.com>
	<87a5bj8gax.wl-tiwai@suse.de>
	<878qr38g6r.wl-tiwai@suse.de>
	<87v7u76xhl.wl-tiwai@suse.de>
	<CAGPQRHaDRLTRisn68TA26sBM1PKVoUcDsKSQVrCsR7MinQbSmQ@mail.gmail.com>
	<87a5bh6b6y.wl-tiwai@suse.de>
	<CAGPQRHYG_BUSjWSN4LH4oPeM5h4E30WSyfaRynYhrcDYT95dXg@mail.gmail.com>
	<CAGPQRHYXcbWTiKpCANEQ1mq9aUHM=v82T231fw7Ld=C-NM4+Bw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 24 Jan 2025 23:58:29 +0100,
Samantha Glocker wrote:
> 
> Hi Takashi,
> 
> Sorry for the delay I had a build pipeline problem.
> 
> Confirming your TIA patch works perfectly on my 16ARX8H. The TI amp is
> detected and enabled correctly again.
> 
> We're including it in the nobara and cachyOS kernels.

Good to hear.  I'm going to submit the fix patch for the upstream.


Takashi
