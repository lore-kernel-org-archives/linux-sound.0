Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1B36E494
	for <linux-sound@vger.kernel.org>; Sun,  5 Jul 2026 10:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783246494; cv=none; b=pK67wouNMgVBwWpq0j05TTIzmeOfQ6W5FdEZA3UIdvG+6TkIf+hQMixHicRU1AxwRlBw+seU4Y3I66IIe/0KtpGgzuz98QRFcozTTVpsJala0tRMcn7iRpIVXXpbXDZG90DgYY8dUMrmxGoLaZkEL8DKoGr2Irh0/53frEhTLk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783246494; c=relaxed/simple;
	bh=iqYMm8VJRjEnud5aGi39pyHQ2IdCOzqKZkAgG5ccCEE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EudZ+Acv9lNPLDRpj/qLtJTJaOSqyHeAah85UAARFRhVzh5sYNlwY8KhHZ02mhyoXoI+dnV+dNIsH6HVW4VB9b+B+6n6/eKRWflZ5i+HvaC6d8AO0Kk6+PNutRJ9pAsWIPCfUKG8vv5K/PreUu+z3eGeCt+aNetUr7VVFEUOSRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mgg/ydmq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xDydX0qn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aFv4UMLK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EC7bFb6W; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mgg/ydmq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xDydX0qn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aFv4UMLK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EC7bFb6W"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CEB5975234;
	Sun,  5 Jul 2026 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783246491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ty+JEkAD/PWxjKOf7VsyFUguTelZhZYWgCn9O6GHQ=;
	b=mgg/ydmqnmbzO0P242QX9Ky13MjE2EmSN/rBYZJORp1s5J2XXzbDZA/FZtVtE+zRKAEwpE
	5zxo+pWPFUQQvTbRuxIHn95ffHS78WLnuoxDGaBUyx8BpyMEp9ChmgQNI5RErZcSRgXY98
	qsVMwrmcy8Hnn0qc4Uf8HsJ9eaDft04=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783246491;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ty+JEkAD/PWxjKOf7VsyFUguTelZhZYWgCn9O6GHQ=;
	b=xDydX0qn2f1XxixrjzopidGgPJwusQJd1G7bPmPWyXmdr/ggTD+Fsk+hLHJ6Q6scKbidMt
	fnQqGlR2nl52AvBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aFv4UMLK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=EC7bFb6W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783246490; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ty+JEkAD/PWxjKOf7VsyFUguTelZhZYWgCn9O6GHQ=;
	b=aFv4UMLKkHt1iELjIGfv+FYYlL5wA+NuAj27n9juIzREYhEj5VJmesEUmchuBCVx+SO+lz
	k/PysxQANudjGP0nV9TWksDxbVmtFNvBhz8TxNbmMWfrwH7KcpoHw/StVRHWQoZCiMqAwq
	kPxs0EcHLU/1nyQN82lTZgwarxX2XjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783246490;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6ty+JEkAD/PWxjKOf7VsyFUguTelZhZYWgCn9O6GHQ=;
	b=EC7bFb6WHxGeyotzbMGolI1S9G1VC9xdRp2RLvCDDbHePdK3ohOMSSU5CYNyo8GKtre7nR
	cNKicwQZnj022qDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 972C4779AA;
	Sun,  5 Jul 2026 10:14:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wBHvHZouSmpycwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 05 Jul 2026 10:14:50 +0000
Date: Sun, 05 Jul 2026 12:14:49 +0200
Message-ID: <87mrw568va.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Daniel Mack <zonque@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: caiaq: validate EP1 reply lengths
In-Reply-To: <20260705084601.56400-1-pengpeng@iscas.ac.cn>
References: <20260705084601.56400-1-pengpeng@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CEB5975234
X-Spam-Score: -3.51

On Sun, 05 Jul 2026 10:46:01 +0200,
Pengpeng Hou wrote:
> 
> usb_ep1_command_reply_dispatch() uses buf[0] as a command byte and then
> reads command-specific fixed items from the same URB buffer. Several
> paths use buf + 1, buf[1], buf[2], or buf + 3 without first proving that
> urb->actual_length contains those bytes.
> 
> Add per-command length checks, use a payload length derived from the
> bytes after the command byte for the control-state copy, and reject short
> analog input payloads before the input helper reads fixed offsets from
> the EP1 reply.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied now.  Thanks.


Takashi
