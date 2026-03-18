Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C627603A
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773845671; cv=none; b=rnDdM1WGdpvVdf+OMUQ0HTgNNWSjmWyX8ii/hejCPOSOPpb4ryUTbDMktnwITA7E73S57hdI7bPn5R34RGesOHq0bNT5q8JW16wDjuE2AQa4Cb9yJ464ZDhJMEHpmjFd1c7v2UNLEXpoMMY+hyf1uWMlqtu1xFqwhQRm876kkBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773845671; c=relaxed/simple;
	bh=qkLFsKsc0W6y3O90aHDb8/Z2ZFjsfmewSnmGfm/Xj1I=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p2diOlha80OZhleW53eYKrBVdCMFIGkK0AWe1ux/55RxbFKNsCZLVjmYTd3J6BHQxPh9Ysm6Idsmtkn5xAekzeQNbMzTB/9jLFRo2h+1HwnPAyHgKr551VNe7ugZDZnH56TEEwWhXbyeHVXCY81EV3qxZZgJ9clkXOIVXZd/nWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fSgbPFMj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RZ/EuynX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fSgbPFMj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RZ/EuynX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fSgbPFMj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RZ/EuynX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fSgbPFMj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RZ/EuynX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BF94B5BEC8;
	Wed, 18 Mar 2026 14:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773845668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8E25LSXPTLO6tJcAcIVjurslfd98Fke7mjgvciMaTyk=;
	b=fSgbPFMjmWzbgpyEhyewMIMwE/hQJSiU3XypUyySYcd/xPABFySrZ/43Sw5Z0DX5pKhiQY
	SrVv94yecmtrUP1YxT1hPTAxMDkuvKDZR+3OtoOs1O8WtbSW0U3tltPeE7NyaxesBSfwo4
	guyoCr+/04E4wY79TPGY4SK6jzHuQaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773845668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8E25LSXPTLO6tJcAcIVjurslfd98Fke7mjgvciMaTyk=;
	b=RZ/EuynXF0j8gnkDImL+wsk8znjbXqyPeVEcYoFLycpAuRHyny3ooz5/hLRQ1EMDrlmBIm
	TDnxYEdlxQmwHtCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fSgbPFMj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="RZ/EuynX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773845668; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8E25LSXPTLO6tJcAcIVjurslfd98Fke7mjgvciMaTyk=;
	b=fSgbPFMjmWzbgpyEhyewMIMwE/hQJSiU3XypUyySYcd/xPABFySrZ/43Sw5Z0DX5pKhiQY
	SrVv94yecmtrUP1YxT1hPTAxMDkuvKDZR+3OtoOs1O8WtbSW0U3tltPeE7NyaxesBSfwo4
	guyoCr+/04E4wY79TPGY4SK6jzHuQaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773845668;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8E25LSXPTLO6tJcAcIVjurslfd98Fke7mjgvciMaTyk=;
	b=RZ/EuynXF0j8gnkDImL+wsk8znjbXqyPeVEcYoFLycpAuRHyny3ooz5/hLRQ1EMDrlmBIm
	TDnxYEdlxQmwHtCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 76D1B4273B;
	Wed, 18 Mar 2026 14:54:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1yvLG6S8umm5fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 14:54:28 +0000
Date: Wed, 18 Mar 2026 15:54:28 +0100
Message-ID: <877br9chnf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	perex@perex.cz,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"open list:SOUND" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: qcom: Fix the license marking
In-Reply-To: <805c7ea8-521f-4f62-b6b1-c5f02c6b84b0@oss.qualcomm.com>
References: <20260317180943.3062085-1-daniel.lezcano@oss.qualcomm.com>
	<87fr5xcqrw.wl-tiwai@suse.de>
	<805c7ea8-521f-4f62-b6b1-c5f02c6b84b0@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,qualcomm.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BF94B5BEC8

On Wed, 18 Mar 2026 15:30:51 +0100,
Daniel Lezcano wrote:
> 
> On 3/18/26 12:37, Takashi Iwai wrote:
> > On Tue, 17 Mar 2026 19:09:38 +0100,
> > Daniel Lezcano wrote:
> >> 
> >> The Copyright for Qualcomm changed its format and replaces the old
> >> Qualcomm Innovative Center by Qualcomm Technology Inc.
> >> 
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> > 
> > Applied now.  Thanks.
> 
> 
> Thanks Takashi
> 
> In case you missed it there is this trivial patch [1] to be acked-by
> or merged with Bjorn immutable branch [2]
> 
> [1]
> https://lore.kernel.org/all/20260316171419.2619620-5-daniel.lezcano@oss.qualcomm.com/
> 
> [2] https://lore.kernel.org/all/abdkE2qWX5Amf5Jo@baldur/

Well, I already gave my ack about this so that it can be applied in
other trees.  As a really trivial change, I don't mind who to take.


thanks,

Takashi
