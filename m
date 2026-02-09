Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC063276028
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649725; cv=none; b=HOnx5g+zeR+BvVqf/zmsoWSrM3oqBQDbZcS4fiMW1eTLZo1gH23/39Cb+Egq60PiKfasoCHMNflUiVHn1FtdSPz/O/3F6EOW/hpn99dRmTCuhxQf7UfYKKzKpoKN4FZhQVQgHnVHDApWgOhxtCksrpjgjY1yEiiGQ4q+xQF5Sz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649725; c=relaxed/simple;
	bh=bJ2AgIuODQiEkeFHPhc8gG/z2RvSiIvfFeDZzzfSgCg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDwwvwCOCJN2+RgAzzmEzxJA1VX47pxiYjjkksjMv2GQcUGl2kh52TbskfXB3pnzPxqZE3rlsN/b4u+CdFYnOX9GcNRrHvYlyJkrYBJjJC/K8SFzNsBJ2EVCqi26P9TLzXN5GMhVdJL7rJEgUrdx/UUDXu4xDBuKHP3ZaIcqYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tNIdNx8u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ujaH62Sy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tNIdNx8u; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ujaH62Sy; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tNIdNx8u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ujaH62Sy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tNIdNx8u";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ujaH62Sy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0C19C5BD23;
	Mon,  9 Feb 2026 15:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770649723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9HKcor3oewf6YZEl+lnXV8bE5WQIZtCHOihxiAGPeSY=;
	b=tNIdNx8uiuJvrNAPkT1Tr1Vu0yN7SzVPcjBicP48g23CKZBFBmjX9OFQuSVNAIzSHt5Wfg
	Y3ENYEU9/C9XMekdqkvMRzzY+WNx+TtvmeY5m+L3kwr5n20j3sPozzbGbb5fM6GnAtAknB
	tRcSyXTzbhOONIIElD8zyfsZyS25fQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770649723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9HKcor3oewf6YZEl+lnXV8bE5WQIZtCHOihxiAGPeSY=;
	b=ujaH62SyKCz2VJVbahkYkJYn/HxFLbNfq1PK4PCuxT+okIm7NmdtoDe0Ju5fWNhCgtdpb0
	PVxKX+J41+bNYdBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tNIdNx8u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ujaH62Sy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770649723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9HKcor3oewf6YZEl+lnXV8bE5WQIZtCHOihxiAGPeSY=;
	b=tNIdNx8uiuJvrNAPkT1Tr1Vu0yN7SzVPcjBicP48g23CKZBFBmjX9OFQuSVNAIzSHt5Wfg
	Y3ENYEU9/C9XMekdqkvMRzzY+WNx+TtvmeY5m+L3kwr5n20j3sPozzbGbb5fM6GnAtAknB
	tRcSyXTzbhOONIIElD8zyfsZyS25fQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770649723;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9HKcor3oewf6YZEl+lnXV8bE5WQIZtCHOihxiAGPeSY=;
	b=ujaH62SyKCz2VJVbahkYkJYn/HxFLbNfq1PK4PCuxT+okIm7NmdtoDe0Ju5fWNhCgtdpb0
	PVxKX+J41+bNYdBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CB8A63EA63;
	Mon,  9 Feb 2026 15:08:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1AGQMHr4iWnNJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 09 Feb 2026 15:08:42 +0000
Date: Mon, 09 Feb 2026 16:08:42 +0100
Message-ID: <87a4xi0xad.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Qihang Guo <v-conet@outlook.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: Add DSD support for iBasso DC04U
In-Reply-To: <TYYPR01MB14098529E0BD900921BE6F42CF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
References: <TYYPR01MB140982EB52459BA89009AED3BF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
	<TYYPR01MB14098529E0BD900921BE6F42CF465A@TYYPR01MB14098.jpnprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0C19C5BD23
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 09 Feb 2026 11:04:18 +0100,
Qihang Guo wrote:
> 
> From: V-Conet <v-conet@outlook.com>
> 
> Vendor ID 0x0661 is assigned to Hamamatsu Photonics K.K.,
> but is used by iBasso for iBasso DC04U (0x0661:0x0883),
> which supports native DSD playback.
> 
> This patch adds QUIRK_FLAG_DSD_RAW for iBasso DC04U, enabling
> native DSD playback (DSD_U32_BE). The change has been verified
> on Arch Linux using mpd and pw-cat.
> 
> Signed-off-by: Qihang Guo <v-conet@outlook.com>

Thanks, applied now.


Takashi
