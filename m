Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116833B19A9
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786028350; cv=none; b=UbbUS5DoFEpPzJAc4I0IL4XKlEFci1LnVY8gzg2UtHdAbUoooxuGhknqcKTLYIrhIWGprx9wl+REbyI8L++AVgTE/NcwD//H0OYqKCfjiRL6nfsm0k+mxoYP719RqpJt8gtRxMLcTuS/L/8c0zxtH/5Xa1VMHPvLMZWjKak7QdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786028350; c=relaxed/simple;
	bh=lodbG47Jdyfwe3HviPus+WatmxgS+W1XeQIdm0mkiZs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAMpii072vDxljcpZvI3jjp/iorw3P2TrTzDchxZeMz9eANzLCwoNdMh2C2n8YjzLfngcKvCSrZhikT/4aTSq3fmP+kq8AS2W61ZpTwFKHpJoLLmRs1qFBfUXo34D7JJkBlRlPW1trfN5QGEH1V40cgWlgvjK5J34swZ3uXi/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xmp4VCCl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CtAQFgUv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tyOM8ggU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sXAvb8A9; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xmp4VCCl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CtAQFgUv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tyOM8ggU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sXAvb8A9"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D25C5800F2;
	Thu,  6 Aug 2026 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786028343; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WsUfzM89j8BDKave/yzMiXadUAqkb5eeZ2czNZOJVok=;
	b=xmp4VCCl7FXTZmeT1VimWV/jLIxH5xlCFvN78yZmLXNWyo7RRFGsNgnyRQQ55PkiIwgeIL
	I/Qx2ywYQlDc+LGbHocu1b1BPApu2o4wIw4ohJLZEQHDzy3OzuHPVO3Mp1FkobeoIObbke
	Xb20w0vz47r4+kzQsSvwKSp/p70M1Ro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786028343;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WsUfzM89j8BDKave/yzMiXadUAqkb5eeZ2czNZOJVok=;
	b=CtAQFgUvhcSJigNRARCuWVZsCvZyu8+ptTBHta6VC+uSrLbpYv96HX4JoafCXj8iEdw2a9
	RXe32dhN8S+Pu+CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tyOM8ggU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sXAvb8A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786028338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WsUfzM89j8BDKave/yzMiXadUAqkb5eeZ2czNZOJVok=;
	b=tyOM8ggU3y21Bfsy4sMLLhb6OhUms6cU7WciCgIRnkJHSz72o1p86f5YO6cL3m4rV+Kf0M
	St8TwL+06zcY21JhOYdt68xMP3JpvlhZ203Grkgui4k6DgbY4stcuBCWE14KHoewHMUW8l
	RLkUoqaLqWXtYod48cyMhujrdUEGqCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786028338;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WsUfzM89j8BDKave/yzMiXadUAqkb5eeZ2czNZOJVok=;
	b=sXAvb8A9TXTjV/k86Q0g56gqZehthKiE2GDZ+KE0NRpxOJiwUzt969NAZ3iye2s9amkHdf
	oeEV25zmE5jCqOAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ACE24779B6;
	Thu,  6 Aug 2026 14:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id snH5KDKhdGqodQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 14:58:58 +0000
Date: Thu, 06 Aug 2026 16:58:58 +0200
Message-ID: <87ldajcn2l.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ankirin <ankirin4@gmail.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable speaker on Xiaomi Notebook Pro 15 (1d72:1709)
In-Reply-To: <20260806141815.40527-1-ankirin4@gmail.com>
References: <20260806141815.40527-1-ankirin4@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D25C5800F2
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

On Thu, 06 Aug 2026 16:18:15 +0200,
ankirin wrote:
> 
> The Xiaomi Notebook Pro 15 (subsystem 1d72:1709, Realtek ALC256)
> silences its internal speaker on Linux: the codec sets coefficient
> register 0x10 to 0x0220 (bit 9 set) on boot and after S3 resume.
> 
> This is the same mechanism already supported for the Xiaomi Mi
> Laptop Pro 15 (1d72:1905) via ALC256_FIXUP_XIAOMI_PRO15_RESUME,
> which clears the stuck coef bit on every codec init. Add the
> missing 1d72:1709 SSID entry to the quirk table.
> 
> Verified on this board: with bit 9 cleared (coef 0x10 = 0x0020),
> the internal speaker outputs normally, including across
> suspend/resume.
> 
> Signed-off-by: ankirin <ankirin4@gmail.com>

The Signed-off-by is a legal requirement, hence it needs to be with a
real name (or a known identity).  Please resubmit with the correction.


thanks,

Takashi
