Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D0F21B1BF
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772705889; cv=none; b=NsDFC/RwacCcrghiN7gM7kUC0wLhBedLwQZ6hM4VBSCc3MGPBhNs67gJgLCrceCYTnZPhCE8QUAF+2EdATWiIf2Et9Vtls2B6MDZZ7QJoARLmc04bW1ogRs6VvQ2jNaByVCjqhYqLPnzS/L8IYiS3A4c0aO2B3wq1eR91xX6M4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772705889; c=relaxed/simple;
	bh=BnRy5OAYrtn4zXSIqDR+8Xc8KDN+p5CXNhVfoELcvuU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=btX+RkYt4edNifiE2AFko7rGpZ4gEvTizdebDBOp+3lGHWaPQL3Mzf4bWpQnLFJlciIH9tm/o+NhXuAe7YfrlVtTKIApEn0bg2+xHuvjS58rT4pepDcZ+Y1osGPbkCUk0z9HknIG+JKCaFvQDtjHvUFII44BvxQRXCTStZBmH9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HOjiXlrg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4a0UHMq7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HOjiXlrg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4a0UHMq7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HOjiXlrg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4a0UHMq7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HOjiXlrg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4a0UHMq7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 799B85BCF6;
	Thu,  5 Mar 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772705886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=HOjiXlrgpocBy0exQ5pcz5GshgfbWJCZqQRttrCkWHnKl5uTovcT0YWQ0Y1lG90KxRRA4v
	Qdf6uydzbvtHk6PDGBFcrpA/u2+pSS+i8svXe+Dt7RP3EJDwKULpUltH8aOBznooHAzIC7
	4EN3KA8B56yXxmXkH9eGBzVXhZyamGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772705886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=4a0UHMq7ABPKOOiDlN7qatKNtFD9Lo/2hjf77Lo1ES258szVqWaTkvIfR4aXOWy58kz9gM
	wE8D+baGldVevnDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772705886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=HOjiXlrgpocBy0exQ5pcz5GshgfbWJCZqQRttrCkWHnKl5uTovcT0YWQ0Y1lG90KxRRA4v
	Qdf6uydzbvtHk6PDGBFcrpA/u2+pSS+i8svXe+Dt7RP3EJDwKULpUltH8aOBznooHAzIC7
	4EN3KA8B56yXxmXkH9eGBzVXhZyamGU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772705886;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B6E7IV+RocukvDYzrznAWf1CA3qHkgH4euHnWwhlxQ=;
	b=4a0UHMq7ABPKOOiDlN7qatKNtFD9Lo/2hjf77Lo1ES258szVqWaTkvIfR4aXOWy58kz9gM
	wE8D+baGldVevnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3EF033EA68;
	Thu,  5 Mar 2026 10:18:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O0fxDV5YqWk+YwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 10:18:06 +0000
Date: Thu, 05 Mar 2026 11:18:05 +0100
Message-ID: <87pl5iy3z6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 2/2] ALSA: control: add ioctl to retrieve full card components
In-Reply-To: <cf59b85f5bfa3607b7ef799714df56bf42daa67a.camel@opensource.cirrus.com>
References: <20260303145815.9930-1-mstrozek@opensource.cirrus.com>
	<20260303145815.9930-2-mstrozek@opensource.cirrus.com>
	<87seagx6c4.wl-tiwai@suse.de>
	<c4392a10442c436484d9758c54622888b07a3a74.camel@opensource.cirrus.com>
	<87v7fay4l1.wl-tiwai@suse.de>
	<cf59b85f5bfa3607b7ef799714df56bf42daa67a.camel@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 05 Mar 2026 11:11:40 +0100,
Maciej Strozek wrote:
> 
> W dniu czw, 05.03.2026 o godzinie 11∶04 +0100, użytkownik Takashi Iwai
> napisał:
> > On Thu, 05 Mar 2026 10:54:35 +0100,
> > Maciej Strozek wrote:
> > > 
> > > W dniu wto, 03.03.2026 o godzinie 16∶47 +0100, użytkownik Takashi
> > > Iwai
> > > napisał:
> > > > > 
> > > > > + */
> > > > > +struct snd_ctl_card_components {
> > > > > + int card;
> > > > > + unsigned int length;
> > > > > + unsigned char *components;
> > > > > +};
> > > > 
> > > > And the ioctl can serve for two purposes:
> > > > 
> > > > - When length=0 is set, the kernel stores the current number of
> > > > bytes
> > > >   and returns without copying.  User-space can use this mode for
> > > >   allocating the buffer.
> > > > 
> > > In alsa-lib all data must be allocated beforehand, so this
> > > length==0
> > > query is not very useful there, it will just go into a [512] array
> > > anyway. Are there any other users that may benefit from this?
> > 
> > My suggested API can work even with the fixed size 512, too, if 512
> > is
> > hight enough.  It's just more flexible.  And there is no restriction
> > about alsa-lib data allocation; the function can query the size then
> > allocate, too.
> > 
> > 
> > Takashi
> 
> OK, will prepare v4 with this, thanks

Well, let's see how others think, too.  The API design needs more
considerations because we can't change it any longer once after
defined.


thanks,

Takashi
