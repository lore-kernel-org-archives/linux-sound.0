Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D960389DE6
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307260; cv=none; b=QRJZbKVOL1FMomGYz7d1YuWIvX3j21UqufwA6aRWQuWmBlGrZ3Yi1Ujb5M2Eq30a9nuqMiiDRcYU+ARIAK/R0VXInqmRjCxRRNHyY+XyiXWR7swOGquqgHZdyptrug75lTZZsPRHMfwBZn3XaRIk67onOCKmQpZgJzRvpcrR+vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307260; c=relaxed/simple;
	bh=238lMP6tVIY+bjfJNKpNr4ht6LfMCnRxt6ILam2R8qA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYd7hl4Y99qhnfvD+wYP4+lcR0g/XKGK5eGJ0Y8ZR63HKn8jAjaifWSob8VIWW7XUoEZnVZKs9Vh3lQ2vvvUTQmqUe3/VrPfaHb7CIF3z5euIRrzOgZqyojJM8gI0g3RcAJAhORzWqK17sP9LREVakWU5SNfWcvcSCOS3EA/ysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hwIOefyx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A2cBTnpt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hwIOefyx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A2cBTnpt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwIOefyx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A2cBTnpt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hwIOefyx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A2cBTnpt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 42E8E5BCCA;
	Tue, 13 Jan 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768307257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwdit+YkJjC2GLsY8wRRhnxR7M6gyF3p2Useh4C02/8=;
	b=hwIOefyx0UXP0DZryokr3J02GCkRLegD6tkmNc4i/kEljQWce/zYCnPqfhw/CGFYZdStwE
	2wjNFqiaJ3PwGM2w7lwzNtr7opgLQrftAYOnZqpMrnDRRyx7yEDidWIJCsFPK9/hNMBS7P
	/edgSGXp4oF18xivj8lYTy/FcThEnoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768307257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwdit+YkJjC2GLsY8wRRhnxR7M6gyF3p2Useh4C02/8=;
	b=A2cBTnptsvcNlnzTSSkHVOhAW8Z6GIHg/zdhgroHLhsHcN5LUrhi0uUmeRW2+KfyAFaMw2
	zFqP7ej67ylT+ZCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=hwIOefyx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=A2cBTnpt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768307257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwdit+YkJjC2GLsY8wRRhnxR7M6gyF3p2Useh4C02/8=;
	b=hwIOefyx0UXP0DZryokr3J02GCkRLegD6tkmNc4i/kEljQWce/zYCnPqfhw/CGFYZdStwE
	2wjNFqiaJ3PwGM2w7lwzNtr7opgLQrftAYOnZqpMrnDRRyx7yEDidWIJCsFPK9/hNMBS7P
	/edgSGXp4oF18xivj8lYTy/FcThEnoQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768307257;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iwdit+YkJjC2GLsY8wRRhnxR7M6gyF3p2Useh4C02/8=;
	b=A2cBTnptsvcNlnzTSSkHVOhAW8Z6GIHg/zdhgroHLhsHcN5LUrhi0uUmeRW2+KfyAFaMw2
	zFqP7ej67ylT+ZCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1F3793EA63;
	Tue, 13 Jan 2026 12:27:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CkL6Bjk6ZmmlUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 12:27:37 +0000
Date: Tue, 13 Jan 2026 13:27:28 +0100
Message-ID: <87a4yhr93j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Bharat Dev Burman <bharat.singh7924@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add HP Victus 16-e0xxx mute LED quirk
In-Reply-To: <20260112184253.33376-1-bharat.singh7924@gmail.com>
References: <20260112184253.33376-1-bharat.singh7924@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 42E8E5BCCA
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Mon, 12 Jan 2026 19:42:40 +0100,
Bharat Dev Burman wrote:
> 
> HP Victus 16-e0xxx with ALC245 codec does not handle the toggling of the mute LED.
> This patch adds a quirk entry for subsystem ID 0x88eb using a new
> ALC245_FIXUP_HP_MUTE_LED_V2_COEFBIT fixup, enabling correct mute LED behavior.
> 
> Signed-off-by: Bharat Dev Burman <bharat.singh7924@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
