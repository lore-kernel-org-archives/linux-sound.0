Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0231A9FBD
	for <linux-sound@vger.kernel.org>; Sat, 24 Jan 2026 10:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769249915; cv=none; b=Ac6az1t995d3mYlu9BCywcOEDrcW1RFAdUZVlUoBfKGfKnnxW6QW/AfQ0cfgX9rijH3UcjVCoVPculj2W4zZz/b9HRSBDh393pMhUvKTyjoqinUs6YV+7BLnEp3FoCu7OgoRUZ2+9oR296IpWgCDoBHxabmVBjzU5AwUuqn2ZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769249915; c=relaxed/simple;
	bh=0JdYwcqD/0z9jsEadE/LjBjvhM14iXCrc2kjEmNMWr8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YylZh4TQLxDlTJfJ5yaFfr9EwQoubZ61Mzv+e+GMHttqOrf++/HfQ4BRaXAx30cJI50av+2R9SQ6RTrqfPCUd72X2W8KX5cWfjm3VgtYZPHbQ7ir//MbBNlgGDcagqxmD9ovwYcbfYJzI7TZbHaMZhTD3ZvLTLyQWUW/Uy81Edc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ijom3uOh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sByktOeG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rqUwn2Ye; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FQYzxHR9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ijom3uOh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sByktOeG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rqUwn2Ye";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FQYzxHR9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6CE03368E;
	Sat, 24 Jan 2026 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769249906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yg/KnMuP8mJay2YLt6+GR7gMpc4r2C2EubieSOPWaac=;
	b=ijom3uOhnWgNFgDSfw2P94TFKMTpJRtwHmAVTGkhmMCzkk7+63rIOtCt66vuqMduTO0X7q
	Hx7ryPYUtLh1XLtX4xQI3M4ig8K/r6Xw+9dS1Ud4Uby3YD/bdLFWT0V3b/+xHmVx/pkhUB
	YQL9A6KrYTzvGd0VBcow8kdii5+h6s8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769249906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yg/KnMuP8mJay2YLt6+GR7gMpc4r2C2EubieSOPWaac=;
	b=sByktOeG5YK8Z5eFs+GhUg1LVdOqQNrmRCx+mmpaqYY/1ziVx0iWgmJj9KdnIV8nDOSiKs
	NQRuc8Dcb6fxzVCQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rqUwn2Ye;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FQYzxHR9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769249904; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yg/KnMuP8mJay2YLt6+GR7gMpc4r2C2EubieSOPWaac=;
	b=rqUwn2YeHmzcQChvcjB7z+ORoYWPFB0QFS2sHYdlgdSylbKxKNKl50zxkdM8zeRIBjRwec
	/1my9DhmQoBtePYIFaO34oDWeti6krrrLDBtkoYeZ2cMloHMcQTq8jSWrQcM2l2Tpc8uUd
	T+rIX7jqdqePiuZdaSyltfXPzoEN9AI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769249904;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yg/KnMuP8mJay2YLt6+GR7gMpc4r2C2EubieSOPWaac=;
	b=FQYzxHR9QKvMog48y8hUD20+OliksWRmYFe/My7YXI4v4daBp9p9D5Z0me7uanXh8477Zt
	zvXWHqVwiw1xbcBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8812D137DE;
	Sat, 24 Jan 2026 10:18:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fVEEH3CcdGkOBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Jan 2026 10:18:24 +0000
Date: Sat, 24 Jan 2026 11:18:24 +0100
Message-ID: <87jyx7co0f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/realtek: Really fix headset mic for TongFang X6AR55xU.
In-Reply-To: <20260123221233.28273-1-wse@tuxedocomputers.com>
References: <20260123221233.28273-1-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,tuxedocomputers.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: C6CE03368E
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 

On Fri, 23 Jan 2026 23:12:24 +0100,
Werner Sembach wrote:
> 
> Add a PCI quirk to enable microphone detection on the headphone jack of
> TongFang X6AR55xU devices.
> 
> The former quirk entry did not acomplish this and is removed.
> 
> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Applied now (with manually added Fixes tag).  Thanks.


Takashi
