Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693537DE84
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 08:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776758908; cv=none; b=V4z5/p+XN9EIJq428gx2SMaRG4f4tQaHIVyiEd5BPL4dnIFmvCNOc2EJYP3KajOyAd7BcZIATSF+/B3XO39fEfyar1LbZlVz+i9QhjxlV2ZH6lVcTx7945t8z6ZFu4z2/azzLZeemjTtgGP5hBUm0t4POII2CwU3sS7ZwoER2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776758908; c=relaxed/simple;
	bh=qckNuy6BRKHCCm74hNZrqX+NfMREeQ6h/qiDWCj4fXs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ys1JQPnneaxSp1BvPMxSq0RUwVSjQ3++einbjwIlMxm1nOMbMy/3RbAALusYAue9FFbmViJguUn3D4m76SDNq/UxmYADDtD3j3Gu2bhmUnXaT7gJA67MhpE8nK69nw6uw9xiqxyMc6jhY21LJAV7kQa0W0HV472fX7vBbop11QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lAxLZtyD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GF+MrIxt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uIHMIIrt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f7XIVeqD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lAxLZtyD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GF+MrIxt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uIHMIIrt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f7XIVeqD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 404D95BCF0;
	Tue, 21 Apr 2026 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776758905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49LZJ6cy9+43wjjHxVQH61n7bNFuCeV2IYvn2T/ZT1k=;
	b=lAxLZtyDkd3lHG0CQLgd+qDLqGMHLrNGSeHzrgSlM/iW+BwbTTTDzRzTlZ4OYNKXsnsjqM
	uMufSDCT6QfyBktST81+Wi1zKtNC9szxS0RXt4PIK+Rg0F8c/PGI8nx98WG1ynX6BzAu81
	syGLq4ve7F0dSzn1aq8xohLAtqofYoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776758905;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49LZJ6cy9+43wjjHxVQH61n7bNFuCeV2IYvn2T/ZT1k=;
	b=GF+MrIxt2o78coVx59rjmjx2mO/VRaTGArLgfSMbTv3GP2as2TaOOeUcQJrIKxpvw3qkV1
	4imUIaiYkWxHW8BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776758903; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49LZJ6cy9+43wjjHxVQH61n7bNFuCeV2IYvn2T/ZT1k=;
	b=uIHMIIrtuPBuMo+LZKktX4jAARmQn67PPeG/S9K7OOH12aptJqrqZnbkS7L101/ylWZaZQ
	CcW549wYq5akLq7SbRCScI7d+xVuPRcI4CA42kCyEzyjUMTfsOd4Qbi/JOm53eKHtjFROk
	/TwqLYsTi4e8LJO9Y7Ca1MFLR9Tts6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776758903;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49LZJ6cy9+43wjjHxVQH61n7bNFuCeV2IYvn2T/ZT1k=;
	b=f7XIVeqDi6jUslENm6nZI/Rsms+HmJKZjlN5oURGYz03mqgWGUfg6pqA7xJY/LA5Mqnlqt
	vO+4YvaXEGR5RVDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AD002593AF;
	Tue, 21 Apr 2026 08:08:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ol4eKHQw52ltUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Apr 2026 08:08:20 +0000
Date: Tue, 21 Apr 2026 10:08:20 +0200
Message-ID: <87wly0ag7f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH] ALSA: usb-audio/line6: Add support for POD HD PRO
In-Reply-To: <20260420152405.7230-1-willerz@gmail.com>
References: <20260420152405.7230-1-willerz@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.28 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.18)[-0.876];
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,perex.cz:email,suse.com:email,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.28
X-Spam-Level: 

On Mon, 20 Apr 2026 17:23:49 +0200,
Phil Willoughby wrote:
> 
> The POD HD PRO is the rackmount version of the POD 500, with most of the
> same behaviors. As with some of the other rackmount POD devices it will
> not send captured audio to the host unless the host is sending playback
> audio, so it has LINE6_CAP_IN_NEEDS_OUT in addition to the POD 500
> flags.
> 
> Tested-By: Phil Willoughby <willerz@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Signed-off-by: Phil Willoughby <willerz@gmail.com>

Applied now.  Thanks.


Takashi
