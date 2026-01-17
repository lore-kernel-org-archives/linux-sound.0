Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83AB288C27
	for <linux-sound@vger.kernel.org>; Sat, 17 Jan 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768638799; cv=none; b=hHsl0u9utxiedjD/ANU5gMrR7dy5YwFFOTYCm8Hx0wKdm+sDxndB87JZuZSNqGhKAMjt1EpEBDW7oJSAjSdQ3GGCm/Y4xzk7Jn4F8dmXV18Vryw+fNIERs2kWaIZFmRl7YJEXoN2gse5R6I7gI+PDHhVRN8nD6qSEtcGU5GOSVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768638799; c=relaxed/simple;
	bh=KBnomWOTqx/GjC2IfQR43kJme+8EL5qD11qlDj00An4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZT2o6lqhj2gtkeogIG8ti9lxE5Th0Zq++Cunf5AN7tD+ODVKohDYfiF+rnT0yr5hKXIU/ctB1XdVcL5QhxZGkKI/NBx8uoBNuMeduCG0UqjMvQhkeExSxmm7e93I04zIVFXsQ8e3DtP86MvtC7+IJSY6FLPkWZyUgxoAhkE6F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Si7nDCBt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=44NwzR/N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Si7nDCBt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=44NwzR/N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Si7nDCBt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="44NwzR/N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Si7nDCBt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="44NwzR/N"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 290463368D;
	Sat, 17 Jan 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768638796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUa+kWf3Nln+LeACK5L+fvl1yQmxpuMjOb3DR3HWyW0=;
	b=Si7nDCBtVyO03NahORCOfCtxyRpBlP8oe4dqiUYT6irXyq8QuIKNyBs9LvQMTs5zXdh+KI
	4grv1gqw9/+N7lIlXL0zSm1wD5LDUYBgCt3TBycV2640Pm1ioz12xhrw48hTemAkQ+3mfy
	NOHc3TRYYhBQgvXAVz/XqD4KyrqLCVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768638796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUa+kWf3Nln+LeACK5L+fvl1yQmxpuMjOb3DR3HWyW0=;
	b=44NwzR/NpilC5HMJSqChg/NsDyLFmBnDZDmwi5BNf16uWH1wh84jZEWNTF7cVX+uTmHvnX
	e7mqBqtNyhKpEtDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768638796; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUa+kWf3Nln+LeACK5L+fvl1yQmxpuMjOb3DR3HWyW0=;
	b=Si7nDCBtVyO03NahORCOfCtxyRpBlP8oe4dqiUYT6irXyq8QuIKNyBs9LvQMTs5zXdh+KI
	4grv1gqw9/+N7lIlXL0zSm1wD5LDUYBgCt3TBycV2640Pm1ioz12xhrw48hTemAkQ+3mfy
	NOHc3TRYYhBQgvXAVz/XqD4KyrqLCVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768638796;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUa+kWf3Nln+LeACK5L+fvl1yQmxpuMjOb3DR3HWyW0=;
	b=44NwzR/NpilC5HMJSqChg/NsDyLFmBnDZDmwi5BNf16uWH1wh84jZEWNTF7cVX+uTmHvnX
	e7mqBqtNyhKpEtDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E09B03EA63;
	Sat, 17 Jan 2026 08:33:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xsaENUtJa2mRawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 17 Jan 2026 08:33:15 +0000
Date: Sat, 17 Jan 2026 09:33:15 +0100
Message-ID: <87zf6cbpv8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	g@b4.vu,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] ALSA: scarlett2: Fix buffer overflow in config retrieval
In-Reply-To: <20260117012706.1715574-1-samasth.norway.ananda@oracle.com>
References: <20260117012706.1715574-1-samasth.norway.ananda@oracle.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 17 Jan 2026 02:27:06 +0100,
Samasth Norway Ananda wrote:
> 
> The scarlett2_usb_get_config() function has a logic error in the
> endianness conversion code that can cause buffer overflows when
> count > 1.
> 
> The code checks `if (size == 2)` where `size` is the total buffer size in
> bytes, then loops `count` times treating each element as u16 (2 bytes).
> This causes the loop to access `count * 2` bytes when the buffer only
> has `size` bytes allocated.
> 
> Fix by checking the element size (config_item->size) instead of the
> total buffer size. This ensures the endianness conversion matches the
> actual element type.
> 
> Fixes: ac34df733d2d ("ALSA: usb-audio: scarlett2: Update get_config to do endian conversion")
> Cc: stable@vger.kernel.org
> Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>

Applied now.  Thanks.


Takashi
