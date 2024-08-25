Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA5571B52
	for <linux-sound@vger.kernel.org>; Sun, 25 Aug 2024 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724595512; cv=none; b=sXU4idEkWQi0SLwoEvVeVkjbgJaBarrp4Sz9TjeqmLZh/CHFw/s8UoiycXO6Dzhv/U2eS23CWPquKGBBYjbzQngPMAPvxQ+dv56mnGvRGF36KgGh/vd2gjHCH93ezZeLXRzTdLKGuYa9VmHwG1tKZoC4pgh68QCgORzzPznPATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724595512; c=relaxed/simple;
	bh=tyN+tIRcZHTkIp1RZzuBmD+PKhJGcwXhxlgjYSUXxRk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C4+EjCPRDEfF1+sGXcMhIJc3ZorJgvoF12Cr+EoCLCGr8PQQ94jsTf9goR78fgFYJr8kV8KYPWqs2iruOVuKoyJLb/Gsr6A/T24Mr+qjRUmOLdjk4ino08Fiiog6A4bH/dAb69Bx0Iz+OXEyf8zskuT9dwAt/n0gJL5btDj4O3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xvi55/yc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MQ1JEhhP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xvi55/yc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MQ1JEhhP; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvi55/yc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MQ1JEhhP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xvi55/yc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MQ1JEhhP"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 84C8A21A52;
	Sun, 25 Aug 2024 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724595501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAP/wJe/yTxU6DyLsVENLZLr5gMk8vHpLh7aGLkky74=;
	b=xvi55/ychLQjQrHojYF7fvXDDo7Z4p25QdznduGNr/hCJ7oJ4YEkwrCImFWuyVQmqbz0Si
	DZzwyuowjTmCfl5EZeabvgCY9IyKMvdtbtKfVXYulSmQR+PfXVTmaAbiSyBD7L8OFn2WDl
	0KTXFeGP392Ykol3sQVLV6omduO18Ww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724595501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAP/wJe/yTxU6DyLsVENLZLr5gMk8vHpLh7aGLkky74=;
	b=MQ1JEhhPp7uCnOyWxACyBwAU5qB5ah2V1co0sbh8A1CdOCw+QPBPDoJIjTkRgr1QP6sCLX
	Yi2mFYYMxrjrCdAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="xvi55/yc";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MQ1JEhhP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1724595501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAP/wJe/yTxU6DyLsVENLZLr5gMk8vHpLh7aGLkky74=;
	b=xvi55/ychLQjQrHojYF7fvXDDo7Z4p25QdznduGNr/hCJ7oJ4YEkwrCImFWuyVQmqbz0Si
	DZzwyuowjTmCfl5EZeabvgCY9IyKMvdtbtKfVXYulSmQR+PfXVTmaAbiSyBD7L8OFn2WDl
	0KTXFeGP392Ykol3sQVLV6omduO18Ww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724595501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eAP/wJe/yTxU6DyLsVENLZLr5gMk8vHpLh7aGLkky74=;
	b=MQ1JEhhPp7uCnOyWxACyBwAU5qB5ah2V1co0sbh8A1CdOCw+QPBPDoJIjTkRgr1QP6sCLX
	Yi2mFYYMxrjrCdAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A31213704;
	Sun, 25 Aug 2024 14:18:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id E/rPFC09y2aPQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 25 Aug 2024 14:18:21 +0000
Date: Sun, 25 Aug 2024 16:19:05 +0200
Message-ID: <874j78k7mu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: YOUNGJIN JOO <neoelec@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book3 Ultra
In-Reply-To: <20240825092515.28728-1-neoelec@gmail.com>
References: <20240825092515.28728-1-neoelec@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 84C8A21A52
X-Spam-Score: -5.44
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.44 / 50.00];
	BAYES_HAM(-2.93)[99.69%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 25 Aug 2024 11:25:15 +0200,
YOUNGJIN JOO wrote:
> 
> 144d:c1cc requires the same workaround to enable the speaker amp
> as other Samsung models with the ALC298 codec.
> 
> Signed-off-by: YOUNGJIN JOO <neoelec@gmail.com>

Thanks, applied now.


Takashi
