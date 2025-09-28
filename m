Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024016A956
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 16:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759078014; cv=none; b=PY5isHKMw+Dkg92m5oo0Ktq1SmG/WTkJYYvWv+TWW8QaaWpK+LZhiarSkEGdkKsTnW4E7WhIRgf1MCVO4/StE8YXYmcf9WbAMeW6utzKNDchoXDWfmsDxftPcRliPU6XkpZtDlDUBOO/6Z+78r/Y883I1IDiMBIjflqbfSjk3J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759078014; c=relaxed/simple;
	bh=gnwJ+K8srNdqC1VWMSJECjCeZLd84FqhOTynejNRUYk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Upsou9+U+Q/G9cYbqIKjmrk8HBPxXKD7Y/rLv0ja5qpn8XdcKN/U2fDQIgQTem4CPOpunclnvx8KQ64tMx7XRFcxd2tE1UX235IYI+fOKPfJyw+MmcC+ows/BaPdjjAH3fZqIOSHxercKCSYPz7zeeIQQjlFw/QiDodIiugwX1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yHckxlGi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=385dGQ1m; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yHckxlGi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=385dGQ1m; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yHckxlGi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="385dGQ1m";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yHckxlGi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="385dGQ1m"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9D1D428A74;
	Sun, 28 Sep 2025 16:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759078010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNjgo/X7viv1++FuQoXx0ddAlL3v7tMHeFlpRWiVZNM=;
	b=yHckxlGiyGcSHmzOcU+TI2IKMiUEc/eRH2RTTVwoaXYvBCFBM50FbojGM3NvblHUH6o+xA
	auk/s+HYnmorFh/h6cJFOfaxGupOBeb3Qoi0hKLiCzaKh9u5L/FgKsKPQEGj7mTaNVAChs
	g/+LGL+1eO848iwvs9FIXAblRta9wPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759078010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNjgo/X7viv1++FuQoXx0ddAlL3v7tMHeFlpRWiVZNM=;
	b=385dGQ1mdOnQDMVyDAe519az2Vg0UNW6lv0QItFygabWD4LSsDMqZP7gvc8nqlhNqv3tja
	2MS1soIggcXnZZCA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yHckxlGi;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=385dGQ1m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759078010; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNjgo/X7viv1++FuQoXx0ddAlL3v7tMHeFlpRWiVZNM=;
	b=yHckxlGiyGcSHmzOcU+TI2IKMiUEc/eRH2RTTVwoaXYvBCFBM50FbojGM3NvblHUH6o+xA
	auk/s+HYnmorFh/h6cJFOfaxGupOBeb3Qoi0hKLiCzaKh9u5L/FgKsKPQEGj7mTaNVAChs
	g/+LGL+1eO848iwvs9FIXAblRta9wPc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759078010;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RNjgo/X7viv1++FuQoXx0ddAlL3v7tMHeFlpRWiVZNM=;
	b=385dGQ1mdOnQDMVyDAe519az2Vg0UNW6lv0QItFygabWD4LSsDMqZP7gvc8nqlhNqv3tja
	2MS1soIggcXnZZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76C8E13A3F;
	Sun, 28 Sep 2025 16:46:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id of86G3pm2WglNgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Sep 2025 16:46:50 +0000
Date: Sun, 28 Sep 2025 18:46:50 +0200
Message-ID: <87ecrq8qyt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 0/2] ALSA: usb-audio: add the initial mix for Presonus Studio 1824c
In-Reply-To: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>
References: <cover.1759059196.git.roy.vegard.ovesen@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 9D1D428A74
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Sun, 28 Sep 2025 13:37:44 +0200,
Roy Vegard Ovesen wrote:
> 
> This adds a reaonable initial mix for the Presonus Studio 1824c.
> 
> The main reason for submitting a patchset is for me to practice
> the different patch submit variants.
> 
> Roy Vegard Ovesen (2):
>   ALSA: usb-audio: add the initial mix for Presonus Studio 1824c
>   ALSA: usb-audio: don't hardcode gain for output channel of Presonus
>     Studio

Applied both patches now.  Thanks.


Takashi
