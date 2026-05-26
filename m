Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19066282F31
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 06:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779776104; cv=none; b=F24Rx6YDm9dd3BkVf1yjnQotZQ9Fj+EI70WGSJVed9eWDxiYErcfwiM+5wYXxdAbFlEwoX4CYOrDgPKZ/5sdFdxqILcLBopsnGE9ZhnL/C/KoeeMb9UUBHc4LkDRryl+Yv72R+obio2NisHuUMFf3UZTAgGgYZ1+v5lS1cHdvTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779776104; c=relaxed/simple;
	bh=tVMx8gt2MPRYv+jGzcJ56dU8xR/z9kwPYGqQ7xOtKR8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ieWjB6Ug/MqgQIgAYNGwJIuDNcENprfBLix7S0KB4Z7XZtI5odPOL+8rl6FyeGuR5oajspE/W8N5BLMLCCJ/T9MM7p+Apr2F3bYB91VzTYciLZ3zIal5UcbxMpI3k9Q5ShQ1kZGDhh9xBhor7ba8oOgN4KkJgzE8ZLLtkkfshv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Yv7JIx4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bE4rKl8F; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Yv7JIx4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bE4rKl8F; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Yv7JIx4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bE4rKl8F";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Yv7JIx4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bE4rKl8F"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 19798653D7;
	Tue, 26 May 2026 06:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779776101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymXyXBbJoSToLMP68khLrd1PwV7J5/0LStL9S36Zdt4=;
	b=1Yv7JIx41g5qXs2u3CEVSZwT0GAKrjWUnTOtmr0ILZUs4KXPFpPzHAbalUl8sFtMki6oYg
	JDQkwr8s3QWwpSp2NUQCtA2fW6z7OwIAQu0JQXD+6eSy6FSOK8jwq4Srm6T4fP4vUyZBB4
	p4pUJq2v2R8SysP4HsNMnWI3OpYkH4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779776101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymXyXBbJoSToLMP68khLrd1PwV7J5/0LStL9S36Zdt4=;
	b=bE4rKl8FgQJgsivxGBf4+FOrHjjvOH3EOz1x9CP0OnxEVRUxxZzRFKNHnSYzkrkv0d0pwE
	JWboAW2y9pRKuKDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1Yv7JIx4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bE4rKl8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779776101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymXyXBbJoSToLMP68khLrd1PwV7J5/0LStL9S36Zdt4=;
	b=1Yv7JIx41g5qXs2u3CEVSZwT0GAKrjWUnTOtmr0ILZUs4KXPFpPzHAbalUl8sFtMki6oYg
	JDQkwr8s3QWwpSp2NUQCtA2fW6z7OwIAQu0JQXD+6eSy6FSOK8jwq4Srm6T4fP4vUyZBB4
	p4pUJq2v2R8SysP4HsNMnWI3OpYkH4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779776101;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ymXyXBbJoSToLMP68khLrd1PwV7J5/0LStL9S36Zdt4=;
	b=bE4rKl8FgQJgsivxGBf4+FOrHjjvOH3EOz1x9CP0OnxEVRUxxZzRFKNHnSYzkrkv0d0pwE
	JWboAW2y9pRKuKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F06DC5A069;
	Tue, 26 May 2026 06:15:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q70TOWQ6FWo9OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 May 2026 06:15:00 +0000
Date: Tue, 26 May 2026 08:15:00 +0200
Message-ID: <87ik8azogr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Damjan Georgievski <gdamjan@gmail.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: SND_CTL_LED / SND_HDA_GENERIC_LEDS enablement
In-Reply-To: <CAEk1YH47VfFk3dtav3m1gEKJ-OkSu6MyyNcGufWR9fX6miEF3w@mail.gmail.com>
References: <CAEk1YH47VfFk3dtav3m1gEKJ-OkSu6MyyNcGufWR9fX6miEF3w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 19798653D7
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO

On Mon, 25 May 2026 22:10:28 +0200,
Damjan Georgievski wrote:
> 
> Currently SND_CTL_LED (on x86), enables the
> `/sys/class/sound/ctl-led/mic/mode` knob/feature, where one can set
> the "mic" led to either the "follow-route" or " follow-mute" (plus
> "on" and "off").
> 
> The way I understand is that:
> 1) It's a tristate symbol with no prompt (not user-selectable)
> 2) it's only enabled pulled when SND_HDA_GENERIC_LEDS is enabled
> 3) When enabled, it pulls in NEW_LEDS and LEDS_TRIGGERS
> 
> On the other hand, SND_HDA_GENERIC_LEDS is:
> 4) is a bool with no prompt (not user-selectable)
> 5) only enabled (pulled) by SND_HDA_CODEC_SIGMATEL,
> SND_HDA_CODEC_CONEXANT, SND_HDA_CODEC_SENARYTECH or
> SND_HDA_CODEC_REALTEK_LIB
> 
> Now, at least in my experience, this knob works just fine on a
> Thinkpad X9-14 with the Cirrus cs42l43/cs35l56 soc/codec - *when
> enabled*.
> But, what I've noticed, while compiling my own kernel (for completely
> other reasons), suited to my hardware, with minimal config to fasten
> compile times - is that this knob is *not enabled* and I have to
> enable some of the above mentioned _HDA_CODEC_'s.
> 
> 
> Now, *my question is*,
> should SND_CTL_LED and/or SND_HDA_GENERIC_LEDS be more generally
> available for _any_ hardware?

No, we don't want to prompt unnecessarily.  The driver that actually
uses the stuff has to enable this.

> Looking at the code I frankly could not understand how it's connected
> to the above mentioned codecs.

How about showing your hardware config details and what drivers are
actually used as well as your kconfig?


Takashi
