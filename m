Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971CD3B95F6
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603316; cv=none; b=Blb22mp8hxhPlrybHmqFr8JS99aGftolAhqX6wzeRWLSxg8Qc++m6+BNisgfWNahcHWJcBTvDlq6kw4jcKC3BpeyXW3kh2a/Q2ZVCRAVc4wkRcHZca8Mpb9a5J9Y2ci2iBPTZtyhxuaEzwUciOfYLuwel0LnX2MXSqhlxKyittc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603316; c=relaxed/simple;
	bh=s9XQ5kv5e+sY/W/Bdqv4K4Bni03vY8UbEJl/6hWk5wA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jkxh4KMJsLzluu3y1Dw94hAlHZ6ln6sMwC2aIeU5J97rHRUxo1kjE0x0uje3XczialvO7tXjCcSoqmbaCNp5vwMIh6WPt2H8yaybUDrN/lprjOlR/h4i4VJDTllTufS5Xaf4kmHmrl09SD7HdyqWASlEhEiwC7s5Tv+xGd+SrZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nh3uuOo5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0UPQr57A; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Nh3uuOo5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0UPQr57A; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nh3uuOo5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0UPQr57A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nh3uuOo5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0UPQr57A"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 21F5C4D1C7;
	Fri, 27 Mar 2026 09:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym+YAyRZYoHgguaVtrmW7eqlKvCM7BAFuE0LZ0RcAL4=;
	b=Nh3uuOo5OBcIRefTgOycM5IKz7+xHuu3TGPrwiQqpV8deIUjmng7SmxY2QxNMeerS3vK0J
	F9891UserV6lIr8xx1PrzoVDxITXh4Q1E9rg9Gz7oxXDx5OTvt4r8cUgBOCTUejaOPRosq
	4e2m9qE/JJqH/Ay7V54n1Sm9RKGu5EM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym+YAyRZYoHgguaVtrmW7eqlKvCM7BAFuE0LZ0RcAL4=;
	b=0UPQr57A1aLm7x+G+W9XxXDB97JrO10xqSrDlZpkP/L2tbvFMjRhUfJLFzDOueNwrHRBu6
	CulJe2XY5OJ03iBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774603307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym+YAyRZYoHgguaVtrmW7eqlKvCM7BAFuE0LZ0RcAL4=;
	b=Nh3uuOo5OBcIRefTgOycM5IKz7+xHuu3TGPrwiQqpV8deIUjmng7SmxY2QxNMeerS3vK0J
	F9891UserV6lIr8xx1PrzoVDxITXh4Q1E9rg9Gz7oxXDx5OTvt4r8cUgBOCTUejaOPRosq
	4e2m9qE/JJqH/Ay7V54n1Sm9RKGu5EM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774603307;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ym+YAyRZYoHgguaVtrmW7eqlKvCM7BAFuE0LZ0RcAL4=;
	b=0UPQr57A1aLm7x+G+W9XxXDB97JrO10xqSrDlZpkP/L2tbvFMjRhUfJLFzDOueNwrHRBu6
	CulJe2XY5OJ03iBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0F4C4A0A2;
	Fri, 27 Mar 2026 09:21:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fYi4NypMxmkuGAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 27 Mar 2026 09:21:46 +0000
Date: Fri, 27 Mar 2026 10:21:46 +0100
Message-ID: <87se9lsk45.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc5
In-Reply-To: <35eee6c4ded9dcae303afc38a82c36a1@kernel.org>
References: <35eee6c4ded9dcae303afc38a82c36a1@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 26 Mar 2026 14:32:46 +0100,
Mark Brown wrote:
> 
> The following changes since commit c369299895a591d96745d6492d4888259b004a9e:
> 
>   Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc5
> 
> for you to fetch changes up to d40a198e2b7821197c5c77b89d0130cc90f400f5:
> 
>   ASoC: SOF: ipc4-topology: Allow bytes controls without initial payload (2026-03-26 11:16:03 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.0
> 
> This is two week's worth of fixes and quirks so it's a bit larger than
> you might expect, there's nothing too exciting individually and nothing
> in core code.

Pulled now.  Thanks.


Takashi
