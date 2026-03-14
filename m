Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F122517A5
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495144; cv=none; b=ipdHNqFgy2TkLAmxibqFjqQHvI4VN3gPHt0gULjYE8B2Bk/6EpEGH15Mee/A8OVJJ7eQWoZtquAHx7wbJNuYWKo0fD/xLlPWdmxh2KzU4n8gTM9glfc90bVrZKqucA7UQih7qJArJ/rGkX7szKRac2hKAFo6ZnUD1gr+EycyyGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495144; c=relaxed/simple;
	bh=6kde1OsevzqZSejXCe3LVcDjux/1zvP8e7VvG7xJUKo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LjDyW8E/styVFZtG/lGu94JpjxjT89dHxY3aRUYCdr4z+isez04S2SG+EUjBDL6+5ROH+c1H20rIqThaEu6n6SLajr7Jb/C+xtwQqhFAVTPzl1M6SdcRobiSBC3XBrYLMe/hiIaLAyqnxnaWgEaOWrtus7e2TlU+1JdWJLQ1Gh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FPYNb45R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ujlGVzS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FPYNb45R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+ujlGVzS; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FPYNb45R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ujlGVzS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FPYNb45R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+ujlGVzS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 20DEF4D2C4;
	Sat, 14 Mar 2026 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpTkQnmQJHNK06idW8+rM3wRLDeqDhsl9mW1rBlg99M=;
	b=FPYNb45Ra3QR6LnC61AvthZVa2f2FlPBTP7FISE7XByLNxAI1IX2O9K+yIMrzub9cQX5gp
	pq3k/jfS5Znhl2PCuBIgvlSL/Z+zuQF2J0bGZILveiz8CZnSNmmf9K1iy2bUh2cGNSMf0l
	cb2FC69sfpXTMhCJeVPeXLFF1p1L0+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpTkQnmQJHNK06idW8+rM3wRLDeqDhsl9mW1rBlg99M=;
	b=+ujlGVzS4/fXxeTIsMRWdd15GHk9Vxqqi2/+gGuRP8rSJwh9U/oos55PUxDOc2gzmdBem/
	UKDXJhBQsPgVzGBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpTkQnmQJHNK06idW8+rM3wRLDeqDhsl9mW1rBlg99M=;
	b=FPYNb45Ra3QR6LnC61AvthZVa2f2FlPBTP7FISE7XByLNxAI1IX2O9K+yIMrzub9cQX5gp
	pq3k/jfS5Znhl2PCuBIgvlSL/Z+zuQF2J0bGZILveiz8CZnSNmmf9K1iy2bUh2cGNSMf0l
	cb2FC69sfpXTMhCJeVPeXLFF1p1L0+s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495142;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UpTkQnmQJHNK06idW8+rM3wRLDeqDhsl9mW1rBlg99M=;
	b=+ujlGVzS4/fXxeTIsMRWdd15GHk9Vxqqi2/+gGuRP8rSJwh9U/oos55PUxDOc2gzmdBem/
	UKDXJhBQsPgVzGBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E31A142724;
	Sat, 14 Mar 2026 13:32:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y/oRNmVjtWnZDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:32:21 +0000
Date: Sat, 14 Mar 2026 14:32:21 +0100
Message-ID: <87v7eya656.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS ROG Flow Z13-KJP GZ302EAC
In-Reply-To: <20260313172503.285846-1-matthew.schwartz@linux.dev>
References: <20260313172503.285846-1-matthew.schwartz@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Fri, 13 Mar 2026 18:25:03 +0100,
Matthew Schwartz wrote:
> 
> Fixes lack of audio output on the ASUS ROG Flow Z13-KJP GZ302EAC model,
> similar to the ASUS ROG Flow Z13 GZ302EA.
> 
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>

Thanks, applied now.


Takashi
