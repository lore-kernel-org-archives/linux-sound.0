Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9E633B6DB
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779169182; cv=none; b=PAzpNQ87xMW7AZ3HB9AopPeMF1xNc2v1D1JpmHRHxL9feN99/eRUkvGNIVEKj9YFF5KftsVJELTVK/PZVFX2E7DHpUcrv4xBR6ga3FNcNMIveIPWfYm78XuwMkoao36iBKwt7xwwMKG5skuj3143GB1ANZHsDcieWFglOyMrSpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779169182; c=relaxed/simple;
	bh=siA+t/IEUvNbvDizbkzLXn6ozyafejqN4dB8jSI9ow8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r67uSCREwIKdfeX2J1fz/w+3ixyX7fZSBiweGtRN6ImIAW0M8bbkVHASyQhlz8GVArfgWn1Ol2U6CCNrqsHYvSSyGJ16OnBbk2JmuYQoYxFKdF3a+ixIOYQyq0z/QX20TXF8EpYAfNnaRsbwI1j0og5TzM4u/JIG9sFHYSL9yAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hg9h7oPF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=U2vWvLtX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zOD28nmQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/Tj81mFF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hg9h7oPF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="U2vWvLtX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zOD28nmQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/Tj81mFF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 398AF67381;
	Tue, 19 May 2026 05:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779169178; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv3D1I7ZfwXPSfykNitvNiTHHQwGETU54vanQ06cU/k=;
	b=Hg9h7oPFpt9s3zdGyxf4sxNxZVyENWWDvpZVa2ULRmKxft1E1PRzusY08aqwRDVt+HaD/5
	iNcbIU+q7u9IDZYCOTVoqKcmLnKESUArKSwJlNYUiVTn+n5u3LJ8ms9vCEG3vQf+XHVc6j
	ogfhNvlV5dUnzuARMlA6pWJgPekRVTw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779169178;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv3D1I7ZfwXPSfykNitvNiTHHQwGETU54vanQ06cU/k=;
	b=U2vWvLtX42duYzmFQuO26olQi/CzN2Cm2Mls1VdHAxMg0S5FEUPMVQRfjZjz1YOCFBUqh3
	MHPEIKBY4dZhN4DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zOD28nmQ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/Tj81mFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779169177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv3D1I7ZfwXPSfykNitvNiTHHQwGETU54vanQ06cU/k=;
	b=zOD28nmQjD5jhrHh+xaBhU4lCD8rMT1oyGthfHmo4BV4MkxK0H97NZVKAsUPFUAmP1dvTg
	2YVB0AQzU9fm0pkR9yxMSjKYNL04kAKUB0j3mFxDKfxVyNi1oxaotS2HSUoOIZXJn6ZPxm
	bkOd+e6GzUi/bKrATRvKgXvLAevsI/Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779169177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gv3D1I7ZfwXPSfykNitvNiTHHQwGETU54vanQ06cU/k=;
	b=/Tj81mFFLjug0WFsQXHdhlJvmEoTAHAMny7mb5UXAOpEVKoZO8TzzieWLcYfTiOAfnQQkw
	jmZR9f1iaDHH/iBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FE47593A8;
	Tue, 19 May 2026 05:39:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QfTHBpn3C2rDZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 05:39:37 +0000
Date: Tue, 19 May 2026 07:39:28 +0200
Message-ID: <87cxys3qlr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: avoid past-the-end iterators in timer/seq port registration
In-Reply-To: <20260518194023.1667857-1-maoyixie.tju@gmail.com>
References: <87o6ic4izy.wl-tiwai@suse.de>
	<20260518194023.1667857-1-maoyixie.tju@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 398AF67381
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Mon, 18 May 2026 21:40:21 +0200,
Maoyi Xie wrote:
> 
> Two fixes in sound/core that remove past-the-end iterator
> use of the shape
> 
>     list_for_each_entry(iter, head, member) {
>         if (...) break;
>     }
>     list_add_tail(&new, &iter->member);
> 
> When the loop walks all entries without break, iter is past
> the end and &iter->member aliases the list head via
> container_of offset cancellation. The insert lands at the
> list tail, which is the intended behaviour, but the access
> is undefined per C11.
> 
> Takashi Iwai confirmed on the inquiry thread that both sites
> are bugs introduced by commit 9244b2c3079f ("[ALSA] alsa core:
> convert to list_for_each_entry*"). The original list_for_each()
> loop terminated at the list head; the conversion to
> list_for_each_entry() left the post-loop access using the
> container struct, which aliases the head via offset
> cancellation.
> 
> The patched code tracks an explicit insert_before pointer
> initialised to the list head and overwritten to &iter->member
> only when the loop breaks early. Observable behaviour is
> unchanged.
> 
> Inquiry thread:
> https://lore.kernel.org/linux-sound/?q=iterator+used+after+loop+end+in+timer
> 
> Maoyi Xie (2):
>   ALSA: timer: avoid past-the-end iterator in snd_timer_dev_register()
>   ALSA: seq: avoid past-the-end iterator in snd_seq_create_port()

Applied both patches now.  Thanks.


Takashi
