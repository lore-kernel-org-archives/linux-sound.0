Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46F2222CA
	for <linux-sound@vger.kernel.org>; Sun, 28 Sep 2025 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759075827; cv=none; b=Y9Ycllmqx0exjGaIaq3fpnRJTZORBzu3TrXW8Z1ZPLRGUHiBwM4sQfPVLZ7dunlWdAJCBcDoh9u8Ce9TvOFLubM+fYBClxLUIU84SCjeZzSmA/BEg4PlK4QBWybJxRdluf3Ay95elNRDVhB4zuFgTCpRlouwvNjUo0XIhUtkakk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759075827; c=relaxed/simple;
	bh=5PkBs4zLb47ZpNTe8BJoygU3M/MLAmUKJvLJqrW6URs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/VPdgZxvY7vD+cW+BJC8++w+ZbH4yngM9zsJIJePm1JHQkbAXHi8jmnm9qYyYRPi5hFPU/CpY/Zh2IuxlMxo9LVK/+vk2p8J5Vl7CwoFXjK7uvoaPfP8yIoahqVYIL5uG3TVpWp8yRTi1pvw2St//ZM87Uks5fAd3+hs/hUwKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mN86wjOu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fXQk2fb8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mN86wjOu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fXQk2fb8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mN86wjOu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fXQk2fb8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mN86wjOu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fXQk2fb8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7F7CE2889B;
	Sun, 28 Sep 2025 16:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759075817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dmstn59xgsKBj3MIQOpLYyjE71L1PEA63GdUPBB1Vgg=;
	b=mN86wjOuHl1xx7ld0FL0jAqF97nOaxzQ0Z1/P0EQE8squygc88AU4CtEJfn+VzUe0keBUH
	xK0HMu0sVK7GhJPouLny7bi0FZ2mR4V2zzKtSI8R0RqbvTr/TIBPDmZKcAgVVJr8B1QYS8
	PA4PTtfwZ3AdTJi8ftEltTmJvNvwXbQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759075817;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dmstn59xgsKBj3MIQOpLYyjE71L1PEA63GdUPBB1Vgg=;
	b=fXQk2fb8UOm5dfkFcGf8bQFLRYUb9JeuaK4bql5rw6MkaHmWUAcqlBXx1QqlH9jxON2d/d
	8uD5uNhI7yRYivBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1759075817; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dmstn59xgsKBj3MIQOpLYyjE71L1PEA63GdUPBB1Vgg=;
	b=mN86wjOuHl1xx7ld0FL0jAqF97nOaxzQ0Z1/P0EQE8squygc88AU4CtEJfn+VzUe0keBUH
	xK0HMu0sVK7GhJPouLny7bi0FZ2mR4V2zzKtSI8R0RqbvTr/TIBPDmZKcAgVVJr8B1QYS8
	PA4PTtfwZ3AdTJi8ftEltTmJvNvwXbQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1759075817;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dmstn59xgsKBj3MIQOpLYyjE71L1PEA63GdUPBB1Vgg=;
	b=fXQk2fb8UOm5dfkFcGf8bQFLRYUb9JeuaK4bql5rw6MkaHmWUAcqlBXx1QqlH9jxON2d/d
	8uD5uNhI7yRYivBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5802D1333E;
	Sun, 28 Sep 2025 16:10:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hIjTE+ld2Wj5LAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Sep 2025 16:10:17 +0000
Date: Sun, 28 Sep 2025 18:10:16 +0200
Message-ID: <87ikh28snr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.17-rc7
In-Reply-To: <6826572610aa0445785bd57dff718c3b@kernel.org>
References: <6826572610aa0445785bd57dff718c3b@kernel.org>
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

On Sun, 28 Sep 2025 13:53:02 +0200,
Mark Brown wrote:
> 
> The following changes since commit 1dd28fd86c3fa4e395031dd6f2ba920242107010:
> 
>   ASoC: rt5682s: Adjust SAR ADC button mode to fix noise issue (2025-09-17 12:38:59 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.17-rc7
> 
> for you to fetch changes up to 733a763dd8b3ac2858dd238a91bb3a2fdff4739e:
> 
>   ASoC: tlv320aic3x: Fix class-D initialization for tlv320aic3007 (2025-09-26 01:34:43 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.17
> 
> A few final driver specific fixes for v6.17, none super urgent so
> waiting for v6.18 and backporting is probably fine for htem.

Pulled now, but likely pending to 6.18 merge window.


thanks,

Takashi
