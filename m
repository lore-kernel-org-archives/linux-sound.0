Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F9B2253E4
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 18:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760638748; cv=none; b=pT1lHIFbrrxR1KVq1IvWkyP8/W7JR7B3Cfuw3gO0K45xhUwABk/mOKlTvHibBg2qaGh3ES00NmtnMqK7ZvIYjQ4iJPlB8+wwaeHWNY0zcRSLIeK9xW2cso49bz7HlD9qBbtcClnGrwDPfuuuKHd2mNpeMNxDzUbyb1R//iI3GMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760638748; c=relaxed/simple;
	bh=pJREnvJ2VdG92iU6WLEuSHrRXejsWOpIZieABCW/nLQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6IAsY85k1NtmYnUfKVpixrf93QXiwHmonrUpoaLt+TeOETkO02kRxQeO9wheZBn8nJSLotbJJ7kzbltnbu3fSpB6qF1b8YhM+Wq2ZF+OCoxEPCXIDJ//pHd70JGUBlnpphZlzar9xbLBABM49sUCoye63ahOe2au9cts6gKlk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n4MxHswO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J+rKLfPX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=n4MxHswO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=J+rKLfPX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n4MxHswO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J+rKLfPX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="n4MxHswO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="J+rKLfPX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2143F21DEC;
	Thu, 16 Oct 2025 18:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760638745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=n4MxHswO5wewn3IDNMqCBhJR4LrLBFVZx5NKog/yQtmjPqgkDVHvPc3qHUqvMHgoY+4BcF
	vdHNJOKSrlMNeuzEiqC0YKYeb3ZJ/9FfM7iFykwo7vtkdQV462vL0e3T0taU5gMQnBjI+C
	d4K8lZluyTXVm6xhfAM93zU1ybaKyvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760638745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=J+rKLfPXIkhnVxnJhuKXTmzKJQenAwhdmAkhfOncw3XWsCDWSUCsrUiQKPw3grYMjADq6s
	BApgNUbtHXXdaEBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760638745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=n4MxHswO5wewn3IDNMqCBhJR4LrLBFVZx5NKog/yQtmjPqgkDVHvPc3qHUqvMHgoY+4BcF
	vdHNJOKSrlMNeuzEiqC0YKYeb3ZJ/9FfM7iFykwo7vtkdQV462vL0e3T0taU5gMQnBjI+C
	d4K8lZluyTXVm6xhfAM93zU1ybaKyvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760638745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQk2jtiUQF9M2Rh3SYURt/G9ZpH/KRHN004e7QFSMM=;
	b=J+rKLfPXIkhnVxnJhuKXTmzKJQenAwhdmAkhfOncw3XWsCDWSUCsrUiQKPw3grYMjADq6s
	BApgNUbtHXXdaEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF5CC1376E;
	Thu, 16 Oct 2025 18:19:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0/c7NRg38WjlYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 16 Oct 2025 18:19:04 +0000
Date: Thu, 16 Oct 2025 20:19:04 +0200
Message-ID: <874iry7lrb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc1
In-Reply-To: <e26bc312636de276f8c7e46cba269b7f@kernel.org>
References: <e26bc312636de276f8c7e46cba269b7f@kernel.org>
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
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 16 Oct 2025 19:04:02 +0200,
Mark Brown wrote:
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc1
> 
> for you to fetch changes up to f1a450f9e17d341f69f8fb19f6d13ef9f1aa508b:
> 
>   ASoC: nau8821: Fix IRQ handling and improve jack (2025-10-16 12:41:35 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A moderately large collection of driver specific fixes, plus a few new
> quirks and device IDs.  The NAU8821 changes are a little large but more
> in mechanical ways than in ways that are complex.

Pulled now.  Thanks.


Takashi
