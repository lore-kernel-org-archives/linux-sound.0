Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DA932FA14
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774691690; cv=none; b=HliY78zVcrQeckPjd/VudPjHf+cUpXnj1cDsghQ75oivCamKP0gfdIKnc70bb9Gb4Yn7Iw9F1meqPGhYnT547LB5k8D82AuLNGjz9sALgj1EJ1IFdkgJQ45lGy6hMt2CjUybzl9VikQynk+iq6fkkykWITphO8BwiQ16LkAFSPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774691690; c=relaxed/simple;
	bh=A+vW8vC3f4I0+WDHZHcKWZ6Q6Ye1EYYmewmv+3SoDt8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzUx3qeWTNt9kF3WglTbAcvYYVazczy9S71EB4dO/fRoAZFlSIxfnp4LG5Og4mg+JvhV0kwuvRNYDPfRSEDRZVpr4JaEMCMMzimhQTOLG1qMwljviUwEXrUdtPzMKnBhzyC0QZisLPIXAVljCY4MKbnl4BAYxssSeQtp95kPttA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sx/3OJX6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XRsZoxKl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sx/3OJX6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XRsZoxKl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sx/3OJX6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XRsZoxKl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sx/3OJX6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XRsZoxKl"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6562D4D37F;
	Sat, 28 Mar 2026 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774691687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Si2dMQGnj6/espnNqzMGpDCimKTUH4MNPyOS49a/1JM=;
	b=sx/3OJX6m9l+bGywAi/nUM1qlxxyrI5yFWme2JucLvzh91j1geQ9P2TSn7r+4WDHtiXtmN
	lx5/a20U3Be6OuUhO7kys5NCkPT031zxLUooTnE6J/ouZ5nLYXMHdMb1GRjKATPTSJ5TP+
	1gl4cyZKMYvy+3cNuq00Mzd0WYyHDp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774691687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Si2dMQGnj6/espnNqzMGpDCimKTUH4MNPyOS49a/1JM=;
	b=XRsZoxKlRbYZRdnAPfgdQpHPJduCORgRzJXaDbA91R6553kau2b0IYJerl9Q2cQmpl1zRx
	HREluEEANvPPbDBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774691687; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Si2dMQGnj6/espnNqzMGpDCimKTUH4MNPyOS49a/1JM=;
	b=sx/3OJX6m9l+bGywAi/nUM1qlxxyrI5yFWme2JucLvzh91j1geQ9P2TSn7r+4WDHtiXtmN
	lx5/a20U3Be6OuUhO7kys5NCkPT031zxLUooTnE6J/ouZ5nLYXMHdMb1GRjKATPTSJ5TP+
	1gl4cyZKMYvy+3cNuq00Mzd0WYyHDp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774691687;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Si2dMQGnj6/espnNqzMGpDCimKTUH4MNPyOS49a/1JM=;
	b=XRsZoxKlRbYZRdnAPfgdQpHPJduCORgRzJXaDbA91R6553kau2b0IYJerl9Q2cQmpl1zRx
	HREluEEANvPPbDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FD454A0A3;
	Sat, 28 Mar 2026 09:54:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WPKVCWelx2k8RwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 09:54:47 +0000
Date: Sat, 28 Mar 2026 10:54:46 +0100
Message-ID: <875x6gwa6x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sourav Nayak <nonameblank007@gmail.com>
Cc: greg@kroah.com,
	linux-sound@vger.kernel.org,
	stable@vger.kernel.org,
	tiwai@suse.com,
	tiwai@suse.de
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: add quirk for HP Victus 15-fb0xxx
In-Reply-To: <20260327142805.17139-1-nonameblank007@gmail.com>
References: <CAJ9UwXAYD2PwdBnt=hFKkbKUTm9kY8zXacAgE6zXDKOLhBKmKQ@mail.gmail.com>
	<20260327142805.17139-1-nonameblank007@gmail.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Fri, 27 Mar 2026 15:28:05 +0100,
Sourav Nayak wrote:
> 
> This adds a mute led quirck for HP Victus 15-fb0xxx (103c:8a3d) model
> 
> - As it used 0x8(full bright)/0x7f(little dim) for mute led on and other values as 0ff (0x0, 0x4, ...)
> 
> - So, use ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT insted for safer approach
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Sourav Nayak <nonameblank007@gmail.com>

Applied now.  Thanks.


Takashi
