Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D99B330663
	for <linux-sound@vger.kernel.org>; Tue, 13 Jan 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312445; cv=none; b=f9J8Si3xb0unlsgVVLt1Hh+qThM0+ZTrzQM8Awx13qacu/VlOObd7472W+MFENs8AVhlELAduVH0zrJwNbDZy93fygN7OvYCqRsXWTM6YsG36fDpicFb9cIYy6SoSwhdhzLr2ziKL2iDROCSSNv0HNh0yJgRszSi8qjuwX7AaXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312445; c=relaxed/simple;
	bh=aKaBl+gUIqb1HSX8fODgW0tlqMVqxV+JilBWhAP/9IA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a8MwCXDpO/REML+e/G47KHG4pyxnG8PutzYlmz9NgS7XTkKW92dbjXGfpzKCM4lqOHf6IDCKtHYCTwU8rci+92+yBHoU1h3mHmc6yxzcDqizBMwYcJ9syZVVeKD4Jk1F3JwVmIWcIdqS4WcVRK6VwAbuS9kpeyx8yz+ckdSATqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mSf9MnZd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8DA48hXU; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mSf9MnZd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8DA48hXU; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mSf9MnZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8DA48hXU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mSf9MnZd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8DA48hXU"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8AFAB33681;
	Tue, 13 Jan 2026 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768312442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xVXW3u7yEQ0srw4GCIi7TfXUqcy0t8tEUsjAIMaA6A=;
	b=mSf9MnZdFDwpd0/FyP0cTEwfYP1Ja9gGCewvWBPnu7fV1cDwKpqZ8I6WeJttrgyUGoxlEV
	tLm4CPjdBRveeI8QrWO4MOX1dfBiuUbsZNniPuw6r1cH5A6x+djFxKLjUY83W9nqsC9Z/u
	tIg78XXGiNhL+f6MfTu0fRCbYrorrJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768312442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xVXW3u7yEQ0srw4GCIi7TfXUqcy0t8tEUsjAIMaA6A=;
	b=8DA48hXUitoTwyJ087iyqqMKyYHB+/3fwOWcwll4649XgdMpZSIKR8wWU+8VHiNWsxXJnD
	kcycwonQjw1hTJBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768312442; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xVXW3u7yEQ0srw4GCIi7TfXUqcy0t8tEUsjAIMaA6A=;
	b=mSf9MnZdFDwpd0/FyP0cTEwfYP1Ja9gGCewvWBPnu7fV1cDwKpqZ8I6WeJttrgyUGoxlEV
	tLm4CPjdBRveeI8QrWO4MOX1dfBiuUbsZNniPuw6r1cH5A6x+djFxKLjUY83W9nqsC9Z/u
	tIg78XXGiNhL+f6MfTu0fRCbYrorrJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768312442;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8xVXW3u7yEQ0srw4GCIi7TfXUqcy0t8tEUsjAIMaA6A=;
	b=8DA48hXUitoTwyJ087iyqqMKyYHB+/3fwOWcwll4649XgdMpZSIKR8wWU+8VHiNWsxXJnD
	kcycwonQjw1hTJBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 776653EA63;
	Tue, 13 Jan 2026 13:54:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id R9aKHHlOZmmcKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Jan 2026 13:54:01 +0000
Date: Tue, 13 Jan 2026 14:54:00 +0100
Message-ID: <87o6mxpqiv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cirrus_scodec_test: Fix test suite name
In-Reply-To: <20260113134056.619051-1-rf@opensource.cirrus.com>
References: <20260113134056.619051-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,cirrus.com:email]
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 13 Jan 2026 14:40:56 +0100,
Richard Fitzgerald wrote:
> 
> Change the test suite name string to "snd-hda-cirrus-scodec-test".
> 
> It was incorrectly named "snd-hda-scodec-cs35l56-test", a leftover
> from when the code under test was actually in the cs35l56 driver.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 2144833e7b414 ("ALSA: hda: cirrus_scodec: Add KUnit test")

Applied now.  Thanks.


Takashi
