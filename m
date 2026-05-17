Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862F1241CB7
	for <linux-sound@vger.kernel.org>; Sun, 17 May 2026 19:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779047232; cv=none; b=kyMNnQJxx3NgntvdzdaSBc21GM6Eu0HQg/Z4VysE1r0+Pi+QnHk8Gn6/qW7FspwBT1J/hHPVbEgRHlK7jja+TAdcoxSV27jOROtDzyK8qAqQtZUasDBwf1KBIiVMLAukV5+SEZ+1b4L9xWh2sDJvmQUwX7rBkOtNS+rSPRG4OF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779047232; c=relaxed/simple;
	bh=xR8a9kfi9nOgJcflTJ80txOB0+ybteLmmzn/Lcm0xJs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n2Fl8u+iSKLVMJVdBsGkM9t2InVRqUzPlH608ERQVJnq+MQWBs69vpN9lICT41jjZMpc6S7/vspu3GqRmRzvC4PVy/B9uLz7TkxEIlwyiBUs4X+mqvBPLSEan/dsl/hABvVcH9Z8sltxTCTlh3pub5ZIoKHA/GaEClqs1us3jPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o9Kk9zM/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/WjR0TE; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o9Kk9zM/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/WjR0TE; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o9Kk9zM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/WjR0TE";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o9Kk9zM/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/WjR0TE"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9C4E966E03;
	Sun, 17 May 2026 19:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779047223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaKxBIFSnGl8ZXDikKzJ+XC0W6EyQrqU+o6b5bmfEeU=;
	b=o9Kk9zM/e2VxOGseBCv2lDyA4tMag4RF9NeYV4ButWLPaQt+LLyoqX9tPsr/tvH0EwhqfP
	KaTJICK+UmnUAOH66ltpZR9eAj/JonAupr8U/KBn5QlsweZcnkPd/icSQ1zqEV4V9tSm10
	/O8ey3hkaVjdvvwjxSinpA1AvjWOiuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779047223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaKxBIFSnGl8ZXDikKzJ+XC0W6EyQrqU+o6b5bmfEeU=;
	b=L/WjR0TEWAlMcfipalEoJT2juTW5r+JtEvRpWWdvHNYVfsfyFuXKkJYYmUf2rYPwOQcM7e
	maStJ+sXtUPHPqCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779047223; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaKxBIFSnGl8ZXDikKzJ+XC0W6EyQrqU+o6b5bmfEeU=;
	b=o9Kk9zM/e2VxOGseBCv2lDyA4tMag4RF9NeYV4ButWLPaQt+LLyoqX9tPsr/tvH0EwhqfP
	KaTJICK+UmnUAOH66ltpZR9eAj/JonAupr8U/KBn5QlsweZcnkPd/icSQ1zqEV4V9tSm10
	/O8ey3hkaVjdvvwjxSinpA1AvjWOiuo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779047223;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IaKxBIFSnGl8ZXDikKzJ+XC0W6EyQrqU+o6b5bmfEeU=;
	b=L/WjR0TEWAlMcfipalEoJT2juTW5r+JtEvRpWWdvHNYVfsfyFuXKkJYYmUf2rYPwOQcM7e
	maStJ+sXtUPHPqCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7CBCA593A8;
	Sun, 17 May 2026 19:47:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q6nqHDcbCmqbXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 17 May 2026 19:47:03 +0000
Date: Sun, 17 May 2026 21:47:03 +0200
Message-ID: <87jyt1es3s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aryan Kushwaha <aryankushwaha3101@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion Plus 14
In-Reply-To: <20260516144436.35022-1-aryankushwaha3101@gmail.com>
References: <20260516144436.35022-1-aryankushwaha3101@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Sat, 16 May 2026 16:44:36 +0200,
Aryan Kushwaha wrote:
> 
> The HP Pavilion Plus 14-eh0xxx with subsystem ID 103c:8a36 needs the
> ALC245 COEF bit mute LED quirk for the mute LED to follow the audio mute
> state.
> 
> Add the missing quirk entry.
> 
> Signed-off-by: Aryan Kushwaha <aryankushwaha3101@gmail.com>

Applied now.  Thanks.


Takashi
