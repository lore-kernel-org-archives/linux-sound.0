Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599406;
	b=OmUbrO8pPhqM8zI1FVU4CB3pbdMzt1BPjhf2Xe8TqOe5rJbY4VxZ3Uu50ijOUxkqnx3a
	 kQJ43UVT/zbMBVRXi0J0H2mUJxGPE5F+x0IO3m2P867E1AC7ejpUd/RV6S+FJ1+ljuXfZ
	 GvZisiwAaLIoRqMeW+KoG9EJ0GHEursO8zwvQGWh0SYoDIDrCvcgry1jqm7uBwCmyBSx7
	 BQAeu65kvhlUl7APSnRxq4+M+vDmbJ9fw0uSyy2oSZGfJXbsMwgocC/TZFpMjsEzPQHdp
	 RZRbz1UJdVHr9Gz2EUxpKaNJWjYI+UpwuglG8Xhdz0Hd9Milq89Z4gi4jtE/QnIgaUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599406;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=x2kinh6hV+qK8x2DoN00h9+GqH/EBU+M7exisa+Prqs=;
	b=S5wSnkxdK8ISVhVdCKdtWwNLPo4PaSUpAPSR+3yg1P+D7i+CJm3YkGhJRQvHxDA9gl2k
	 +yf2sSgZLWjKqOdHdAE4kMUkPUse9mTI3z0C5eBeNDDWAT/j9L+XpJWiQEmxsT6EPiVyy
	 oBIKO9W3e5xq+PInRhGiGDk7Av0/bQDi9/dRAKUeGxTIUoSKzX/lpRv/WxgnF+iQH68wx
	 O37VP3G+9EbeVsXg1sCu6ylnO6tpxnb4FE85dC5Z3I3z7EtDIqE4y6YL3ac6gakeB0UXi
	 YnU0s5pecs0pCyhpzQo1K9MLOogSS/8mptfhACNYaaCsDK3yGgSVtuZcmhlj2LZk8Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GHOjpobJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WdYc0wfS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a806HDVA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JjRyQaID;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BE4606A321
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 09:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BE4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=GHOjpobJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WdYc0wfS;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=a806HDVA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JjRyQaID
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B09091F747;
	Wed, 25 Nov 2026 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795599403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2kinh6hV+qK8x2DoN00h9+GqH/EBU+M7exisa+Prqs=;
	b=GHOjpobJtboqqi9Tru6WJWW1lPNi3uftcVS44tRqXjRTHm9aX9Ejqo8XHPXnTnVgklHsNe
	BuNoVo3SotK0ShwUs6bPDTNiBbsSKV7Uarpw+uEUGCyCebhAncKrdHLJWQ05wlUvbkFCxw
	bLKxXp3iKmgwVMoqbQt+wd9snei6/yE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795599403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2kinh6hV+qK8x2DoN00h9+GqH/EBU+M7exisa+Prqs=;
	b=WdYc0wfSizXJ08o17zLxFzoIx6luu7fCLsYPuVOhgR6ODHSW0F4Dy4orCO658UNwb9BCCL
	ixvd318Im6IMRPAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795599402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2kinh6hV+qK8x2DoN00h9+GqH/EBU+M7exisa+Prqs=;
	b=a806HDVArz7YXvvEnOCtV/DYNwWUAfhumY6vzLs2i6Omgjt2ToMnY7xfWk2m90ITYUKACm
	ZO+0JOhHbv3NEiMx0SMyP3cPPMnCk0gF7wsxOcYVuHknWfC0LhyDoywRUU3EFMLUU0L4+f
	cHRlUGjr08+BmuiRInWADTDss4p4D9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795599402;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2kinh6hV+qK8x2DoN00h9+GqH/EBU+M7exisa+Prqs=;
	b=JjRyQaIDNR2yYtIKcEkImWLEYiAdddEwUyXNR5fbiUIbJyC2YWP+cGM6rV/R2TMJBdUBvP
	Z17C9iFRXKZ5swCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 62F6F1339F;
	Wed, 25 Nov 2026 09:36:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vhYtDSqsBmvIMAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 09:36:42 +0000
Date: Wed, 25 Nov 2026 10:36:41 +0100
Message-ID: <87fqwp8d7a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: SungHwan Jung <onenowy@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix distorted headphone audio on Acer Predator PHN16-71
In-Reply-To: <20261125081636.4619-1-onenowy@gmail.com>
References: <20261125081636.4619-1-onenowy@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Wed, 25 Nov 2026 09:16:36 +0100,
SungHwan Jung wrote:
> 
> On the Acer Predator PHN16-71, booting with headphones already
> plugged into the 3.5mm jack results in distorted headphone audio
> until the headphones are unplugged and replugged.
> 
> Vendor COEF 0x4a reads 0x2010 when the distortion occurs, meaning
> that the Reset HP JD bit (BIT(15)) is already clear. Clearing the
> bit alone doesn't fix the issue.
> 
> Add a dedicated fixup (ALC245_FIXUP_ACER_HP_JD_RESET) that sets
> and then clears COEF 0x4a BIT(15) during HDA_FIXUP_ACT_INIT while
> preserving the remaining coefficient bits.
> 
> Chain ALC245_FIXUP_ACER_MICMUTE_LED to retain mic mute LED and
> headset microphone support.
> 
> Testing confirmed that pulsing COEF 0x4a BIT(15) restores clean
> headphone audio.
> 
> LLMs were used to assist in analyzing the cause of the headphone
> audio distortion and refining the commit message.
> 
> Signed-off-by: SungHwan Jung <onenowy@gmail.com>

Applied now.  Thanks.


Takashi
