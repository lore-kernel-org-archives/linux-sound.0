Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8754749F7
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859761; cv=none; b=iiMKEXdC2BcN5gLj9kLfw/oAv6tI77dYe7GI8E4kDaFw6ZDFTHeBdF+vQgC7m5Dbq8+n51uld0SjdLbXy9ggPQeUYg0BnOTwljsGDwdjTImn4FmvMyN3z/w5ad5pct5Q/0ya6Mf8u2v1mYj7HamBySGgWvFJsTHz0ca8+2C+3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859761; c=relaxed/simple;
	bh=grg1M9SsiPjIWqWtDqtY+0imSuXT/YTzcFs5EzRAaAo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VkCPzB9EkU9UkDrT2QZbhLDnEyiBNYs4ML/xVxvLFvjn0tPfi9QabI9UOTCuE664rocNo+kQWX99gNruFxqp91X7u8GdzSgW4TstCzo86cfownKzCArMeo7n6rd1pGZJInOvrrR3JrszJ/Tfa+I/FQhHoOGpv6a+g02O2tBPyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z4fKl3Ru; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dADBRlfK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zOhvukRn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gc01x/kG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z4fKl3Ru";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dADBRlfK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zOhvukRn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gc01x/kG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71F317F73F;
	Tue,  4 Aug 2026 16:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785859753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sp2tkMA9cDc3k5l2njTk/d0CkgJUdfWY+HV22J2PV/8=;
	b=z4fKl3RuR8KRxRUBW/+vsGkf1hewsVQ4UGG5qLtn+Hnk17Yuf0cedcljzvv5PVIMTIG1Ql
	AdB4E3K+p9JgaIYEQUwuzYDxcPV7w+87909xIFZ6O/emV49SOiYgiPaOGjnoLRTneS1Ymt
	yxb6gmVDWzhIgsDB7JZviQFht76o8qk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785859753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sp2tkMA9cDc3k5l2njTk/d0CkgJUdfWY+HV22J2PV/8=;
	b=dADBRlfKzw85ZEOX4rrnkDfs5YuxzsA6OA+Tc1lOeaPOhglOceMKcWWS6b0jWI3xql9yJQ
	ujU8+UoCBsF6UYAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zOhvukRn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="Gc01x/kG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785859749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sp2tkMA9cDc3k5l2njTk/d0CkgJUdfWY+HV22J2PV/8=;
	b=zOhvukRnK6WltJy+5hSwYUR7kmxpBIzzO20WcpYB2644uCZYf05GPAZf1WW2Mcy0NWCMWr
	eYEQGFXoNNDrgcw3jWoTTLzNeDTGgSTgXgAe/lPhb9/JeCRdxV2eN71tvXTpYL9OXAPMv9
	GfukgIj5jadtFhsrWcQGVKXpq3hlkGE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785859749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sp2tkMA9cDc3k5l2njTk/d0CkgJUdfWY+HV22J2PV/8=;
	b=Gc01x/kGxe2U291rmJr2Tw44P4SBkn0Wjwtr0JtbuoX1J13yhU+AAiydEobCNRRbTZ21yM
	IyCZukgFexVjDZCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 18F20779BB;
	Tue,  4 Aug 2026 16:09:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id T6jWBKUOcmp3KwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 04 Aug 2026 16:09:09 +0000
Date: Tue, 04 Aug 2026 18:09:08 +0200
Message-ID: <8733wtj2aj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jackie Dong <xy-jackie@139.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	kailang@realtek.com,
	damien.dagorn29@gmail.com,
	sean@starlabs.systems,
	chris.chiu@canonical.com,
	huanglei@kylinos.cn,
	dnaim@cachyos.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA:hda/realtek:ALC269 fixup for Yoga/Legion Mic noise
In-Reply-To: <20260804123637.21001-1-xy-jackie@139.com>
References: <20260804123637.21001-1-xy-jackie@139.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [1.79 / 50.00];
	SEM_URIBL(3.50)[139.com:email];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	MX_GOOD(-0.01)[];
	R_DKIM_ALLOW(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[139.com];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kylinos.cn,realtek.com,gmail.com,starlabs.systems,canonical.com,cachyos.org,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Spamd-Bar: +
X-Rspamd-Queue-Id: 71F317F73F
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: 1.79
X-Spam-Level: *
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org

On Tue, 04 Aug 2026 14:36:37 +0200,
Jackie Dong wrote:
> 
> Lenovo Yoga Pro 7 15ASH11 and Legion 7 15ASH11 use the same audio
> subsystem implementation and support only analog microphone.
> 
> Limit Amp-In Vals to 0x00 and 0x01 for the internal microphone to reduce
> recording noise. Values 0x02 and 0x03 introduce significant noise on
> them.
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>

Applied to for-next branch now.  Thanks.


Takashi
