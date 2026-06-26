Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8F3CC324
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 05:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782452926; cv=none; b=gnaRhv5Nyb7ZhY4sgeGVAm+hWJJJLhNXAPO22y7OkG6dXIdqDzMVL9jyn+tKO591RLfnUk5xp70qpq5Hv8v1eFPR+xT7gx3YL8Dlc7GPoOYEbNKOtCl6P78LBf9q8oTqtV0VDy4M4W8cmHko7ScgwxkBFxcaRUycLgy5xpJAxOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782452926; c=relaxed/simple;
	bh=PdNl4qINB94L4PvZ27XISZVxUpRTdWvNyOKKR++jJxs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h7vppGWFA0GSpqmk6G37Qgjx3t8+JA+uUuEReNYxSWlsyVJ9CY4ORPYNFO0KfRCWyLDAxHP6T//LUJzBvBpVlUlM/yaQEv6CM6l//5Pp54dO2E5XOC9cd6IUGZ5T/q4RgZfpBy1+UyAoaR0YXhuUQKQaqh2iu9Th7NXo+eFTghg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Is67lPpO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k4g8rDI0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Mqkk85w0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KKeM9gDX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Is67lPpO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k4g8rDI0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Mqkk85w0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KKeM9gDX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E19875FD9;
	Fri, 26 Jun 2026 05:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782452922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8B4OTPyaPwFDwzDVzSwgYYUft4rUWoNGbLnoshvdEmU=;
	b=Is67lPpO/vcJQG1AfiT7BxOT1Cw2LtvnR3jb2MezBeK/x6S8Hvk5+gNVc/duLmgEpOH0/v
	XPhRvXxHz8SvN402dJa6oxwJbLeJTcPCvzHWVTlvNKGrSB4Lmn9b++pv5ZlU6G2egfe53C
	SpQ6pWtkbn/vgEaS/h20y7F952eptMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782452922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8B4OTPyaPwFDwzDVzSwgYYUft4rUWoNGbLnoshvdEmU=;
	b=k4g8rDI0u4ed+1z/FuglBaqdKBkKRxgqKyOAMvURezqkthi8R1TwOWef596kDroOGokBQp
	f63Yh5urQpmJ2EBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Mqkk85w0;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KKeM9gDX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782452921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8B4OTPyaPwFDwzDVzSwgYYUft4rUWoNGbLnoshvdEmU=;
	b=Mqkk85w0TDOUeM6sBwxedzUqsn6GMBqjTFsw0gMMPQU8lOLKRqhbMQZgQtLwINYQ48u+cZ
	DwoKV0EMo5+yAsFObOI9mhbsGEALbEMIFJRVw9eYIyVFkw3i/+iIyWjVTSe10uD3e+hrUn
	PQIcdp03V5CiTTS0L+/iBlVW7yx9QbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782452921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8B4OTPyaPwFDwzDVzSwgYYUft4rUWoNGbLnoshvdEmU=;
	b=KKeM9gDXso/y4ZBfK0ZlKiI6fTZ8lDWSC4EM6f6Ml3CSSos37bFmyNGj4WfoxZsVmSsDv9
	P0oTP/ZJ3hWyEzBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1BDE779A8;
	Fri, 26 Jun 2026 05:48:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bPaDLrgSPmpRbgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 26 Jun 2026 05:48:40 +0000
Date: Fri, 26 Jun 2026 07:48:40 +0200
Message-ID: <87ldc1ua13.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christopher =?ISO-8859-1?Q?H=F6ner?= <christopher-hoener@web.de>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH v3] ALSA: hda/realtek: Enable internal speakers on Razer Blade 16 (2025)
In-Reply-To: <20260623190207.3242-1-christopher-hoener@web.de>
References: <87cxxhczce.wl-tiwai@suse.de>
	<20260623190207.3242-1-christopher-hoener@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 5E19875FD9
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[web.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Tue, 23 Jun 2026 21:02:07 +0200,
Christopher Höner wrote:
> 
> Hi Takashi,
> 
> thanks for the review.
> 
> v4 moves the captured programming and the fixup into
> sound/hda/codecs/helpers/razer_blade16_2025.c and uses the full model
> name throughout, so it can't be mixed up with other models.
> 
> On power_save_node: it works, but it clicks on every stream start for no
> real benefit here. Given the click -- and the existing fixups that
> disable it for exactly that reason -- I kept the pcm_playback_hook.
> 
> I also couldn't drive the amp from a power_filter: the per-path power-up
> on stream start goes through path_power_update(), which writes the power
> states directly and never consults codec->power_filter (that only runs
> on the codec-wide transitions), so the filter never sees the
> converter/pin coming up for playback.
> 
> I think v4 is ready - I hope you agree.

OK, then let's take it.  But it's a big change and now is already at a
very late stage for 7.2 merge window, I'll postpone the merge for 7.3.


thanks,

Takashi
