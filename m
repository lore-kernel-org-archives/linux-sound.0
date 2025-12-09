Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FE722A817
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 07:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765264177; cv=none; b=hDCBpDKXBoGvMxr2j/s6DE2F63SVNCwlWmh96OaN1ieDoS4+FkuqRTc7Wb2NBUps3N0AU6vEncDqipo47h2AjdoI9zwpTrL/U5YOWC4FNLTr9AbwD/hacwOehlMHyofSyL6tH/4uu1zqsev17a5uE4bjEDUZaNfYpskEhzct3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765264177; c=relaxed/simple;
	bh=UO9ciZnTTbhmWYffgQguuYC/b4/lH9WOP2lwSvcXny4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MIxfM90SZm+yOKAiXbdHFCQthv3jHVffgavJotPk2dUmLPupkAM7/6xXt3uGpxjPvxdZAJOD5SGhoSQ4eAwL5LVWQ/qyqBUkJ9BLIztAZFHCgwqH5t8dsrpOHOdb1HnW+qnhvzHbkaqww22FqNa+Em2K+sDE0susi8txKLrUW+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kYcGlXmK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KvdwSd6n; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kYcGlXmK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KvdwSd6n; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kYcGlXmK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KvdwSd6n";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kYcGlXmK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KvdwSd6n"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6AFA5BD97;
	Tue,  9 Dec 2025 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765264173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRquHJZZ+GvgQlEDY9NlRFzXHqH3Jhkyh7uxwx+J+6M=;
	b=kYcGlXmKL0jZft8tD5J7IPyj9d/L/GwVYagJpQ9g4G5kBiADuFiiZ78wnsZXTC7cTN87r5
	UY50t2pqm05iB8iTeJ1od5tJwD0/xaHEhY0bD4o4x565uWvSk1zQh0KLIUW2H239KP/gFq
	4LpKJdKe5eNLa59ox179OyYErlgcxUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765264173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRquHJZZ+GvgQlEDY9NlRFzXHqH3Jhkyh7uxwx+J+6M=;
	b=KvdwSd6n0sAuqT2HmFxWF1jjRMtoJykMD2dxR9dNJH1E0eEgtqxiosKZ//EFDgsgxGpcnM
	wod05chdVEzoq1AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765264173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRquHJZZ+GvgQlEDY9NlRFzXHqH3Jhkyh7uxwx+J+6M=;
	b=kYcGlXmKL0jZft8tD5J7IPyj9d/L/GwVYagJpQ9g4G5kBiADuFiiZ78wnsZXTC7cTN87r5
	UY50t2pqm05iB8iTeJ1od5tJwD0/xaHEhY0bD4o4x565uWvSk1zQh0KLIUW2H239KP/gFq
	4LpKJdKe5eNLa59ox179OyYErlgcxUg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765264173;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRquHJZZ+GvgQlEDY9NlRFzXHqH3Jhkyh7uxwx+J+6M=;
	b=KvdwSd6n0sAuqT2HmFxWF1jjRMtoJykMD2dxR9dNJH1E0eEgtqxiosKZ//EFDgsgxGpcnM
	wod05chdVEzoq1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 899653EA63;
	Tue,  9 Dec 2025 07:09:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p7nVHy3LN2lEOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 09 Dec 2025 07:09:33 +0000
Date: Tue, 09 Dec 2025 08:09:33 +0100
Message-ID: <878qfct9le.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire-motu: add bounds check in put_user loop for DSP events
In-Reply-To: <SYBPR01MB788112C72AF8A1C8C448B4B8AFA3A@SYBPR01MB7881.ausprd01.prod.outlook.com>
References: <SYBPR01MB788112C72AF8A1C8C448B4B8AFA3A@SYBPR01MB7881.ausprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.960];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[outlook.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 09 Dec 2025 06:16:41 +0100,
Junrui Luo wrote:
> 
> In the DSP event handling code, a put_user() loop copies event data.
> When the user buffer size is not aligned to 4 bytes, it could overwrite
> beyond the buffer boundary.
> 
> Fix by adding a bounds check before put_user().
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>

Applied now.  Thanks.


Takashi
