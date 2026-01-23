Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7622C11E1
	for <linux-sound@vger.kernel.org>; Fri, 23 Jan 2026 11:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168179; cv=none; b=TJPx35Hjw5qgS+wiegvYJpQ98sfkA8nvJcR7Mcq2vrxEyoJycxOr6vFyNBLlgqE+nGjq/qoCBCqSWp/SwQenzm+AUnB2LSh54N5q+FYW/SS9Mbl63S8vjyYM1kMBGln10ViDauW48Nf/O29UmzRXST7lwRMNA5y6mpZOCA9dht0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168179; c=relaxed/simple;
	bh=p9lV1MZc4d3D8+YpLL73UTN1ZyyIUOlNO74WN3Qv+VA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lgfjec5G1d4cWhe+SMcOemOg4ItoFYMX81BazjESJu+FDqPrqeYoiGb+iJ/c6FyxpR2fgcq3K4OCXxQZ2LKUef17HnIUxcRThqRK2WNAaE9QGqSBC8QWkUiOxQRKzM6YvaKBzKf/p38FfpfBYdfFItsODwVh6uvGgyF2/0wYfRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gKA/W9d0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lOvhfxIL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gKA/W9d0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lOvhfxIL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gKA/W9d0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOvhfxIL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gKA/W9d0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lOvhfxIL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 828FF5BCCD;
	Fri, 23 Jan 2026 11:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2Fz+NXy2tubQ2VkY1GIwVZJi9zJovqqQlxfZ7hg9Kw=;
	b=gKA/W9d09kRoTshqYHzcGlO0/SWnAAdZyLF5MXKMuadLQH8FxmCN2n1S/Kz46Cm7VTqgnv
	VYne09fwi/giQi4EFagb8/8V/zikNre55ELo0jiJ/tOshxk9BUVPBfd+7LZ9x5iiUONAt5
	JIIBRmz/tJ3Hnb+xuj8aGdNgApB0OeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2Fz+NXy2tubQ2VkY1GIwVZJi9zJovqqQlxfZ7hg9Kw=;
	b=lOvhfxILXjmwUgzWW85R3r7/PlX2QnNQQYxQmYnFvuUfNqB22r7QHDV5AxLYecQR+OH9sg
	lHCPKH7et6NIDXDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gKA/W9d0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lOvhfxIL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1769168175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2Fz+NXy2tubQ2VkY1GIwVZJi9zJovqqQlxfZ7hg9Kw=;
	b=gKA/W9d09kRoTshqYHzcGlO0/SWnAAdZyLF5MXKMuadLQH8FxmCN2n1S/Kz46Cm7VTqgnv
	VYne09fwi/giQi4EFagb8/8V/zikNre55ELo0jiJ/tOshxk9BUVPBfd+7LZ9x5iiUONAt5
	JIIBRmz/tJ3Hnb+xuj8aGdNgApB0OeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1769168175;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v2Fz+NXy2tubQ2VkY1GIwVZJi9zJovqqQlxfZ7hg9Kw=;
	b=lOvhfxILXjmwUgzWW85R3r7/PlX2QnNQQYxQmYnFvuUfNqB22r7QHDV5AxLYecQR+OH9sg
	lHCPKH7et6NIDXDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4ED631395E;
	Fri, 23 Jan 2026 11:36:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ukbQES9dc2m+eAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 23 Jan 2026 11:36:15 +0000
Date: Fri, 23 Jan 2026 12:36:14 +0100
Message-ID: <87fr7wftn5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU
In-Reply-To: <20260122171543.19958-2-wse@tuxedocomputers.com>
References: <20260122171543.19958-2-wse@tuxedocomputers.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 828FF5BCCD
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 22 Jan 2026 18:13:42 +0100,
Werner Sembach wrote:
> 
> Sorry the last patch I sent didn't actually work. Here is a revert and
> a new version. Luckily it was catched quickly.
> 
> Tim Guttzeit (1):
>   ALSA: hda/realtek: Really fix headset mic for TongFang  X6AR55xU
> 
> Werner Sembach (1):
>   Revert "ALSA: hda/realtek: Fix headset mic for TongFang  X6AR55xU"

Could you rather fold into a single patch with a Fixes tag?
Or, at least, give more details in the revert patch.  It says only
reverting, and it doesn't help understanding what's going on.


thanks,

Takashi
