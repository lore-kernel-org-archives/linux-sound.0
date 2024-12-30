Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14A64DA04;
	Mon, 30 Dec 2024 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735556093; cv=none; b=ZJST/TUViHYJtjAc3rtE5Xxp/LNXtpi8aIQFuhF0O5HIW8DDhYCZUu0eBaZGEX98Sw8oIJKN5ttzRvUknAD9Vw5ROVjqrOcS4ulcBP5jrwdNCfnv9TdFh18U4KIXBa6pHD7SZ7LWE1XvsbpW9LmK/MurZb59CNlyhqGvK530qZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735556093; c=relaxed/simple;
	bh=ThBlzEO9jnSV40Wsf7pqN1loKxFI747iFeho2kfK+L8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O/2+ovp5892ihzRqobtzRS/XoNIl+VNve4r9Dr6GihmbggS0ne61MynmKM5g7lXqey7sA7gp3x9E5zDoH8oIkOzV/EIuDqE8gaacs/GbPqFcQCx22pv/96Hcmnh117aG57/fitTv1QBs+ewCoiHzbJlwqLkGM603J/ji0s5cDpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gMOgLWZZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JTGj7vjK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gMOgLWZZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JTGj7vjK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gMOgLWZZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JTGj7vjK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gMOgLWZZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JTGj7vjK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C14461F381;
	Mon, 30 Dec 2024 10:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735556089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHAktnSoAxVvg7K2/dzLW2x9/6VDBf1vTHrJF2qdxZM=;
	b=gMOgLWZZ4Px7emC18gXUSjeql6VrmUEdPEl6g0Y/nVQqVwIaaCiveR3NGbAUB4J0F11lOA
	a+ck3Z9ysZ8wX/tAls71UX4AUavJ19LjSkz4RBQBcmeGuFSzOQI2TE/v1llLdyitdhRuB0
	jRk+kxw2+6Cm0XdHrmVR9u7YbAjdpkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735556089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHAktnSoAxVvg7K2/dzLW2x9/6VDBf1vTHrJF2qdxZM=;
	b=JTGj7vjK88o1YQkA/Ktwvl1bVRQasCByqE6Riq3Gj0X8MUY8C4ssB3l0g50Ae4Zg+r4XP3
	IXkNhYgP1zYAyyAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735556089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHAktnSoAxVvg7K2/dzLW2x9/6VDBf1vTHrJF2qdxZM=;
	b=gMOgLWZZ4Px7emC18gXUSjeql6VrmUEdPEl6g0Y/nVQqVwIaaCiveR3NGbAUB4J0F11lOA
	a+ck3Z9ysZ8wX/tAls71UX4AUavJ19LjSkz4RBQBcmeGuFSzOQI2TE/v1llLdyitdhRuB0
	jRk+kxw2+6Cm0XdHrmVR9u7YbAjdpkg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735556089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fHAktnSoAxVvg7K2/dzLW2x9/6VDBf1vTHrJF2qdxZM=;
	b=JTGj7vjK88o1YQkA/Ktwvl1bVRQasCByqE6Riq3Gj0X8MUY8C4ssB3l0g50Ae4Zg+r4XP3
	IXkNhYgP1zYAyyAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B87813A30;
	Mon, 30 Dec 2024 10:54:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 19t1HPl7cmdabAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 10:54:49 +0000
Date: Mon, 30 Dec 2024 11:54:48 +0100
Message-ID: <87r05pwidj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	arnd@arndb.de,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ryan_richards@creativelabs.com,
	wychay@ctl.creative.com
Subject: Re: [PATCH] ALSA: ctxfi: Simplify dao_clear_{left,right}_input() functions
In-Reply-To: <vxs3fuzdia52pcztueh7g3vug3mgl4s35p3yfwqjz3xh2kdmof@ib4s63vadpwk>
References: <vxs3fuzdia52pcztueh7g3vug3mgl4s35p3yfwqjz3xh2kdmof@ib4s63vadpwk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 30 Dec 2024 06:06:47 +0100,
Ethan Carter Edwards wrote:
> 
> There was a lote of code duplication in the dao_clear_left_input() and
> dao_clear_right_input() functions. A new function, dao_clear_input(),
> was created and now the left and right functions call it instead of
> repeating themselves.
> 
> Link: https://lore.kernel.org/lkml/NyKCr2VHK_xCQDwNxFKKx2LVd2d_AC2f2j4eAvnD9uRPtb50i2AruCLOp6mHxsGiyYJ0Tgd3Z50Oy1JTi5gPhjd2WQM2skrv7asp3fLl8HU=@ethancedwards.com/
> 
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> Co-developed-by: David Laight <david.laight.linux@gmail.com>

The submitted patch isn't cleanly applicable.  Possibly due to your
mailer setup.

Could you try to resubmit via git-send-email?


thanks,

Takashi
