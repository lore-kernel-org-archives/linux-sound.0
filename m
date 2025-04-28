Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526BF211704
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745827245; cv=none; b=Ay4IQ6PRXZXosc/9UBOfVjwTNWl8jPTPn69ipJNTUDmD5g+5ZZzYbGKlnbGXU2DRZy2QsPNlVrHklr6OuJp7IRVozLgIso5fT0w9tUop5qSQSDT2HvxXQTJ/psYR+54hyQXKdTjh5eaf9JKpO9qw1b1LJijiSwMcHPtx1+IvC8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745827245; c=relaxed/simple;
	bh=6B1cBez2w51X38NtcldCNNkYwBfWl3pgCSEErH//63Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHOuXrdRdhQYeNo7rgez6hbUEEk5zIlYUDPVHlX6iP5tbOBuqNrxA+GsjbSpGxreAhEKoFQjK/5U2HXJ68pfwXJv2ozpcBQj8CX3SwzECe9SQdo+vHvlnfDPEjpz0o0A1gR0lLsYUQe5OXGzeas70+vmz/zDhrmMP+7McRY3NAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eyiib64y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EeJhld1M; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eyiib64y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EeJhld1M; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eyiib64y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EeJhld1M";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eyiib64y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EeJhld1M"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6ACB81F795;
	Mon, 28 Apr 2025 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745827242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsQX8BN3qiRJ6N+peqL9DQmJf4Xfr6apuYKVydY/Et8=;
	b=eyiib64y59xpR7dl57sQbQ686mgKfhJXC2UuvRVT8Wn9XXMusunG7dBdzIZHcVbHnzY/bK
	RtWgF7/kJSgpjj3lonnUnqPrFjf46f7NN1NryQYrvnp8gMt6yAKZChU/Odd1MW6I7Xd3Nh
	+Kw71L1qMCQobLKXbruEUBJ3GzhuI4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745827242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsQX8BN3qiRJ6N+peqL9DQmJf4Xfr6apuYKVydY/Et8=;
	b=EeJhld1MRWnIKbBGKgHB8u1aJd7+JojKUI1aXgFy8tXW/AZgsYKPyTWLdML9CVTSpJU5mO
	dMeKJT9a07IHy+BA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eyiib64y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EeJhld1M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745827242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsQX8BN3qiRJ6N+peqL9DQmJf4Xfr6apuYKVydY/Et8=;
	b=eyiib64y59xpR7dl57sQbQ686mgKfhJXC2UuvRVT8Wn9XXMusunG7dBdzIZHcVbHnzY/bK
	RtWgF7/kJSgpjj3lonnUnqPrFjf46f7NN1NryQYrvnp8gMt6yAKZChU/Odd1MW6I7Xd3Nh
	+Kw71L1qMCQobLKXbruEUBJ3GzhuI4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745827242;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hsQX8BN3qiRJ6N+peqL9DQmJf4Xfr6apuYKVydY/Et8=;
	b=EeJhld1MRWnIKbBGKgHB8u1aJd7+JojKUI1aXgFy8tXW/AZgsYKPyTWLdML9CVTSpJU5mO
	dMeKJT9a07IHy+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 527211336F;
	Mon, 28 Apr 2025 08:00:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U2blEqo1D2iVdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Apr 2025 08:00:42 +0000
Date: Mon, 28 Apr 2025 10:00:41 +0200
Message-ID: <87jz74yaty.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Joachim Priesner <joachim.priesner@web.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add second USB ID for Jabra Evolve 65 headset
In-Reply-To: <20250428053606.9237-1-joachim.priesner@web.de>
References: <20250428053606.9237-1-joachim.priesner@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 6ACB81F795
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[web.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 28 Apr 2025 07:36:06 +0200,
Joachim Priesner wrote:
> 
> There seem to be multiple USB device IDs used for these;
> the one I have reports as 0b0e:030c when powered on.
> (When powered off, it reports as 0b0e:0311.)
> 
> Signed-off-by: Joachim Priesner <joachim.priesner@web.de>

Thanks, applied now.


Takashi
