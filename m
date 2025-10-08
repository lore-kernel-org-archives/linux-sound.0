Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27482F2602
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 11:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924569; cv=none; b=aewIu3xSxSCYmCICWNAfmC2AcXSBqVDMeWCqEr+5ym8/+UThDbuOLP7RKgqPrBnmzmnwurWcluIgFgbYsamYH6o5kfwH50l4XqZoRRW6Ud9rzDRv1IVx3c6uLJwYqUaBDXtR7SAz73GHH5Ick3eh/AY/1Dnwy7gGHY7BAEg4Q8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924569; c=relaxed/simple;
	bh=5eKBYOPp9FiUPGhwlt5BT+q8VLxz9trj8PADWNXrDuY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsmK4ZtP1YBCDLpzAg4uMA1ID4uEV+Ds9mVMOi66rPeFGMQ9Q6DVpKBxAQ8ZByHo7f/OHJKTv8fI9CcTfS+7cFjOEaCtycRrJl47jjWi2UJq0b7UmtFZGXR2XtwzCpte8lX3Px9XLX/BrEbEE654NoaSBttr1kt7hwErPIDb64Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t1B0y3rP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B8jBf8Yz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=t1B0y3rP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=B8jBf8Yz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t1B0y3rP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B8jBf8Yz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t1B0y3rP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="B8jBf8Yz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2AB2F336A9;
	Wed,  8 Oct 2025 11:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759924566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFoKgPLLseGSTmEDJuS2hF8KtRT/6jGqdKgHmA2a8tw=;
	b=t1B0y3rP+5BOP5OXM8IevM45FFZcKadgdHRDyn9X2sNC9GX4e5N7HRC9ntLsV5h1UKIAdI
	rtSkAYHbtT3fioX0kQMZdOYSeJs3e9MyOerSvflumjrHKCG3ENLQW6pGZPZ2VMho6WCbVE
	XGYm1y4VhDAHt6G06hpnfGpbtb6JPM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759924566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFoKgPLLseGSTmEDJuS2hF8KtRT/6jGqdKgHmA2a8tw=;
	b=B8jBf8YzoWtg5seDGQTQKtb9BzmiMaW8h8hBJrI3vpdlgtmachnpgad+ly3z0PQ42D+3qo
	HSPVY3Y96fZwQyAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759924566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFoKgPLLseGSTmEDJuS2hF8KtRT/6jGqdKgHmA2a8tw=;
	b=t1B0y3rP+5BOP5OXM8IevM45FFZcKadgdHRDyn9X2sNC9GX4e5N7HRC9ntLsV5h1UKIAdI
	rtSkAYHbtT3fioX0kQMZdOYSeJs3e9MyOerSvflumjrHKCG3ENLQW6pGZPZ2VMho6WCbVE
	XGYm1y4VhDAHt6G06hpnfGpbtb6JPM4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759924566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YFoKgPLLseGSTmEDJuS2hF8KtRT/6jGqdKgHmA2a8tw=;
	b=B8jBf8YzoWtg5seDGQTQKtb9BzmiMaW8h8hBJrI3vpdlgtmachnpgad+ly3z0PQ42D+3qo
	HSPVY3Y96fZwQyAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0655013A3D;
	Wed,  8 Oct 2025 11:56:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VZBRAFZR5mjoMQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Oct 2025 11:56:06 +0000
Date: Wed, 08 Oct 2025 13:56:05 +0200
Message-ID: <87cy6xd2ui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-merge-window
In-Reply-To: <c03c248d42a17bc7d332b83ebb540541@kernel.org>
References: <c03c248d42a17bc7d332b83ebb540541@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Wed, 08 Oct 2025 13:35:05 +0200,
Mark Brown wrote:
> 
> The following changes since commit f8b9c819ea20d1101656a91ced843d9e47ba0630:
> 
>   ASoc: tas2783A: Fix an error code in probe() (2025-09-26 12:43:33 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-merge-window
> 
> for you to fetch changes up to a27539810e1e61efcfdeb51777ed875dc61e9d49:
> 
>   ASoC: rt722: add settings for rt722VB (2025-10-07 13:19:44 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A small pile of fixes, almost all for the Intel and SOF code surrounding
> management of the host buffer.  We've also got one fix for Meson and new
> device IDs and quirk supporting the RT722VB.

Pulled now.  Thanks.


Takashi
