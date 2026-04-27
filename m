Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355538758F
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777290436; cv=none; b=IRQ7HY03eXVk6Q4DI68reLrPVlZcZea8Iab37jGWfsaF15u7tj3WJDGoO9sdOqQW3MxyCAfC2lZHgtZWq3rtIFQY4pGt7X6cSiQ2Vw0IYzbTI/21inSYNZaarmlIKY0T6aWkT+ugSujPpylVE/amFwGt7iOlXC71oElMAwNJOO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777290436; c=relaxed/simple;
	bh=QeDnL/v5nkbfcBIxOpa/Jzr9B9LT/EYGGSZDC1bPEBE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=prFQJGdaJ176Kzia5RxPFz1+smsvzBERXZMD2EQGWyjqhoQJsMX715GWEAgNGTR5hrY2R7AcBcMZo1Fd9P9iK+P2swafZPyt7eikeBvnBO0zHEWwKJTTR6NvHUxytESONs5EVr2AIa1M6FS0SjlNdtnGlCyJRBwlwP94AsciNA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WHRtGn+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5cYEZcQz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=WHRtGn+A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5cYEZcQz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WHRtGn+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5cYEZcQz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="WHRtGn+A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5cYEZcQz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 170206A906;
	Mon, 27 Apr 2026 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DusX2QQbSH+SZlRDjN8jmWEWseCjk5HkIE7uz67ARFs=;
	b=WHRtGn+AXsilCicY7UpdSqzee6Ajnl3UaofKM+6VpvGtLF+MUgAYG8LAmyYR+3m4FKhroZ
	j918Qo3WgIx98DM8c4TeDga3AFAOJQsk5qnc8TcLsFJc9J/JZPTUu4LRtRJdoZ9znb/qTZ
	A4FxBKSPyueHkrCfrYyct5t2Nc/sicA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DusX2QQbSH+SZlRDjN8jmWEWseCjk5HkIE7uz67ARFs=;
	b=5cYEZcQz7sw449/y2fMQAfQT01fCCWNMvwYY1zYZgYXAQ32o/0lp6UEq/BdkTcUJWHv+OD
	N0hGcDqqn/OC3SDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=WHRtGn+A;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5cYEZcQz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777290433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DusX2QQbSH+SZlRDjN8jmWEWseCjk5HkIE7uz67ARFs=;
	b=WHRtGn+AXsilCicY7UpdSqzee6Ajnl3UaofKM+6VpvGtLF+MUgAYG8LAmyYR+3m4FKhroZ
	j918Qo3WgIx98DM8c4TeDga3AFAOJQsk5qnc8TcLsFJc9J/JZPTUu4LRtRJdoZ9znb/qTZ
	A4FxBKSPyueHkrCfrYyct5t2Nc/sicA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777290433;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DusX2QQbSH+SZlRDjN8jmWEWseCjk5HkIE7uz67ARFs=;
	b=5cYEZcQz7sw449/y2fMQAfQT01fCCWNMvwYY1zYZgYXAQ32o/0lp6UEq/BdkTcUJWHv+OD
	N0hGcDqqn/OC3SDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF97B593B0;
	Mon, 27 Apr 2026 11:47:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K9SyMMBM72mubQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 11:47:12 +0000
Date: Mon, 27 Apr 2026 13:47:12 +0200
Message-ID: <87se8gzku7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] ALSA: hda: allocate nodes with tree
In-Reply-To: <20260425023421.476334-1-rosenp@gmail.com>
References: <20260425023421.476334-1-rosenp@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 170206A906

On Sat, 25 Apr 2026 04:34:21 +0200,
Rosen Penev wrote:
> 
> Use a flexible array member to combine allocations. Simplifies
> allocation and freeing.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
