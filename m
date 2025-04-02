Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781C19047F
	for <linux-sound@vger.kernel.org>; Wed,  2 Apr 2025 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578944; cv=none; b=e53DZruDU6GQCB1wAMrIEY8Q4pmjBkqv4Iymi/283LY3bpkH04BTDpJz7aSfd1X80j2ItMFdVKeXq/cJ9DiRyQDcD6z7thzNiXxSZ0Tk+WWOl29kxI3dfsZedHZdfiWGL1b1AEI/cHvuf4wID8lWPS4ILRIEM8+GL6s6kH4k+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578944; c=relaxed/simple;
	bh=GeEBJRqdVDMbDnd4tKKwaLqLImegAc8CzKZ7gAtO1Hg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pf0auFwGWxyKVlbWSGL1jGSuA3Iq0UF3LvWwaGzrqJlIAwM5JJ0BfOL6/6+17TpktEqvLzSRbYibpaPeB4pmlKt2muR3ca5l0zRwyqiynihu3TKuqJwS4Q0NgKBmUtRwIu5cITuDnYfOlTOV7YJAFD3jXxPyWtg1tOAqJ4h5YbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HMHZcR6R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoosVOq8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HMHZcR6R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HoosVOq8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HMHZcR6R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoosVOq8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HMHZcR6R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HoosVOq8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6BC15211AA;
	Wed,  2 Apr 2025 07:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743578935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HMHZcR6R9CU02f9anLF0zC32gE3A024b20/Fjo37c+N+AGnQtHIaEBdkS2F1Za81uSnzeG
	yVWIMoVJvDY7Vd/vceorniPowdkKwQkU0FRip4MQP402EbkWiuaPZghAs0pGKYc1Lh2Q8v
	j4swDRgmkuOorVF1unR9wutfqXs6NZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743578935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HoosVOq8u+xR/sNoeWHlBCtGQYtWnnIb70B1jR3AkiPTaeviTC3YRrVqr5aOQDRYMyRa/w
	ibd/OACeGmsOe5AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1743578935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HMHZcR6R9CU02f9anLF0zC32gE3A024b20/Fjo37c+N+AGnQtHIaEBdkS2F1Za81uSnzeG
	yVWIMoVJvDY7Vd/vceorniPowdkKwQkU0FRip4MQP402EbkWiuaPZghAs0pGKYc1Lh2Q8v
	j4swDRgmkuOorVF1unR9wutfqXs6NZA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743578935;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UXppZlGv6sH0SU26yjPMp4VYZzvLoKiEpL0vkueFMDE=;
	b=HoosVOq8u+xR/sNoeWHlBCtGQYtWnnIb70B1jR3AkiPTaeviTC3YRrVqr5aOQDRYMyRa/w
	ibd/OACeGmsOe5AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BFBF13A4B;
	Wed,  2 Apr 2025 07:28:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XugPETfn7GfCHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Apr 2025 07:28:55 +0000
Date: Wed, 02 Apr 2025 09:28:54 +0200
Message-ID: <87bjtfyqbt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Support mute led function for HP platform
In-Reply-To: <2c960ab58b4d4090ad4ee075f8cfdffd@realtek.com>
References: <2c960ab58b4d4090ad4ee075f8cfdffd@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 02 Apr 2025 05:00:10 +0200,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach was fixed mute led no function with HP platform.
> Many Thanks.
> 
> BR,
> Kailang

Applied now.  Thanks.


Takashi
