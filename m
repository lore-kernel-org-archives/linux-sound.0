Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B5207A02;
	Fri, 10 Jan 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496737; cv=none; b=rxz8P0hRh0bUiN3V2T2KWpRucNVLVoVO6zChvdib5H/rzHIeywKxNTwKTejF8Dbc5BxMBbpBXbkf6vJnu7neY3JQSMiGhXskZoY02F5rxBIKSPa5jT3a+8S2CNvhCZo8T8ZPtULDegG6yc+uAZB5oJFzNKUgCn1EqYOyst1AZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496737; c=relaxed/simple;
	bh=PRSJq2cZTKNs494LVXoDLhL6Zzou72pcy9dzb56fPCM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jbixbn9chTYS047kqz5BSBSUiC1MBlZlGpeW//zhGztOCEaNKUelIip8vK/Mjtkvql+Sy+Ve8yc+Zb+ZQ5A6BruXGp6Hg7op61xKLYSAO/XtB5SG2hc6toswG1cikW8Ec/0kjrZgjt6XogKicUXtywX0bYtdBfrtqDPKmHm9ORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ER6id5k+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ByWDFAvb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MUqR/o8f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PeyzMcyX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ER6id5k+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ByWDFAvb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MUqR/o8f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PeyzMcyX"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B1A441F394;
	Fri, 10 Jan 2025 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736496732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H77USBSvwOwFDuFy2unRFSraEtszHgNhvseuPbHkFXs=;
	b=ER6id5k+nl2HsWAyZqxEkLCPLUA73IQeLrmHb+gZY8Fdz3aVpvpKksHZUqgNpyl8RlTNhP
	snr2j/VX/9HbH2IrMdzA8gOmYXIoDBeacL6fjnipi2DllZRoqygGA2qk6FTo/mxN/7gjhs
	ty5jnPwu4TP5KfqUNG92e+ceu+o+dGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736496732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H77USBSvwOwFDuFy2unRFSraEtszHgNhvseuPbHkFXs=;
	b=ByWDFAvbfLWUYGZ7rog2yREHOAW+QX4rM+npCwpuTzTmP5q4P0hS4Q7SNNtuvkRiPzicQL
	2QJ+IOJIQ4RqlmCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736496730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H77USBSvwOwFDuFy2unRFSraEtszHgNhvseuPbHkFXs=;
	b=MUqR/o8f6lHHn1CqpJ2jIO/ZW8TUHeg/zTRjnSSbcqyA1VPO87DtJHzlIa4uZhQUVxcTDI
	JBnxStkjPsc9O3j8zOSHBosRHMaXd4ejxu9mGGsfdWtY3YNx5nfYBg6j4IPLgFjABOfPQ8
	vJpV7p28H9cQSQUC6Z4F1X3Kbjvv+wE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736496730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H77USBSvwOwFDuFy2unRFSraEtszHgNhvseuPbHkFXs=;
	b=PeyzMcyXngDBwIrBZbri/JDRFM8Mr2wIo/+DjdZy1xRzIoojZY9IIe8vw/lO/CKVw55NEK
	vdw5S8/jrhLk0yBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 819EC13A86;
	Fri, 10 Jan 2025 08:12:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id j05jHlrWgGeEeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Jan 2025 08:12:10 +0000
Date: Fri, 10 Jan 2025 09:12:10 +0100
Message-ID: <87plkvulyd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: sb: Use str_enabled_disabled() helper in info_read()
In-Reply-To: <20250109230521.237162-2-thorsten.blum@linux.dev>
References: <20250109230521.237162-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[wanadoo.fr];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,wanadoo.fr,suse.de,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 10 Jan 2025 00:05:19 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied now.  Thanks.


Takashi
