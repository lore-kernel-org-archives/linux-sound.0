Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B139C00F
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740477; cv=none; b=hXGYh4NvPWlN5Twt0SqyUwV7CVtOJSjwmqdcYt1JrP/nZaWbkBu/GKSu9Ntq4d0pcIuDRyrN5QYpz2RpcnVbtLhy27JsLDT56tLYrT0mK12w5+1ZjmY3yiORcTXh1Z7RCdMMFg7f0Qm1kjVAJwYP3bHmsBlHHIXjgmw6qju/JgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740477; c=relaxed/simple;
	bh=GL5Tdt9rSEUeS8UtXnsIurgC+u+yrw+PwcCC8Z95YwQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VRXa34cnRRtR/cX6Or9GsoVWn7OzbGb4sw30kuhVTUF+AM33SUuN6BkekVNdlUMWmZJu+2PrFyA5zG+cwDVagyptr1bOrVLk4B2dLC7Tt0YrOo8MsCqq3Tw/fZPv+pDQERpvjUhZAERUwjOfvWTM0d+fQ7MExfkfIwqeZINjmKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IA4lNiT1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Kz35gaA8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D6LXbe1U; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7eZQKHMs; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IA4lNiT1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Kz35gaA8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D6LXbe1U";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7eZQKHMs"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AA3863EA5;
	Mon,  3 Aug 2026 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebfgprOS8I1fFjFHNbhvFQhQufb9ObHFRpqCKGJNGqE=;
	b=IA4lNiT1IxEXxrrBBnp57ua0SayyNkUD5ylxV3RfWYeYa+hfXfRgjC9bSmaIZNnLeJIpZP
	66gJbq+xvNqgWxFE220TRGqOZ9AkrM+5GedZX9tQ8P95w7EQfwML7LfjMUgcM/PfpjhWJA
	3BgQz6XmqugerCgkbCejUJupg+yJpEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740469;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebfgprOS8I1fFjFHNbhvFQhQufb9ObHFRpqCKGJNGqE=;
	b=Kz35gaA8IOXgaJFmyj83CX3kIY9Sf8cvG+vbRftl0qudTpmdFlAx1mv1lcdMiYMJ3/y4Ln
	NLaKhghY1TM9kFDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebfgprOS8I1fFjFHNbhvFQhQufb9ObHFRpqCKGJNGqE=;
	b=D6LXbe1U/Wg4kThVT8X/JSkn6M/AxQBA+dK9Oi5iajKEQ6QiKFzd6nCreSJAPH8sTLut/c
	AS7oq8LZMnNqDksaI5Yw02/vbnGgXhpCxisFZ/7AiMtOx8GVzCxXrcyg/8ap1s4ChyHscu
	jbbOVwdO7oBgQFCkl/vEBdsBNKFX5qg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740465;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ebfgprOS8I1fFjFHNbhvFQhQufb9ObHFRpqCKGJNGqE=;
	b=7eZQKHMsr3e3g9qsZDyDHz7yzIhUAHjpBk8ZDkweKQA/9JfNeR/ZDwV9ybiEUNd8zbewX4
	2eSB+uih7OerSwDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6D18C779A1;
	Mon,  3 Aug 2026 07:01:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e05yGbE8cGqyCQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:01:05 +0000
Date: Mon, 03 Aug 2026 09:01:04 +0200
Message-ID: <87a4r3bscv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mauricio Orozco <mauoro3@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maudob@live.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook M515DA/X515DAP
In-Reply-To: <20260730033506.8958-1-mauoro3@gmail.com>
References: <20260730033506.8958-1-mauoro3@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.28
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.18)[-0.903];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[live.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,live.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,live.com:email,suse.de:mid]

On Thu, 30 Jul 2026 05:34:55 +0200,
Mauricio Orozco wrote:
> 
> From: Mauricio Orozco <maudob@live.com>
> 
> The ASUS VivoBook M515DA/X515DAP (subsystem ID 1043:1e3e)
> requires the ALC256_FIXUP_ASUS_MIC_NO_PRESENCE fixup to
> enable the internal microphone.
> 
> Without this quirk, the internal microphone captures only
> silence under Linux, while it works correctly under Windows.
> 
> The fix has been verified on real hardware.
> Tested on an ASUS VivoBook M515DA/X515DAP running Linux Mint
> 22.3 with Ubuntu HWE kernel 7.0.0-28.
> 
> Signed-off-by: Mauricio Orozco <maudob@live.com>

Applied to for-next branch now.  Thanks.


Takashi
