Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0523368950
	for <linux-sound@vger.kernel.org>; Sun, 19 Jul 2026 08:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784450570; cv=none; b=H+YK3JczEnztEgmO8c4Upmz36gxF6O1vmUIXBKBTwYr0ntnjkpvDHT+WIigNB/afU7a4vrlP6tYVVK0cXxeWKL2MQq2qBUM9uKWNuoIJvF5TWXXZPAQRNd33f4dPnAtuJ9SX8gf/Tp1kHhaMrMGfJy+tAEZqbyqSZP1L2n11BVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784450570; c=relaxed/simple;
	bh=W8VdWsKrVB5MKJ3Ap6V/79Jv7TxbCfO/aBMIdSmVeZY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdR9En2dGdziT8svG8ta/CSY6pXQs4itzhg31iEJ8gAa7k6+9Rvh0VXMBDfEeVUHaRzuDIWiyhCLwMY60uch6NhlvPNwhp6WTotmFHybIk/lluryJBUqqvluFl4fzO7T5BY11Gtgc8vBm33eK/NQia71kdqwDK42e3q7fQr+xP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NkHDiKHA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=VryRzwG+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OPrseuIS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rUFWVDGN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NkHDiKHA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VryRzwG+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OPrseuIS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rUFWVDGN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3DC1F3E0F;
	Sun, 19 Jul 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784450560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kB+i7s4+WrPiezhWdXddQ3BZSK+zqZtEUOlQNlip6cQ=;
	b=NkHDiKHADKUVS/cpYcDjm3sxhmsysfZfeKQctiZ3VzYzHNIqjY/V6+iAL8unbK3XfYH+/M
	529JSPIEXjnWczob7XPGfIwr5iNZ3WDVAPrE+cYvJOpa56WrTE7FZtJ+40yx1c6hxmBGCU
	KtoDOgB8WmvVXZzCe32B8sIMXZeHvcg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784450560;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kB+i7s4+WrPiezhWdXddQ3BZSK+zqZtEUOlQNlip6cQ=;
	b=VryRzwG+nUJvVauQ07+yweQ2DCQ3j6M8KyjNmnDc0W4zH6oO7c7H/dpqEJdWrwu2hlUCWX
	iheigFh/gJHkHgDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OPrseuIS;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rUFWVDGN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1784450559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kB+i7s4+WrPiezhWdXddQ3BZSK+zqZtEUOlQNlip6cQ=;
	b=OPrseuIScdteq/jahBLA3Cf7rs2/qJ8y1Xr2nwrF2W0nLA2LXf8DqqJA8GHx6lIPSLTLuR
	Ol0JBEB6dHbN7awUHLm5ffoqh1NlLL6Rf3ovFKP3VZM+InTDReYpjSYtAyQcJKSIIsBA4F
	J9KQdgtDgVWzBQD7mw8Er2tOYt1jnzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1784450559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kB+i7s4+WrPiezhWdXddQ3BZSK+zqZtEUOlQNlip6cQ=;
	b=rUFWVDGNIoFak/TwU6w8xjQHZ8SHhtzyvU4a/xBCRRcQuf2pE+USWqJtYlZEGHY9G+Acf7
	UnJhyLepDag0tSBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04EE1779AA;
	Sun, 19 Jul 2026 08:42:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dd8GO/6NXGp+RQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 19 Jul 2026 08:42:38 +0000
Date: Sun, 19 Jul 2026 10:42:38 +0200
Message-ID: <87bjc3s741.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: tiwai@suse.de,
	david.laight.linux@gmail.com,
	wangdicheng@kylinos.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] ALSA: sparc/dbri: Fix "possible condition with no effect" warning
In-Reply-To: <20260717091542.721877-3-wangdich9700@163.com>
References: <20260717091542.721877-1-wangdich9700@163.com>
	<20260717091542.721877-3-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 3DC1F3E0F
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kylinos.cn,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,kylinos.cn:email,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 17 Jul 2026 11:15:41 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Fix a compiler warning about a condition with no effect:
> 
> sound/sparc/dbri.c:1843:1-3: WARNING: possible condition with no effect (if == else)
> 
> When DBRI_DEBUG is not defined, dprintk expands to an empty do-while
> statement, making both branches of the if-else no-ops. Guard the entire
> debug block with #ifdef DBRI_DEBUG to eliminate the warning and keep
> the rval reference consistent with its declaration scope.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
