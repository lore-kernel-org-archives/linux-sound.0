Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529337;
	b=g1TfGN0gawkBtxiq2n2X0UxjwHSqIueO0OQJVvR25jKze4h+cmj+QsuO7WzAjh9nN4uS
	 s0t7GAFxZK67wyrmf/Pz/Oj7nnfircAoTBKXlSTTou0EJzWre8MUHydwpxDWR4Vy2V6vN
	 MijUrbGTfKZxM3b4sNKE/KkLX1bjWmXPqGTmCIhcovgxqwANpSkRwOFjShzlWcLhUH1rQ
	 lDNp84KHpOEHKflqch59X8WpCVm0QsGH2IFg2QJR2qhbY3dejx5ov4bP7QqnoZ6DkgfJu
	 y0ydwB8NqTNaPqMIr2FgGf0cG5CTTglVXIh8LuHT8zd5pMhVCc98FPgfKaJfziNjk2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529337;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=Je9ClsLfsMZ/lJZdXpnfycUztnl6nyDYisYe5CCmtOI=;
	b=jTTmsaO0OAiJeHxmf/qKjDzlFFlDSbk2f7lRQZhJtWvlnkz4PNfQoP6bCztcBZLmTbwG
	 TsuHE/NN5Z3VWMciyO6DElfgMYoB4xteVT/tXZrbsBySOj5JP761QpRlvfKFOHVYm+lZI
	 pxu+f8tjJi9EdCDPP992nf6FtPSDqwFRfPGzwPWOaDFtpgwX6Hf9pLQMvVYcFeOr+/2vS
	 jINW08jNLU3Ww3xEONB7Oufv19gZSZYsaQL0sud1MGT9RzdLznf2PDUa09LW6T8Vnv+EU
	 mT3dUXmfkHlYHpVNB/UWshLZC29LWouarbPHdXsjV9NguFsPxbm+B0yrD3kF8ECQUoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AXxj1qPL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WZBjr4Jl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=V+ZGw9ib;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GpkH5ySr;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBD5606A680
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 14:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBBD5606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AXxj1qPL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WZBjr4Jl;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=V+ZGw9ib;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=GpkH5ySr
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B7F9E1F7BA;
	Tue, 24 Nov 2026 14:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795529335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Je9ClsLfsMZ/lJZdXpnfycUztnl6nyDYisYe5CCmtOI=;
	b=AXxj1qPLqN2U2O/Xb1b3msSwagDWDgl5QR8+b4aoHXGQ049pb6vAAvpv022dYtTPZGe0xm
	fEz1/BjPrT683XLZnaK1NmEvvpPYKqQBvpYrX/10FHagFS9H+8ei1FP1sA7GQ2oVzcrqp2
	rkmXj63Va3bO8sNiYylWgIEoROhbqu8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795529335;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Je9ClsLfsMZ/lJZdXpnfycUztnl6nyDYisYe5CCmtOI=;
	b=WZBjr4JlZXn5sXVUAecbOzCxJ1UjMjmMBYsRNeQdfZy6IxnKrNk0Cwk5dcoW+fBnWIwS25
	99anTt/3GiAW7TDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=V+ZGw9ib;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GpkH5ySr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795529333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Je9ClsLfsMZ/lJZdXpnfycUztnl6nyDYisYe5CCmtOI=;
	b=V+ZGw9ibAM+oJ8VaDxev78av3CMAApz0y1BktohK3o6CepW4xQ+qxskuhdcBob49jVNKY5
	klkq3OhTJa3MyM5WKjnmX0x/R3Gi1wpP/1Be252rhyndDyqY5j4KZ4nEBqtK9sII/6MmBF
	CG7xuDMgldWXEOH2kbOaX8AA3si0MRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795529333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Je9ClsLfsMZ/lJZdXpnfycUztnl6nyDYisYe5CCmtOI=;
	b=GpkH5ySr3LqSSL50P87gpUbcNFQ6PTLGJjEPzrY4neQg4CaXP4OmEAmONl4xrTS8Ui4SWt
	7446ij5uev6+MoAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 834ED1339F;
	Tue, 24 Nov 2026 14:08:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cNJPF3WaBWt0HAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 14:08:53 +0000
Date: Tue, 24 Nov 2026 15:08:49 +0100
Message-ID: <87jym29v9q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Lord <mlord@pobox.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cen Zhang <zzzccc427@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: ALSA: pcm: Unlink substreams before releasing them
In-Reply-To: <d406700a-4a14-4f47-95e0-72704544dce5@pobox.com>
References: <c8132c27-b7d0-4867-a17d-89e4cf869c0e@pobox.com>
	<b8d3168a-b829-46d0-84fb-f964d116bae5@pobox.com>
	<c8bd572b-d5fb-4db8-a3ce-f9fc3e8153b0@pobox.com>
	<87ik1ndgkp.wl-tiwai@suse.de>
	<0D01CA13-AAF6-43B0-88E3-FA8B60DD77A3@pobox.com>
	<874id7d336.wl-tiwai@suse.de>
	<64ed6659-2a04-42d3-9f79-7abdf6b6dd13@pobox.com>
	<874id6bdsx.wl-tiwai@suse.de>
	<E1C6473D-4008-405F-88B9-A5BE65D3B1C2@pobox.com>
	<87mrqy9yfk.wl-tiwai@suse.de>
	<d406700a-4a14-4f47-95e0-72704544dce5@pobox.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B7F9E1F7BA
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
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 14:47:07 +0100,
Mark Lord wrote:
> 
> On 2026-11-24 08:00, Takashi Iwai wrote:
> > On Tue, 24 Nov 2026 13:56:23 +0100,
> > Mark Lord wrote:
> >> 
> >> You will have to be more specific about exactly what you want.  What commands to run, which files to view/return, etc.
> > 
> > I also have no time to guess your system, either.
> That's why I provided that information up front in the
> first messages I sent you.

Are those the kernel messages all from the failing case (where you see
no sound devices) and the working case?  It wasn't clear.
The kernel showed nothing obvious.

If that's all messages, check whether the kernel devices are still
present in /dev/snd/*.  If they are, those should be still accessible.
Then check the direct access via ALSA API, e.g. "amixer -Dhw:0",
"amixer -Dhw:1", etc.  And, instead of suspend/resume, try just to
restart pipewire (wireplumber).

Those are about user-space stuff, and rather questions to distros.
For further investigations, you should ask distro people.


Takashi
