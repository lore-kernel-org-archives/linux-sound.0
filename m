Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF730F53B
	for <linux-sound@vger.kernel.org>; Thu, 27 Nov 2025 06:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764224516; cv=none; b=SgXSBKPjTJE+fD0Be0RskeuPx4qmINMW7YYBBh+76qHHmG2smO0vixDWOZb76Fjmj/d0rEGgNs5kJjBYtux/QfN7A6mAnhGOjWR6wCjY5uH+SLUz7BNmToSCHeXYCTEisX5v4mlkbKwZMSVJmpeQxOXFz80LcalmSGXCr7K8UVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764224516; c=relaxed/simple;
	bh=k+FOmYCaGVE9vvb/Rm9s7ThCFFXpjQrDwKd3hjAY/K4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivNMMn3HQfWqIaZDn7M6m2+KAY/kW4yXl1GboTmY0cDVzPWF9O7o0pYUopQEx6hfVIuaYsQmG3kNP0jHZMmKQho2NhMucrbeaZBynTD0tmBwd/A/QxKrmk57l6dSKNhVM1hvV7k89Yr8EorUIu5gYyTYKu/527+sJHDM2tnpAPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ikTZD/YL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sa1IgNHw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ikTZD/YL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Sa1IgNHw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ikTZD/YL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sa1IgNHw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ikTZD/YL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Sa1IgNHw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94CCF33691;
	Thu, 27 Nov 2025 06:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764224512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=ikTZD/YLctnXRP5zAYFQdsA6NENWz6lI9EwXrD5YobKqxL7EW+zmGIHe+BObrDIxUGyZrW
	YHiaDUkdd0PGtBKIHBJ6nzkY1ewTwVcmZu0R+xBsb3OAhmOUbl/6X7WWLG3gnTFKm7uJ4C
	c68N1kTReN0qokgi1jiCnyGjHw54xaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764224512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=Sa1IgNHwW8SqmQhPc//ATvKG8GkqcTMJZqaiaZ97GBNsRzUiwjSK7A7x5TzsKqx77UsHBH
	huadnLft7YW7MhAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ikTZD/YL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Sa1IgNHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764224512; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=ikTZD/YLctnXRP5zAYFQdsA6NENWz6lI9EwXrD5YobKqxL7EW+zmGIHe+BObrDIxUGyZrW
	YHiaDUkdd0PGtBKIHBJ6nzkY1ewTwVcmZu0R+xBsb3OAhmOUbl/6X7WWLG3gnTFKm7uJ4C
	c68N1kTReN0qokgi1jiCnyGjHw54xaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764224512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=Sa1IgNHwW8SqmQhPc//ATvKG8GkqcTMJZqaiaZ97GBNsRzUiwjSK7A7x5TzsKqx77UsHBH
	huadnLft7YW7MhAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 617923EA63;
	Thu, 27 Nov 2025 06:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C2oYFgDuJ2lrMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Nov 2025 06:21:52 +0000
Date: Thu, 27 Nov 2025 07:21:51 +0100
Message-ID: <87jyzc9erk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc7
In-Reply-To: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
References: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 94CCF33691

On Wed, 26 Nov 2025 21:46:45 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:
> 
>   Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc7
> 
> for you to fetch changes up to 73b97d46dde64fa184d47865d4a532d818c3a007:
> 
>   ASoC: fsl_xcvr: clear the channel status control memory (2025-11-26 13:24:19 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A small pile of driver specific fixes that came in during the past few
> weeks, none of them especially major.

Pulled now.  But not sure whether I'll send another PR for 6.18.
Might be postponed in the next week for 6.19 merge window.


thanks,

Takashi
