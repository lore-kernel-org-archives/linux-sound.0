Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117803CF68F
	for <linux-sound@vger.kernel.org>; Wed,  6 May 2026 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054941; cv=none; b=eUfXaMj3pVY7W3g+/WDlatpdtQR75JkMo1rhw/WpwXnQy4ouG7qN0SePWG5JUFG/0Sc4AZwY4ArYvxUHfLr8RZEiDoD03yr6++cse1m1QZC+r47GhoRdZfCAZFu6wSm5oFnnOlHt9JDhjo3XQ0sfk5cVMNaFSMeCCrpb85eGCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054941; c=relaxed/simple;
	bh=S72qG40myR9ufB02bQogqZi/Nwl43iUNW4vHNj6mRh8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=emgljyu8l2zUGOKyP55RBLDwn6N85xOjm1WVf64Qtc+IJ31/sWt2WpKi6edufwAVFeuwiKdlELSlHq+gCV71faDv0aT2Ymiyt8SwHkgO5WuVeqsNkoLxmKD5x/81Y0S/wiqiE4Lz2KoBm3ay7kNKIidj2aojR7HSXCJKZ1pYMWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xEAF0+aE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7jNXKMyy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xEAF0+aE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7jNXKMyy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xEAF0+aE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7jNXKMyy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xEAF0+aE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7jNXKMyy"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 66CDB5C3E6;
	Wed,  6 May 2026 08:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmdLG5xrLCAEm//LY3U7/HYhtHV1gWq7scizKQFeYYs=;
	b=xEAF0+aEB8ZjvclOUbTOqmP1DNDn7wsloZIQG6SytAe3zR7Et+hpzUzxLgHqRYGI5Vs9tb
	HJPh2KExUHLsN6k7S4sEskZ8kPi/firLGtjj1jEy0PNdRdXzg6nlu+kZUY8IovaqEzrIRI
	kj0nIR1/wgih/Iohe/pKNkgEzhqNPjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmdLG5xrLCAEm//LY3U7/HYhtHV1gWq7scizKQFeYYs=;
	b=7jNXKMyyG+9xek9k5iehChr68iMkzsZtKnDObt8lB/GrxZI+EbxUiqzRWpUrwzq+EEQED4
	UYo3j+9x4FkrApAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778054938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmdLG5xrLCAEm//LY3U7/HYhtHV1gWq7scizKQFeYYs=;
	b=xEAF0+aEB8ZjvclOUbTOqmP1DNDn7wsloZIQG6SytAe3zR7Et+hpzUzxLgHqRYGI5Vs9tb
	HJPh2KExUHLsN6k7S4sEskZ8kPi/firLGtjj1jEy0PNdRdXzg6nlu+kZUY8IovaqEzrIRI
	kj0nIR1/wgih/Iohe/pKNkgEzhqNPjY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778054938;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xmdLG5xrLCAEm//LY3U7/HYhtHV1gWq7scizKQFeYYs=;
	b=7jNXKMyyG+9xek9k5iehChr68iMkzsZtKnDObt8lB/GrxZI+EbxUiqzRWpUrwzq+EEQED4
	UYo3j+9x4FkrApAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C07A593A3;
	Wed,  6 May 2026 08:08:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id A8ofDRr3+mlALgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 May 2026 08:08:58 +0000
Date: Wed, 06 May 2026 10:08:57 +0200
Message-ID: <871pfpt0x2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: sparc/dbri: add missing fallthrough
In-Reply-To: <20260506031854.780411-1-rosenp@gmail.com>
References: <20260506031854.780411-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Wed, 06 May 2026 05:18:54 +0200,
Rosen Penev wrote:
> 
> Fixes compiler error with probably newer compilers:
> 
> sound/sparc/dbri.c:595:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>   595 |         case 1:
>       |         ^
> sound/sparc/dbri.c:595:2: note: insert 'break;' to avoid fall-through
>   595 |         case 1:
>       |         ^
>       |         break;
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied now.  Thanks.


Takashi
