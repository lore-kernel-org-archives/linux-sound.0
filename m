Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524424;
	b=2P4hOXT4d2QN2ozQTJz7OFC/UquSUsWWWErtWwu8S2Il24eUAp0L7GctD++TZXy9PuCD
	 IdVwV55GPM6okvGWyZft8wx9Ocyxz5pUCc9Kjnt6GmA+IeYve96nZ0rCxNs2zM4mI7eZV
	 VYzOnohriHx3Pc47+hZVcXYc5Lauzc6SGIoWjRxOQtP7y/kUKHDt5CmUq6sTM2a8w6Qsp
	 1urlB7midjaD/3jN2x990NwqQqJSnw7mUNcBS8jz8oxDOhh6W9wvkCksCqNnd8WG7eE37
	 pHqyhT2Sc/IltOX8o3hOqB0nNiX8FuefDXf3QqAM1BY+h+usthNZykgUo48TvZhYZKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524424;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=CacvBfem82ERgVnq295k78As/wrD+9T4N/mprrJK3Ss=;
	b=wz8KrSCELH0ALxqOzQMTgJYXBrMiaNx2BCQ09AXCq/h4Zoo9M1Sc8BVxZeTyP2apzJ3F
	 a3HardCLmG2M65CeatdkKNhRkU/PYiGqF+fnEmeifeGvBo74oFS14bto7ZSJhZTVMZ/KN
	 L3zI6WqSdNUIpjbHKai3Yqysy58l2Sa+ebUvNaxRbjNqpziHMu3+nGb1ad0XZcASP5P5L
	 0jqBQ895TjSOgtOnHacJnLHrR/Ati0mlSIOQ7IWgHNH0X000zcyro/Yj8xwzOriii4K+s
	 DH9Z6OFML4tUlM17XLYRMo+FHuuJpngVaMJiagHGdgSaECmYtnHAV1PL49AXdGlkQaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sHZtD540;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rF0zIbKh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0RU6M4gA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PirZLTcd;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365A606A31E;
	Tue, 24 Nov 2026 12:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0365A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sHZtD540;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=rF0zIbKh;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=0RU6M4gA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PirZLTcd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D86F621F0C;
	Tue, 24 Nov 2026 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CacvBfem82ERgVnq295k78As/wrD+9T4N/mprrJK3Ss=;
	b=sHZtD540GUYvMCHB9pLFeCXWmRj/JctKP/Hs9U0+HpuCXU3gdB8d7+crvqNDCnBd9so+FY
	tIXWl4ZgPqimw+3j0GsjKtCLILiNx7g+vrJOyz51IT3NKMqSAobBZZ909RSENR9Hi56/IH
	g8RsBxMQqpPtS6A1yGx+1lc0y75LcVk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CacvBfem82ERgVnq295k78As/wrD+9T4N/mprrJK3Ss=;
	b=rF0zIbKhFyg3OKATFosw1LBx0juQBBWJ19JSQ05ILtIlnC3SJXc8Rp2htx9gdLNEQmcLm3
	FbOA0C6jjnguFwAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0RU6M4gA;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PirZLTcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795524420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CacvBfem82ERgVnq295k78As/wrD+9T4N/mprrJK3Ss=;
	b=0RU6M4gAiatBLIgnFvdmJxM6g/JYE7WA4d+JqlwQWxf9eXwDPLaKkMZDDAAinSPnukMNbL
	cujHS1CoRkLakrgb7e3eS4jnduZ+0a2gU/h7aNuRIrOZx1ZRabXWAq8PJJB8pUD+taSc+k
	BONWyFBpBpFuz1arWj+ye/hkOjK9v/M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795524420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CacvBfem82ERgVnq295k78As/wrD+9T4N/mprrJK3Ss=;
	b=PirZLTcd6wKP6BbKUzG6WNHzs01RgFF23hXuBgo0VUr5QYg6vB+VPpUyHV29zKaAFWRiYN
	kg8w6k4eraZSITAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3EA81339F;
	Tue, 24 Nov 2026 12:47:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id v1rcHkSHBWuuFwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 24 Nov 2026 12:47:00 +0000
Date: Tue, 24 Nov 2026 13:46:56 +0100
Message-ID: <87wlq29z27.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: shyckless@gmail.com
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: mixart: Don't touch the mailbox when the BAR mapping failed
In-Reply-To: <20261124-mixart-free-v1-1-13765d8d445b@gmail.com>
References: <20261124-mixart-free-v1-1-13765d8d445b@gmail.com>
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
X-Rspamd-Queue-Id: D86F621F0C
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hust.edu.cn:email,ntu.edu.sg:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim]
X-Spam-Score: -12.51

On Tue, 24 Nov 2026 05:47:07 +0100,
Suyuan Wang via B4 Relay wrote:
> 
> From: Suyuan Wang <stevewong@hust.edu.cn>
> 
> snd_mixart_probe() calls snd_mixart_free() when pci_ioremap_bar() fails
> for either BAR. snd_mixart_free() then unconditionally calls
> 
> 	snd_mixart_exit_mailbox(mgr);
> 
> which masks the outbound mailbox interrupts by writing to
> MIXART_REG(mgr, MIXART_PCI_OMIMR_OFFSET), i.e. through mgr->mem[1].virt.
> mem[1].virt is still NULL if either BAR mapping fails, so the error
> path oopses on a write near address 0 instead of returning -EBUSY.
> 
> Only call snd_mixart_exit_mailbox() when the register BAR is mapped. The
> rest of snd_mixart_free() already copes with a partly set up manager:
> iounmap() accepts NULL, and the IRQ and DMA buffers are checked before
> release.
> 
> Found with a static analysis tool and checked by hand.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>

Applied to for-next branch.  Thanks.


Takashi
