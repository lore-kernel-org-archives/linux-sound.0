Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B977030F524
	for <linux-sound@vger.kernel.org>; Fri,  5 Dec 2025 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764950190; cv=none; b=cO2mWqP8jebeA8dxxfh+pu/dNY3uodJ4+eWy/zwqY02Kdi7jfiTXuxiEbLNmDj5x5RSliCjKPtpujmhf8HCn2DLqF2ubS0XuVh9D6vF+Lqy+rL6wjRSPcKGU2DGwxFr9uK+bfBU1HAoHX4WrXqEC99TrnSR4mdzphhTz4WmpNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764950190; c=relaxed/simple;
	bh=UdHmO4BUeK1cVvqORC0uGrWI2qyEZd4KibGuaXZkvzM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WcQNaE/YurwSv4HIZyqqHGUYa8QlG2hwuHULMkbeSzYmDk+m7EMXT9HQO4QPGZsWN08qB8c2Cp/9a/VrGTxPsycL2za7HIZJsmz6fxq38CQbqI7f3ar7HZBihNc+SozL/PiBKVwbgnpWH//c0E1ljsy/O9wO0EGjqC5yj3bjqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LvpHbkXB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MD3kZPz2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ndssFIVM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=d6qYs4zB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LvpHbkXB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MD3kZPz2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ndssFIVM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="d6qYs4zB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7BE9733704;
	Fri,  5 Dec 2025 15:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764950180; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUgMUp0lcd1WpeV/swW7GnVF2mQbnTDoAk8W//8qkaI=;
	b=LvpHbkXB7LM3bM/ThRB5CJ2+e0qSYbFsphTErGGCPr/qhG2El2MTjgzThzvBTWNOoaJMEh
	iBTtWaCcNfC756sMlzUW9ZTtIRN10O6BsGsQ8IiHgCgIq1xMvlVxOdJWUZHXcdFFBS22sI
	G0717dmlFe2rSw3LURowKHclW0DjOLE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764950180;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUgMUp0lcd1WpeV/swW7GnVF2mQbnTDoAk8W//8qkaI=;
	b=MD3kZPz266Ef52ZY8iT6bFNc2bEl9EfIbHndbFsofZQehgIFi+YNO3P4g5fyRGzJFnNJ3i
	etwPTZuHW9WXzKBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ndssFIVM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=d6qYs4zB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764950179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUgMUp0lcd1WpeV/swW7GnVF2mQbnTDoAk8W//8qkaI=;
	b=ndssFIVMOStssc/LKJyakRODgYSDncZExVTVEqCn+AQnwus/7+djTnDK13ZqWqjGyhCttz
	WCf93aaJif0zq/duO3v2+cKaH1IVShjNh69z1zlcvbvNGen8jIF0KntLCI2f08Pj/lhlUH
	L+6KARyGrysmUSUydSQZI+tIeI+xc5Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764950179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CUgMUp0lcd1WpeV/swW7GnVF2mQbnTDoAk8W//8qkaI=;
	b=d6qYs4zB9bMqGh8pUfByBFD2G+k3D8k4hw4f3WYCqlx2hV0fHXvtLmioxa18n45NTunlxW
	NzcyEjExhH98dmCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2B51D3EA63;
	Fri,  5 Dec 2025 15:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nPTOCKMAM2mDVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Dec 2025 15:56:19 +0000
Date: Fri, 05 Dec 2025 16:56:18 +0100
Message-ID: <87fr9ox6ql.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Joakim  Zhang" <joakim.zhang@cixtech.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org"
	<broonie@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org"
	<conor+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com"
	<tiwai@suse.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
	cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject: Re: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller support
In-Reply-To: <SEYPR06MB6226C1FD56A14F4B0E23FD4A82A7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
References: <20251205111634.3004576-1-joakim.zhang@cixtech.com>
	<87o6odvw5w.wl-tiwai@suse.de>
	<SEYPR06MB6226C1FD56A14F4B0E23FD4A82A7A@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	URIBL_BLOCKED(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,suse.com:email];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,cixtech.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cixtech.com:email,perex.cz:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,suse.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[dt];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Queue-Id: 7BE9733704
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Fri, 05 Dec 2025 16:45:50 +0100,
Joakim  Zhang wrote:
> 
> 
> Hi Takashi,
> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Friday, December 5, 2025 10:30 PM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > Cc: lgirdwood@gmail.com; broonie@kernel.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; perex@perex.cz;
> > tiwai@suse.com; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
> > cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
> > Subject: Re: [PATCH v5 0/3] ALSA: hda: add CIX IPBLOQ HDA controller
> > support
> >
> > EXTERNAL EMAIL
> >
> > CAUTION: Suspicious Email from unusual domain.
> >
> > On Fri, 05 Dec 2025 12:16:31 +0100,
> > joakim.zhang@cixtech.com wrote:
> > >
> > > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > >
> > > Add CIX IPBLOQ HDA controller support.
> > >
> > > ---
> > > ChangeLogs:
> > > v1->v2:
> > >   - fix dt-binding issues
> > >   - remove delayed work for probing
> > >   - refine dma address traslation
> > > v2->v3:
> > >   - update dt-binding commit title and message
> > >     - ASoC: dt-bindings: -> ALSA: hda: dt-bindings
> > >     - use full sentences for commit message
> > >   - rename cix,ipbloq-hda.yaml to cix,sky1-ipbloq-hda.yaml
> > >   - update compatible cix,ipbloq-hda to cix,sky1-ipbloq-hda
> > >   - "cix,model" to generic "model"
> > >   - change the addr_host_to_hdac bus callback to addr_offset field
> > > v3->v4:
> > >   - describe more for both dt-binding and driver commit message
> > >   - remove __maybe_unused for pm ops
> > >   - fix robot compile warning for 32bit system
> > >     - Forced type conversion for
> > CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET
> > > v4->v5:
> > >   - rename "clock-names", "sysclk" "clk48m" -> "ipg" "per"
> > >   - remove "reset-names" property
> > >   - remove "model" property
> > >   - additionalProperties: false -> unevaluatedProperties: false
> > >   - update the dirver since "reset-names" removed
> > >     - mostly is devm_reset_control_bulk_get_exclusive to
> > devm_reset_control_get
> > >
> > > Joakim Zhang (3):
> > >   ALSA: hda: dt-bindings: add CIX IPBLOQ HDA controller support
> > >   ALSA: hda/core: add addr_offset field for bus address translation
> > >   ALSA: hda: add CIX IPBLOQ HDA controller support
> >
> > Applied all three patches now.  Thanks.
> >
> 
> Please wait a moment. I am so sorry that I just noticed I made an elementary mistake when update from v4 to v5, an error return was missed when copying and pasting, sending the v6.

OK, now rolled back.


Takashi
