Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006568;
	b=4hO5obcnr99lPdA3eJAF0xXDw6Vyt4nf2QT3O0a/kNvLPxwRdp/Z/aevAwRTjNtn7y1P
	 +qhj2xMzKiiqtB05NwWRihljVg6V7Ti2/x+MGdsuHRzpbQxRmTfFnkDPGgD2KMVcGIQym
	 ehw2g3mSfWBgRmNdnM8IPaRHPsn9xxFod2wRvBBAp0SSR6WnwtbMAWYFuZPVDwe8q56ki
	 K1ktREaY/XblR4avuUVmd/G95QjlXM49/oVIRzAKKTwbmmcm+gGIPVuo4uE1s+VGd3oWj
	 9sulc7IT07d4oAAw8E2i0N9J6faGms+vzPsAEoU82yIDJBL2y8dpNsW2EC9xRUZfR8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006568;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=wElVjObCcE5lba+Xb6tcCUzBEml+hpIqeY7ve28PTAo=;
	b=F3/lKw6eMbdzJYYwNFxdaFacBbHotMQJMqyDrIEsipAEcVlzKcKkt7FbjI8LodcmXXq3
	 ZupOjdZlLt2NISGYFFGIJOFc/mAp5TfGing7s2pLyU8U/QlccBJ2FdgA8X9w53cO8DTmA
	 JbyX/W5undTNfKORunc2rYvudAtqnsH7j+j0tOHjern5rVrx08vQjpRM6pQL6b9/IdP7S
	 5WcP27q7sn4oEKpVc7oDvf5GPrnlwhDuNTu7GYKAg3K+py+Mv1NzP/U/SsxHL/3uRkg+G
	 ugHrdJ+NmExd6gn0pw4zN9tvBgIiElUPgOOzJWCQLdICh0Z38ifArixnO/ORS5x7dsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dTaQoHvh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xEs+zrvz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=X9m1x4X6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VhYVWm+T;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3820D606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 12:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3820D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=dTaQoHvh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=xEs+zrvz;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=X9m1x4X6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VhYVWm+T
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9CFD22114;
	Wed, 18 Nov 2026 12:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wElVjObCcE5lba+Xb6tcCUzBEml+hpIqeY7ve28PTAo=;
	b=dTaQoHvhGIM/00qqGYBLtBG3eJO1LOOHjHuHh1pfU6jLrgoSsBpU02lkbsacijZn4KaVFT
	9/eDnbI6eRIFmgOxGCs23Ubrs+KhM295SsZCw999SxOhiBa1oDPTiHeQMmki6+KphYQrcb
	AtrjK+ayuNR8QLUJy7GUn4QLJgVyZLY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006566;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wElVjObCcE5lba+Xb6tcCUzBEml+hpIqeY7ve28PTAo=;
	b=xEs+zrvzS/eYLUySkSQHfiQMuDtf7vf3a9Ohf9GkswLTT8B5RERGrKPUeo3J5gj6tsYh6n
	qIYgObNV3QAxH6Bg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X9m1x4X6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VhYVWm+T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006564; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wElVjObCcE5lba+Xb6tcCUzBEml+hpIqeY7ve28PTAo=;
	b=X9m1x4X6VAmlm4rpy7Tu/TWRPX93tTVkoXhr2MM+WPl3iorKLeTl5QBbMsc0WVoIeKYxG8
	1JfETxYJ2D50/VtZs033HAMDUqG0qlFo20oAr/IcpvKbT9uGxL9V6Rv23SEQnuAaMxGWt9
	/sI9cAIdO6YDn2sFcFSinh9bD00PgiM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006564;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wElVjObCcE5lba+Xb6tcCUzBEml+hpIqeY7ve28PTAo=;
	b=VhYVWm+TjpypMzRHqsABqeBThtJbo96ZLALol5lO+B12KHVUAAhyeuN/Z/Dy1s2zW0Ro35
	mYDSR+8i+GjhRmDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94EBD134E9;
	Wed, 18 Nov 2026 12:56:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aJwBGmSg/WpVWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:56:04 +0000
Date: Wed, 18 Nov 2026 13:56:04 +0100
Message-ID: <87se0ywb6j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dustin Tacy <tacydustin@gmail.com>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP OMEN 15t-ek000
In-Reply-To: <20261118030254.29314-1-tacydustin@gmail.com>
References: <20261118030254.29314-1-tacydustin@gmail.com>
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
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D9CFD22114

On Wed, 18 Nov 2026 04:02:54 +0100,
Dustin Tacy wrote:
> 
> HP OMEN 15t-ek000 with PCI subsystem ID 103c:878a uses an ALC245 codec.
> The mute LED requires a quirk to work.
> Enabling ALC245_FIXUP_HP_MUTE_LED_COEFBIT on this SSID.
> Verified on my HP Omen 15t-ek000.
> 
> Signed-off-by: Dustin Tacy <tacydustin@gmail.com>

Applied now.  Thanks.


Takashi
