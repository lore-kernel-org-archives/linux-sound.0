Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C19C34C81F
	for <linux-sound@vger.kernel.org>; Sun,  8 Feb 2026 16:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770568189; cv=none; b=np3Uyr78oeFXK6WGOi2ZbgkHIDZdyJlXrvNVh94wZn/rSYvn8ZQOTSzQoIXVsy6kf1moz8PcI0X8RCQ1noTTSCeMoZaM+bWzu2cJcSgU+R1G5vXDVOdzfJBkdH/P24qf+xuxM8jiTyuZ5caCf2c+dbyesNJ+6oAOwNjE92HvuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770568189; c=relaxed/simple;
	bh=ezBhRB2oOoDETHtfgUpW93XZCL71vcRjU8j1SP8hNgI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btsS7OJOCXgFv8C5XLuJmibIJ+2aEpJcvRffPDkh4toEHG1xe9Iup4pHxkpOPgAVWSbS+P9/RM3h14d2flxpJbMFj8stcnU8oxl6u+BvppVlisYL2dALbe3FrI/IhgBZ0dnJRAAjdC8OIT3/+X+r2hzNFE86R9Dl2X2PyIBSQFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y+jMaztf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zJEvXtUb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y+jMaztf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zJEvXtUb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y+jMaztf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zJEvXtUb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y+jMaztf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zJEvXtUb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 961A73E6D3;
	Sun,  8 Feb 2026 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770568181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kwRae2/XNrOjTbNj+P6+HrkkXm7MqYkkhMLfQuWlUY=;
	b=Y+jMaztfilKIpSar478nFp4sif130RHjKbBCFEiQG+8vsoDdy8tEp/FR6Zq8Otvu1lfYve
	SW2+0noYtG/UJQWStU50w8u95z/K1xN492pkMEzc6ZTfPUA8Jh3m8i3zw+EHZ6mX5L2mtX
	nKWqsn5WPa55wlQys4D8m6wd6ZmBv0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770568181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kwRae2/XNrOjTbNj+P6+HrkkXm7MqYkkhMLfQuWlUY=;
	b=zJEvXtUbKkGaxfNNfiGaitn6WmqjBGdOl5kWKh4dcSlh6lUz8jVqZA9Vyopf/Cp1Psz17u
	SivDeqnRvV18a6AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Y+jMaztf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zJEvXtUb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770568181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kwRae2/XNrOjTbNj+P6+HrkkXm7MqYkkhMLfQuWlUY=;
	b=Y+jMaztfilKIpSar478nFp4sif130RHjKbBCFEiQG+8vsoDdy8tEp/FR6Zq8Otvu1lfYve
	SW2+0noYtG/UJQWStU50w8u95z/K1xN492pkMEzc6ZTfPUA8Jh3m8i3zw+EHZ6mX5L2mtX
	nKWqsn5WPa55wlQys4D8m6wd6ZmBv0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770568181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3kwRae2/XNrOjTbNj+P6+HrkkXm7MqYkkhMLfQuWlUY=;
	b=zJEvXtUbKkGaxfNNfiGaitn6WmqjBGdOl5kWKh4dcSlh6lUz8jVqZA9Vyopf/Cp1Psz17u
	SivDeqnRvV18a6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5AD6B3EA63;
	Sun,  8 Feb 2026 16:29:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4M5BE/W5iGkyOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Feb 2026 16:29:41 +0000
Date: Sun, 08 Feb 2026 17:29:40 +0100
Message-ID: <87pl6f6vwr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: ctxfi: Add quirk for SE-300PCIE variant (160b:0102)
In-Reply-To: <20260208133001.680550-1-me@harin.net>
References: <20260208133001.680550-1-me@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 961A73E6D3
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Sun, 08 Feb 2026 14:30:01 +0100,
Harin Lee wrote:
> 
> Add quirk for the Onkyo SE-300PCIE variant with PCI subsystem ID
> (160b:0102). This variant (OK0011) was found in the official Windows
> driver packages.
> 
> Also, reorder entries and fix the indentation to maintain
> consistency.
> 
> Signed-off-by: Harin Lee <me@harin.net>

Thanks, applied to for-next branch now.


Takashi
