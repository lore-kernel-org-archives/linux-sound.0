Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59A36BCDE
	for <linux-sound@vger.kernel.org>; Mon,  9 Mar 2026 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773046552; cv=none; b=JKcKHY694wd8MKJEtslhLqtIVtlFpKVmIURhWUTbCKsaC2gV5wPWkRxntgwZaH3jARiRcGYB6SpLY0enkXLWjirA3W90wqCV8uBXq3aMQypOTSBXdXnGCU3QPKmkikCf2Y1ZdJ4+2FEP07419dsja+RuVLz4glZAdh3Xgv1hHwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773046552; c=relaxed/simple;
	bh=r/m32jY5LKMCa04+O9FBjZNIAZvnRpSlvZDTXLbJLhc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lBVNKpqM5eLTb+T2KS61R5mRbofZJCxeE3EpB3y8DTXzDg8D0/vw1WwA4Zi6d1wZmd4+PrA3JCLTM8OXzfnmq3FLqtMxoyxHgO/dsAeLV8Hel2baaPg6i5PTmCeH/TtLhU4l9VaMhoNY8NKvocMyo2KdVKXKE7ujnIrJ7pEpcMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m2WzbWOY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fjIOKt7c; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m2WzbWOY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fjIOKt7c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m2WzbWOY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fjIOKt7c";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m2WzbWOY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fjIOKt7c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 18D8C4D2D9;
	Mon,  9 Mar 2026 08:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqSgFH8WgLvvila9gFlP/7dxVVSbbnoL+65nUtFcXHw=;
	b=m2WzbWOYRqVFgv+nn8hZIwgfOD3ULa0wpqqkZgEFoeFP/0pbkzxbpbmlEILwv4cgNYCbSB
	njjGraaIdDKQs75mFsFFF15GlF5c5kOM73Bth8rzjiiNImZm/eZSdxDs23ROs5ZTaDiDGc
	sT2wA0kl1yTWEpFB1IEogogOuMmw1pY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqSgFH8WgLvvila9gFlP/7dxVVSbbnoL+65nUtFcXHw=;
	b=fjIOKt7coorY1eEm9IxrzzJf+Bk+CDfvrJCzrCPGOhH/0wuUvUmYF0hCBn2CBqf3DIwOZE
	NDqVc23isbmviJAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m2WzbWOY;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fjIOKt7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773046548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqSgFH8WgLvvila9gFlP/7dxVVSbbnoL+65nUtFcXHw=;
	b=m2WzbWOYRqVFgv+nn8hZIwgfOD3ULa0wpqqkZgEFoeFP/0pbkzxbpbmlEILwv4cgNYCbSB
	njjGraaIdDKQs75mFsFFF15GlF5c5kOM73Bth8rzjiiNImZm/eZSdxDs23ROs5ZTaDiDGc
	sT2wA0kl1yTWEpFB1IEogogOuMmw1pY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773046548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqSgFH8WgLvvila9gFlP/7dxVVSbbnoL+65nUtFcXHw=;
	b=fjIOKt7coorY1eEm9IxrzzJf+Bk+CDfvrJCzrCPGOhH/0wuUvUmYF0hCBn2CBqf3DIwOZE
	NDqVc23isbmviJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D97C13EDF8;
	Mon,  9 Mar 2026 08:55:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tcbjMxOLrmnzRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Mar 2026 08:55:47 +0000
Date: Mon, 09 Mar 2026 09:55:47 +0100
Message-ID: <87sea9tm98.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Gigabyte Technology to fix headphone
In-Reply-To: <b55f6ebe-7449-49f7-ae85-00d2ba1e7af0@kylinos.cn>
References: <20260305024958.49026-1-zhangheng@kylinos.cn>
	<875x7axz4x.wl-tiwai@suse.de>
	<b55f6ebe-7449-49f7-ae85-00d2ba1e7af0@kylinos.cn>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 18D8C4D2D9

On Fri, 06 Mar 2026 02:19:57 +0100,
zhangheng wrote:
> 
> > Sorry, I didn't take a closer look. I will check it carefully next time.
> From 6d60f41012a0db7fc5ebbd1e03c47ed837495022 Mon Sep 17 00:00:00 2001
> From: Zhang Heng <zhangheng@kylinos.cn>
> Date: Thu, 5 Mar 2026 10:35:59 +0800
> Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Gigabyte Technology to
>  fix headphone
> 
> The BIOS of this machine has set 0x19 to mic, which needs to be set
> to headphone pin in order to work properly.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220814
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
