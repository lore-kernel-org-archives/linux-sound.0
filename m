Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81D339A068
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778828139; cv=none; b=X9+TIa2AjcTgEvHXjrdAEvo8yojmCDH0hq5xFm/YPyfNEnjNg33D4T6sihMjrR3Te2qPM295vVPQ0RkrbAN6dWBk8a5uct8Zd2Smwd7XpqbE+Aa+6NfdONZkJ8NfotivwNd4pWaR/ZaZXVCULy4lqWkPsJovlOwtd478CgbmmCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778828139; c=relaxed/simple;
	bh=V8/7dcG4YKKRtQY1emSNwarj3tvseTNdxJgaYPuQ3Bk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fru4lRjwbjNKNSk4da4tmKdVG7tLmrHVTcw9oQ7nEB0brSapyWEjDVOY4lzbXQwkq/iMMsTMEDl5O1OyZ9osVqoX7zyNir80IYiMnK8mgctWqlv0ZkO0LpxcJR3oEXn24rDwdAieCN/RPxTnV3H0cPf87AUYiJH2HS6EpVYXHgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sm/1uNxI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8qbqkFa7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Sm/1uNxI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8qbqkFa7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sm/1uNxI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8qbqkFa7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sm/1uNxI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8qbqkFa7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 271D76B2A1;
	Fri, 15 May 2026 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xYmIenVMH+yqhwyJrvCMit6NPjZhq1+okGy0dyLLbq8=;
	b=Sm/1uNxIAsqVUyDdMFamc9QC8Yh1QWK2zk5r+VkudT+R+x19Xc/uEEKULOluFp7NCicYRi
	GH20Ziy3knVcOTvRlaBWWyX5g3iNIYZ3HAD2FI59FY0lqyOOpiC+ZPb0IEiXfvOXKpJpni
	SvpAdvOrGB/Zm87o0zk/FNhw/+awaWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xYmIenVMH+yqhwyJrvCMit6NPjZhq1+okGy0dyLLbq8=;
	b=8qbqkFa7H+0HWrnjM7qWmIHDW20DOL0/DKl5jSy4cD3qc2abh64dTJxqls1BNPwBDDzkyU
	SugFaiyP+7UbaMBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Sm/1uNxI";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8qbqkFa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778828136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xYmIenVMH+yqhwyJrvCMit6NPjZhq1+okGy0dyLLbq8=;
	b=Sm/1uNxIAsqVUyDdMFamc9QC8Yh1QWK2zk5r+VkudT+R+x19Xc/uEEKULOluFp7NCicYRi
	GH20Ziy3knVcOTvRlaBWWyX5g3iNIYZ3HAD2FI59FY0lqyOOpiC+ZPb0IEiXfvOXKpJpni
	SvpAdvOrGB/Zm87o0zk/FNhw/+awaWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778828136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xYmIenVMH+yqhwyJrvCMit6NPjZhq1+okGy0dyLLbq8=;
	b=8qbqkFa7H+0HWrnjM7qWmIHDW20DOL0/DKl5jSy4cD3qc2abh64dTJxqls1BNPwBDDzkyU
	SugFaiyP+7UbaMBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1AAB593A9;
	Fri, 15 May 2026 06:55:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HxGMNWfDBmrrUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 06:55:35 +0000
Date: Fri, 15 May 2026 08:55:35 +0200
Message-ID: <878q9lupp4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Wood <simon@mungewell.org>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: M-Audio C600 disable Output Gain Knob
In-Reply-To: <20260511212458.44142-1-simon@mungewell.org>
References: <20260511212458.44142-1-simon@mungewell.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mungewell.org:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,mungewell.org:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 271D76B2A1
X-Spam-Level: 

On Mon, 11 May 2026 23:24:58 +0200,
Simon Wood wrote:
> 
> The C400/C600 interfaces have a large output gain knob which attenuates
> the outputs as stereo pairs (1/2, 3/4 and 5/6). The Windows driver/app
> provides a control to disable this knob/behaviour on any/all outputs,
> forcing maximum gain on each.
> 
> The 'disable behaviour' is desirable if any outputs are being used for
> aux/effects sends, or if interface is being used as a live/matrix mixer.
> 
> This patch adds a control to select which output pairs are affected by
> the Output Gain Knob. Default behaviour is to select all outputs.
> 
> Tested on the C600, likely also works for the C400.
> 
> Signed-off-by: Simon Wood <simon@mungewell.org>

Applied to for-next branch.  Thanks.


Takashi
