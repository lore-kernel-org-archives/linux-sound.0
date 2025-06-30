Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933FE1FBE83
	for <linux-sound@vger.kernel.org>; Mon, 30 Jun 2025 07:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751267522; cv=none; b=fla6F0OaJVwtvKpT0RLBne6s2aHoQ7/MgL5XmbVRdWvpGvYurCq1nM2tktFskJCNTaVG5UbYhm3GROy2DTrg3irTHTbBkM+EhQ4m9+XPx3CM9OpPTe8f3RwNwWfwyBkuvZr2fh5uixp88LSc8ONPoSo8b/sMH8cUSsYypstOa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751267522; c=relaxed/simple;
	bh=4LZzuUp+bdgqDLHGaNAj0ECN42yJs3Hr4SHlIWjKdn0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p8vckO9mnjVIr4E7l5XjvWvTL+1HjlWTXrvxJyU27GwPW66U94K/H5SQf5yJdIuTdFOwMWIejVYusXl1DKJ5KRK5qKpKVU55ZBhO8fGnm2Bx9tGLXkmQKXHOuLzw1xcTTXSokspSNxsEgRClqsnjrOPKroLHCjJjJ2dhpfRyzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RLq8s10Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6NQlStgx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RLq8s10Z; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6NQlStgx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RLq8s10Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6NQlStgx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RLq8s10Z";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6NQlStgx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 798131F38C;
	Mon, 30 Jun 2025 07:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751267518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YG5RHBxiLUk6rdRwLvrnHICcbqCgPbm99p0wzZ5HpzM=;
	b=RLq8s10ZNJMlSZdrgDaEKKgXi0uoSHIaWVrFAkj5hIQHVztePeVk1hg1iiykWS6i+xIm9q
	v0EnMt/VCIYefVDR0rRxssliNJz5fq1jSPN0NUy/O/dn5zj1reaVUjB5VPSVSQ0JnicV8/
	hliTEXMfNWgtIQT0JFaSmMctMWAcfT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751267518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YG5RHBxiLUk6rdRwLvrnHICcbqCgPbm99p0wzZ5HpzM=;
	b=6NQlStgxXLA+Q/GswdCl7csK8UwfuLInljjUDjE+fFP/CgK+kwMcPT/h3GuPw4uDMkA2L9
	1yg+LQEucYw8k+Bg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RLq8s10Z;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6NQlStgx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1751267518; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YG5RHBxiLUk6rdRwLvrnHICcbqCgPbm99p0wzZ5HpzM=;
	b=RLq8s10ZNJMlSZdrgDaEKKgXi0uoSHIaWVrFAkj5hIQHVztePeVk1hg1iiykWS6i+xIm9q
	v0EnMt/VCIYefVDR0rRxssliNJz5fq1jSPN0NUy/O/dn5zj1reaVUjB5VPSVSQ0JnicV8/
	hliTEXMfNWgtIQT0JFaSmMctMWAcfT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751267518;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YG5RHBxiLUk6rdRwLvrnHICcbqCgPbm99p0wzZ5HpzM=;
	b=6NQlStgxXLA+Q/GswdCl7csK8UwfuLInljjUDjE+fFP/CgK+kwMcPT/h3GuPw4uDMkA2L9
	1yg+LQEucYw8k+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54E8513983;
	Mon, 30 Jun 2025 07:11:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id x/lpE744YmhMYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Jun 2025 07:11:58 +0000
Date: Mon, 30 Jun 2025 09:11:57 +0200
Message-ID: <874ivxg0ua.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Improve filtering of sample rates on Focusrite devices
In-Reply-To: <20250630013357.1327420-1-alexander@tsoy.me>
References: <20250630013357.1327420-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 798131F38C
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.51

On Mon, 30 Jun 2025 03:33:57 +0200,
Alexander Tsoy wrote:
> 
> Previously we were filtering out only upper unsupported sampling rates.
> This patch adds filtering of the lower unsupported sampling rates. As a
> result there is 1:1 mapping between altsetting and supported rates.
> 
> The issue was found on a Scarlett 3rd Gen card (see linked bug), but the
> same filtering is likely needed for the Scarlett 1st and 2nd Gen as well
> as the older Clarett cards which lacks Valid Alternate Setting Control.
> 
> Patch was not tested on a real hardware.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=214493
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Applied now.  Thanks.


Takashi
