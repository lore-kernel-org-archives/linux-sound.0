Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E7143752
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 11:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722253866; cv=none; b=FvXiYshR+J2oWdLG4kAgfdqGizltaOMaPgMpVeozNU9kkM8H9DlbNIYSPAeOygKhyOBthzOQCAoiiFh/9Qyb27a05HrNAhkCbR5b/AnXSRBSeQJlnLtywUvXFQaJlu6l6fOL/pRMIjBhokzwNnvvyV/x5C4uCVnF/wwM14F0TSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722253866; c=relaxed/simple;
	bh=kEqU2IJJzNi3Tn6MAvCZQqdhfqTIVOg8QKYFuC4UB2E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bb5qGDzvkQ+GZYTuzzC+GdIXl5r4/86k4V6g77hINgfqn7vxf8vTL54qGo1P7gUn1n7uHGk4EsrOe7coSOkDvsXGMnVD1HUPaqLEbY4i+oHqApoXJXEdkf4YMHtmpFzXfByBz/oIQxm116fzaEREL0eWzRccI951zLz3Al32FiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mHI30SBJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d+pF19tC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mHI30SBJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d+pF19tC; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mHI30SBJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d+pF19tC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mHI30SBJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d+pF19tC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 009DE1F793;
	Mon, 29 Jul 2024 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722253863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5yc4mHr3rF1WhryxGSTj6+VjCTwmBXM14C6OdWEAKo=;
	b=mHI30SBJqjzUTMmMEOGAZ7V86uSR55GSx0/VohutR0pKv8swDqVbYNsItG4g4Nj/J9z33q
	0abNUaaVL1SEU4bVTRlrdmCMliPXyeNGNjMpfCtJQlb6sTEKXviU8ScEHw4X0v1W4L5oM4
	BcedvLty+m3ZWerqXBXuKLo7cBaFit8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722253863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5yc4mHr3rF1WhryxGSTj6+VjCTwmBXM14C6OdWEAKo=;
	b=d+pF19tCMV69/Je00fklMmlIldkvwh/JNtmaBo/MIGodRX63F000rGY6YYFxkOKJSVbTFt
	yXQHCDT5hpPe/RCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1722253863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5yc4mHr3rF1WhryxGSTj6+VjCTwmBXM14C6OdWEAKo=;
	b=mHI30SBJqjzUTMmMEOGAZ7V86uSR55GSx0/VohutR0pKv8swDqVbYNsItG4g4Nj/J9z33q
	0abNUaaVL1SEU4bVTRlrdmCMliPXyeNGNjMpfCtJQlb6sTEKXviU8ScEHw4X0v1W4L5oM4
	BcedvLty+m3ZWerqXBXuKLo7cBaFit8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722253863;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L5yc4mHr3rF1WhryxGSTj6+VjCTwmBXM14C6OdWEAKo=;
	b=d+pF19tCMV69/Je00fklMmlIldkvwh/JNtmaBo/MIGodRX63F000rGY6YYFxkOKJSVbTFt
	yXQHCDT5hpPe/RCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4BF91368A;
	Mon, 29 Jul 2024 11:51:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CvzWLiaCp2b6NwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 11:51:02 +0000
Date: Mon, 29 Jul 2024 13:51:39 +0200
Message-ID: <87frrsct6c.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Acer Aspire E5-574G
In-Reply-To: <20240728123601.144017-1-mavchatz@protonmail.com>
References: <20240728123601.144017-1-mavchatz@protonmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[protonmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[protonmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.10

On Sun, 28 Jul 2024 14:36:04 +0200,
Mavroudis Chatzilazaridis wrote:
> 
> ALC255_FIXUP_ACER_LIMIT_INT_MIC_BOOST fixes combo jack detection and
> limits the internal microphone boost that causes clipping on this model.
> 
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>

Thanks, applied now.


Takashi
