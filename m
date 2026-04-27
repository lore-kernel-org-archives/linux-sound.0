Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132093B6343
	for <linux-sound@vger.kernel.org>; Mon, 27 Apr 2026 12:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292632; cv=none; b=Rdq195D3J+Bk+jNvYi+uqNdpn8Qoa7VkKrTHk5YcHDcQpTj8sMLztsNTX3OJsY+d3rFl9ETxZynOJVrs15vZd2hfbkOhOwV+O2+3wb89unJrK3sx8jtV2nOH7MT/sELSbeDLtPz97fU3JYjLncrHpbLnWiSbEO6rROvltQgwfAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292632; c=relaxed/simple;
	bh=PtJZe2Kvg/U95m2QPcwArfOKy4P8BsQLv7Juttceg5M=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VnorMyv2NDx3XtWjaDXSuRyAn1YviTB4UNwUxim7pt8LbKusCHGucrOXLydSa4rq3XgZx4YdTxR6vdwEmAOWVz4L75dUS0my4QvL7lRoy3aBApQijP67px50FCS/cXSlqN5E568nytpxdbSyuf1J5YYX/4KebPg81W6mG/2CitI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cju8CvRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MkrHQnYg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=cju8CvRq; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MkrHQnYg; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cju8CvRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MkrHQnYg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="cju8CvRq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MkrHQnYg"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4C01C6A825;
	Mon, 27 Apr 2026 12:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ml6lZr9+eSVT4uVt+q5gie6LNd5cRBKnxkx21Jw2d18=;
	b=cju8CvRqZPy/5emtNTTqI21BOxHeLE31E+jNK9crUR+BADfBHViwlqzzEyatWB+8y6EBfk
	8vcZ/c0A+JvZx0Wxj1lj/Ak+bZEHbJPRMdoWEvQp6YmSkfqCXKeJwGkI5V8M1hchUH8Ao+
	4PBcH55pFwevVGu8WL4NH13OkuvUcuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ml6lZr9+eSVT4uVt+q5gie6LNd5cRBKnxkx21Jw2d18=;
	b=MkrHQnYglsBvLW8u7lKY8vpaGdtozO+kpvFeMmm+If43LoSAP1tNh6vTctW2kALhi7/+DP
	cHNlwsWu1t1fG8Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cju8CvRq;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MkrHQnYg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777292629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ml6lZr9+eSVT4uVt+q5gie6LNd5cRBKnxkx21Jw2d18=;
	b=cju8CvRqZPy/5emtNTTqI21BOxHeLE31E+jNK9crUR+BADfBHViwlqzzEyatWB+8y6EBfk
	8vcZ/c0A+JvZx0Wxj1lj/Ak+bZEHbJPRMdoWEvQp6YmSkfqCXKeJwGkI5V8M1hchUH8Ao+
	4PBcH55pFwevVGu8WL4NH13OkuvUcuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777292629;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ml6lZr9+eSVT4uVt+q5gie6LNd5cRBKnxkx21Jw2d18=;
	b=MkrHQnYglsBvLW8u7lKY8vpaGdtozO+kpvFeMmm+If43LoSAP1tNh6vTctW2kALhi7/+DP
	cHNlwsWu1t1fG8Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23FAA593B0;
	Mon, 27 Apr 2026 12:23:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lSiKB1VV72lLFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 27 Apr 2026 12:23:49 +0000
Date: Mon, 27 Apr 2026 14:23:48 +0200
Message-ID: <878qa8zj57.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rosalie Wanders <rosalie@mailbox.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: apply quirk for Playstation PDP Riffmaster
In-Reply-To: <20260426025520.3985-2-rosalie@mailbox.org>
References: <20260426025520.3985-2-rosalie@mailbox.org>
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
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,mailbox.org:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4C01C6A825

On Sun, 26 Apr 2026 04:55:19 +0200,
Rosalie Wanders wrote:
> 
> This device, just like the Playstation 5's DualSense, has a volume
> that's too low, hid-playstation solves this by raising the minimum
> volume on the device itself by sending an output report, third party PS5
> controllers/accessories do not support this output report format, so we
> apply a quirk to raise the minimum volume by 6dB.
> 
> Signed-off-by: Rosalie Wanders <rosalie@mailbox.org>

Applied now.  Thanks.


Takashi
