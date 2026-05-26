Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9BD4028CD
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807201; cv=none; b=ET/KktvIATs3lQK0EwkkWF+xrpuSvOk+cnis5VZv464N2dWQnUwzmEg/lbym3KJcUVqWa3gp+Al1m1HtTYbRe5tmUPJiiZlxx46Pcjc+QxGcv43wJDjOfeYxwF6PgOS355FFra+kqwEv5mt/Vo/p+9zNeobhXXOFpCy7kmNnAl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807201; c=relaxed/simple;
	bh=xEiKeR2Y/0GhXWlIohqcWmI07xo42dyHPBEM4FcLqtM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5s+N8Yy0GPs4MWTlFggWmqm03JAyBmD7wtrHqbUYMVZFePkOJHMih3E/riKKKgO+xgz3SU7eMrlCbQ56xSCWF27az6+8RsAOvUovvsAPsi1nMOeO0UneM+kfoOZaaRYzzhfEknkUzlxbV37pkgf8pgWIL1WV2hLrEbJi/Z7jJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VVix3Mr/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jg2nJbXh; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zYQxqfeM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kzKTQ0OT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VVix3Mr/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jg2nJbXh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zYQxqfeM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kzKTQ0OT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 44E3A6A96A;
	Tue, 26 May 2026 14:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779807197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x1BNcbbFTNXWvy4JDZzAZmpOBa6dmFMMNXaGmIsqJyE=;
	b=VVix3Mr/rNnnyoHZuOWk5RuHl0hoUc3O9TiTCDmev3XCmHYRGPP+YseMMTOhwEg8VQKfkF
	ZjJ4mlJFaIh+jIQDe5cxP38uN5wOZz6HK5uN23SkVMYFRVMAaUzgG5/ApDzSnHCwiiMtH7
	GJxmo3DmAUPzKf3kr9eHz4JW37oEImw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779807197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x1BNcbbFTNXWvy4JDZzAZmpOBa6dmFMMNXaGmIsqJyE=;
	b=Jg2nJbXhfM4LWRvxo7uoKpkNwQfohEr5Z4Ejk1wafZJIRlY4klYaahw80pNMgiLJXmGOus
	tSpGU0duMafcTgBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779807196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x1BNcbbFTNXWvy4JDZzAZmpOBa6dmFMMNXaGmIsqJyE=;
	b=zYQxqfeMobTQSZtkPuUwyjb0tLECiygalY9DqTXNp2Y3SgL6DWDprOs03BUHt9hy1Qbnc/
	eAMM4MwVWWbBoI0SV57P1CwX6n7GpsF2lqAuDjj0tEOB2aXuU6WDFttu3McX60ZHZCq2ti
	3y+rPzVI4IUsrgdXz4WXABOPzCpwsbU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779807196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x1BNcbbFTNXWvy4JDZzAZmpOBa6dmFMMNXaGmIsqJyE=;
	b=kzKTQ0OT8eqIdcSpAX8gJpg1AbWSZy9YApYeUqIzpKyPK2IBGlljQtoQD1ACQK2p/OeG2E
	oDwlBUyzJQACn8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 264255A26F;
	Tue, 26 May 2026 14:53:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QzinCNyzFWoHRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 14:53:16 +0000
Date: Tue, 26 May 2026 16:53:15 +0200
Message-ID: <87jysqxlwk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <rollkingzzc@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	zerocling0077@gmail.com,
	2045gemini@gmail.com
Subject: Re: [PATCH] ALSA: seq: oss: copy SysEx payloads before handoff
In-Reply-To: <CAB7XQsEz9bqm8FgZFvD3VyO7MG0xnOg+bbdLy+REbbdMWkj7WA@mail.gmail.com>
References: <20260521233900.478153-1-rollkingzzc@gmail.com>
	<87y0h6xph3.wl-tiwai@suse.de>
	<CAB7XQsEz9bqm8FgZFvD3VyO7MG0xnOg+bbdLy+REbbdMWkj7WA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,perex.cz,suse.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 26 May 2026 16:39:54 +0200,
Cen Zhang wrote:
> 
> Hi Takashi,
> 
> Thanks for the review and the patch.
> 
> I tested this approach with the same reproducer I used for
> the report, and it fixes the issue here.
> 
> Would you like me to send a v2 based on this approach, or would you
> prefer to take your patch directly with my Tested-by?
> 
> Tested-by: Zhang Cen <rollkingzzc@gmail.com>

Thanks for quick testing!  I'm going to submit a proper patch, then.


Takashi
