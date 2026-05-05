Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218CE2D061D
	for <linux-sound@vger.kernel.org>; Tue,  5 May 2026 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777975105; cv=none; b=RBX80RMsldLhzu0qDA0Y7ueiwPvBseR15shsMbCoDiDAbYspzx/E7Jj9X1t9cRAfiBQBHshd+9nVNnm0D/F0ynJztFZ7pJkTWmf4AWnMux2StuhtR3cWIVgQfh19bIcb7cMT7cHCTxOgzsNVSgmWgy/BIY5dmPbO5L2ZoPDecu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777975105; c=relaxed/simple;
	bh=sPfnPC9uJuYKKVw/EsgdUUQuS3nO635471VbYrlwdes=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYkJXYOqHql9dAbEMWFL55NdIYq/t/lWvwuHpLclIU8AwBQy/Hrepbl2R9MDlXh9/VcrPTNCqxoMT7ZU8G3dFixFL9tUoQ1rc0sOg1Ped1FK75/Sq7f70iIlYs7Q4X+Fjb3MgFeYEkYOmuSMxjGHsOvjFUGCGZOxaORMvXsl18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S8O8yYZa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=emOh5fv7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=S8O8yYZa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=emOh5fv7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S8O8yYZa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="emOh5fv7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="S8O8yYZa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="emOh5fv7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4B8AD5C13D;
	Tue,  5 May 2026 09:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777975102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KctJbaiioZNlarf+sUFIcxsGNYYhDCpEN05JM4NJcI=;
	b=S8O8yYZawRD+n0zmdG+0Frr3pcWsfa+YuO2/C/C61cq6qflkyeG6+VUFRHOK/ZKrZPvhxv
	huUXIbz9AZZ20nR2KENcnD0ZXofvS7njtABE43nO5qloL77V2Ss4WPLOsmYjUSIY1xud1P
	yQiy09ZoEkzY5zAt8NCm1h7QraE5eUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777975102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KctJbaiioZNlarf+sUFIcxsGNYYhDCpEN05JM4NJcI=;
	b=emOh5fv7vYMtnB5Dphr6uaCNYQuRiYq4h9wrMG/Y+QH8mFrvVB0IP9MYHRXQjwC5uAJ1mf
	x2yGt+IwmE0cI0CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=S8O8yYZa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=emOh5fv7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777975102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KctJbaiioZNlarf+sUFIcxsGNYYhDCpEN05JM4NJcI=;
	b=S8O8yYZawRD+n0zmdG+0Frr3pcWsfa+YuO2/C/C61cq6qflkyeG6+VUFRHOK/ZKrZPvhxv
	huUXIbz9AZZ20nR2KENcnD0ZXofvS7njtABE43nO5qloL77V2Ss4WPLOsmYjUSIY1xud1P
	yQiy09ZoEkzY5zAt8NCm1h7QraE5eUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777975102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KctJbaiioZNlarf+sUFIcxsGNYYhDCpEN05JM4NJcI=;
	b=emOh5fv7vYMtnB5Dphr6uaCNYQuRiYq4h9wrMG/Y+QH8mFrvVB0IP9MYHRXQjwC5uAJ1mf
	x2yGt+IwmE0cI0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22E27593A3;
	Tue,  5 May 2026 09:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c7PXBz6/+WmvcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 05 May 2026 09:58:22 +0000
Date: Tue, 05 May 2026 11:58:21 +0200
Message-ID: <877bpiw536.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Rong Zhang <i@rong.moe>,
	Cryolitia PukNgae <cryolitia.pukngae@linux.dev>,
	Arun Raghavan <arunr@valvesoftware.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Kees Cook <kees@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: simplify mixer control name handling
In-Reply-To: <20260504212008.147373-4-thorsten.blum@linux.dev>
References: <20260504212008.147373-4-thorsten.blum@linux.dev>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,linux.dev:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4B8AD5C13D
X-Spam-Level: 

On Mon, 04 May 2026 23:20:10 +0200,
Thorsten Blum wrote:
> 
> In get_term_name(), remove hard-coded return values and a strlen() call,
> and return the number of bytes copied by strscpy() directly.
> 
> Since get_term_name() may now return -E2BIG on string truncation, check
> name_len < 0 and return early from get_connector_control_name() if
> needed. Also replace strlcat() with strscpy().
> 
> Other get_term_name() callers only check the return value for non-zero
> and are not affected by this change.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied to for-next branch.


Takashi
