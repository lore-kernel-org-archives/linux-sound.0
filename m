Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE968373BF3;
	Mon, 24 Aug 2026 06:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787554061; cv=none; b=kH/BdsV8OY2urw4pL/EUreRNm/KqrrL9u0K2C8tOGCkKwQJ/qapK1pdD1cIl2TvI//rbb1o/5J95MwutdA8C75Eve6HfIFZpJOjH299GsS2t/GdlRYomTaRxJlOIoJk6kYvFosXMnBiTBvRrGdsT04c9x8KfXdgMLfndVcIUwVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787554061; c=relaxed/simple;
	bh=9QF/h8dyZIVS5VgksSl/TCvuHfXr+Fs1mDlOauZ4UgE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SP0SfF3UnO5Xn4okKguJDb0MIUym22jXtX31xutUDTJx1Rgllf+/luh8j6COQoYHpRCgq96aGVq2A0K+EX5AeXXjDUeKF5mYapm89FRvydcAwfkfSefTOynrdyxHPKb4yjoTayQ+RAUKFY31EmTYvgHDT3jgcTVUnqA+5kHvXWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=u88ViqNH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zCciXBk9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RRPZpo1x; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=k5uWW117; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u88ViqNH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zCciXBk9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RRPZpo1x";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k5uWW117"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83BB486598;
	Mon, 24 Aug 2026 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787554053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OiOCsLFOF7GgLZGytbQC5MS95DihrFTVqHC+OPzGqkM=;
	b=u88ViqNHmindg2ia3vttnWJZv8vjyVSZjnkmjnS+AuyGqoZxlIJIC2ChONGUGN/eXJO8NI
	101HvsWzhy6o02koc+GTHAkEfI/0HjxAAWqRDKOuXKYQHlizUKMJL440wXDh8Y6o8M8GN+
	SjMF9PVqAw9cxr2I+O4Yfy0YKHQnKdU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787554053;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OiOCsLFOF7GgLZGytbQC5MS95DihrFTVqHC+OPzGqkM=;
	b=zCciXBk96xiUNZRXYhKyrtJB5tvrTbKc44KPo8ETw4VGV0ZXRnyRhC+3Ooc/Xu/I7IBwP1
	bip3M5w3H0ekJRCg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RRPZpo1x;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=k5uWW117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787554049; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OiOCsLFOF7GgLZGytbQC5MS95DihrFTVqHC+OPzGqkM=;
	b=RRPZpo1xJJSGi+wMeGaqxmZZQLKIc6iIMKTiWUXmpWNLWVIO+uB1apm2JW2sMw51yLksSb
	kSfcEbYtdZsh73FZqwK3wHBr4neakmdlUDSnJbXHPyiemDE8rmztV7W3T3R+DU8yovJWEh
	/cRrn0Q1qXOA9QNdF9YBp/+MKJ/eM3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787554049;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OiOCsLFOF7GgLZGytbQC5MS95DihrFTVqHC+OPzGqkM=;
	b=k5uWW1173IOCUeMPwOLfhErxucwbdQkygsSznskjsNfqU3t78PRlqSk4brtH7i3Ya39/xU
	G8PmOMxYWx8q8KDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4905D13331;
	Mon, 24 Aug 2026 06:47:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id viC0DwHpi2onRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 24 Aug 2026 06:47:29 +0000
Date: Mon, 24 Aug 2026 08:47:28 +0200
Message-ID: <877blgvwu7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marouane El Moufid <eun0us@espilon.net>
Cc: tiwai@suse.com,
	clemens@ladisch.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	eun0us@proton.me
Subject: Re: [PATCH] ALSA: usb-audio: fix OOB write in snd_usbmidi_novation_output()
In-Reply-To: <178749334830.543645.13722252148340572274@espilon.net>
References: <178749334830.543645.13722252148340572274@espilon.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 83BB486598
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Sun, 23 Aug 2026 15:55:48 +0200,
Marouane El Moufid wrote:
> 
> snd_usbmidi_novation_output() lays out a two-byte header at
> transfer_buffer[0..1] and passes &transfer_buffer[2] together with a
> length of ep->max_transfer - 2 to snd_rawmidi_transmit():
> 
> 	count = snd_rawmidi_transmit(ep->ports[0].substream,
> 				     &transfer_buffer[2],
> 				     ep->max_transfer - 2);
> 
> ep->max_transfer comes from the output endpoint's wMaxPacketSize via
> usb_maxpacket(). A malformed or malicious device can advertise a bulk
> OUT endpoint with a wMaxPacketSize of 1 - the USB core only clamps this
> value downwards - so ep->max_transfer becomes 1 and the count argument
> becomes -1.
> 
> snd_rawmidi_transmit() passes the negative count on to
> __snd_rawmidi_transmit_peek(), where "if (count1 > count) count1 = count"
> leaves count1 negative; get_aligned_size() keeps it negative for a
> byte-stream substream, so the following memcpy(buffer, ..., count1) runs
> with a (size_t)-1 length and writes far past the transfer buffer, which
> was allocated with usb_alloc_coherent(ep->max_transfer).
> 
> This is the same class of bug that was fixed for snd_usbmidi_akai_output()
> in commit 0970274613fb ("ALSA: usb-audio: fix OOB write in
> snd_usbmidi_akai_output()"); the novation output routine was left
> unguarded. Bail out when the endpoint cannot hold the two-byte header
> plus at least one payload byte.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marouane El Moufid <eun0us@espilon.net>

Applied now.  Thanks.


Takashi
