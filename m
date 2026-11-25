Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613730;
	b=p2pOulheV872rKQX9fEwC+96SNKOnwG1KSghIh0lLN3AdnGBFmekjzyjb/dX43K5+7Z7
	 P6K3cu/yTbmxPK4nyM8ZgH4IB9czand88Geh+h2JjE9gI3Lskh61FvZ8pbfaYMAlzQWiP
	 1E4BmiW50mbcvbyTHWFapH4HVGivsuKfNOsag20vEc1dG5LbCuQUhUVAB2zM9eL0xNV2h
	 v3DFK95m1dWwtMhpToT14NB3dQqBkrdxdeSTL7eWgGKPlTGWR3CrM3r5wgVAhzAn7DX8i
	 O6Q/E9aBJ1OTMg285DrVev+Q7oeDCNAftPFXMXln6BI3VGgAHuuf74oSglWUOdYQInw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613730;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=YyuN4v/mK36dRkCoe7q/SOnilzCa2Fp0fWFXKhZ9HnQ=;
	b=uKojzIQGOW62zfsuQ4ZMATFiKb/4TdhKFCo4rXjbQuZ/iUNdyNAnu7uYb4VjiPCqaz5t
	 dv5UpOFBefTrmnMCGBProTprvl6Z9CJbmsUCXAm4DCbQj86hSPbl1antTbe5eXWxDCvtI
	 2qbpTjTdS8bH1WZIPRk8ngqEOOygBlwu0ZgFdf5/S1s3KON35YYD8+x9ZBpOKKuIEuIm5
	 kIDGEewdmrrNIfayEaMBsQopBQ2uJXi5KtIYGmICGBtJG6mZVP81bCP+i9CCybzooc0Sr
	 +MzjwpQVXcJ4UBWIihkbmWMthjMR0oF5iC8NSPoHGV4tQVIMCXqsMnXmVe0TV47CLUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q7Xmi6zS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lnsrGDvF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eC8G7PRK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+W9WLiLK;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F345606A335;
	Wed, 25 Nov 2026 13:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F345606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Q7Xmi6zS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lnsrGDvF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=eC8G7PRK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=+W9WLiLK
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A231D21F5C;
	Wed, 25 Nov 2026 13:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795613727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YyuN4v/mK36dRkCoe7q/SOnilzCa2Fp0fWFXKhZ9HnQ=;
	b=Q7Xmi6zScLqGjS0Aces7iNVAPJuDfoDD269CiKI6h/A451HMM528yzAuhC+dtulGpvrBm8
	edXgFRJ160nGTDh2dJAfgtpiJaoXJgSHKZKMHabcObPIpg0mbpuvGMSh26lXqvJDgpJmZC
	O9K65wylcmexX7yR54CF/bdvpv3kh6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795613727;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YyuN4v/mK36dRkCoe7q/SOnilzCa2Fp0fWFXKhZ9HnQ=;
	b=lnsrGDvFFprZ8eGw96WUesN1Y0TtldWTWljL0gBqWEMHLVCTXBNzfenRPyrqCsOCkDFWR5
	pelEqCo41nygtCDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eC8G7PRK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+W9WLiLK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795613725; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YyuN4v/mK36dRkCoe7q/SOnilzCa2Fp0fWFXKhZ9HnQ=;
	b=eC8G7PRKsLoyGcOggPxp3yXhFTvgpQ0XgEXmu0VfUjKUiDXwwz23CAM/TUuXt5v2gAh/FS
	OocYhafGPhf6VZlTvgrVC6UVsXBijYJH/E12nkQ738/PrBCXm1azhgtx+ohTV9lcWeFqtD
	gKBGN9KJDK22Y63gZ9sAP+zPaZyO1ng=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795613725;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YyuN4v/mK36dRkCoe7q/SOnilzCa2Fp0fWFXKhZ9HnQ=;
	b=+W9WLiLKH3oLAA9PIMLPKDAQxausyygdy7tMYYfJ5NFTKJBzuSQIIy1rgFOQx37v9iFpzU
	VYfhbBbS9xambYAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A2701339F;
	Wed, 25 Nov 2026 13:35:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id di1ZDB3kBmtzLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 25 Nov 2026 13:35:25 +0000
Date: Wed, 25 Nov 2026 14:35:24 +0100
Message-ID: <87zeux6nkz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH v4] ALSA: core: Reject zero major number
In-Reply-To: <20261125093538.4974-1-sreekuttan2156239@gmail.com>
References: <87o6bd8ijb.wl-tiwai@suse.de>
	<20261125093538.4974-1-sreekuttan2156239@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: A231D21F5C

On Wed, 25 Nov 2026 10:35:37 +0100,
Sreeraj S Kurup wrote:
> 
> Reject a zero major number before calling register_chrdev(),
> as ALSA expects a fixed major number.
> 
> Remove the redundant major variable and use snd_major
> directly with module_param_named().
> 
> Keep a separate configured card limit for automatic
> module loading, as snd_ecards_limit may increase at
> runtime when cards are registered at higher indices.
> 
> Update device number creation and character device
> registration and unregistration to use snd_major.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

Applied now.  Thanks.


Takashi
