Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFB5387584
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721582; cv=none; b=pXC+yo2AvDUVLoCLovTNWNHBGvt8d3owPDlAzx3jeekO8VM77hiNAwGwyhvLO2Gb2k1fnxd7bWYxnoGR5EF11aNWvQs3VZ8gfx6VUDSMglJKjpA0EirLqNnu3FmRw33/iUrbcw9l9Mo8bojkhzCJ3tqyH+jWBPaZrpPSD0H2R7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721582; c=relaxed/simple;
	bh=IbZsP8ICO/NLIxmAOApzmVHYGjMu+B95x0GJ11HRIHU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fLyAQgr4B0mqS5/1Nj+smxsPoaxmwsUkhWmsRs47xxsKDWVZ2gwwm4bs3JM+tQyLwEWWQuGfp2q94JSuYNUYaigFHjapZUjQBJuyeryH28yIX868GYivUKmP75DzA/xFlac7S9CPGeyyrOlH3lfmMeq5RgjHy0U0734wOhxFD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0NoET2n8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pd5tKf/D; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0NoET2n8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pd5tKf/D; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0NoET2n8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pd5tKf/D";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0NoET2n8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pd5tKf/D"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D3F135BCEB;
	Thu,  9 Apr 2026 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775721579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VhGB5tn+hoek/vFqjGru1nHoa1FDStpHE0X7Mh2tL/M=;
	b=0NoET2n8idvyNtQHLP2ZFglvbKPaSYhcC9uMb4301C5nD6Ei9TFCWytraSHTYr7fLEJFtz
	VhLXRnFdtdkPP2fD3iPQCj6P9LbLQLAnxArBGwZqVOAGrKkPq/BPUblwlsl7IAndBYfQdN
	YxA9axBp1Ki51yxVY0AoUTzbbwCKkUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775721579;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VhGB5tn+hoek/vFqjGru1nHoa1FDStpHE0X7Mh2tL/M=;
	b=pd5tKf/DsR2YcVepRk0WjviFbEfow7DNsgG0ftn0BeJaoS4Q0RPOZtXYhK3Inml+c3ndGp
	C3vn36PsolrWLJAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775721579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VhGB5tn+hoek/vFqjGru1nHoa1FDStpHE0X7Mh2tL/M=;
	b=0NoET2n8idvyNtQHLP2ZFglvbKPaSYhcC9uMb4301C5nD6Ei9TFCWytraSHTYr7fLEJFtz
	VhLXRnFdtdkPP2fD3iPQCj6P9LbLQLAnxArBGwZqVOAGrKkPq/BPUblwlsl7IAndBYfQdN
	YxA9axBp1Ki51yxVY0AoUTzbbwCKkUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775721579;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VhGB5tn+hoek/vFqjGru1nHoa1FDStpHE0X7Mh2tL/M=;
	b=pd5tKf/DsR2YcVepRk0WjviFbEfow7DNsgG0ftn0BeJaoS4Q0RPOZtXYhK3Inml+c3ndGp
	C3vn36PsolrWLJAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A21284A0B3;
	Thu,  9 Apr 2026 07:59:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DShPJmtc12lOcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 07:59:39 +0000
Date: Thu, 09 Apr 2026 09:59:39 +0200
Message-ID: <87jyugk1hw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: Takashi Iwai <tiwai@suse.de>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for CSL Unity BF24B
In-Reply-To: <f66e3c00-5280-4d35-9e95-2d142e4f1458@kylinos.cn>
References: <20260409024028.1297587-1-zhangheng@kylinos.cn>
	<873414lnyf.wl-tiwai@suse.de>
	<f72b3ebd-a7f3-4a1a-a48e-bbbbb67b18de@kylinos.cn>
	<87mrzck34i.wl-tiwai@suse.de>
	<f66e3c00-5280-4d35-9e95-2d142e4f1458@kylinos.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 09 Apr 2026 09:51:44 +0200,
Zhang Heng wrote:
> 
> Do we still need to consider HDA_FIXUP_ACT_PRE_PROBE
> 
> and HDA_FIXUP_ACT_INIT?

With my proposed change, only HDA_FIXUP_ACT_INIT is needed.

Of course, it pretty much depends on how the GPIO bits are handled.
For a volatile toggle like your case, there is no need to cache the
value, hence the direct call to handle GPIO bits is better.  OTOH,
for static GPIO setups, the caching can work better as is now.

In anyway, I already applied your original patch.  After cooking up
the whole, I'll submit the cleanups.


thanks,

Takashi
