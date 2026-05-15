Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDE330652
	for <linux-sound@vger.kernel.org>; Fri, 15 May 2026 11:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778844551; cv=none; b=TSyk8G6m+joAKdmd4k53t1wMW7eQuNdbkqGA61F7cGayL8Vgs/4rhcvhDh1WDit63YqO9UpfR3Lb3bpB/DfUnr147ouyNv3r8STcbStu3xDHr2opvmFcNlmpEOyTm+Zdq69SSeC3bUnBz6dXnfSfE8BZaTOplPl4DlAYuNTM0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778844551; c=relaxed/simple;
	bh=Vt6C2R7J74ep4IAJHGoCDlCWWVwjVjM9zuyRLeXJj5U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEMohx+1l1bWC/ca7RemXm4iqERjuGn2A7HzgLCx7RM0X9maUul0l6NH7+8SJNukJcupPDFrNlSCYyvhRsBQMSCEFfs+qLxZIUblz6VDM+hli1nwb4FRix2HPWp6WLEM6vqag9os/ixDEQpvVDC8pe7OSGjnobtVnXEJCdV2ghM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dGgm/Aoz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5ckU1Rxi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vf3lb3ot; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=be935DKn; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dGgm/Aoz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5ckU1Rxi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vf3lb3ot";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="be935DKn"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77F935EBC5;
	Fri, 15 May 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778844548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2rQ6+erL4uMqBHIhFehobWpvzhCKlxsKtzqQ1sTQy0=;
	b=dGgm/AozMKTXoftuS7Bklz4ETEXjdbvJuc1XUQ+Hef/R2NobrAlM9ej9v6Xq0qB4W057SA
	YlxhKt4kjPG6Og0TVX/NsO7eIfLDWBnF/pQ48fGOT9rqVpiBFVaA556DMJe8KdYjFId82V
	UraE0WqsXEf9xVYo9wO84M9JcQJ+CSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778844548;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2rQ6+erL4uMqBHIhFehobWpvzhCKlxsKtzqQ1sTQy0=;
	b=5ckU1RxiX5hfcNKGWWB9Te9olijHt9eIGRNvPVbP9S7icxuabUhxf4n4fA4WKLv03ZfTfE
	6EhjZE2zRxP9j+AQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vf3lb3ot;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=be935DKn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778844546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2rQ6+erL4uMqBHIhFehobWpvzhCKlxsKtzqQ1sTQy0=;
	b=vf3lb3otMud7f9rdx6B/VykHZyNEcHpsEdMo/Q4/NOkshotoqLl7zWZ6JPEELKXG/90vip
	OGRfpXlNyqctDFpjAQuHypTVF7RF7e6ik6d1oIDvxbLTiV584bjuNiBiOXQxwWhQdpXpRH
	Qj6x6QZ1UqSeZqolfc4/z7ZkjQhhzp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778844546;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2rQ6+erL4uMqBHIhFehobWpvzhCKlxsKtzqQ1sTQy0=;
	b=be935DKn0lFgoqCfwl2GDU6BY5y/IYyi8205AtwY+/VDG+VoTWgca6BT/8qRVoKHXr7raV
	Wm9psL4mjuUC2RBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47D54593A9;
	Fri, 15 May 2026 11:29:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DkQyEIIDB2ptbQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 11:29:06 +0000
Date: Fri, 15 May 2026 13:29:05 +0200
Message-ID: <87y0hksygu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>,
	Zhang Heng <zhangheng@kylinos.cn>,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Fwd: [PATCH] ALSA: hda/generic: Add mic autoswitch support for dyn_adc_switch mode
In-Reply-To: <7698e8ba-974b-4bdd-a2ce-21a32e50c1de@perex.cz>
References: <5b215802-4c94-4f94-9cee-f8e497b31337@kylinos.cn>
	<a7daf8a3-559b-4532-a2ee-a211a7e0e0b0@kylinos.cn>
	<87ecjnp8dx.wl-tiwai@suse.de>
	<7493b4e0-2b8c-435f-8421-ed397593356a@kylinos.cn>
	<be6ddfdc-7cd2-460f-be75-c30f90a1bceb@kylinos.cn>
	<87ecjdt487.wl-tiwai@suse.de>
	<7698e8ba-974b-4bdd-a2ce-21a32e50c1de@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 77F935EBC5
X-Spam-Level: 

On Fri, 15 May 2026 13:19:57 +0200,
Jaroslav Kysela wrote:
> 
> On 5/15/26 11:24, Takashi Iwai wrote:
> > On Fri, 08 May 2026 04:50:22 +0200,
> > Zhang Heng wrote:
> >> 
> >> I tested this change:
> >> 
> >> In create_capture_mixers in generic.c:
> >> 
> >> - name = nums > 1 ? "Input Source" : "Capture Source";
> >> + name = "Input Source";
> >> 
> >> And it also works normally. It seems that user-space does not handle
> >> "Capture Source" very well. So should we just remove "Capture Source"?
> > 
> > If this really works, it is rather a question to user-space behavior,
> > specifically alsa-lib's interpretation.
> 
> It's more likely the app interpretation (PA/PW) rather than
> alsa-lib. The "Input Source" means that there are more capture PCM
> devices and those controls distinguish the input sources for them.

I vaguely remember that we have some special handling of "Capture
Source" in the mixer abstraction?

> It would be nice to see the 'amixer controls' output to see more
> details what the driver exposes to the user space.

Yes, we need to take a deeper look at the behavior in user-space.


thanks,

Takashi
