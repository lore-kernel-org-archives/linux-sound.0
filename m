Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B2C20CCDC
	for <linux-sound@vger.kernel.org>; Sat, 11 Oct 2025 06:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760164248; cv=none; b=Cb0A78bpSF865VjcX3pV5RcoqF+U0JOYVdap7+4kxkDjFtTO/klQC4QTmOS9iep06VyxFiipRrZKXvvJwqGJe0tRETyWSOBX4ZYw/JiWG4szyOC93lCoxBU+/CxHmBS3WGwSjpUfovZRrsoEqyqCGFa9uT/Acnj7+STAolmXauw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760164248; c=relaxed/simple;
	bh=u1LF+Ti3AAEtLlFrb9ScnJ7ruknF7L8hxWlfKPV/hro=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iOoCvoQW6AOcj5qxuSOFMgWK8wBELE96bLzxskuCQi07pbxYr6Z3f1qia5/rDRmY9eY9ZgCJQqUhwWtirur5CXm6a/+RN6EMX2VCk8lY1/set8B/3VPUUCSaxKtWvVupa2VysmJog7LZIF1/HN1Eiix/MFzVF+H1wwvcBfJ7Va8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zt5AUOJE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wjZWLBRz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zt5AUOJE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wjZWLBRz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zt5AUOJE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wjZWLBRz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zt5AUOJE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wjZWLBRz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B59DE1F394;
	Sat, 11 Oct 2025 06:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760164243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqzxnXW+bK68xaupaKeMgqc9JSRzxKgcBWYyvqmLiQs=;
	b=Zt5AUOJEj97VtCNWyZMa62Bp9rBJPu0fPk2Hi93Wgh0KOuYVK0fi8YQIbaq7KSk/AzYWdl
	BmpjftPZKI4Nj67lBFfT+H53C6JsZ3q9lA2RTpABDeE0D48WUbDHV00+OV3gaRL4Pa9GGB
	xyA3z5POZ0+IZwxi6u6ObQlBG6GFgkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760164243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqzxnXW+bK68xaupaKeMgqc9JSRzxKgcBWYyvqmLiQs=;
	b=wjZWLBRzug6BnvP64dt1xQwdjg30w7bW5OHTLS+GrSHMWquNKRQmS6PNZAVXDaMvVOZgWQ
	8motOrRi1JA5LMDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760164243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqzxnXW+bK68xaupaKeMgqc9JSRzxKgcBWYyvqmLiQs=;
	b=Zt5AUOJEj97VtCNWyZMa62Bp9rBJPu0fPk2Hi93Wgh0KOuYVK0fi8YQIbaq7KSk/AzYWdl
	BmpjftPZKI4Nj67lBFfT+H53C6JsZ3q9lA2RTpABDeE0D48WUbDHV00+OV3gaRL4Pa9GGB
	xyA3z5POZ0+IZwxi6u6ObQlBG6GFgkw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760164243;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqzxnXW+bK68xaupaKeMgqc9JSRzxKgcBWYyvqmLiQs=;
	b=wjZWLBRzug6BnvP64dt1xQwdjg30w7bW5OHTLS+GrSHMWquNKRQmS6PNZAVXDaMvVOZgWQ
	8motOrRi1JA5LMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 679B113693;
	Sat, 11 Oct 2025 06:30:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Vnz8F5P56WiWDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 11 Oct 2025 06:30:43 +0000
Date: Sat, 11 Oct 2025 08:30:43 +0200
Message-ID: <87ldli9ch8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Denis Arefev <arefev@swemel.ru>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: Fix missing pointer check in hda_component_manager_init function
In-Reply-To: <20251009105050.20806-1-arefev@swemel.ru>
References: <20251009105050.20806-1-arefev@swemel.ru>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,swemel.ru:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 09 Oct 2025 12:50:47 +0200,
Denis Arefev wrote:
> 
> The __component_match_add function may assign the 'matchptr' pointer
> the value ERR_PTR(-ENOMEM), which will subsequently be dereferenced.
> 
> The call stack leading to the error looks like this:
> 
> hda_component_manager_init
> |-> component_match_add
>     |-> component_match_add_release
>         |-> __component_match_add ( ... ,**matchptr, ... )
>             |-> *matchptr = ERR_PTR(-ENOMEM);       // assign
> |-> component_master_add_with_match( ...  match)
>     |-> component_match_realloc(match, match->num); // dereference
> 
> Add IS_ERR() check to prevent the crash.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: ae7abe36e352 ("ALSA: hda/realtek: Add CS35L41 support for Thinkpad laptops")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Arefev <arefev@swemel.ru>
> ---
> V1 -> V2:
> Changed tag Fixes
> Add print to log an error it as Stefan Binding <sbinding@opensource.cirrus.com> suggested

Applied now.  Thanks.


Takashi
