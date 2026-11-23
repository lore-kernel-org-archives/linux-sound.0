Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427291;
	b=uf53Ns4Fxt7NCCeHzXfck0syluiLYnpvtVzAs4SRvQcYyb2LjJc5OoSNomg5s31ERzm1
	 GbrcMSD5L3vMgX0uDdN2HeiNgnv9FWt5lmPoYpm7t15uVIBwxQ3KuNbNXTlQPYHhBJdRm
	 E5+06QV7olMyGaJTLxwLbJH4Er0CCSK1BQ96YkAFqk9UmE1DzoaxKxXT/vsfo1kdi46/k
	 SzWQ+h21RjEqmRpeblxhjkrH30rQZWRaguRH9cxO0TY9jApjE4wThzqSp30xTwROSdOqq
	 ZVxf8rP7uQf1NFYiH4F2e9veqtk/U2BkPiwEW6+eAJWMgxXI6CGUePk7foeDJ8tJTBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427291;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=ua4Q1kdi2dAA8tcwfoAr/chxgYmA+sN/dl2JGBy9jM8=;
	b=Oaw2N5eS9EHZnUPrBQ8r8KFFDFmwARA5IttawViRdT1HamajpoDwpAL7a7da98AB9djn
	 d7+reKLgSA0u6xPsHek4dnxBAshO3S/7VXMvxIo4EWib57Fa+9avxCKNlZg93W+nkmQw5
	 DZhXiTbPESxuBlDEM1Z92PzweGvjQcpj/jVss6PF6p+ICQ1OFGhBUlQFLvOU5N/GfwBiv
	 v7Uo44IM94ES1a8ZnWxCnbof7rgUeG/SKvkWgW9NarCv6LgxbjN0TknRVcrNYqlDdIrNE
	 C1OeptWT67JhfFItPfuCTasOni9vpWGW8E610leOuTp5qe9yZVQp4SSMUygeLaEq28Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="nGbWxqL/";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iKPPjQyy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UMKSo2SL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5h72LF6F;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1275606A31A
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1275606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nGbWxqL/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iKPPjQyy;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UMKSo2SL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=5h72LF6F
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 859331F770;
	Mon, 23 Nov 2026 09:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795427288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ua4Q1kdi2dAA8tcwfoAr/chxgYmA+sN/dl2JGBy9jM8=;
	b=nGbWxqL/xmcJt3TRvLYNq+4x533IC3y0hZccCGF6pju63tHyqdCQaOTRlId9v7jdJe2XTG
	Pd0oVQKFMqD5bZ97NiLaFFC54B8FePFIDGD0sgu0xrZ+RHVrvtLPoL33aHNEghMHKPR0ar
	V26OUQwLv5BAHuwL6iDkP2KuNTAvd4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795427288;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ua4Q1kdi2dAA8tcwfoAr/chxgYmA+sN/dl2JGBy9jM8=;
	b=iKPPjQyy2I3KFLvotfr1fa35x0PnxoErtG03cUoMR4bAmxQJLsBTGzBljkUSMbDs5ZQL9m
	2nBRvIj2Jg8p8rDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UMKSo2SL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5h72LF6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795427287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ua4Q1kdi2dAA8tcwfoAr/chxgYmA+sN/dl2JGBy9jM8=;
	b=UMKSo2SLwMVw64b6iPwc068eQsSvnmWEQVvInCm+qoeWlWWougpfqOabH3n4JxnntdyZEK
	6cLSgigNVS0z5C/pB8ltYzZO6oUvngYfTjIgtx30daHNn599ctLXg9N2A9KiZDs9mcdLfA
	4Ddm889Mf5jSoJ1ve8kKJdD5ChBFf+0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795427287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ua4Q1kdi2dAA8tcwfoAr/chxgYmA+sN/dl2JGBy9jM8=;
	b=5h72LF6FTMYeZII76F1G2UdkwkNnnJlXE+SH8OhM8d/rpY2G/CuEagTynFxfNMTzwggf6I
	Ll+XkSUlBLz4VWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BB8C1352B;
	Mon, 23 Nov 2026 09:48:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dqImONYLBGsHNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 23 Nov 2026 09:48:07 +0000
Date: Mon, 23 Nov 2026 10:48:06 +0100
Message-ID: <87ik1ndgkp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lord <mlord@pobox.com>
Cc: Cen Zhang <zzzccc427@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
	<b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
	<c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 859331F770
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Sun, 22 Nov 2026 17:56:25 +0100,
Mark Lord wrote:
> 
> On 2026-11-22 11:30, Mark Lord wrote:
> > 
> ..
> >> But.. subsequently in 7.4, at some point before v7.4-rc2,
> >> the situation changed again.  Audio then works after boot,
> >> but the devices vanish on suspend/resume.
> 
> I now tried updating /lib/firmware with the contents
> of the linux-firmware git tree, which eliminated the firmware
> warning from i915.  Now the system boots, with audio.
> It then suspends/resumes ONCE with audio.
> A second suspend/resume results in no audio devices again.
> 
> Locking issue, race condition somewhere?

Possibly.  But I failed to find how the suggested commit d1e57f8fb7a6
is involved with your problem.  It's basically about PCM link, and
unless you're using JACK or such, PCM link isn't used as default,
IIRC, hence the change shouldn't influence.

Could you double-check whether the commit really matters?


thanks,

Takashi
