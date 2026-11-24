Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524741;
	b=SLXV4ApU68WScH4jmudShM9LLNNIMQgNdzoy+0R5fRD2r3T6OfELdpmLsWPo9dN/BCT7
	 GwzzyNf6yjVY6eXL7ucsdwaLJekWD/Y/t7319f06fkjNFbFyjR4hzTOS4t6Vczl1QMsA7
	 QR6whlKWCVyT93BquB701WAIhkCgFR4jlgwgQ90YCyYvK8+S9S1KU8Ry5tZGE/jzEKhq8
	 4gDppjpJT1ENwNXwxtzdDugf6HryJwGf93NPN5iiG6B+wSvhzKGLE8nbM29IyLC4W7HZy
	 WvDBh6qKNS9Trm8WCpvcbstyuFANXsnHQi7NEs8SZ0cbU8j1pLtWLOubE9hbSwlnKNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524741;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=TqR5+FaU8Z8EYSbVVcKWK8XYphq3sDH/nbQY6UeEloE=;
	b=lFt3HQFRnYyK4wtb9U/E1uLYbhYZIxU+JsNnehXIA6goqF/TVPpi8vCQVoa2yAVYkt4A
	 BV727mdKxTe3kYOrU7Ng+BNh2floukPOTKoN4XQnUKLNenx7TPtP25AzWhsO2pCxfONVa
	 CYvybrO6go/29DHkwQJ0SWrziDG/dJdcCfelFBbWBRgM1uenFZt5hXUsWj5h64uaxfwgh
	 4Wo6EcmMpwHxPI6jbDjmmX/BC7QHSgWl3/lXz4AUiknpZnNq6taeDEk8Smv8tFLGwHPLs
	 beXGPd3sEz6vhWSFXCf0tvD9tqyHuUHV4+PQq/sqYjW6eJVzndh83o0aghQmKCUaR4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="0b3AoQd/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZSaYaWhn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="0b3AoQd/";
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZSaYaWhn;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDCF606A31E;
	Tue, 24 Nov 2026 12:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECDCF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0b3AoQd/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZSaYaWhn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0b3AoQd/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZSaYaWhn
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 304251F7B4;
	Tue, 24 Nov 2026 12:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqR5+FaU8Z8EYSbVVcKWK8XYphq3sDH/nbQY6UeEloE=;
	b=0b3AoQd/XAak6y1stOOgyG+EPdnIndYdX0VaM54UumoaO03oNp0GC8k/hA/7yTGCo+gjje
	H1KXZhHKYQssU8Gn3JsdnHPapzsI/v5PtbO6U5kmJ4fCmhmpgZMkg7vjGddQnykKxD6e9z
	AlBqf/xIKeRLYwNUMkeSE9DMpc6xviU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqR5+FaU8Z8EYSbVVcKWK8XYphq3sDH/nbQY6UeEloE=;
	b=ZSaYaWhnytgX+h05vFKGqTloN94FS7wPA0LP8o9XIK0hTDLLleuPcoHYHsDkq08+ZrgSOt
	ZYa87IDBzNNO6PDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524739; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqR5+FaU8Z8EYSbVVcKWK8XYphq3sDH/nbQY6UeEloE=;
	b=0b3AoQd/XAak6y1stOOgyG+EPdnIndYdX0VaM54UumoaO03oNp0GC8k/hA/7yTGCo+gjje
	H1KXZhHKYQssU8Gn3JsdnHPapzsI/v5PtbO6U5kmJ4fCmhmpgZMkg7vjGddQnykKxD6e9z
	AlBqf/xIKeRLYwNUMkeSE9DMpc6xviU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524739;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TqR5+FaU8Z8EYSbVVcKWK8XYphq3sDH/nbQY6UeEloE=;
	b=ZSaYaWhnytgX+h05vFKGqTloN94FS7wPA0LP8o9XIK0hTDLLleuPcoHYHsDkq08+ZrgSOt
	ZYa87IDBzNNO6PDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBE201339F;
	Tue, 24 Nov 2026 12:52:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nooAMIKIBWv1HAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:52:18 +0000
Date: Tue, 24 Nov 2026 13:52:14 +0100
Message-ID: <87qzga9ytd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] sound: core: Check return value of device_create()
In-Reply-To: <20261123100535.3025-1-sreekuttan2156239@gmail.com>
References: <20261123100535.3025-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 23 Nov 2026 11:05:35 +0100,
Sreeraj S Kurup wrote:
> 
> The sound_insert_unit() function ignores the return value of
> device_create(). If device creation fails, the function still
> returns the allocated minor number as if registration succeeded.
> 
> Add a helper function, sound_device_create(), to create the sound
> device and check the return value using PTR_ERR_OR_ZERO().
> 
> If device creation fails, remove the allocated sound unit from
> the sound loader list, unregister the character device when
> preclaim_oss is disabled, and free the allocated memory.
> 
> Return the original error code to the caller instead of reporting
> successful registration.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
