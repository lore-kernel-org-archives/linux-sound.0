Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8237C0FE
	for <linux-sound@vger.kernel.org>; Tue, 19 May 2026 06:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779171040; cv=none; b=AnbX/oetDFqftqDZy7OQmG/hDmhdDBi9M04CPqzRQ79XUfKxl7YFA4xnJgG1PbTgKBq93o1zTPYKRhsu3RZ58y2zZsSQNNqtcWNYkVlgUIUzoW9kLGupnm6CFEyk/BzlfevJhndv6Oe8dc2Rk7z7SFcvOdajV3XHj9IsHS5JhKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779171040; c=relaxed/simple;
	bh=JvqxnIav7ntp8tJdgYjxwpdEHy4PTdC7dVyLYqZiyBM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mp9r6HoxcDyFdlF2wT/icnd24XWy8jsokB7FzA+JhifBtPe2SpDQNYG6YC1XuVS5AbgzQSIdkicDFVVg2MvzFsG/mr2TvAECakv5eUBR1FD6ljjab339OY7jqca+ToUFjCLxsa2wIGqFkBVS5LZ1Pj5JNipKXcuU4nQTMp9j/2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h+9MJhqI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5mi2LbCv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h+9MJhqI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5mi2LbCv; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h+9MJhqI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5mi2LbCv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h+9MJhqI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5mi2LbCv"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3AD2167E2A;
	Tue, 19 May 2026 06:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779171037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+luWZemAhCChKaWAN80rNgAiT1X7IpqRfWRAusPRdQ=;
	b=h+9MJhqI/RJQp0yRMWGIy8z72BL2eEXExQ0oHGCchcO/LeL4eD1YSgvStSORxuFeFFQf1x
	zxNzySmvenexKe6wmwNR0vi/YEe+6SO37sQfKh31tD6EMZO3DZkcOGWN7+KG96F/5e115Q
	kiaz7Ht4XNHhsGL1NF/XEXZuarFScqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779171037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+luWZemAhCChKaWAN80rNgAiT1X7IpqRfWRAusPRdQ=;
	b=5mi2LbCvjqT8oPgZtvcTmDBMDaX0R9TVlMuU6Uab5dFDFv11w/P/y36AI2dGWnCsXmSFY8
	cwm/gtCQvURlvXBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779171037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+luWZemAhCChKaWAN80rNgAiT1X7IpqRfWRAusPRdQ=;
	b=h+9MJhqI/RJQp0yRMWGIy8z72BL2eEXExQ0oHGCchcO/LeL4eD1YSgvStSORxuFeFFQf1x
	zxNzySmvenexKe6wmwNR0vi/YEe+6SO37sQfKh31tD6EMZO3DZkcOGWN7+KG96F/5e115Q
	kiaz7Ht4XNHhsGL1NF/XEXZuarFScqY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779171037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+luWZemAhCChKaWAN80rNgAiT1X7IpqRfWRAusPRdQ=;
	b=5mi2LbCvjqT8oPgZtvcTmDBMDaX0R9TVlMuU6Uab5dFDFv11w/P/y36AI2dGWnCsXmSFY8
	cwm/gtCQvURlvXBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 207DD593A8;
	Tue, 19 May 2026 06:10:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CBQsB93+C2qLAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 19 May 2026 06:10:37 +0000
Date: Tue, 19 May 2026 08:10:36 +0200
Message-ID: <874ik43p5v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usx2y: Drain pending US-428 pipe-4 output commands
In-Reply-To: <20260519-alsa-usx2y-p4out-drain-v1-1-8f0a4550bae2@gmail.com>
References: <20260519-alsa-usx2y-p4out-drain-v1-1-8f0a4550bae2@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
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

On Tue, 19 May 2026 05:20:41 +0200,
Cássio Gabriel wrote:
> 
> The US-428 pipe-4 output path submits at most one pending p4out
> entry from the shared-memory ring per input interrupt. If userspace
> queues more than one command before the interrupt handler runs, later
> commands remain pending until later input interrupts, even when async
> pipe-4 URBs are available.
> 
> Drain pending entries while idle async URBs are available. Copy each
> command into the existing per-URB async buffer before submission, so the
> submitted transfer does not depend on a userspace-mapped ring slot
> remaining unchanged after p4out_sent is advanced.
> 
> Also update p4out_sent only after usb_submit_urb() succeeds, so a
> failed submission is not reported as sent.
> 
> This keeps the shared-memory ABI unchanged and fixes only the local
> queue-draining behavior.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
