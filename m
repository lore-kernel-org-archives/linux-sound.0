Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8D1DFE09
	for <linux-sound@vger.kernel.org>; Mon,  1 Sep 2025 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756725334; cv=none; b=bm7bYfH9IzmrT84Nao0TIRsO2n+4RFod9GedopjxPLhqsWmhOAsyhkR5unj36yv28ue2dnGWbpK7ZhZ3Vva2yWcI4xyoFoyCHhl8QQd+XIaBeuSP57cXzFvT16+11hx2RqV3LNm6h/8EtNs2FBKBRoZjUvKWl61Tq238qn2vJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756725334; c=relaxed/simple;
	bh=r+APyHp7ukCOffWC6T8FDUYI8Ifcs64Hg03ymTBisT0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6s+VkabkTFwr1P5IMaN6HVuqqjF17oOjOzOvHVqdVGZIRaNFOr490WnF5GkEtOCFlMulGPqA2xWHY5DCsBv6/o5yEWpOK4X+T1vah6egHAj0FeRPdyYcqDpD5U2+JoUxOuD+PlQrMxhZ3T5LoGh3qSKxsagP4yqRrvnXTE8pos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZIsFkk8a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uTowglN6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZIsFkk8a; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uTowglN6; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZIsFkk8a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uTowglN6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZIsFkk8a";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uTowglN6"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5F38F21172;
	Mon,  1 Sep 2025 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756725331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LmaSr7MUDGEiKm+O1yHUH5qFwx9frPSeOrqcp5fQRc=;
	b=ZIsFkk8adw6LQacJ7tEePqQDhrU+jrjcXo0H4PrDkhnvDFX2M7DSppzrHdsHNm+k96upnb
	k0jbmaKZqWK3/22NIeLhUgUmv4rcGOnvDrFgYGmE8l6pg+A598ajH1Q45W/AAakJqD0cmM
	1tWDnLLNN4uTjPNDgCWhXzQ/DIiQ9Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756725331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LmaSr7MUDGEiKm+O1yHUH5qFwx9frPSeOrqcp5fQRc=;
	b=uTowglN6cnPDYXVsBnqAJCsYgHNAi273he4y/cqs3/TDB2I4MB2Bu6sf31Kg5sQLcys86d
	a9liwh0THCmqBqAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756725331; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LmaSr7MUDGEiKm+O1yHUH5qFwx9frPSeOrqcp5fQRc=;
	b=ZIsFkk8adw6LQacJ7tEePqQDhrU+jrjcXo0H4PrDkhnvDFX2M7DSppzrHdsHNm+k96upnb
	k0jbmaKZqWK3/22NIeLhUgUmv4rcGOnvDrFgYGmE8l6pg+A598ajH1Q45W/AAakJqD0cmM
	1tWDnLLNN4uTjPNDgCWhXzQ/DIiQ9Ho=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756725331;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/LmaSr7MUDGEiKm+O1yHUH5qFwx9frPSeOrqcp5fQRc=;
	b=uTowglN6cnPDYXVsBnqAJCsYgHNAi273he4y/cqs3/TDB2I4MB2Bu6sf31Kg5sQLcys86d
	a9liwh0THCmqBqAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39AD913A31;
	Mon,  1 Sep 2025 11:15:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H/YjDFOAtWgPEQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 01 Sep 2025 11:15:31 +0000
Date: Mon, 01 Sep 2025 13:15:30 +0200
Message-ID: <875xe277al.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tina Wuest <tina@wuest.me>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: Allow Focusrite devices to use low samplerates
In-Reply-To: <20250901092024.140993-1-tina@wuest.me>
References: <20250901092024.140993-1-tina@wuest.me>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 01 Sep 2025 11:20:24 +0200,
Tina Wuest wrote:
> 
> Commit 05f254a6369ac020fc0382a7cbd3ef64ad997c92 ("ALSA: usb-audio:
> Improve filtering of sample rates on Focusrite devices") changed the
> check for max_rate in a way which was overly restrictive, forcing
> devices to use very high samplerates if they support them, despite
> support existing for lower rates as well.
> 
> This maintains the intended outcome (ensuring samplerates selected are
> supported) while allowing devices with higher maximum samplerates to be
> opened at all supported samplerates.
> 
> This patch was tested with a Clarett+ 8Pre USB
> 
> Signed-off-by: Tina Wuest <tina@wuest.me>

Applied now.  Thanks.


Takashi
