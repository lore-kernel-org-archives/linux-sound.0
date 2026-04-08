Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BC93AE6F4
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638320; cv=none; b=FL/8FOkL/KDmTXbOdTjclnsbrSFM8jkGM/+ZTEg28ENemqcGintUO9F46czvxjLQ6bN7AW5mF6TnUGTzg1Co4z/Wt2l5+xb2JbQoT6GSeDP8Bl+xlsfI8T3IpqtzY6Wz320lJ52HNliNZKTWlmdOIokYqosnjEmVvMNW9O/vK28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638320; c=relaxed/simple;
	bh=S544du5bZ/J3BMuUEgNVYldylf9Mg0p3CMO7hTIt/s8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uVDBHXzDT0OVPB3WO5tJGzRE9zjeCfymhdhoEZHrnLJpBEz0d6g2mjcG40Dz8QXwzD2yPX8C9oBl7hQ1yzunFSmeyxKt6EMdVucc3nlaFWyKN/aJmiFJJxeIj/XymJ1OBXvHmgG+nJM9DILW8cNKQqWXErCFP1OgdFvjE5aPHXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zOa4E9D2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/5djaFWG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0ojRQh1E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yX8Lc+6O; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zOa4E9D2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/5djaFWG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0ojRQh1E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yX8Lc+6O"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1A71C5BD9E;
	Wed,  8 Apr 2026 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775638310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Rn9fmv7KmRDRNSGYaPYNJ6RB3/EbojI5GL75NZyiI=;
	b=zOa4E9D2qzA/ZCVUWyqPJ+/2FzJkhIUxqdEcjViJ1eukkPCkn/vju3IT/5lFXUOcHOIXKB
	NCBAZAIuwOgP87Vpr8TazJV4tzRs67poBEnBNHkvgMh6bVnRo7bAh2Gi0wbM7etGGMWqs9
	Z+SMZAcPDPbcM/B46luEGmaD+MqchEA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775638310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Rn9fmv7KmRDRNSGYaPYNJ6RB3/EbojI5GL75NZyiI=;
	b=/5djaFWGZhH6Nqe5sFdud9t7qpwXRcm1kOq9Xo0Q2A1EYGTyWeOInRNCrjFwFAnoxFq0/3
	n8UlRb91tIXi0DDw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0ojRQh1E;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yX8Lc+6O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775638309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Rn9fmv7KmRDRNSGYaPYNJ6RB3/EbojI5GL75NZyiI=;
	b=0ojRQh1EGl09OYQOfMMeajTYGCoo8+c/NlLOFPSBL+WgLwbY55EFP4LEY6GZZAfbxkkrfg
	p1bMJjqdW1NW1iLK1LVWvDemZCFyHH/kLQd/BRvUhn3mV0qrXi21tnhrcSw5dLU2cRqwFm
	TtHO4qHT8XJmvg5m//zyBMXGYfovKBI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775638309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Rn9fmv7KmRDRNSGYaPYNJ6RB3/EbojI5GL75NZyiI=;
	b=yX8Lc+6OUyN3XEQyzAXMnYKNLNSya/XKyApVVUWdy1iM2qztvzN/AuD5uiD+sa2hJnoTe9
	zNPzGH2pBuFYSmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E75924A0B3;
	Wed,  8 Apr 2026 08:51:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +kNaNyQX1mkUDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 Apr 2026 08:51:48 +0000
Date: Wed, 08 Apr 2026 10:51:48 +0200
Message-ID: <87tstlltqz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: i2c: ak4xxx-adda: implement AK4529 reset handling
In-Reply-To: <20260407-ak4529-reset-handling-v1-1-b971c18b1a32@gmail.com>
References: <20260407-ak4529-reset-handling-v1-1-b971c18b1a32@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1A71C5BD9E

On Tue, 07 Apr 2026 23:13:06 +0200,
Cássio Gabriel wrote:
> 
> Delta 410 uses snd_akm4xxx_reset() both around DFS changes and from
> its PM callbacks, but the AK4529 case in this helper is still left
> unimplemented and never drives the codec reset path.
> 
> The AK4529 datasheet documents register 09h.RSTN as an internal
> timing reset. Clearing RSTN powers down the ADC and DAC blocks, but
> does not reinitialize the register map. That matches the existing
> ak4xxx helper model, which already keeps the desired codec state in
> the software register cache.
> 
> Implement AK4529 reset handling by clearing 09h.RSTN on state == 1,
> then replaying the cached register image and setting RSTN back to 1
> on state == 0.
> 
> This restores cached Delta 410 mixer state after resume and gives
> the AK4529 DFS-change path a real codec reset sequence.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Applied to for-next branch.  Thanks.


Takashi
