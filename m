Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E9175A76
	for <linux-sound@vger.kernel.org>; Mon, 30 Mar 2026 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878122; cv=none; b=OvuIywyt30uM5izRMzbpltPSSw8spkT3bmKLJTb9WzUO545EeioHxQMqNvvBDyxwe27bjhbMBq1UYo8csvuhCaK93O3tJVHWRnDRlhgMMfWU0+IIJ6XxXo4IXWNLQUfgDVwTdCiAzWEld4Y16yIFgSyvRY6ym6KfGZn5qFW6Sfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878122; c=relaxed/simple;
	bh=4ntqofeYwsmErQMhLN/tfy12RFq8Ft48ukjMAuwoCLk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DqZ/LZWXm0sEYhPjmzRHjhhcQzVznPiO8YMW/i6tqNDoRhdFUGEmW8wNUFg51Moib54SjlWjdvuaqUFCHX04ECPrCBxPgn1kfXeiaSOl+xc2ElBG7RcGNnDlprNmJg7TVavi89d3OFm27oZSm6sMISx+4Nojn6Im26OZ/nhJXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lMPmlhif; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=onaUx01R; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PbfzknE2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YjD1xqR7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lMPmlhif";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="onaUx01R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PbfzknE2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YjD1xqR7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D28215BD4C;
	Mon, 30 Mar 2026 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774878119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CtZn3DL7ZSsu4AlflTjWChNJIuJpJ+JOX/v9xrqox4c=;
	b=lMPmlhifvUo3Kd+BDvhb6T0uaxk/naxwpu9xwKoaFiYj/3OGjM6huStL5W652a9Q4/StGz
	edBprxC/4C7FaXCnTNuP3OHxXqSLLUehM9+Mmwk6Wa2H31hS20nxZAhsy0/2glpR11Jx0x
	XSEzIMiX47GRYIG28JOYUCt0kqr9HNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774878119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CtZn3DL7ZSsu4AlflTjWChNJIuJpJ+JOX/v9xrqox4c=;
	b=onaUx01RhTKc5foFzmP47fBtawSsGKLIPGg8KpCqlf3k+SRnJ0mM4mBY/pg8CSwfvHENZ5
	Xqq7HJZkCiI8/FAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PbfzknE2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YjD1xqR7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774878118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CtZn3DL7ZSsu4AlflTjWChNJIuJpJ+JOX/v9xrqox4c=;
	b=PbfzknE2nKIW8HnDldniDtCQYN1fTg/tHK2xDCTp6oodTZgRXphJKo/2WcNcoxhodiJ1NK
	sxtazo6WF6forG+tcWMTb7ywfwHzi/0CPIYuyX/vuCzJk6sSqejrpXt4OM7ILiFNBr3Yd4
	ksf+3zws3FwDcnZdpXGg2f5gllVkjxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774878118;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CtZn3DL7ZSsu4AlflTjWChNJIuJpJ+JOX/v9xrqox4c=;
	b=YjD1xqR7EAiFu2doXecFIqVguUF+czRSy2pH0nwiGip0DD59xSh0iShT9HqfAyqrkhx2gr
	k3WWn9Hp5CcNqNCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 960814A0A2;
	Mon, 30 Mar 2026 13:41:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fwf7IqZ9ymklKgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Mar 2026 13:41:58 +0000
Date: Mon, 30 Mar 2026 15:41:58 +0200
Message-ID: <87y0j9towp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lei Huang <huanglei814@163.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lei Huang <huanglei@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: fix bad indentation for alc269
In-Reply-To: <20260330125333.86012-1-huanglei814@163.com>
References: <20260330125333.86012-1-huanglei814@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D28215BD4C

On Mon, 30 Mar 2026 14:53:33 +0200,
Lei Huang wrote:
> 
> From: Lei Huang <huanglei@kylinos.cn>
> 
> Mention complains about this coding style:
> 
>   ERROR: code indent should use tabs where possible
>   #6640: FILE: sound/hda/codecs/realtek/alc269.c:6640:
>   +        [ALC233_FIXUP_LENOVO_GPIO2_MIC_HOTKEY] = {$
> 
> fix it up.
> 
> Signed-off-by: Lei Huang <huanglei@kylinos.cn>

Could you try to pinpoint the introducing commit with Fixes tag?


thanks,

Takashi
