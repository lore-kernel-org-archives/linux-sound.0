Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194348;
	b=JXZ/8aTwQ8BRLqMrhdXeedlmKySTPFriiaS5x4aCSoMiu3HyyNf8hROaWmNQu7/qIE/z
	 EMnK8BVwH+ydf/p1+anbRt5c2sG8z5zRWn9lsPqQt/8ow8S+rZ0QEE3e6qYcAVrKnPvFt
	 K9eJpYLdhATmlyG0+poiOo3r4viOH2d7bypVeBB0ixc1hXCkLFEC1dm9B6HxsCY8DheHS
	 RoPoyEV3WzfL49lrNK6xafk9f6YwlDdYTmkuQNoNAowX8wDU1mPSG/aKVW+uj+6OnZy/r
	 GMFw9peMYVZ83eyIz1SCD308MbiKQr/N8kNikEELTAcYg+OHw7hy5BGzEvhBXksBVEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194348;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=159PI5MJAmW2/Y8h0mNkT9i2yahlnIJJYGzlwMgFUYE=;
	b=a1QLBZ6QUfGv8PpELoKSbgkdTOOZ06NMCLQVEISC86HpcR0nTeH/f2Ei2GkQ1uSzKy+g
	 lu6kcCZoP506KF0d5Aloytkatfh6ZBs8gLTxhGZ+fgStg9C/EA2iCKpFqVKhhImS2oT1E
	 nNPqTBbC6hEFfiDllcJrPAOzKvnF1xB6W45Q67fMeD9N2TWr7RXO5j6dgfDxghoJdvI5M
	 HimoJvbdngvGPUFkbipTGBSxmR9LpvX8JNtza0ycWDlCrhY3xEe3BAuNH+JimYDJrtsAt
	 nz5/cb1+NjUaA/X6CldoDWxomelLXCrxV+Yzc6IjYXoQpVz3Js41m/wh9IJek70x2zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fg2STN2F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="bNBPE/VL";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aeyh1g22;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zZDcGM4C;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ED3606A33C
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 17:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0ED3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Fg2STN2F;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bNBPE/VL;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Aeyh1g22;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zZDcGM4C
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C133B22521;
	Fri, 20 Nov 2026 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=159PI5MJAmW2/Y8h0mNkT9i2yahlnIJJYGzlwMgFUYE=;
	b=Fg2STN2F8dTZEe5uQlJCi0TSkazHlXJAlXzHWImEDtL6/NsMlhEYYfaL11Pv0vA9NJnCKz
	PWF/BGrfUojqwE8nC/97nJoStDHAxVP0xn17B1GDD0auK8XasHQjR+OeGU6AbQCZbBMjsC
	V9ygbjj2DECxZjiNfMyYzzs7me++qrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194346;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=159PI5MJAmW2/Y8h0mNkT9i2yahlnIJJYGzlwMgFUYE=;
	b=bNBPE/VL0JcheKO0j/cis6ERQre13jPSL5kH+qlIFUyxcvV+rFZCHO/l1duyEynUlBY61F
	E26zumz1/0IuHLCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795194344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=159PI5MJAmW2/Y8h0mNkT9i2yahlnIJJYGzlwMgFUYE=;
	b=Aeyh1g222NnYG8tx73rsq7tkssIBza4MNQmFFJygv/+rkN8XejXfsFEtsrXzIUOAaqyz6i
	wiCe/vNnYHxbmMlsg8NYZMLiFZ5I5qJjusTaqBnj3gP5z2zOoNqU9p/5l/itsbMI1GWi/G
	cjumBga4pVDUM0djw7dvH2C9RF1qAHs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795194344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=159PI5MJAmW2/Y8h0mNkT9i2yahlnIJJYGzlwMgFUYE=;
	b=zZDcGM4CK3mhurGrKvjSSdFOzDTGxxFvFVDsjN5Al6GmEr2LlIXoK6gFJB0yNVFyEIZaLj
	paQrBSVOtTJyxMAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D91F1342D;
	Fri, 20 Nov 2026 17:05:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ij2jDeh9AGscTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 20 Nov 2026 17:05:44 +0000
Date: Fri, 20 Nov 2026 18:05:43 +0100
Message-ID: <878q2nwhzs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,	Norbert
 Szetei <norbert@doyensec.com>,	bui duc phuc <phucduc.bui@gmail.com>,	Kees
 Cook <kees+treewide@kernel.org>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	Maoyi Xie <maoyixie.tju@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: timer: Simplify snd_timer_user_tselect()
In-Reply-To: <20261120115207.810114-2-blum@kernel.org>
References: <20261120115207.810114-2-blum@kernel.org>
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
X-Spamd-Result: default: False [-10.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[treewide];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,doyensec.com,gmail.com,kernel.org,suse.de,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -10.80
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 20 Nov 2026 12:52:06 +0100,
Thorsten Blum wrote:
> 
> Return errors directly and remove the now-redundant goto statements and
> the __err label. Also drop the unnecessary err = 0 initialization.
> 
> While the current unbounded sprintf() works correctly, replace it with
> scnprintf() to bound the formatted string to the str buffer.
> 
> No functional change.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

Applied to for-next branch.  Thanks.


Takashi
