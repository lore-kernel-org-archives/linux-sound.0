Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92A53515F9
	for <linux-sound@vger.kernel.org>; Sun, 26 Jul 2026 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785048992; cv=none; b=ktNxDHlqeahz/pO+YF7bdyaMQSyBqPw+1HOqWRS5zmM5f0kxLRw181p0SeKQOChvQ+/qGEVVaWZLA1MuXThL9K714JjE1Nsjp0gjzz7waf2oU8HGRZOIoXvWEmwEwu9lvkeQTxiR89eEZOtGLORn5NzMGvtcK0w4ZYgG/M68ZXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785048992; c=relaxed/simple;
	bh=z71Rtu/B3/nbHAOgsQZRduoT4bMHjUsoR/xvhCaJBlg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ep8YAc+KPT6qnXJZXpQplY2FsJ1k2UwDDDD2jrhQLJOhpH0FFnmQef27vwyBzw5uCbGVGqOV9BQZDb+ZnWB4P546TTatmwifLGcK7hkkT+kPQhSJ6Yz/pJ1tmZsh8cZMSauK6GXlo1FTqR+NtBW5q35cl5g4QmFEnnnP/1nY7zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GUc1bGBl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=N79BC6z8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bKcco0YD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=72tx/+Rt; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GUc1bGBl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="N79BC6z8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bKcco0YD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="72tx/+Rt"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D806D4B13;
	Sun, 26 Jul 2026 06:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785048989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJnPSyNkL4zbfVBQ7gpyzKumpiX/8cJ1gmDUAHWPEdY=;
	b=GUc1bGBlBdzIA+hf8fr1ONsspShlwBzTtH1CoB0NgYfGjicLXb4H1Se1RpLwafudSF5FS7
	8z5isx8ckRoZVppWjPW9D/sjg1f/C6yCF8C8I37bZhp/IbbPqjRS0YGC3qrH6BOx2INsD6
	8EoJiWYjGj9/GP1q5HbnmFgrzI+TOFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785048989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJnPSyNkL4zbfVBQ7gpyzKumpiX/8cJ1gmDUAHWPEdY=;
	b=N79BC6z8gy+yRfMUFGqmRLK6C/9Q/hhpgkUh2ZMPmEtKVCRyU959/orN1oqqXiHRRIi0h1
	yCYnCp+y9+AvqrBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bKcco0YD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="72tx/+Rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785048988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJnPSyNkL4zbfVBQ7gpyzKumpiX/8cJ1gmDUAHWPEdY=;
	b=bKcco0YDhHgPWLjWp0CyWqG0MumAzPnBPR3HhDn2RsOgb45oE39AnsZwAeVkgrHbHFJQL4
	2PvkhpxRDKfqsGWM38qYpSpvbbkoe7UxQqfwF8symeriOKXLuVbcnlsQLsywSFgGl6yjG1
	FdcxNCnZbQgEDjo8OWUbrEFDPNdgXqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785048988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qJnPSyNkL4zbfVBQ7gpyzKumpiX/8cJ1gmDUAHWPEdY=;
	b=72tx/+RtYCxRe4VnX+QJ3vODmbhYuVJJ0Pnc9H/4M0fyJ2YxfX8IEC+dH+hDE8PDxcmVni
	eNEo3tEOXyAUMoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A519F779B9;
	Sun, 26 Jul 2026 06:56:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IRYXJ5yvZWpyeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 26 Jul 2026 06:56:28 +0000
Date: Sun, 26 Jul 2026 08:56:28 +0200
Message-ID: <87fr16b5nn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Eckhart Mohr <e.mohr@tuxedocomputers.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for TongFang X6SP45xU
In-Reply-To: <20260724190109.169889-1-wse@tuxedocomputers.com>
References: <20260724190109.169889-1-wse@tuxedocomputers.com>
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
X-Rspamd-Queue-Id: D806D4B13
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 24 Jul 2026 21:00:13 +0200,
Werner Sembach wrote:
> 
> From: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> 
> TongFang X6KK45xU and X6SP45xU have actually different PCI IDs. This patch
> Adds the missing PCI ID to fix headphone detection and clarifies the
> naming.
> 
> Signed-off-by: Eckhart Mohr <e.mohr@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Applied with Fixes tag now.  Thanks.


Takashi
