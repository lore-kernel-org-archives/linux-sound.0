Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E3340411
	for <linux-sound@vger.kernel.org>; Sun, 31 May 2026 13:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780233942; cv=none; b=eslCc60VcM3LVkvpVycz73pdz9VTOtfeaiW2sNwS+7Xv6jLLeiup9XOY3GAxXEwAPnSnMfteTZ2AvxuVMjG1YZz+QtOwVtDTPUUUZcMxJiXJHw0iKNWYTx/9mMs0ASnRhg+PSJLUbSyp29rfx7kgYuJlUWPqmPe74eGDmAMRYBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780233942; c=relaxed/simple;
	bh=SGdQAXPoI/DWahvTKMWriEzagO4ErgLkb81eK+rjIng=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pt4ehezBTq7CCS7gjIYHYHHePM54xkXN36I1mZ4i/rGAd6yrgg/Tx6+PdF+G+utQfMykRXK3gSE1sg0KEcMR3auauZv8miWMKwo7EsBCPiGYfi0u1yJU843wkKLDTeQMFThBy12grcW2oII5+KjnMKx6agkb02BO2ibZO0m/r7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k2Qjux8H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pz/eN3AF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k2Qjux8H; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pz/eN3AF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k2Qjux8H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pz/eN3AF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k2Qjux8H";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pz/eN3AF"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6F8576B180;
	Sun, 31 May 2026 13:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780233939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCxT2jwnscUzIWUVsT9K/p+Gbv9gyRMsBayJAK53h/o=;
	b=k2Qjux8HECAqbDkemNd4EvUB+vIB/uKM4SN/fFyrHkhMW6CvcVa9Mb+iIGFDH0xGBnyGTD
	Urx7ImLfL+oY/8Q4ogC5gigxG5g011o6Yz/bRdFqPNfc6PSjTka7nJswqkDhodkepX321F
	P3r+bboqbVXWWHNbp9y8+HH2crTed04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780233939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCxT2jwnscUzIWUVsT9K/p+Gbv9gyRMsBayJAK53h/o=;
	b=pz/eN3AFwuSi63e2lKmMs2hXC1DZG0o77gIG2h2p2wrV/rWaY1K6MWSfGzY2d0Z32aCpQh
	F+2YSwrw9xpLTTDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780233939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCxT2jwnscUzIWUVsT9K/p+Gbv9gyRMsBayJAK53h/o=;
	b=k2Qjux8HECAqbDkemNd4EvUB+vIB/uKM4SN/fFyrHkhMW6CvcVa9Mb+iIGFDH0xGBnyGTD
	Urx7ImLfL+oY/8Q4ogC5gigxG5g011o6Yz/bRdFqPNfc6PSjTka7nJswqkDhodkepX321F
	P3r+bboqbVXWWHNbp9y8+HH2crTed04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780233939;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lCxT2jwnscUzIWUVsT9K/p+Gbv9gyRMsBayJAK53h/o=;
	b=pz/eN3AFwuSi63e2lKmMs2hXC1DZG0o77gIG2h2p2wrV/rWaY1K6MWSfGzY2d0Z32aCpQh
	F+2YSwrw9xpLTTDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3CC21779A7;
	Sun, 31 May 2026 13:25:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4tRJDdM2HGrXWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 31 May 2026 13:25:39 +0000
Date: Sun, 31 May 2026 15:25:38 +0200
Message-ID: <874ijnpv71.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: fix Kconfig dependency of HD Audio PCI
In-Reply-To: <20260529-hda-kconfig-v1-1-4a2c6a0efd56@hartkopp.net>
References: <20260529-hda-kconfig-v1-1-4a2c6a0efd56@hartkopp.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
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
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Fri, 29 May 2026 17:23:59 +0200,
Oliver Hartkopp wrote:
> 
> With commit 2d9223d2d64c ("ALSA: hda: Move controller drivers into
> sound/hda/controllers directory") the HD Audio drivers have been moved
> from linux/sound/pci/hda to linux/sound/hda.
> 
> But the Kconfig dependency for SND_HDA_INTEL stayed on SND_PCI instead of
> depending on PCI directly. To make the "HD Audio PCI" configuration entry
> visible it is currently needed to enable "PCI sound devices" although
> no PCI device in the submenu needs to be selected.
> 
> Make SND_HDA_INTEL directly depending on hardware/architecture like the
> other entries in this Kconfig.
> 
> Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/controllers directory")
> Signed-off-by: Oliver Hartkopp <socketcan@hartkopp.net>

Applied to for-next branch.  Thanks.


Takashi
