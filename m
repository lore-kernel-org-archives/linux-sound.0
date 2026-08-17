Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16423DB321;
	Mon, 17 Aug 2026 11:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967512; cv=none; b=b/IB+hctsoqS7Wr6gKuejolxgYoszE2jFHlq9hoiELDMh57FHJPhjM2W8Ukiw88ate+7f3cEA90kUNqVmi0fFahGMr4KM4AcKtmoFmo63T/dAtiSZ77wMBCzVDl6+RGc9AyuMJPL8/hiYmRRphE/sgW6Sy3J1OIRWEwYS29aJm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967512; c=relaxed/simple;
	bh=uS/+2sUes7LhuAycKjtuJ5T3WMtdKH/gO07pcpQcdGo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQWkDJO1R3TpyMy3i4dshtn4k9N9vIwAfgrj79GaLJhyWQS4Um6h67sFT9h1WvkptHvu3bXAstz5UGg04MSxce/dTnr0J8pBQkXa2IPI8yByffo4J8cRFQ3NiVoaCdUUQxjIE/3VR4bnMtFayWEc8HUXXbcag5qakT2pE/8U3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dPqKBREo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6P0m3rBn; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DIKI1aHX; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jk2xx1k4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dPqKBREo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6P0m3rBn";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DIKI1aHX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jk2xx1k4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 881C983F5E;
	Mon, 17 Aug 2026 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786967504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+kmRmLX817Ik+D5NBWF90wJMeHjKXaP96FU2xqpjeM=;
	b=dPqKBREohQLJpcXuxhU8LZZebxj9IBNmy+L4eUNBf+XXCIWbYlEJvDFpDgIOgI5RBYiJ6F
	RUULTu4sbbT8XY35okec61nNKOw1uqMnJElOnQvoWNNQ9bdQHje5RWtuaUQ2K9LtbuYPwp
	HEB6AKJPu6vKV1Lq3oezXpHFlq/rdZk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786967504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+kmRmLX817Ik+D5NBWF90wJMeHjKXaP96FU2xqpjeM=;
	b=6P0m3rBnr0Y6xU//oCWpa1lp5B+QHtNAENm3H1JlDGHrvMboWSohpQqZ9vhcDys/cV16ti
	Bkhr/7rin9uUmkBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DIKI1aHX;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Jk2xx1k4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786967500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+kmRmLX817Ik+D5NBWF90wJMeHjKXaP96FU2xqpjeM=;
	b=DIKI1aHXGHLme+zRvoKlJdE/gNNDfKmdWuHpheHv6Cq5VZc/+CWu3pB98Iz+s7m2oMauxR
	gTHra+kbMbWSmmXQBtGlA7avv3P1exARrZ48/BOA7HOUXvtKkH1teI/kCSPJwG4lvxSRf6
	xs/TXVhIufaClCd4fuV0y6Ak3lsgdq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786967500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9+kmRmLX817Ik+D5NBWF90wJMeHjKXaP96FU2xqpjeM=;
	b=Jk2xx1k4hjhLAL0iaM2bmTqRfAU0M/Z3oVLhzZLTIeBUwD3lf+c0sofVKEY/u2UaWslF3N
	3AQCrsArs8qyMNDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E5D87944D;
	Mon, 17 Aug 2026 11:51:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uan6Ccz1gmoOUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Aug 2026 11:51:40 +0000
Date: Mon, 17 Aug 2026 13:51:39 +0200
Message-ID: <878q65rmlw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	tglx@kernel.org,
	broonie@kernel.org,
	stuart.a.hayhurst@gmail.com,
	wangruikang@iscas.ac.cn,
	zhangheng@kylinos.cn,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Add Lisuan HDMI controller and codec support
In-Reply-To: <DE1B62191D573D37+20260817085531.992573-1-raoxu@uniontech.com>
References: <DE1B62191D573D37+20260817085531.992573-1-raoxu@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,linux.intel.com,kernel.org,gmail.com,iscas.ac.cn,kylinos.cn,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 881C983F5E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Mon, 17 Aug 2026 10:55:31 +0200,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> Lisuan GPUs expose an HD-audio controller at PCI ID 4c54:5010 and an
> HDMI/DP codec with codec ID 0x4c545020.  Neither ID is currently matched
> by the HDA stack, leaving HDMI/DP audio unavailable on these devices.
> 
> The existing downstream support uses the generic HDMI codec path and
> attaches no Lisuan-specific capability flags to the controller.  Its
> dedicated AZX driver type only changes the short driver name.
> 
> Use the corresponding generic upstream paths instead: bind 4c54:5010 to
> AZX_DRIVER_GENERIC, register 0x4c545020 as MODEL_GENERIC, and add the
> Lisuan codec vendor name.  This keeps the enablement minimal and avoids
> a vendor-only AZX driver type with no vendor-specific behavior.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>

Applied now.  Thanks.


Takashi
