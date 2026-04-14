Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F40935C19D
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 07:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776150397; cv=none; b=nMPFhhqAabwWIwBmWZ2Awe59pOoHMZwMbkFcRSHY+F4oq+ZPC9lZYgQxz4PGtX6X913yqxXKQVbzmGuiNsbds+WW/P/drN4QVwH4csF5Pt8aZvg1u49FV/u1ASjzXzRaXcVlUHPvAvGEXuBDNEoz5S0emRTx0x6e/7RkXx8UepU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776150397; c=relaxed/simple;
	bh=oPgDQtOkwfxiI17Ey2l76gGFzq/NqW+sFdVxHUpRGeI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EWbL/li7Mt4qx3lRypapn1l/vocTbAYiFR5BiP7UicocHMa8no3w+3vQiHktIDtShboQ43uRiF6tqAEtYOQBgSryFefQR9qsY9lwL3ldS6kryOKzJ5i3vbbMYH8Cq2RPWEJh1QkGwrggC2aJp9PwLSNC4qVpHM8SXLJIWWX8nw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xe2Uwdhv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y9TzgUo5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=xe2Uwdhv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=y9TzgUo5; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xe2Uwdhv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y9TzgUo5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xe2Uwdhv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="y9TzgUo5"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7E46B5BE4F;
	Tue, 14 Apr 2026 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776150388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZA8IyOK7SlJ5v4aciSYNIbHX1SFlOykm6dpYCMhiRA=;
	b=xe2UwdhvXOI0sanPbCaiJ+frOomL4U9yBDKkTqMjDUI3SRBV+t0zge8EsFrp7NpSHPBvp+
	RrmpSnmJBQGUKCQ7yjXH6bvk9xLaAkBWoAuRVi3yrutYrRfNHBFVZRaC6Gh4KBiNkxmDIu
	JcbX1ZZJq+03GcimaSFybocpFXhUVZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776150388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZA8IyOK7SlJ5v4aciSYNIbHX1SFlOykm6dpYCMhiRA=;
	b=y9TzgUo5SncIm1yKKsL2Vt39DlQxqdqsB6E9TPAqBEJed1bwePe+Q1OiQaYkYe55SsYgMS
	I1cyNIJPGaXxm7DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xe2Uwdhv;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=y9TzgUo5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776150388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZA8IyOK7SlJ5v4aciSYNIbHX1SFlOykm6dpYCMhiRA=;
	b=xe2UwdhvXOI0sanPbCaiJ+frOomL4U9yBDKkTqMjDUI3SRBV+t0zge8EsFrp7NpSHPBvp+
	RrmpSnmJBQGUKCQ7yjXH6bvk9xLaAkBWoAuRVi3yrutYrRfNHBFVZRaC6Gh4KBiNkxmDIu
	JcbX1ZZJq+03GcimaSFybocpFXhUVZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776150388;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZA8IyOK7SlJ5v4aciSYNIbHX1SFlOykm6dpYCMhiRA=;
	b=y9TzgUo5SncIm1yKKsL2Vt39DlQxqdqsB6E9TPAqBEJed1bwePe+Q1OiQaYkYe55SsYgMS
	I1cyNIJPGaXxm7DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 463E94B300;
	Tue, 14 Apr 2026 07:06:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ozbdD3Tn3WliOwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 07:06:28 +0000
Date: Tue, 14 Apr 2026 09:06:27 +0200
Message-ID: <878qaqt40c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Naim <dnaim@cachyos.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion S7 15IMH
In-Reply-To: <ed4dae33-7c4e-4ccc-82c1-fa1aee137bcd@cachyos.org>
References: <20260413154818.351597-1-dnaim@cachyos.org>
	<87ik9uua4a.wl-tiwai@suse.de>
	<ed4dae33-7c4e-4ccc-82c1-fa1aee137bcd@cachyos.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 7E46B5BE4F

On Tue, 14 Apr 2026 05:28:00 +0200,
Eric Naim wrote:
> 
> On 4/13/26 11:56 PM, Takashi Iwai wrote:
> > On Mon, 13 Apr 2026 17:48:17 +0200,
> > Eric Naim wrote:
> >>
> >> Fix speaker output on the Lenovo Legion S7 15IMH05.
> >>
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Eric Naim <dnaim@cachyos.org>
> > 
> > Thanks, applied now.
> > 
> > 
> > Takashi
> 
> Sorry Takashi, can you remove this from your tree? I seem to have gotten the
> PID wrong for this device. I'll follow up with a v2 or fixup once I've
> confirmed I got the correct PID. Let me know which of the two resolutions you
> prefer.

As the tree was published, could you rather a correction patch on the
top?  Put Fixes tag for pointing to the corrected commit.


thanks,

Takashi
