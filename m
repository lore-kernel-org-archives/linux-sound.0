Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA04DA04
	for <linux-sound@vger.kernel.org>; Mon, 30 Dec 2024 10:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735555850; cv=none; b=HkYpvBIoNTfoCKJ8R/0UgpgpQ6QOlclX4CdN36zWt4FvSHjC/ON5JCFn+dEX5+RPhlYG4N09UR2nkwe3FPNnpEU9gJ1zA/DYgMGID9MQ2eXAAEIfTbCU48aeIaWpYFC7GM4fRTXe/7mxGdkxw1CCWwSlov58JomDfedvlFUE6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735555850; c=relaxed/simple;
	bh=NVdPMu4m0MnJLTcIUZWTFBZ0Fz9QjQxAhKIA/MhYWb8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jot2NHlDfMNQ81FVDiI+Nj/JSrm0Gsh8XoDYGhrovPybMmcEEhKY7oh5dHnRxjdLZC/ccWcIlrMECEFocgwO4w65c3QFiA3uC9lsDpvXq90+ALrFUlDelHrugg7FJ2kaRqJDxVqHavwswi37l7TiFN3f2bBf4fWXk41M2oFiOJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T/YG8i+x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xzQsla7c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T/YG8i+x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xzQsla7c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T/YG8i+x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xzQsla7c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T/YG8i+x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xzQsla7c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 931F121163;
	Mon, 30 Dec 2024 10:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735555840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fmO+Pf3kiFfppXn1382bxhobtOn6TRAbmn4qzLvkv44=;
	b=T/YG8i+xbwtAWsIxss1lSy9/d8NbTRdrbY5zT2QNeBSckGYwvdq25oSFOJ1p+gw2SbZKtZ
	XlEgl/hcEvjRc0txlFQutKAUS4UwreAwbyV8L2hcJMOYnIbyGnUJf2ivfMSZLspo+zFkbr
	8xlfrEKqGV8i1p3ywdkp8eSP4A3G668=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735555840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fmO+Pf3kiFfppXn1382bxhobtOn6TRAbmn4qzLvkv44=;
	b=xzQsla7ccXj2qsCQOhdY4DWDmPDvHuhW8+OHZgcdgsmHjn/wNs+whiTaN4pbSWyGS4a853
	EFJSm11PJ347GAAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="T/YG8i+x";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xzQsla7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735555840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fmO+Pf3kiFfppXn1382bxhobtOn6TRAbmn4qzLvkv44=;
	b=T/YG8i+xbwtAWsIxss1lSy9/d8NbTRdrbY5zT2QNeBSckGYwvdq25oSFOJ1p+gw2SbZKtZ
	XlEgl/hcEvjRc0txlFQutKAUS4UwreAwbyV8L2hcJMOYnIbyGnUJf2ivfMSZLspo+zFkbr
	8xlfrEKqGV8i1p3ywdkp8eSP4A3G668=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735555840;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fmO+Pf3kiFfppXn1382bxhobtOn6TRAbmn4qzLvkv44=;
	b=xzQsla7ccXj2qsCQOhdY4DWDmPDvHuhW8+OHZgcdgsmHjn/wNs+whiTaN4pbSWyGS4a853
	EFJSm11PJ347GAAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CB2113A30;
	Mon, 30 Dec 2024 10:50:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sd07FQB7cmdlawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 10:50:40 +0000
Date: Mon, 30 Dec 2024 11:50:40 +0100
Message-ID: <87seq5wikf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] fix remaining descriptor races in sound/core/compress_offload.c
In-Reply-To: <20241229185232.GA1977892@ZenIV>
References: <20241226182959.GU1977892@ZenIV>
	<d01e06bf-9cbc-4c0e-bcce-2b10b1d04971@perex.cz>
	<20241226213122.GV1977892@ZenIV>
	<20241226221726.GW1977892@ZenIV>
	<87o70udgzi.wl-tiwai@suse.de>
	<20241229185232.GA1977892@ZenIV>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 931F121163
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 29 Dec 2024 19:52:32 +0100,
Al Viro wrote:
> 
> 3d3f43fab4cf "ALSA: compress_offload: improve file descriptors installation for dma-buf"
> fixed some of descriptor races in snd_compr_task_new(), but there's a couple more left.
> 
> We need to grab the references to dmabuf before moving them into descriptor table -
> trying to do that by descriptor afterwards might end up getting a different object,
> with a dangling reference left in task->{input,output}
> 
> Fixes: 3d3f43fab4cf "ALSA: compress_offload: improve file descriptors installation for dma-buf"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Applied now.  Thanks!


Takashi
