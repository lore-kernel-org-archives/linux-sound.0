Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343A334E743
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 08:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771836774; cv=none; b=PPl/FY03sC8mp/h6m1+ZO5+eTdUdZWu6UmgvoFR/XG6noOxcPi6wDMslJhwR3TkNQDuWR91mMOBMBKKl6Ul3fg2YOVPOMgZN1xEUg5q13/Hj85J36R4OWdjaIjbG9OIgaACRYg/YSIDQ/+6qwq8v3s31hel7+Mjk4fMqwwp+BwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771836774; c=relaxed/simple;
	bh=GHE6AOEIjB7ae4bVNpF3De0LQfeWsvbJklV2x7/SA5w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYdFf6SQrTW8e+R3hO+Feaf6YLTu97mf4sxQd+SKDdozfBbsOAZsBTvnY3Kb3M9O1juCv1TqcnQY56UBaDN6a6I6lg5mC7UvEnYooJZD4ONGHrMt1exSEQzBbrOYMJX8RsfuVwd1Qou7R9A5u5EcDyOAyKyIPWZUcKrw4HMyyM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o1L0LNlR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IHNDx7dC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o1L0LNlR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IHNDx7dC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o1L0LNlR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IHNDx7dC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o1L0LNlR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IHNDx7dC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FF495BD01;
	Mon, 23 Feb 2026 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqG8V6MYMR9fyOrAX2go7jl93LuRFN1A+Y4cf0J3fOA=;
	b=o1L0LNlRUVQqPyfehUYqqjAnEIR3nzw6AieGcxdtD1q26SZ18QAz7AvvsP4MM51eaIDTFp
	cpeH6BuwmxJvxzq5JSetFQwKmFeWNEadkDONpbcN76z51cKFw4L4ZH19l/JsPLDHHG8pHZ
	37FROKhEQkKU0XeVk1vyX69k5VvEO20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqG8V6MYMR9fyOrAX2go7jl93LuRFN1A+Y4cf0J3fOA=;
	b=IHNDx7dCkCQOeHAiRiBjMESlYHxNwU9cKEaVi3I+YESiRiNpU8HYRUP5wzcZwEkQSX/gc9
	ooaKeHd+h6LtgmDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=o1L0LNlR;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IHNDx7dC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771836771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqG8V6MYMR9fyOrAX2go7jl93LuRFN1A+Y4cf0J3fOA=;
	b=o1L0LNlRUVQqPyfehUYqqjAnEIR3nzw6AieGcxdtD1q26SZ18QAz7AvvsP4MM51eaIDTFp
	cpeH6BuwmxJvxzq5JSetFQwKmFeWNEadkDONpbcN76z51cKFw4L4ZH19l/JsPLDHHG8pHZ
	37FROKhEQkKU0XeVk1vyX69k5VvEO20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771836771;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pqG8V6MYMR9fyOrAX2go7jl93LuRFN1A+Y4cf0J3fOA=;
	b=IHNDx7dCkCQOeHAiRiBjMESlYHxNwU9cKEaVi3I+YESiRiNpU8HYRUP5wzcZwEkQSX/gc9
	ooaKeHd+h6LtgmDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F08683EA68;
	Mon, 23 Feb 2026 08:52:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SFfqOGIVnGlyfAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Feb 2026 08:52:50 +0000
Date: Mon, 23 Feb 2026 09:52:50 +0100
Message-ID: <875x7nn8nx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: scarlett2: Fix DSP filter control array handling
In-Reply-To: <86497b71db060677d97c38a6ce5f89bb3b25361b.1771581197.git.g@b4.vu>
References: <86497b71db060677d97c38a6ce5f89bb3b25361b.1771581197.git.g@b4.vu>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2FF495BD01

On Fri, 20 Feb 2026 12:28:48 +0100,
Geoffrey D. Bennett wrote:
> 
> scarlett2_add_dsp_ctls() was incorrectly storing the precomp and PEQ
> filter coefficient control pointers into the precomp_flt_switch_ctls
> and peq_flt_switch_ctls arrays instead of the intended targets
> precomp_flt_ctls and peq_flt_ctls. Pass NULL instead, as the filter
> coefficient control pointers are not used, and remove the unused
> precomp_flt_ctls and peq_flt_ctls arrays from struct scarlett2_data.
> 
> Additionally, scarlett2_update_filter_values() was reading
> dsp_input_count * peq_flt_count values for
> SCARLETT2_CONFIG_PEQ_FLT_SWITCH, but the peq_flt_switch array is
> indexed only by dsp_input_count (one switch per DSP input, not per
> filter). Fix the read count.
> 
> Fixes: b64678eb4e70 ("ALSA: scarlett2: Add DSP controls")
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
