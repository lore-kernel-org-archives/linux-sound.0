Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D273F35A95A
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 15:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095817; cv=none; b=VJUpSFj2ywhF8zU+Q2dzO7rYAuaOvE5OSPMIwB6qloetRG21O8mpI56kGENn7ssXY3m4x27y6stYpq9oENC+cZA57p9TYZwgHf2ySiYPXEuZ29RHJjI7mOqPvZ6ddKRE8Wvb+ofQaxdVboMKS4I/8ON3N7xyHvOLfdcvMK5hzB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095817; c=relaxed/simple;
	bh=6Ri7kWrxZr+sGaaCrVHOpkjlIB52Qak4ITKGXDWrMpU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AA4NIpCY1/a7Vati30s5Af6lZ4fqTCckCYsfJ81200Lzo6GXBdKqWv+7iAPGjLj6tC3wMHOUuYFFVhm40zqU+Bl8fnYcZ9o+HDniKrB2vI8GelAdwbN49EIK30uMFB7cMJ3lQYXjNRVrrhErxBO/jE03JFkAFbJEPte2En5zBzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OvQab8Bp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rwRZLUkp; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OvQab8Bp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rwRZLUkp; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OvQab8Bp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rwRZLUkp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OvQab8Bp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rwRZLUkp"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 196896A8B8;
	Mon, 13 Apr 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776095814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptt0RMXQ4WLOkEvCI/PWfLuE+dAATdwgMD/xMPtxGRs=;
	b=OvQab8BpoxcJKTNSvozpe/fsUIejszl1/rtaCvaiIAHu2GbG0MpbMvGyyo68eSpZIeFV45
	RxJKSKl2X6DNZG66dN5UlEvKOe9RkW9hj496By+XFslxG92XngdE3Y2fua1NcaklmCWP40
	iHbjNE6IXW3wBSIv1TVJqqjMijK2erY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776095814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptt0RMXQ4WLOkEvCI/PWfLuE+dAATdwgMD/xMPtxGRs=;
	b=rwRZLUkpX55tPSH7rSnr4+GoyDuBZsmg6aBzQLjxEP0HDcFFYO8K+yH/LOEDnpZJXFKdp1
	lXkFADHCGCAE0xCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776095814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptt0RMXQ4WLOkEvCI/PWfLuE+dAATdwgMD/xMPtxGRs=;
	b=OvQab8BpoxcJKTNSvozpe/fsUIejszl1/rtaCvaiIAHu2GbG0MpbMvGyyo68eSpZIeFV45
	RxJKSKl2X6DNZG66dN5UlEvKOe9RkW9hj496By+XFslxG92XngdE3Y2fua1NcaklmCWP40
	iHbjNE6IXW3wBSIv1TVJqqjMijK2erY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776095814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptt0RMXQ4WLOkEvCI/PWfLuE+dAATdwgMD/xMPtxGRs=;
	b=rwRZLUkpX55tPSH7rSnr4+GoyDuBZsmg6aBzQLjxEP0HDcFFYO8K+yH/LOEDnpZJXFKdp1
	lXkFADHCGCAE0xCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB1A04AF7B;
	Mon, 13 Apr 2026 15:56:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id b5g0NEUS3Wk/WAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 13 Apr 2026 15:56:53 +0000
Date: Mon, 13 Apr 2026 17:56:53 +0200
Message-ID: <87ik9uua4a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Naim <dnaim@cachyos.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Legion S7 15IMH
In-Reply-To: <20260413154818.351597-1-dnaim@cachyos.org>
References: <20260413154818.351597-1-dnaim@cachyos.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 13 Apr 2026 17:48:17 +0200,
Eric Naim wrote:
> 
> Fix speaker output on the Lenovo Legion S7 15IMH05.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Naim <dnaim@cachyos.org>

Thanks, applied now.


Takashi
