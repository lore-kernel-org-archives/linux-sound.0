Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7813E0257
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828967; cv=none; b=HCGVDqw6fNzYj6tzYZ73zWelBq/DlAiAx2B4Bf2RbrHdFK9SV6xX88d/ba79Wdyb+/f0nEOUBprFLfhvjEqSlZA95d3YtYPmgt/9v2fOx/2v12POyksXB5wWn6Vw6mMaITuJ/0QwBxrq68yAwFw/vQ/ozKHIOOQazJiwzVa+cgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828967; c=relaxed/simple;
	bh=NtZdYTjr2Y72Hshw6GGMurJFVtneKYUTtjMeNwy2+JM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xob2SjoNwtJ0wV6nJAiC8sfKm58dRX5LIfLpVQP4FP6H3VsWbKfrKo6Sh/S4M700sqIulDeUyDnrsC0I1C6gc2iJu9XB78widWFXcXzPzfs93sZMW3eVOFIbYjeBuq/h6M8hOlfJkP48UkZCKB7svOCG0ft+GwENwF+Mou5bEqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=AuImmLfr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ahg/6ra2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dt/aIUZF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iQuVBHQg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AuImmLfr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ahg/6ra2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dt/aIUZF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iQuVBHQg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EAF5C675BE;
	Fri, 15 May 2026 07:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E5lB7dW1xvtEvX9VF4g0dSKrvtXJwz5OgGCKbI2n/u0=;
	b=AuImmLfrxV5F5sWYONsqbHWmHSZ77DO91RRa0aFBvdw6771QU0FVkOpdpwQ6teM6Pkmi0H
	JuUCVITwl5YZFtxyzmhzJjG/RXf5awGuUzPsiHDsvUXUuPSbO34Midu7EwslatIFAWCW2S
	U79CUspHbmBLJ0qku2o6bKhwOZyUTxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E5lB7dW1xvtEvX9VF4g0dSKrvtXJwz5OgGCKbI2n/u0=;
	b=Ahg/6ra2hnrxVnywVKxSb7XG/SP21IpDyCNzkIdiOiykzsI90IwXUmx6SKfe8RLHxdz/3X
	2rBfIQjZdPRg+eDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828963; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E5lB7dW1xvtEvX9VF4g0dSKrvtXJwz5OgGCKbI2n/u0=;
	b=dt/aIUZF9AYggn9Q2qq//hu83FITa8LJx+LjekC2cFHUBM0hq7S4ee0DMn+Obp8OvLg047
	E0esRE0UH7vWYGM6iD3AX6DRmKyuQcgZg+H+cVgQqFV7jrR0nvhYI3D02/bwjJsU+rSlCX
	2g5aHaLvrkT+o31XSC47veOC47PdYCE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828963;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E5lB7dW1xvtEvX9VF4g0dSKrvtXJwz5OgGCKbI2n/u0=;
	b=iQuVBHQgDiy3I1HtuKYd8KhhwlNsDs3+Q/WFXUEaienxkT34q5tAfnsCEmQKH6krAE+cl8
	rEgIueQXnJfIOQAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9F69593A9;
	Fri, 15 May 2026 07:09:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PmEdLKPGBmolYAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 07:09:23 +0000
Date: Fri, 15 May 2026 09:09:23 +0200
Message-ID: <87zf21taho.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Quan Sun <2022090917019@std.uestc.edu.cn>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	thorsten.blum@linux.dev,
	ian_minett@creativelabs.com
Subject: Re: [PATCH] ALSA: hda: Fix NULL pointer dereference in snd_hda_ctl_add()
In-Reply-To: <20260514132245.3062884-1-2022090917019@std.uestc.edu.cn>
References: <20260514132245.3062884-1-2022090917019@std.uestc.edu.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,uestc.edu.cn:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Thu, 14 May 2026 15:22:45 +0200,
Quan Sun wrote:
> 
> snd_hda_ctl_add() dereferences kctl->id.subdevice without checking
> whether kctl is NULL. Multiple callers in sound/hda/codecs/ca0132.c
> pass the return value of snd_ctl_new1() directly to snd_hda_ctl_add()
> without a NULL check:
> 
>     return snd_hda_ctl_add(codec, nid, snd_ctl_new1(&knew, codec));
> 
> snd_ctl_new1() returns NULL when the underlying snd_ctl_new() fails
> on memory allocation (kzalloc_flex),which can occur under memory
> pressure or via fault injection.
> 
> Add a NULL check at the entry of snd_hda_ctl_add(), matching the
> pattern already used by snd_ctl_add_replace() at the same call
> path (sound/core/control.c:515). Return -EINVAL to let callers
> handle the error gracefully.
> 
> Fixes: 44f0c9782cc6 ("ALSA: hda/ca0132: Add tuning controls")
> Signed-off-by: Quan Sun <2022090917019@std.uestc.edu.cn>

Applied now.  Thanks.


Takashi
