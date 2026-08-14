Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D31347532;
	Fri, 14 Aug 2026 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697069; cv=none; b=FDjEwp5zUP+48EeU7LfYMY2MY7sVUQC44Dv+/311NpZpkCRtL9KP/839PRDEHuRUO5EoIA9FGkOowoktIjNdx4CUu1BKhanML9cDUDijdUlfeaUCr9PMHPgKYe7dtggJduNre4AmUoYpMHiYWnE+MP4kzp/iakkB0loYUZYc7nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697069; c=relaxed/simple;
	bh=32LG7uPZtMVRtIC9DyRl7J+JMGYsHHCJbIBXSB2Vt9I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKSOGcRxXzT3TTFNP3F2jp72apZI8DhNJV9IWU4ZdtvqWRM/Y4JpS/EPkRStXRrV9oZDibSbOLkmT900veL8IF/d/qz/3zxhZK7V5EZK+U9VxL+WjKV4avFVllFaUS9M080jX3zCRWQwyznjZaqaTAq2d9jRsz5XarPEKZl9aOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UuNLzlW2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=P2/4QBT3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=em3S+6S9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ptu8qLGJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UuNLzlW2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="P2/4QBT3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="em3S+6S9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ptu8qLGJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0EC9D3EB6;
	Fri, 14 Aug 2026 08:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786697056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JVbjMeU18V8a8U7eTwgNns2oEazhkzMft6prjTss31Q=;
	b=UuNLzlW2osweh4YeRSsQcyNToXlZDrkIafOnXRQUMPxcHk4eICV80QHhrHCI+vYbhvYns6
	Psl8lyEqY+mtLYGns4zcr7OR5ZGO9Jrrp33rrwM73xyL1ryEX4JJNVWSs/gzyOGImzQ9/T
	BssEHYPuCY3jP251CEugrc+W5i7xy/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786697056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JVbjMeU18V8a8U7eTwgNns2oEazhkzMft6prjTss31Q=;
	b=P2/4QBT3DpjpiZuVd4v7PkD8G4kyjJAKehwYSVBW853v66z+HWVbtcfh/MasKy5xUaJdki
	CpV0OkEISYv1WSDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=em3S+6S9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ptu8qLGJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786697052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JVbjMeU18V8a8U7eTwgNns2oEazhkzMft6prjTss31Q=;
	b=em3S+6S9AX3/x8VZ78EkxdjUHIWu/CRGZjmy7HU8VXS+BQUme4g54HfTtsU1gjKolr/5WF
	dNJRkhlqORsWVteMtCzfpfC0hnvFv58scGr+rTjN7npuKDl9WRRCLxtU9Vme8ifzfKdGjN
	G3sBDDm1q8jvKIHyjFbqWYU9yvaAms0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786697052;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JVbjMeU18V8a8U7eTwgNns2oEazhkzMft6prjTss31Q=;
	b=Ptu8qLGJYA4AX9KwJtxAEEgMPbfxrJ9ukQIGrBRvu+baseMDW+k2YMrCwRsMM7yMRG2/SX
	Tg4N4JG+9w0AZFDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DABD7782B7;
	Fri, 14 Aug 2026 08:44:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zTwPM1vVfmoUPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Aug 2026 08:44:11 +0000
Date: Fri, 14 Aug 2026 10:44:11 +0200
Message-ID: <87mrupdrc4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Drop duplicate quirk for Lenovo 0x17aa:0x38df
In-Reply-To: <20260814084101.504471-1-zhangheng@kylinos.cn>
References: <20260814084101.504471-1-zhangheng@kylinos.cn>
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
X-Rspamd-Queue-Id: 0EC9D3EB6
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 14 Aug 2026 10:41:01 +0200,
Zhang Heng wrote:
> 
> The PCI SSID 17aa:38df is listed twice in alc269_fixup_tbl[], both mapping
> to the same fixup ALC287_FIXUP_TAS2781_I2C:
> 
>   SND_PCI_QUIRK(0x17aa, 0x38df, "Yoga Y990 Intel YC Dual", ALC287_FIXUP_TAS2781_I2C),
>   ...
>   SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
> 
> The HDA quirk lookup (hda_quirk_lookup_id()) returns the first matching
> entry, so the second occurrence never takes effect; it is dead code.
> 
> Drop the second entry.  The retained "Yoga Y990 Intel YC Dual" label also
> follows the naming of the neighbouring 0x38e0 entry ("Yoga Y990 Intel VECO
> Dual").
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied to for-next branch.  Thanks.


Takashi
