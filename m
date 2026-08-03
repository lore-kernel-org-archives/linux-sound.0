Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009730E0C0
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740785; cv=none; b=c3P740uDLJTZKxwEZECYtXatYHejEA9/yDGp2vG+BOERa2149pt9t9LNDsE/99amzydMlnnPFR4tetdyI+9Qge9sVZsEtO+BJSbnk5qo1VJn9O+92694iaOhZg8uHUppPOOz71r4s9OVQ/AKxBK5AnrSMkUaOoFMbYp/rmxqHOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740785; c=relaxed/simple;
	bh=u3fh7D0bZ4+VPVgRB0YhlezAykWEF308FxeTPcJABiI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UjknzhqHr97f+WT65k+X57wtN49XcH4P8b0TDw2kUgyof5KCy05gBHSuY37xSwfbQOZYDJE8BshzcNwq+rzH8ckJlY1MDsUlNdIyWXaeOlL6thiu+B6iuq1VHqr6jNr8RVzZIOPmnp2kcZxavDwf2j3RDgsNrkCGcVcC4tp3Sds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qjsxYSQq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9g2SReFF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o/yjQ87/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ogp2IdJ+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qjsxYSQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9g2SReFF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o/yjQ87/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ogp2IdJ+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 690C37EF32;
	Mon,  3 Aug 2026 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou08O7Hto53sCwxi/RHRyC018/fJsOou3j2y5iDKL3I=;
	b=qjsxYSQqvE54XczgK9b+d9fqwHgoNR3MmpP74sDXtAfVs0Mo9ztnQbA4RUubmhH7DNji7E
	BqDqVHjGIzxg877WbtHMmYtm2LHMbIP+a0UCDgm+3RhAXDiTUBbkV0SvuQFGRDqJf+XSWU
	FSITe2f3I7/45fqKCinwrM2u5Ol1XdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou08O7Hto53sCwxi/RHRyC018/fJsOou3j2y5iDKL3I=;
	b=9g2SReFFXVhfv8eh592AmXXymd8bHWuVb6T79aiod++VPkoxx09y6AoRMHJKYeeBjwYXLB
	ZpMrRkDNagmQbmBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="o/yjQ87/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ogp2IdJ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785740774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou08O7Hto53sCwxi/RHRyC018/fJsOou3j2y5iDKL3I=;
	b=o/yjQ87/7CgzJ45wGc6OC4tfvyLZGSZxtAhPpGnzXdBaDWGpEvFdOZJzi5XB+zDmimE0fh
	3l4spxnBwM1Q/XNapcLcXWmNopRVefh7pVva0a42r33SRIbm0k2GPHvFgI8iSyMaiT9NzG
	4COVzHf+byYzjx89Y+/xYvPMax2UZjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785740774;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ou08O7Hto53sCwxi/RHRyC018/fJsOou3j2y5iDKL3I=;
	b=ogp2IdJ+mgdtywGB7MIRe0e3kdsytz5zJgYAFdTQ7oiBf6LHyhz5IKxV8kH/J8VrH4YseY
	0a3DcG820BqOZcDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2FE2E779A1;
	Mon,  3 Aug 2026 07:06:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0XZCCuY9cGpkDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 07:06:14 +0000
Date: Mon, 03 Aug 2026 09:06:13 +0200
Message-ID: <8733wvbs4a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Aaron Fan <aaronfan404@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for LG gram 16 (16Z90TR)
In-Reply-To: <20260802055818.7389-1-aaronfan404@gmail.com>
References: <20260802055818.7389-1-aaronfan404@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.19)[-0.967];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -4.50
X-Spam-Level: 
X-Rspamd-Queue-Id: 690C37EF32
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Sun, 02 Aug 2026 07:57:27 +0200,
Aaron Fan wrote:
> 
> The LG gram 16 (16Z90TR, SSID 1854:0554) drives its internal speakers
> through Samsung-style smart amplifiers on an ALC298. Nothing initialises
> them, so the internal speakers are silent after a cold boot, while
> headphones, HDMI and the microphones work.
> 
> A warm reset leaves the amps initialised, which masks the problem:
> rebooting gives working speakers, a cold boot does not, with a
> bit-identical kernel log in both cases. Dumping the codec's processing
> coefficients in the two states shows the difference confined to COEF
> 0x22/0x23/0x25/0x26. COEF 0x22, the amp select register written by
> alc298_samsung_v2_init_amps(), reads 0x39 when the speakers work and
> 0x00 after a cold boot. 0x39 is the second entry of
> alc298_samsung_v2_amp_desc_tbl[], so two amps are in use.
> 
> Verified with hda_model=alc298-samsung-amp-v2-2-amps, which selects the
> same fixup: the internal speakers work from a cold boot and COEF 0x22
> reads 0x39.
> 
> Signed-off-by: Aaron Fan <aaronfan404@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
