Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C48A330661
	for <linux-sound@vger.kernel.org>; Tue, 23 Dec 2025 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766483372; cv=none; b=t9LNE+0B+GfQauDhz3/Pky+40xfu8y1OoutwRAY2oAg/zfU2F/InZMCOvZc9HZ3/lclmDFq3M8j35nU+iySMTxSUE3ojtg01CvOpj/36zA/4DWQl8EdNCRGHClE+jkjoYuq/N8+UPcH/1HW8dcO+7O5y+alLO68I4X5mlY3/wWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766483372; c=relaxed/simple;
	bh=Ga76KVgerH7N+RudTz2jDPqQo8hXnNQHfwC0GNacKSU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAZejS/wyYfTK9xJbOfdDf9Plc3f5DaPDHQY+pC5Qj/iGvAGSoVv5tsKiPiEmriS2znm/47Pv28XdYghUbNqfBA15Qbnpakc9u5J0ulBchQDSCa7t1ZoXCjrrNVyNIWsL5yy90DSK2qjUQaGl0D7u3/8FprTdH8A7J8m9urnb4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xKRgSOkq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9XcGUXRJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=T/EBsI9Q; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L/AJWZIZ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xKRgSOkq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9XcGUXRJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="T/EBsI9Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L/AJWZIZ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D6F8E336A0;
	Tue, 23 Dec 2025 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766483368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=xKRgSOkqZr4FyY2HZ/U05qB4yU8x+86dHPr+612+gdn/vnt4kt4k9Ox+hALKBWKHuuMiPo
	vjKSLhwD9QToTngpdmoR91ol3+dtcWUtQ0SSx9cumb/kLw0Arb+oN1F/t2h7QRFTqC1niv
	bz/EBPGzCgMTv15odE+Pf0XjMrKLTt0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766483368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=9XcGUXRJfIfL1XAVtV3NRNT5+h87H4XICbPqegTMltcw7pEihIfgZ6+FJ5UhNwziQDKMyD
	VufRdrKQjrElpWAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="T/EBsI9Q";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="L/AJWZIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1766483366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=T/EBsI9QNwkwJJt2wLORx/EpixnpZrYpjLnQVBu9m1qlsGXWVQDL0oIctaek9ittAzGoun
	0hgrnaUki+ySziIulPlGTCNc92bAiIf59Cums5g4rnGPUrKvBQrHFHI3dwgVxLXQP+EBfE
	JVFv92pjEkMg0WEXYW+a6s1fjYPy4Lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1766483366;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1X29ty62scZ8p6FeRrl9HbbCQYJ5o5mL8wxvJx6F2EY=;
	b=L/AJWZIZSTusyqvXgfhSIF30Xxcp0Bc8RY6djgPFDvlh+iFENOBlwjdIsSTj1TuBYK1icS
	JdL2R/nl6BxlQqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 411F03EA63;
	Tue, 23 Dec 2025 09:49:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9Fb3C6ZlSmlqPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 23 Dec 2025 09:49:26 +0000
Date: Tue, 23 Dec 2025 10:49:25 +0100
Message-ID: <87pl85il3u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Re: Enable Mute LED for Lenovo platform
In-Reply-To: <8a99edffee044e13b6e348d1b69c2b57@realtek.com>
References: <8a99edffee044e13b6e348d1b69c2b57@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: D6F8E336A0
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Mon, 22 Dec 2025 10:33:44 +0100,
Kailang wrote:
> 
> Hi Takashi,
> 
> Attach patch was for enable mute led functions of the Lenovo platform.
> Many Thanks.

Applied now to for-next branch.


thanks,

Takashi
