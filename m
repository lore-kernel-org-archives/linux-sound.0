Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9EB257821
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774705360; cv=none; b=mgOSohXffEerMHILG4kcLIWuioDNTHf8EPw8CRUc9Y2q5S0qq1u4yJepp7nUeNRDBEnB3Sws513isgLodSWGXwzy638zH/GsbVk2fbboV0KFlBmKWTQT+Zf/Hmju8DWkOJ1I/YgoC5ms089aqtFUV84x/AdRjr5wMzbnUsSAKnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774705360; c=relaxed/simple;
	bh=SnXY3lmEshNny1rlym/Swyp8iDpMO+sOr6m0WwMBHlg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fNiUceS4NiJmhFwRclfTKJns9yzhcD4K5uS8TJyT+7JNiOwT/lu7FX2nGPvmwSonsgDYrj5uJL1LJnNLdVi+xSGoOsFsn3IL7tXEJJnkKXnDlSxseDuABqBhJUvJGF/T0dBoohBY0fz5R46peLFSuKekK8WLsO7FhobmACARY5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sqRntLyo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3K1wZGcL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CqXSLDuu; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kKGiaZL1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sqRntLyo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3K1wZGcL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CqXSLDuu";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kKGiaZL1"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F2D935BD3E;
	Sat, 28 Mar 2026 13:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774705358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwUGA0vnQIM83U8jwBy9+lIZlopJY3QXQ+ynZFDemtQ=;
	b=sqRntLyoUqDhnVdvvCw+bANrcwzABmPSASnNUciY/2GTk/AP2QaA5PPrH+4zwvRe+5SPcQ
	jx/J2tZzE+GvwxhIARUhBePH0OzVfuqPvuXnTEGr+ajNhEUtY8SFM/HvgchaSEdSjNEhPp
	uX7HWjqZfADO4ccNi8NbzWSsWEOY0eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774705358;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwUGA0vnQIM83U8jwBy9+lIZlopJY3QXQ+ynZFDemtQ=;
	b=3K1wZGcLyg7kFMbzwv5XAC+MrNs2uetN8k4EihTiSaR1vNimp8SpnnK24Eo3Mkhy5EjdK2
	2TclWFAdtZP+YzBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774705357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwUGA0vnQIM83U8jwBy9+lIZlopJY3QXQ+ynZFDemtQ=;
	b=CqXSLDuuC3Gt+jxBl9ajV8QKC/RGPdP1fnuC62pd5g+a7XknVpQ1JI2LsJy5+oxizcxYbG
	uyORdtGpCUqjNRPreIbHgXGzqnktiWLxgut7tCzLcyYqa/ipnVsyPhuDV7aG0f2g9pIp7N
	vCgpPv9gzVRUaLPBtB/7WB7QmaAJli8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774705357;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwUGA0vnQIM83U8jwBy9+lIZlopJY3QXQ+ynZFDemtQ=;
	b=kKGiaZL1jVodZfrexpATviG/k6qjceyo1Q2LMsjnl1bw/g5aIpxa6y83ormamMwmZKkuvV
	RYt5UXBtRwIeWLBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BF0174A0A3;
	Sat, 28 Mar 2026 13:42:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rIXYLM3ax2mYJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 28 Mar 2026 13:42:37 +0000
Date: Sat, 28 Mar 2026 14:42:37 +0100
Message-ID: <87tsu0ul2q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/proc: show GPI and GPO state in codec proc output
In-Reply-To: <20260328-hda-proc-gpi-gpo-v1-1-fabb36564bee@gmail.com>
References: <20260328-hda-proc-gpi-gpo-v1-1-fabb36564bee@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Sat, 28 Mar 2026 05:53:35 +0100,
Cássio Gabriel wrote:
> 
> print_gpio() prints the GPIO capability header and the bidirectional
> GPIO state, but it never reports the separate GPI and GPO pins even
> though AC_PAR_GPIO_CAP exposes their counts.
> 
> The HD-audio specification defines dedicated GPI and GPO verbs
> alongside the GPIO ones, so codecs with input-only or output-only
> general-purpose pins currently lose that state from
> /proc/asound/card*/codec#* altogether.
> 
> Add the missing read verb definitions and extend print_gpio() to dump
> the GPI and GPO pins, too, while leaving the existing IO[] output
> unchanged.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch now.

I noticed that the verbs for setting GPI and GPO are missing.
Will submit a patch to complete those.


thanks,

Takashi
