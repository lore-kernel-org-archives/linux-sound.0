Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6438422578D
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775833601; cv=none; b=ZRUvaVuYWwYQSPaoWhMgylAz+5zIu9tuvmrwYpODYbLGIead4msuU0bpmeYy8xNbW1It/ZfDVbWQpd2cm/PW0Cb3tr2wKfvU3J3FxXCLIMav/Ix5N5a8kAJow69eJncYu7xsvanfgyxWV5U2VdVOJRmIQJiSlczrTZE1X57r9yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775833601; c=relaxed/simple;
	bh=N0qqrolcchg92/tv4ZepxcPxNyoX8x7TykF8q6anhig=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3yjv3YS8Apxb89lHuLKndNEullmPxcKEd6MoqbF3fGal3uojBr99qdWnQxId8IYutRNz010AMJiMWTHwqauzf5WiYfsrbZCHd3R48Xps4ZEzHXZ7VWbg5ofktUOUHaEVlUubP3trrrJL/co1D77Iz2Z6+WIdn3fzTavwtnAoiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KzSBaAva; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HtP3yGo0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KzSBaAva; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HtP3yGo0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KzSBaAva";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HtP3yGo0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KzSBaAva";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HtP3yGo0"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B91095BCD3;
	Fri, 10 Apr 2026 15:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775833598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Af3OZ1fe77ANu/4FEEn5zR7/bDvTGy7EVReCgbl5erw=;
	b=KzSBaAvao2g9OcFaTXjQuO1tGMth8C9q/KhZkXQioJqXZaPLCYEPupPHG5fqUN54gxJRFW
	lif64Ti45Z6vXogEIJ1AOZ09PhoundG1UW2KrE5l1BGa0+MlGJLzteSrAETUZD4Jad89Ba
	Oc/AkS3d6KEcqGGiFqekjfaxhUwubDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775833598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Af3OZ1fe77ANu/4FEEn5zR7/bDvTGy7EVReCgbl5erw=;
	b=HtP3yGo0Evtwp40/Zp/NHwtpU0KN+prkVijeN9/9bBeJrdhkOX6zctbXngzT9a6pxnTNFp
	ZYGi3lY6BUHlEUBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775833598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Af3OZ1fe77ANu/4FEEn5zR7/bDvTGy7EVReCgbl5erw=;
	b=KzSBaAvao2g9OcFaTXjQuO1tGMth8C9q/KhZkXQioJqXZaPLCYEPupPHG5fqUN54gxJRFW
	lif64Ti45Z6vXogEIJ1AOZ09PhoundG1UW2KrE5l1BGa0+MlGJLzteSrAETUZD4Jad89Ba
	Oc/AkS3d6KEcqGGiFqekjfaxhUwubDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775833598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Af3OZ1fe77ANu/4FEEn5zR7/bDvTGy7EVReCgbl5erw=;
	b=HtP3yGo0Evtwp40/Zp/NHwtpU0KN+prkVijeN9/9bBeJrdhkOX6zctbXngzT9a6pxnTNFp
	ZYGi3lY6BUHlEUBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9016C4A0B2;
	Fri, 10 Apr 2026 15:06:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OIEPIv4R2WnMDgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 10 Apr 2026 15:06:38 +0000
Date: Fri, 10 Apr 2026 17:06:38 +0200
Message-ID: <87ik9yg8ht.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abhinav Mahadevan <abhi220204@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for PreSonus AudioBox USB
In-Reply-To: <20260410143335.5974-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Fri, 10 Apr 2026 16:33:35 +0200,
Abhinav Mahadevan wrote:
> 
> The PreSonus AudioBox USB (0x194f:0x0301) only supports S24_3LE
> format for both playback and capture. It does not support S16_LE
> despite being a USB full-speed device. Add explicit format quirks
> for both the playback (interface 2) and capture (interface 3)
> interfaces to ensure correct format negotiation.
> 
> Signed-off-by: Abhinav Mahadevan  <abhi220204@gmail.com>

Thanks, applied now.


Takashi
