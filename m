Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F082E173D
	for <linux-sound@vger.kernel.org>; Sun, 29 Mar 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774775212; cv=none; b=Qgw2pXaT6xZ5wDE7hKT9h+ZEoX3spbUS4DXfiGE7nYgyI0OLwyXAXv+ThkxdlK8GJ1WBYekol4mD3WyDVpT7E48wNPZrOd7Dafg7HCFWVt/m24qZgMbwywr/CMwMerZG10fsAY3zKJWfequIfNxebeAw/NwDBj7UmNCSOwgZ+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774775212; c=relaxed/simple;
	bh=kMzt+aXZnOR4RgOb5eWr60oeXdXTFbx/XBdKuzEgAhw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBqT0igyWLveu5jdWxonEeGMFgA0UgIQ5eUwlmV25K7VJLesvuV+iqadUqdac4ga9OoVFBi55JQkyk/NcaX49qMsWelQQ2hDXW3+iWga/PkRKl4U8WeiScclDaYWcPSlJxTEXSJm8HEcld5idmQJdTyO2hjgWYG+p+p/SvGBx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D7xazQfK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0VBG6OAR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D7xazQfK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=0VBG6OAR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D7xazQfK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0VBG6OAR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D7xazQfK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0VBG6OAR"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2B66B5BDC7;
	Sun, 29 Mar 2026 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idNW5HUvF72g2z4t0yaTbh97vWRM9X4bU4Up5yC928=;
	b=D7xazQfKoaEzgkg2GQgyQv2TU+YDm5Lvg/aZsbT7cd2DBq10Rzd0eEp2XF6Kbk76BIpCet
	ZXQm0ISiXXswXenvuSRzLsPghP+a11mh+QmFUwRGpbdnEQR6a77h4FcpGyghVC9l+R9/vk
	Kkh83sU98fHdfyIPREVEDEWdzqSt/Hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idNW5HUvF72g2z4t0yaTbh97vWRM9X4bU4Up5yC928=;
	b=0VBG6OARNz/iM6Jq48wCu9KwRNkdduQMv7pvlTilZIUL1DHF7U85Grbp4yktwC/yOw5z3B
	FGL9W5aSIdP/3CBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=D7xazQfK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=0VBG6OAR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1774775208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idNW5HUvF72g2z4t0yaTbh97vWRM9X4bU4Up5yC928=;
	b=D7xazQfKoaEzgkg2GQgyQv2TU+YDm5Lvg/aZsbT7cd2DBq10Rzd0eEp2XF6Kbk76BIpCet
	ZXQm0ISiXXswXenvuSRzLsPghP+a11mh+QmFUwRGpbdnEQR6a77h4FcpGyghVC9l+R9/vk
	Kkh83sU98fHdfyIPREVEDEWdzqSt/Hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1774775208;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/idNW5HUvF72g2z4t0yaTbh97vWRM9X4bU4Up5yC928=;
	b=0VBG6OARNz/iM6Jq48wCu9KwRNkdduQMv7pvlTilZIUL1DHF7U85Grbp4yktwC/yOw5z3B
	FGL9W5aSIdP/3CBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04A134A0A2;
	Sun, 29 Mar 2026 09:06:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rfB0O6fryGlZDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 29 Mar 2026 09:06:47 +0000
Date: Sun, 29 Mar 2026 11:06:47 +0200
Message-ID: <87a4vruhqw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio: tidy up the AF16Rig quirks
In-Reply-To: <20260328160326.23665-1-willerz@gmail.com>
References: <20260328160326.23665-1-willerz@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2B66B5BDC7

On Sat, 28 Mar 2026 17:02:58 +0100,
Phil Willoughby wrote:
> 
> Use macros to make the AF16Rig quirk table smaller.
> 
> Add a disabled block containing the theoretical quirks for the other
> clock sources that the AF16Rig has. It's disabled because I cannot test
> it.
> 
> Tested-By: Phil Willoughby <willerz@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Phil Willoughby <willerz@gmail.com>

Applied now to for-next branch.


thanks,

Takashi
