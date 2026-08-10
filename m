Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F93BED55
	for <linux-sound@vger.kernel.org>; Mon, 10 Aug 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376148; cv=none; b=EOU+53NnCxdRHs2vW81naOXtE2pnO+IGB9k0vlb09KVmZRlD6NMaAU+EGhaTpg+gKWrpVqJ+Vmhy5DbsHGBE+tSTrLnHJa1Ks7wClxFgpyX9MabiGe9jMhuhJoFHxHlSGp+JSmBGeQTRsvVQql1LLEGNyKkQAnvdTjJINHguMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376148; c=relaxed/simple;
	bh=Z2wHKHwW/uWbAAgMvyWQSnEAJalBg8MS38Z1eVkzugc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7GI7zbZNGt7n/Xb6JgvhaW++ZfAj9NhBXUW1tQFaSkXjscvQ92fyyOUqquSoQQ5KvRxlAIeNFY73smKXRJegNc0W6sld1p1qQWiu+7PnqfAFJimxinSuH2ICdgl4EUPGkqTX4MoFji9SZJRHZBMIGs8TQc51BtavqjCtCLZl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZITjM7OA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=oeAJPkNM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwyG/FxQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fMO1zS3i; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZITjM7OA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="oeAJPkNM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwyG/FxQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fMO1zS3i"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 661763E0E;
	Mon, 10 Aug 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786376140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+AumuUpKXkLzgsxqklsNGCCLeP/QZW4P8Ur0e18rmM=;
	b=ZITjM7OAsGv+uJl21EVLEUGWSEIZJd6A8weKVlaAJxNaoiQUemYfe6JfKrhAVyKgnK/QNY
	ejbb+LVN1I2Yuer7EVwzvq5Eg2EC6XEV65Q9dFrSXrP4ym7P7P6XhcxRiko4j2jgujWk4e
	/al4bIn5LMKg9peGY5pLc6Q78QvbCJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786376140;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+AumuUpKXkLzgsxqklsNGCCLeP/QZW4P8Ur0e18rmM=;
	b=oeAJPkNMBMP1u3nEeOndSgK2y9KVxGbyVgMQ0N0fIPTkhyni5arJ6Pt8Qf28Ab/Tcs8e+J
	lh5SZSTZQru14GDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786376136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+AumuUpKXkLzgsxqklsNGCCLeP/QZW4P8Ur0e18rmM=;
	b=XwyG/FxQOM7rbKZekQDfi384zp3uYPfaQWaSdEPuV1zO+Nfof9GcUk8znZAbsJDcMM++9F
	e4jOYY4JjItg/PvytIW1pcUmhfTARNsopw7xrFer0KxxtmquEEtQlTPd4D7gsB3oTdHkya
	Tbg+nbh6gwh7wdO18BD+i8LyVk4b+0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786376136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p+AumuUpKXkLzgsxqklsNGCCLeP/QZW4P8Ur0e18rmM=;
	b=fMO1zS3iQVQPG6E4Y40L49fUaTaG4ByaI5mxlz4ccC6kuBP4ebUizL9xvNv4DxLxkt8097
	qShKjmSrHmpdGvBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45104779B2;
	Mon, 10 Aug 2026 15:35:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CkGxD8jveWr8EwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 15:35:36 +0000
Date: Mon, 10 Aug 2026 17:35:35 +0200
Message-ID: <87v79iaszc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Brian Koebbe <brian@koeb.be>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: Fix quiet 3.5mm jacks on Beelink SER6
In-Reply-To: <20260810145700.1206010-1-brian@koeb.be>
References: <20260810145700.1206010-1-brian@koeb.be>
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
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[koeb.be:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Mon, 10 Aug 2026 16:57:00 +0200,
Brian Koebbe wrote:
> 
> Both the front headphone jack and the rear line-out jack play back
> at a barely audible volume on the Beelink SER6 Max (ALC897, PCI subsystem
> ID 1f66:0202), even with all mixer controls at 0dB. GPIO2 on the
> codec gates an external headphone/line amplifier that the generic
> parser never enables. Add a fixup that asserts it. Verified fixed
> on both jacks.
> 
> Signed-off-by: Brian Koebbe <brian@koeb.be>
> ---
> v2: put the QUIRK in the correct position
> 
>     remove comment from alc662_fixups[] addition, to better match others
> 
>     append to enum and alc662_fixups[] rather than insert

Applied to for-next branch now.  Thanks.


Takashi
