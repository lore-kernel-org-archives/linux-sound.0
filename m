Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93262F90C5
	for <linux-sound@vger.kernel.org>; Mon, 18 May 2026 19:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779132373; cv=none; b=XNg8xdzjFA5NedhtHML9n6TenzGKCwC913wZSkuSCvbPAthsHOSmWPc2HlrgfTJ5t+xdONegAaAE46MOZ8tMU99KRKwxM97CGjXr3TUEk7uNY9YXQHhT1V3T5Bm+sDebN+7ibcRCXpxyGf+NU3iF2dR46j85K0p04pvPMG9hATg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779132373; c=relaxed/simple;
	bh=C7f5sZf8ry8VJEOOf0O5p2yxBBHZ7Ya2MuMEHhQ1XFQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F2ldxEoR08TtZYCsHwomPpTcU1cwD8+eILNHmoQumru/KS7s2cDYmdBoB4X9rO4VJLVEiylh+CfZtGnRtWZB2YpGnMq3YxVGu4ZHrkdt2jmu8x74lf1/LzXzIP1sEcvL7TxF3KPIZ929vQzfzkfHihdtrqmImJhlEkhw6C+Tnw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HzIFG1Fp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xXo7zCC2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HzIFG1Fp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xXo7zCC2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HzIFG1Fp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xXo7zCC2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HzIFG1Fp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xXo7zCC2"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 299525CFA1;
	Mon, 18 May 2026 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779132370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc5biI5HiHU+ABT0kPCfi1SQHi9aQp4Yt37MOcSuQSw=;
	b=HzIFG1Fp4NdoPLpuD4cQrx4AlDK4y22Q6vRhGCenOUIkrG58q56LyOumpZg29OUk5TbXeh
	EDw8vKk7jJbg8v3nWErGiYjBysTr5qs6HFKlcLfOw4w9JkBeRIT2qTJcgzkAM75eeODqKT
	eLnY/fVamzoGor6f/UuOTpsG010CXuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779132370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc5biI5HiHU+ABT0kPCfi1SQHi9aQp4Yt37MOcSuQSw=;
	b=xXo7zCC2i0BiUf9K0CKD95FXo5LIJIQd7ePQYZmbpbALZ5GLfM1Ka1zkfTjIPoH2se+/MU
	wakNsmPVe52WwyBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779132370; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc5biI5HiHU+ABT0kPCfi1SQHi9aQp4Yt37MOcSuQSw=;
	b=HzIFG1Fp4NdoPLpuD4cQrx4AlDK4y22Q6vRhGCenOUIkrG58q56LyOumpZg29OUk5TbXeh
	EDw8vKk7jJbg8v3nWErGiYjBysTr5qs6HFKlcLfOw4w9JkBeRIT2qTJcgzkAM75eeODqKT
	eLnY/fVamzoGor6f/UuOTpsG010CXuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779132370;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oc5biI5HiHU+ABT0kPCfi1SQHi9aQp4Yt37MOcSuQSw=;
	b=xXo7zCC2i0BiUf9K0CKD95FXo5LIJIQd7ePQYZmbpbALZ5GLfM1Ka1zkfTjIPoH2se+/MU
	wakNsmPVe52WwyBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E149593A8;
	Mon, 18 May 2026 19:26:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EKFFAtJnC2oAJgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 18 May 2026 19:26:10 +0000
Date: Mon, 18 May 2026 21:26:09 +0200
Message-ID: <87o6ic4izy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: ALSA: iterator used after loop end in timer/seq port registration?
In-Reply-To: <20260518160029.1529836-1-maoyixie.tju@gmail.com>
References: <20260518160029.1529836-1-maoyixie.tju@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-0.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -0.80

On Mon, 18 May 2026 18:00:29 +0200,
Maoyi Xie wrote:
> 
> Hi all,
> 
> While reading sound/core/ I noticed two places where the list
> iterator is used after the loop has walked past the end of the
> list. I would appreciate it if you could take a look and let me
> know whether these are real issues, and whether they are worth
> fixing.
> 
> The first is snd_timer_dev_register() in sound/core/timer.c
> (linux-7.1-rc1, around line 1018):
> 
>     list_for_each_entry(timer1, &snd_timer_list, device_list) {
>             if (timer1->tmr_class > timer->tmr_class)
>                     break;
>             ...
>             return -EBUSY;
>     }
>     list_add_tail(&timer->device_list, &timer1->device_list);
> 
> The second is snd_seq_create_port() in sound/core/seq/seq_ports.c
> (linux-7.1-rc1, around line 147):
> 
>     list_for_each_entry(p, &client->ports_list_head, list) {
>             ...
>             if (p->addr.port > num)
>                     break;
>             ...
>     }
>     list_add_tail(&new_port->list, &p->list);
> 
> In both cases, when the loop walks all entries without break, the
> iterator has gone one step past the last entry. &iter->member
> then aliases the list head via container_of offset cancellation,
> so the insert lands at the list tail. That is the intended
> behaviour, but the access is undefined per C11.
> 
> Jakob Koschel cleaned up many such sites in 2022, for example
> commits 99d8ae4ec8a (tracing: Remove usage of list iterator
> variable after the loop), 2966a9918df (clockevents: Use dedicated
> list iterator variable) and dc1acd5c946 (dlm: replace usage of
> found with dedicated list iterator variable). The two sites in
> sound/core/ were not covered.
> 
> A candidate fix would track an explicit insert_before pointer
> initialised to the list head and overwritten to &iter->member only
> when the loop breaks early. The observable behaviour is unchanged.
> 
> If this is intentional or already known, please disregard.
> Otherwise, I am happy to send a [PATCH] or to leave the fix to
> you. Thank you for your time, and sorry for the noise if this is
> not actually worth fixing or has already been spotted.

Thanks for the report.  I believe those two are actually bugs,
likely introduced by the early commit 9244b2c3079f
    [ALSA] alsa core: convert to list_for_each_entry*

The original code were with list_for_each(), and at the end of the
loop, it was supposed to go back to the list head.

If you have already fix patches ready for submission, it'd be
appreciated.  Otherwise I'll fix them up quickly, too.


Takashi
