Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4D631D362
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102429; cv=none; b=WwKaZ/MJ8XlEInMTHcTMPw/JFNn2wcYcXDvq7QL+5fAg5zqJwXGXjORJ5EVyuM1lIgZ8AiU34e93y3gK9qNg1RUOwb+vG0KKet/a8NF/ycwqPYus2325BULDr8VTNgqcgFrD06xRkQbVuHg6ahnhLZlQHHotLL0U9pNxJu6gI7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102429; c=relaxed/simple;
	bh=lANZsT0rQ9j2v5miAIG8DntDQ1tgGdL6ncvwvjpOblk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ti2YhpauC+nmWvSUdV/tIePO956FefWvpiSWYpEy5ar78NC7KIsLctHloFp1ITkeLBbxi772XBnXXZmLRwcXBUHrKmpAaOmx5aNU8EwsCT01fEx0P9H4ohp1PRCpq9ZzIy3karBE3rcbz4hBlkQVjRdzlvWtwoh0x4qlrXPI+aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jhag/tyK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gLW1cqgR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TojV9Dwe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RJKB1ZQ4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jhag/tyK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gLW1cqgR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TojV9Dwe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RJKB1ZQ4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 87D3D782B7;
	Wed, 15 Jul 2026 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784102425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R1IvlgXwVWWmnu+SViOpEwWiuJyD9bQso1D/8z6HbXA=;
	b=Jhag/tyK60r/dVJRclxORjbyqz15g7erAT0DY56nW/7VYam1uR7mUWf1jlmTVYHQYljRtT
	1Pr0S5JiJXf5Rv0/t8MVrAS58yZdS7V/ZpkYePk4pauG4nTLqP66UIY1rHWGLAKdkS/MYE
	c9lRNj+B297QWa6kBV2ZVJ6jZNQcwFk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784102425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R1IvlgXwVWWmnu+SViOpEwWiuJyD9bQso1D/8z6HbXA=;
	b=gLW1cqgRJdZ1enjRH7yD0HoU+4K+9xGvG3OWDPqljHuNKt/JPCWgVxOeXvlAz+P6P8M3qX
	xJhQbakBaAcE8hDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TojV9Dwe;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=RJKB1ZQ4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784102424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R1IvlgXwVWWmnu+SViOpEwWiuJyD9bQso1D/8z6HbXA=;
	b=TojV9Dwe9qDl4J+5YFSfTxal1OkEm6F1RvOHbrmdfsKJZ9mvSb4Xl7Ty9oWfMFfvJKIeUr
	brZkc7iCUxzrnvF1DAl6nA1v4zgdWY4r5h1sAy+GwR0t3EXk2OK+gvCw1wVtNyOA5Qo2Y0
	YAiO6L2j0er2thJML50Zbf/LGFqrbg0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784102424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R1IvlgXwVWWmnu+SViOpEwWiuJyD9bQso1D/8z6HbXA=;
	b=RJKB1ZQ4EUKxSlO2SYvyqmNfcC4XEJqc5rWLp8r1z9ME2ZDti3CBXJapgEF0BP2nuv8as4
	DVpspXb9JBB4UJDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 67ED2779AD;
	Wed, 15 Jul 2026 08:00:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sQ0uFxg+V2oBQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Jul 2026 08:00:24 +0000
Date: Wed, 15 Jul 2026 10:00:24 +0200
Message-ID: <87ik6gy95z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oliver Ohrt <oliver@theohrts.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speakers on Alienware x16 R2
In-Reply-To: <20260715070409.42696-1-oliver@theohrts.com>
References: <20260715070409.42696-1-oliver.ref@theohrts.com>
	<20260715070409.42696-1-oliver@theohrts.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[theohrts.com:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 87D3D782B7
X-Spam-Score: -3.51

On Wed, 15 Jul 2026 09:04:09 +0200,
Oliver Ohrt wrote:
> 
> The Alienware x16 R2 has two pairs of speakers, but the BIOS
> marks pin 0x17 as unused, so only the pin 0x14 pair plays and
> audio is very quiet/dull.
> 
> Apply ALC289_FIXUP_DUAL_SPK like on other Dell machines to set
> up pin 0x17 and route it to DAC1. Tested on my x16 R2 with
> kernel 6.18.38, and now all speakers play at full volume.
> 
> Signed-off-by: Oliver Ohrt <oliver@theohrts.com>

Thanks, applied now.


Takashi
