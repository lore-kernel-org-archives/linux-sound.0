Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7626939D6FB
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622581; cv=none; b=mPeJYQv5OTyH//J/eUQj4IQ7sixsjW0VDct+Sqz2bpaUeD0ycSatHMXrqhVxugYj8rTK6o4N03QaxlbZsMzTs2LSSITDgVqSDpvKFryA2Z/e5Lb48vSUKKOH3O200bHmM04vCvxpy7ERJ/xe5Ex1x5KcaMkKMBydChCyjh1R4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622581; c=relaxed/simple;
	bh=blklentUN2VJWxcrYJdSb+d8SsSySae/P+CaJwinsYk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFwld9ubSvBJ8QiDkfbLbr4RjQhjR0k7NMXbCYwpTFIWPkWvbtUNzjBat3twtndRt4Y3MUA0Ry6W+DOhZXoG6jQ0uhVYyYO7GlGW4BIGP9Emi3EliqOHjlNYu1DQ7p3j/CxZddx7owXwKprJj+bixWWdYWulvSpEMMV6sqjs4/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O5oTX7vA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zMYct2i/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=O5oTX7vA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zMYct2i/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O5oTX7vA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zMYct2i/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="O5oTX7vA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zMYct2i/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AC4563E7E9;
	Wed,  4 Mar 2026 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772622576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g8kHn0yOFG0jwy+y+5bFAVzKjOkgkyASYH/xZuutOvc=;
	b=O5oTX7vAfDkC0w0RhE6jYyaT/mWjHW38EUkhpbwhpPSP3VR7wF+BjCdVEOaW6B4PVXTd6C
	Mh/lzGGJ6SsZr80wrTVOj14yPuAb0ShA7RJIqSyNw//t3Pw0GeASXXb7yNHgGShTGo3mU0
	F/6e0sc8CZjYXECt3cMoLAj9f44cuuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772622576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g8kHn0yOFG0jwy+y+5bFAVzKjOkgkyASYH/xZuutOvc=;
	b=zMYct2i/oTS/FfMqngN4AZsxH0oAy5N48lcS5n6VQ5ksgJhXCi3ULYh7juOifFKPwFFBAv
	sKei9EBpU4i34TBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=O5oTX7vA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="zMYct2i/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772622576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g8kHn0yOFG0jwy+y+5bFAVzKjOkgkyASYH/xZuutOvc=;
	b=O5oTX7vAfDkC0w0RhE6jYyaT/mWjHW38EUkhpbwhpPSP3VR7wF+BjCdVEOaW6B4PVXTd6C
	Mh/lzGGJ6SsZr80wrTVOj14yPuAb0ShA7RJIqSyNw//t3Pw0GeASXXb7yNHgGShTGo3mU0
	F/6e0sc8CZjYXECt3cMoLAj9f44cuuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772622576;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g8kHn0yOFG0jwy+y+5bFAVzKjOkgkyASYH/xZuutOvc=;
	b=zMYct2i/oTS/FfMqngN4AZsxH0oAy5N48lcS5n6VQ5ksgJhXCi3ULYh7juOifFKPwFFBAv
	sKei9EBpU4i34TBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 75DEE3EA69;
	Wed,  4 Mar 2026 11:09:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id puN/G/ASqGkgOAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Mar 2026 11:09:36 +0000
Date: Wed, 04 Mar 2026 12:09:36 +0100
Message-ID: <871phzx34f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: bo.liu@senarytech.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/senary: Add hardware init verbs and fixup framework
In-Reply-To: <20260304070219.450083-1-wangdich9700@163.com>
References: <20260304070219.450083-1-wangdich9700@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kylinos.cn:email]
X-Rspamd-Queue-Id: AC4563E7E9
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 04 Mar 2026 08:02:19 +0100,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> Port the essential hardware initialization logic from the vendor driver
> and introduce the standard HDA fixup framework to handle different
> machine configurations.
> 
> Key changes:
> 
> 1. Add hardware init verbs:
>    - Implement `senary_init_verb` to send the vendor-specific
>      initialization sequence required by the SN6186 chip.
>    - Override pin capabilities for Node 0x19 to ensure proper headset
>      microphone support.
> 
> 2. Introduce fixup framework:
>    - Define a default pin configuration table (`senary_pincfg_default`)
>      to provide a fallback for devices with invalid BIOS configurations.
>    - Establish a quirk table structure for future machine-specific
>      fixes.
>    - Since the standard quirk matching relies on Subsystem IDs, we
>      manually apply the default fixup if `snd_hda_pick_fixup` does not
>      find a specific match.
> 
> This ensures the chip is correctly initialized during probe and resume,
> and provides a scalable mechanism for supporting specific hardware
> quirks.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

As this doesn't look like an urgent fix, I applied to for-next branch
for 7.1.


thanks,

Takashi
