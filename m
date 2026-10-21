Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575251;
	b=nJQRvP053/XXYrv3/aPmXrbbmyYt0hOcKTZSnPQJ0h0R+1fuy/09uGlHa9kh7XFi9EF/
	 qDo4kkJoVXFvRixPRad5TA/N4yyqQqM5il7T0yUljfUh3gc2+v1cdp1w0fKfepnqUNwL3
	 fKI/qff0QkaSkpNN23KfqFS+qlQp+wV0wFdwHPBP3cRyLLGI7J+qQWT9Juh3JqwKHLlMt
	 iw+D50jq0gsOiQ26m0/r3jEP7caAzfRbqsVkhOJ+nDO/NbYRUdgvyYzn/+CEzmpmOtUJq
	 KKfogt/y8lka4lIE428xJoZISUiRPUnL3GyXo6RY3lWrAFQh7nppYlXhexLiZv1ffbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575251;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Server:X-Rspamd-Queue-Id:X-Rspamd-Action:X-Spam-Level:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=C0hxcQYCzmMfbeaGHf2ZXRxGM/zTP9+KD1NYX0t92hw=;
	b=Dn2f24D0xcpRUdjo6B5aUwV3YT489QNhj0UEuGYHA1Ar0SYimke/iIIaPsH92Y8Bgz22
	 +Z+MjccPcJt21p5p3f2TgK8JED+1yxWo9vlcu+1gyrmZKFebqr34aGigyHkC2P9oKRac+
	 PlNtj7wRDucOwIisVzykTpBzQMlsnC2FIscchWVGM1UAwUTm2psG+DbNyEsJAocXje+qt
	 XhOkJiE29e6waKVMNMVFte3wGJaP/5+19Y0KHiXVGn2L1zlqM3u+5ITWmJIFQzFw7b0kz
	 JfAamgTiN6HPfiHet3OwJDKaNDDMDM5OIlv/L8DrqZ0tPPZwp8WJlqlOKZnaDyFP3ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m1he+AON;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JfySLHAw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m1he+AON;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JfySLHAw;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF93606A319
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF93606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m1he+AON;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JfySLHAw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=m1he+AON;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=JfySLHAw
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BD4621DDF;
	Wed, 21 Oct 2026 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0hxcQYCzmMfbeaGHf2ZXRxGM/zTP9+KD1NYX0t92hw=;
	b=m1he+AONUuumn7C2zCELC7nHC8VUbRfQyNJAa1Bv1CxLPLFBHW0D4wkrfYYb9YM6oQwEFY
	1CidtOwhxDJJsNxgE3SYDiGIO1Igakos1rLZbtw0DO68Hvc9gedprsQJtR954MKTMVYlZ0
	Zjyp9BvNZSoqm+c3PnALAIFRHLATjrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0hxcQYCzmMfbeaGHf2ZXRxGM/zTP9+KD1NYX0t92hw=;
	b=JfySLHAwhvP6y7UeER4hBcOhq/J31wlYCpQ9kTxyb417t4otu+XHaN2DIXCFSt1SKx2MPf
	pXKua83yNKhBRvAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m1he+AON;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JfySLHAw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792575249; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0hxcQYCzmMfbeaGHf2ZXRxGM/zTP9+KD1NYX0t92hw=;
	b=m1he+AONUuumn7C2zCELC7nHC8VUbRfQyNJAa1Bv1CxLPLFBHW0D4wkrfYYb9YM6oQwEFY
	1CidtOwhxDJJsNxgE3SYDiGIO1Igakos1rLZbtw0DO68Hvc9gedprsQJtR954MKTMVYlZ0
	Zjyp9BvNZSoqm+c3PnALAIFRHLATjrE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792575249;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C0hxcQYCzmMfbeaGHf2ZXRxGM/zTP9+KD1NYX0t92hw=;
	b=JfySLHAwhvP6y7UeER4hBcOhq/J31wlYCpQ9kTxyb417t4otu+XHaN2DIXCFSt1SKx2MPf
	pXKua83yNKhBRvAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44CB4134A5;
	Wed, 21 Oct 2026 09:34:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Jp06CBGH2GobGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 Oct 2026 09:34:09 +0000
Date: Wed, 21 Oct 2026 11:34:08 +0200
Message-ID: <878q3rfldb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nazmi Maizan <nazmi.maizan1@gmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speakers on COLORFUL L1 Plus
In-Reply-To: <20261020162323.23202-1-nazmi.maizan1@gmail.com>
References: <20261020162323.23202-1-nazmi.maizan1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7BD4621DDF
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Tue, 20 Oct 2026 18:23:23 +0200,
Nazmi Maizan wrote:
> 
> The COLORFUL L1 Plus (Rimbook L1 Plus) with an ALC233 codec has silent
> built-in speakers. Its firmware marks pin 0x1b as unused (0x411111f0),
> although it is connected to the speakers.
> 
> Retasking pin 0x1b to an internal speaker (0x90170110) restores audible
> output. I tested this pin-only correction with the early HDA firmware
> patch loader on Fedora and confirmed that it still worked after reboot.
> 
> Add the subsystem ID 2782:a248 to the quirk table and reuse
> ALC233_FIXUP_MEDION_MTL_SPK, which applies the same pin correction.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=222155
> Signed-off-by: Nazmi Maizan <nazmi.maizan1@gmail.com>

Applied now.  Thanks.


Takashi
