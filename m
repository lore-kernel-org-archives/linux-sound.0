Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533E3A1BC
	for <linux-sound@vger.kernel.org>; Thu,  1 Feb 2024 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706792085; cv=none; b=bbOrUFohInnCXkaxoWVdQfkC0vORVB248rys9uX+fv6UbUW3+wjd1vSiUR1htiSpocIfls92TTJ6hCevMPP11pZd2DhjfWb7Ah2bV6FYqn2o6yO3JfUBtqrlUkcYtQqvqvK+x2zvbiomMeL44S3Rm/KgqfDuM8VUnyOpuYhvsZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706792085; c=relaxed/simple;
	bh=19RbUztdI9hT+8JH4JWmI8vzlRNr3qq6WVLA2pxxFpc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bIbDwRboQdKX0JzNK5WfL1ZGkwPwpa9W919MFlcyyluws9GyV+IUVMtQagRD96BzoX7CRhxNvOXopGpt9+ZR3JBQnyPp/7BomQLWI4OQaZfnVCwVI3kKvTrCUmyrXuPUFFsEJPwfjUELZt1Lc7M71ocQFpYfE8bffW4fOPW9mxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2PWvCwh4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vrFMkKuv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2PWvCwh4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vrFMkKuv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2PWvCwh4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vrFMkKuv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2PWvCwh4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vrFMkKuv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C59041FB83;
	Thu,  1 Feb 2024 12:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706792080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIfuqAFN4/3lAjjTocN+xw0r/7wYJpijilYg9u6Np4Q=;
	b=2PWvCwh41q4Y7bjJat1yaqUIJAefdvarhSsU/1H1G2XJz8cpbpl4ooAygf9ZexUPRDTudN
	1bA/aEzXhUuPniqTwgF9TwVPsJnvB7xEnwVkw3XksoDDbCDYbzDcOQYyKlMJlK+WSCnKo9
	NmBxnsQeFDqMvKt6pSw4576eC/4VcMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706792080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIfuqAFN4/3lAjjTocN+xw0r/7wYJpijilYg9u6Np4Q=;
	b=vrFMkKuvcVTRdEWNHMhg+rRDC4GFaHkbXdCZIPxI/n5xZ322Nl1d8G5uvIDYXBhZ1Sy39r
	aDOFP+giETtc0bDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706792080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIfuqAFN4/3lAjjTocN+xw0r/7wYJpijilYg9u6Np4Q=;
	b=2PWvCwh41q4Y7bjJat1yaqUIJAefdvarhSsU/1H1G2XJz8cpbpl4ooAygf9ZexUPRDTudN
	1bA/aEzXhUuPniqTwgF9TwVPsJnvB7xEnwVkw3XksoDDbCDYbzDcOQYyKlMJlK+WSCnKo9
	NmBxnsQeFDqMvKt6pSw4576eC/4VcMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706792080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EIfuqAFN4/3lAjjTocN+xw0r/7wYJpijilYg9u6Np4Q=;
	b=vrFMkKuvcVTRdEWNHMhg+rRDC4GFaHkbXdCZIPxI/n5xZ322Nl1d8G5uvIDYXBhZ1Sy39r
	aDOFP+giETtc0bDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0807139B1;
	Thu,  1 Feb 2024 12:54:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fFZsJZCUu2XFPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 12:54:40 +0000
Date: Thu, 01 Feb 2024 13:54:40 +0100
Message-ID: <87il38z6nj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: <linux-sound@vger.kernel.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: hda: use azx_stream() helper in all places
In-Reply-To: <20240131151001.737372-1-perex@perex.cz>
References: <20240131151001.737372-1-perex@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=2PWvCwh4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vrFMkKuv
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.78 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-2.27)[96.56%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -2.78
X-Rspamd-Queue-Id: C59041FB83
X-Spam-Flag: NO

On Wed, 31 Jan 2024 16:10:01 +0100,
Jaroslav Kysela wrote:
> 
> Make code more readable with azx_stream() helper. No functional change.
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>

I have no much preference, but using the macro doesn't look like a
significant improvement to me, honestly speaking...

But I'm open for those.  If you have further changes based on those
updates, I can take now, too.


thanks,

Takashi
