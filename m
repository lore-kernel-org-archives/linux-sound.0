Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762533BBFD2
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 06:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640656; cv=none; b=Bts7ZMECEUpwWrBrEGNn5idjwzqP60ykaSS34c3MXSJUIxDuBPTsVkKBp23ZfddBmw9O/BempC9GFF6W0KAoR6atvD19w9JN0Ly5rFAV6I/rQz5IXo7j/tgBappSYYQVPA15XEFX/PS2wbIyxJV1XBGvoioK9uKgIpsnxOSxaUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640656; c=relaxed/simple;
	bh=vkMOM58EyJLYtMfYqpTwi1n85BmlllkWhBX0m00qllM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eZW0oeD/EY/fymleJEhjEe/4a3gTzlbOSZXtrWeMmap62Wvkyh41fbeB+jGRFPj70zmO8+btgQLuBNOtUShUWVoyU6HsmTwxmYYxhyMNiHTsY0jwe/dMjhJyo3LhD5OxSXMZdfujap2Uyje2jUyS0Q7BlmIY4NyzCao7cskuVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ko3pSvEq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xPheEBOe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nKMw7INC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qNciohEW; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ko3pSvEq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xPheEBOe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nKMw7INC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qNciohEW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D65906AA67;
	Fri,  5 Jun 2026 06:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780640647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uW1cFQILsWDDaZTBTxOudOwCTdBxAA67J5HCdw5Ifcg=;
	b=Ko3pSvEqqIj9Is56Pi8VZcVFyB0sOoRgRLFULkCbWvAa3t1PI9Rh0htu9CCtRt/tGS/D4+
	C/MvhDUXX/+A0JqgOKXWMi97u1jLnx/qtSJVRxgBoIChQbLlfN4irWhXMicFwSV8eUd7xi
	aInMy/IXhmI7OwqxM4jWUfrO/cFHl/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780640647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uW1cFQILsWDDaZTBTxOudOwCTdBxAA67J5HCdw5Ifcg=;
	b=xPheEBOeDsUBFlhH7iMoH8HoYFlSlnMhnYG5rTcZSQnqa/dQZRntn9fUKO7Ge52W+7il96
	bZWZEDKvbJ9aYrDw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nKMw7INC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qNciohEW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780640646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uW1cFQILsWDDaZTBTxOudOwCTdBxAA67J5HCdw5Ifcg=;
	b=nKMw7INC2O9R/RJUp56g7hWT6C5nmKqMX/OFSbsXoO7As0xtwSHLkJT6YgEl8exN3oN+oR
	kurtI8rQBI0DJ/g5OiILuBUieOOfZwtsyKYQpsq2wUe8+8og8y9qwJUxYCCCJiu9I5lPxt
	ZJvT0+bs5RJqQb2Aj+tMrCLdNN+tgEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780640646;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uW1cFQILsWDDaZTBTxOudOwCTdBxAA67J5HCdw5Ifcg=;
	b=qNciohEWcxeqpLjW6BU3ppkgwdI654CdrxngFDJp8QtpntaKASVONCavTjwmrcv75geKsp
	JM0rLGMjvj2jtSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8BDD3779A8;
	Fri,  5 Jun 2026 06:24:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id urTLIIZrImq9cQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jun 2026 06:24:06 +0000
Date: Fri, 05 Jun 2026 08:24:06 +0200
Message-ID: <87mrx9v721.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <chleroy@kernel.org>,	Mehul Rao <mehulrao@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,	=?ISO-8859-1?Q?C=E1ssio?= Gabriel
 <cassiogabrielcontato@gmail.com>,	Cen Zhang <zzzccc427@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: pcm: keep linked runtime alive while draining
In-Reply-To: <20260605051637.1442529-1-lgs201920130244@gmail.com>
References: <20260605051637.1442529-1-lgs201920130244@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D65906AA67
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,gmail.com,linutronix.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 05 Jun 2026 07:16:37 +0200,
Guangshuo Li wrote:
> 
> snd_pcm_drain() may select a runtime from a linked playback stream and
> queue a stack wait entry on its embedded sleep waitqueue. The function
> then drops the stream lock and sleeps before removing the wait entry.
> 
> commit 9b1dbd69ba6f ("ALSA: pcm: fix use-after-free on linked stream
> runtime in snd_pcm_drain()") cached scalar fields from the linked
> runtime before dropping the stream lock, because a concurrent close can
> unlink the stream and free its runtime. The same lifetime issue remains
> for runtime->sleep. If the linked runtime is detached while the wait
> entry is queued, remove_wait_queue() can later operate on a freed or
> reused waitqueue, or the stack wait entry can remain linked to freed
> memory.
> 
> Take snd_pcm_link_rwsem for read while the wait entry is queued on the
> linked runtime. Acquire it before re-taking the stream lock, matching the
> link/unlink lock order, and drop it only after the wait entry has been
> removed.
> 
> Fixes: 21cb2a2ec581 ("[ALSA] Fix races between PCM drain and other ops")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

This should have been already fixed by the commit 88fe2e365872
  ALSA: PCM: Fix wait queue list corruption in snd_pcm_drain() on
  linked streams
in for-linus branch of sound.git tree.
Please check whether the issue still occurs.


thanks,

Takashi
