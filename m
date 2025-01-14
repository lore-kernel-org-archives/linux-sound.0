Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4432F1ADC70
	for <linux-sound@vger.kernel.org>; Tue, 14 Jan 2025 10:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736851080; cv=none; b=Hb8R8Z6/tmvqhvpqLhER/6PfJYZnm0N/1ygWVxNn2qWm8/KFU4DSDusSsCJ33mhi61QL4YzwhtHgn3pCwCB8IJ1B8SgFJAA6vFkIXQW6BQTa/l168nxQNJamatAR7ZOHGy/Hwf8H68uldq6s2PiEW5JcOanr9vBInvh2A1jVSFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736851080; c=relaxed/simple;
	bh=vYkJrvmya4ntoq1egxs9zy5NgJIgOh2//aR+Rln6ZN4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EhCIBSuanzEEGVL7MNL5R0ilJN50bKf93r+WRCCMXNcvoRBlRzbUnxcbz+fcHk40Ypoq8glfK3Cxg/2LUn5U4MhXY5OA00ka5e6v/JOD9NFIse0cRYIE6ZCkevRokpa43ptRQG3hgNUQCegRnJG/y5y6Vi+Ukk5BD8Li6VJJXVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yoNTZRdg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z+mQNJxK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yoNTZRdg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z+mQNJxK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yoNTZRdg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+mQNJxK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yoNTZRdg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z+mQNJxK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 684F61F38E;
	Tue, 14 Jan 2025 10:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736851077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlxntL82VhYu64qLqxMRHPIYBaN1DrQyiwQ6P2cYaek=;
	b=yoNTZRdg46/5rzymBGXlGn74UZxAnpHEWBBJedDCL8RPYpE/H8O8ND3IwB/8zLGQHr75YB
	hbIkjtj0ENn5lV2NmUbUQfrJW/SLq4FvmJqeo/Os3CplI6wlo+EkfEfHhfMpaLh0Tzu2Yn
	p95EzztIfQQWBbtRo9JBASLORz5bH2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736851077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlxntL82VhYu64qLqxMRHPIYBaN1DrQyiwQ6P2cYaek=;
	b=z+mQNJxKrLZZn772f75bv2f07hUp8alISgRk2pJqPaI6GzbGaPd22SB6Oxi+DgrPj5cs32
	CtQr9U4TOC6R5vCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yoNTZRdg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=z+mQNJxK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736851077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlxntL82VhYu64qLqxMRHPIYBaN1DrQyiwQ6P2cYaek=;
	b=yoNTZRdg46/5rzymBGXlGn74UZxAnpHEWBBJedDCL8RPYpE/H8O8ND3IwB/8zLGQHr75YB
	hbIkjtj0ENn5lV2NmUbUQfrJW/SLq4FvmJqeo/Os3CplI6wlo+EkfEfHhfMpaLh0Tzu2Yn
	p95EzztIfQQWBbtRo9JBASLORz5bH2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736851077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vlxntL82VhYu64qLqxMRHPIYBaN1DrQyiwQ6P2cYaek=;
	b=z+mQNJxKrLZZn772f75bv2f07hUp8alISgRk2pJqPaI6GzbGaPd22SB6Oxi+DgrPj5cs32
	CtQr9U4TOC6R5vCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 560091384C;
	Tue, 14 Jan 2025 10:37:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YJN2FIU+hmfMDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 10:37:57 +0000
Date: Tue, 14 Jan 2025 11:37:52 +0100
Message-ID: <87seplznnj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/8] ALSA: rawmidi: Expose the tied device number in info ioctl
In-Reply-To: <c44312ea-8995-4027-9616-846e73959eee@perex.cz>
References: <20250110155943.31578-1-tiwai@suse.de>
	<20250110155943.31578-2-tiwai@suse.de>
	<c44312ea-8995-4027-9616-846e73959eee@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 684F61F38E
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Tue, 14 Jan 2025 11:25:05 +0100,
Jaroslav Kysela wrote:
> 
> On 10. 01. 25 16:59, Takashi Iwai wrote:
> > The UMP legacy rawmidi is derived from the UMP rawmidi, but currently
> > there is no way to know which device is involved in other side.
> > 
> > This patch extends the rawmidi info ioctl to show the tied device
> > number.  As default it stores -1, indicating that no tied device.
> 
> Seeing the alsa-lib changes, it may be probably better to keep zero as
> unknown and define this field as (device number + 1) to avoid bad
> interpretation for older kernels without protocol version checks.

It might be safer, yes, although it'd need an extra interpretation.
But maybe the safety should win.

OK, I'll submit the patch to update it before 6.14.


thanks,

Takashi
