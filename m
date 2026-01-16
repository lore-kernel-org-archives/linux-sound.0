Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676EA327213
	for <linux-sound@vger.kernel.org>; Fri, 16 Jan 2026 14:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573174; cv=none; b=s9rIAQP9J0UHlBh4awwDMXT8aT7VDkkG5YSJuaGd9NNzk5Lzd/fYznu/GbIHnWJ7T6jSKn1Z+/TTBet4D/BLHVNIienkuom0ilTeq+7xvKWtayjpBs4Bt/kOSEbCy4+zorYa1BRkmEYwo0KjBuwjLTdM+fLa2yXLWp7AxAw6bec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573174; c=relaxed/simple;
	bh=W0SvJIn4jYNf9VIuPYo40ebUATAFsJcHZ2oLBeu+EoE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=msJNAiC+6yGioEJjrwaQ9Z8W9jfPLFYkw17wTKCDlTIa6PIwRpyocwTlj5OvR9W8WoyyqL7NxLwp74WcoobvEcK9TcWoq+YY7n0lfHEFCkJMllrDK8FgshH+491OWLROH2L//gfbKmkdXt0M6ahJGP+djRtS6D0DHJvC7m15XLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwTf3rgs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JKk6tR3r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XwTf3rgs; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JKk6tR3r; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwTf3rgs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKk6tR3r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XwTf3rgs";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JKk6tR3r"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9AD4C5BE12;
	Fri, 16 Jan 2026 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768573169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pE+Gnpbr5xdkZ8Ww27v97SHDZF9esYd6v6sXQoOu+e8=;
	b=XwTf3rgsagHzObMI96/xyZvceblJSqT1+HNd8vDtySjz7uLGIZatRPrRcY9h3ppjVmUvKk
	P2fWcALLf3JhAZ3iN9me3cRWmXEwgFQe16SI5jhSGlHtS8e6ykLnStVBDz0rwp0bKzXvqU
	K82qHuN6q7IJNlcf/3M8S2MMYPhB2hA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768573169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pE+Gnpbr5xdkZ8Ww27v97SHDZF9esYd6v6sXQoOu+e8=;
	b=JKk6tR3rnwfsEkTTgk/dcbulNblSPIGK0SNlMdbhM2Ka5J9GZo8DLYkDSIdDND2ha0MpPa
	TtB3hMtUdVxvD6CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XwTf3rgs;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JKk6tR3r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768573169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pE+Gnpbr5xdkZ8Ww27v97SHDZF9esYd6v6sXQoOu+e8=;
	b=XwTf3rgsagHzObMI96/xyZvceblJSqT1+HNd8vDtySjz7uLGIZatRPrRcY9h3ppjVmUvKk
	P2fWcALLf3JhAZ3iN9me3cRWmXEwgFQe16SI5jhSGlHtS8e6ykLnStVBDz0rwp0bKzXvqU
	K82qHuN6q7IJNlcf/3M8S2MMYPhB2hA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768573169;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pE+Gnpbr5xdkZ8Ww27v97SHDZF9esYd6v6sXQoOu+e8=;
	b=JKk6tR3rnwfsEkTTgk/dcbulNblSPIGK0SNlMdbhM2Ka5J9GZo8DLYkDSIdDND2ha0MpPa
	TtB3hMtUdVxvD6CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E0C93EA63;
	Fri, 16 Jan 2026 14:19:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p3KSGfFIamntYQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 Jan 2026 14:19:29 +0000
Date: Fri, 16 Jan 2026 15:19:29 +0100
Message-ID: <87ms2dd4i6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cirrus_scodec_test: Use faux_device instead of platform_device
In-Reply-To: <20260115143920.1553783-1-rf@opensource.cirrus.com>
References: <20260115143920.1553783-1-rf@opensource.cirrus.com>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9AD4C5BE12
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Thu, 15 Jan 2026 15:39:20 +0100,
Richard Fitzgerald wrote:
> 
> The dummy GPIO driver doesn't need to be a platform device. So make it a
> faux_device driver.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied to for-next branch now.  Thanks.


Takashi
