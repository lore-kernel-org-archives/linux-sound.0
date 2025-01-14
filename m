Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB1224FD;
	Tue, 14 Jan 2025 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736844423; cv=none; b=BKuaBYakNq/MJmenaejt99bQ5IN+02bq4hJWlkvz1vccCL6WidZ6yo4HuCbUV8oAR1RSQ6IsfFhJgXMU/GKFGOSATG7o9n74CvTD7cH1WwuRDrwMBbN44JKUrnBnN/6CqObHoyFObcJVvTE377JOUR5L4EYmjd1MwzdFibc4qZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736844423; c=relaxed/simple;
	bh=3QUSFX/UsafqjBF3KI4qL8ccl2bVSn3+TukN5FqxQUI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMt99uqNfudFBk8Qr4JjFSqJVdjdV928DvO0J9TQnfbJNyASgFzCkfnrDhGQgNh5Jr+2JDU0VDeyIkTFWAUeoZ7KL5ynJ3WNciU0/nPC8gGOexAQAg/CKVjF4Zag2BrQd8RmGs+PkgxLRjD2CQMHHi1r/xnQLaduUjGZKasEh0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zJU69AQE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qI68tbbF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y1IxtJ2g; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eioeFGeJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zJU69AQE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qI68tbbF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y1IxtJ2g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eioeFGeJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E8FD12119E;
	Tue, 14 Jan 2025 08:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736844420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6btRhj41N583UXRmcZKJS2Wwmu8uZRFKEWKshoTk5UU=;
	b=zJU69AQEBspSFcbXDFyzNTfJ4FcS+UFRxwrnzBznaqqLWojurTsu/HGuu3WF9Tr6pZajTt
	+GCShs2+PTWRrHU3G8/6pBVOZFbD/RhViypG1hxlTqVM0ndG2yCylpDFO5qSVT6VV5K2S0
	MYlcYfP8xY2/vFKC3T2prvps9/upby0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6btRhj41N583UXRmcZKJS2Wwmu8uZRFKEWKshoTk5UU=;
	b=qI68tbbFe0/TuplfhWs/fM1NoX5Wcy0xtyIhrQ5BxRbia1RE4+z2aIp6XHh0IM0RT3UrNX
	UHqVH0WTatFG4NDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Y1IxtJ2g;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eioeFGeJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736844419; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6btRhj41N583UXRmcZKJS2Wwmu8uZRFKEWKshoTk5UU=;
	b=Y1IxtJ2gHB2zAywMDuyrVMF2sXiVyRyU28jPS7/uob+ptGuLhdN3SPjlPL5YO7/HFTRSga
	9o/ZS4xGUu8vX0HgZilIazPzvVt72I/iwwi+NiHJo3vkq/JBBzNPWiJyydIEOCqKyocSJt
	dPaHN923dS351mrEJjwc1pV/u1RjrWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736844419;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6btRhj41N583UXRmcZKJS2Wwmu8uZRFKEWKshoTk5UU=;
	b=eioeFGeJiYf/uKzMzFnG9CE+rh3vaaEQ3FLxngG6cqRzgTvnPDohOxn/SaK6TgDi/dpCbA
	+GnHAxF9Ya0znXBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 930041384C;
	Tue, 14 Jan 2025 08:46:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yWg0IoMkhmebagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Jan 2025 08:46:59 +0000
Date: Tue, 14 Jan 2025 09:46:59 +0100
Message-ID: <87zfjtzssc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Add AZX_DCAPS_NO_TCSEL flag for Loongson HDA devices
In-Reply-To: <20250114080700.23029-1-zhaoqunqin@loongson.cn>
References: <20250114080700.23029-1-zhaoqunqin@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: E8FD12119E
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim,loongson.cn:email];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 14 Jan 2025 09:07:00 +0100,
Qunqin Zhao wrote:
> 
> Loongson's HDA devices do not support TCSEL functionality.
> 
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Thanks, applied now.


Takashi
