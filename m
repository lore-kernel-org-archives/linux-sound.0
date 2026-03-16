Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2013CF049
	for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 17:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773680710; cv=none; b=rcw1I21/y/qjnPsnysYrczm+6a0MZG5GAkuGiTsrhhRxbaQdEiSUFANQE5SdIWoWJw3E9svpmDOMOd1BAgdWrCfP8eP2kCVYiTbhVJbMY8l8W3cDwgQR9UWeNMwwmWQJ/42ObyJQXB46TQgoaaLCAJotyfv9TnhWPTTI7WxPDCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773680710; c=relaxed/simple;
	bh=GzL7TYK1oURajQyS0LjB8/8I45o9SdSJlFmd9VwbCok=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X13/O4PtvPmFKb289ZB6l4XMOVkIy7hHJndrxq88FRR/nhU2x3dXO8y4zrGtoVgnqWh0aBcnlo4GvZDT1wdsyP9X8YExGZ+whMnN3lTtiNDVJfb+X3YaTDOjT1XpfBwNdqmjyQKmZfXdT5FvYP6Ps75rYFu/k8hcLM4PI+ks0X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vgv7s/ni; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gjcEdIt8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Vgv7s/ni; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gjcEdIt8; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vgv7s/ni";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gjcEdIt8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Vgv7s/ni";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gjcEdIt8"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 954464D2FA;
	Mon, 16 Mar 2026 17:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773680707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQr5TAuKOLuQF5KTq3GmDGN6Xpm1CTrnFL2vIuagGds=;
	b=Vgv7s/niHK/dpC8lrB+Ew/q6GhB4HqJa+BDYazfgQ176TwwZcHfYw4a6YS5zB/PL23C3KQ
	RRVJcCMzh7TX0d7oKCuWwhw2o+fm/8AsrFKhxIP5sQ+OPcPpwti3nfUVYjSLKQyjcLiYbY
	ma9oBiFEO6+snXRe7pIDwgfmT0YicGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773680707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQr5TAuKOLuQF5KTq3GmDGN6Xpm1CTrnFL2vIuagGds=;
	b=gjcEdIt8qnQUUDZ49rQrgeV6mnuGmh+IzJRV9SiMjgNfpozoU25WT+hLQXrp76uIHOBiQv
	8Th5xnp797DQI9Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Vgv7s/ni";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gjcEdIt8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773680707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQr5TAuKOLuQF5KTq3GmDGN6Xpm1CTrnFL2vIuagGds=;
	b=Vgv7s/niHK/dpC8lrB+Ew/q6GhB4HqJa+BDYazfgQ176TwwZcHfYw4a6YS5zB/PL23C3KQ
	RRVJcCMzh7TX0d7oKCuWwhw2o+fm/8AsrFKhxIP5sQ+OPcPpwti3nfUVYjSLKQyjcLiYbY
	ma9oBiFEO6+snXRe7pIDwgfmT0YicGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773680707;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IQr5TAuKOLuQF5KTq3GmDGN6Xpm1CTrnFL2vIuagGds=;
	b=gjcEdIt8qnQUUDZ49rQrgeV6mnuGmh+IzJRV9SiMjgNfpozoU25WT+hLQXrp76uIHOBiQv
	8Th5xnp797DQI9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47E524273B;
	Mon, 16 Mar 2026 17:05:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ts5HEEM4uGkgQgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 17:05:07 +0000
Date: Mon, 16 Mar 2026 18:05:06 +0100
Message-ID: <87o6kn7lj1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	chris.chiu@canonical.com,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	danYc_LG@outlook.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: add quirk for ASUS Strix G16 G615JMR
In-Reply-To: <20260316022843.2809968-1-zhangheng@kylinos.cn>
References: <20260316022843.2809968-1-zhangheng@kylinos.cn>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,canonical.com,realtek.com,opensource.cirrus.com,outlook.com,ti.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid,kylinos.cn:email]
X-Rspamd-Queue-Id: 954464D2FA
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 16 Mar 2026 03:28:43 +0100,
Zhang Heng wrote:
> 
> The machine is equipped with ALC294 and requires the
> ALC287_FIXUP_TXNW2781_I2C_ASUS quirk for the amplifier to work properly.
> Since the machine's PCI SSID is also 1043:1204, HDA_CODEC_QUIRK is
> used to retain the previous quirk.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221173
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied now.  Thanks.


Takashi
