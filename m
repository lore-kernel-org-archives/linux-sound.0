Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9790A252911
	for <linux-sound@vger.kernel.org>; Tue, 11 Feb 2025 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286697; cv=none; b=Rj1i2FIwuJElzoLhzDr3dM4YRJcZk+Gpj3hqhSeRRJaMB5AtobbxbaYaLCtmnM0JuXI1csTrVnjYyZDj2bxW98OdULo98m+UdHHnV9h6TuSoMQ6CqW0tUHIbKeeWRW8SeqIIGyZg7LR8uQFSzOkBj77v3UASVyXyMwIXhXtXNW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286697; c=relaxed/simple;
	bh=F72WeCmsM2FXFnz3D9RuoChBrFReTMcxAjsvwTisVcA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpxlVFLEKlKRdBh0MrJC6wImNpM3UV6vVRv+KsmYg9BOPq1MNFj5YDTS2OCZu1UzvZVUUtYAyNvhkJAk/DZymZbTyb7kOj7bnbAFLEJ2Iwg4UuHSmxADAJB0yqdIzEVEdY68fe9Z4F2rmOX7qobe3FcZS2bT2pijI7zBx7RyWkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3zHfh28; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGFJdD8P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N3zHfh28; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JGFJdD8P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3zHfh28";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGFJdD8P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N3zHfh28";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JGFJdD8P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 80F0861474;
	Tue, 11 Feb 2025 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739280818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTozy+xUUJ5Hr1/VRAzSsXln22X6ria+rtcQe0mSc4Q=;
	b=N3zHfh28CqxtJ2y5HoMD6OKRt9TDweZ0B13ooam4IkRM6nZ521sUTQ2EFrlDJTpiTbgbIJ
	+SrguzKUDLuGHFre05NSHcjIUOHWfFEhR9UoXyO6BqO9VC1/lRg3L5ZTxkwmUeeqcuXMB5
	SkR8PWpy7A9Ew2b2ZIquIDiRF4EZ8Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739280818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTozy+xUUJ5Hr1/VRAzSsXln22X6ria+rtcQe0mSc4Q=;
	b=JGFJdD8P8wLRUrDnYkXbA3A0MA0sJcN0hRtEdaPGT2t8slJixhsSMvi0ImkQF/Z/I3xN9f
	q1HagMb1b20ayZAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=N3zHfh28;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=JGFJdD8P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739280818; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTozy+xUUJ5Hr1/VRAzSsXln22X6ria+rtcQe0mSc4Q=;
	b=N3zHfh28CqxtJ2y5HoMD6OKRt9TDweZ0B13ooam4IkRM6nZ521sUTQ2EFrlDJTpiTbgbIJ
	+SrguzKUDLuGHFre05NSHcjIUOHWfFEhR9UoXyO6BqO9VC1/lRg3L5ZTxkwmUeeqcuXMB5
	SkR8PWpy7A9Ew2b2ZIquIDiRF4EZ8Uc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739280818;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uTozy+xUUJ5Hr1/VRAzSsXln22X6ria+rtcQe0mSc4Q=;
	b=JGFJdD8P8wLRUrDnYkXbA3A0MA0sJcN0hRtEdaPGT2t8slJixhsSMvi0ImkQF/Z/I3xN9f
	q1HagMb1b20ayZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C5D913AA6;
	Tue, 11 Feb 2025 13:33:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id K650EbJRq2fbOgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 11 Feb 2025 13:33:38 +0000
Date: Tue, 11 Feb 2025 14:33:37 +0100
Message-ID: <87h6508v2m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Takashi Iwai <tiwai@suse.com>,	Mark Brown
 <broonie@kernel.org>,	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Change device numbering
In-Reply-To: <d895d47a-7705-4cc5-aefc-5ea87fb79c84@perex.cz>
References: <20250127144445.2739017-1-amadeuszx.slawinski@linux.intel.com>
	<f8f2b8f9-527e-486d-ae83-34abd13ef968@linux.intel.com>
	<6fcbc9d3-93d4-4485-9f9f-5bef61476ef3@perex.cz>
	<811c03ef-03a2-44a3-969b-5a2d55f2f876@intel.com>
	<2a772972-3011-4083-9d5d-e1bfe297998b@linux.intel.com>
	<50f5fa11-55f2-4928-97a6-b4758e8d9d52@perex.cz>
	<fabca478-69cc-436e-b0c4-2ffec183e66a@linux.intel.com>
	<675dba40-e559-45bf-b9ec-65f4d4c60923@perex.cz>
	<4c46ebfa-2892-462f-9f6f-98bec8620e5a@linux.intel.com>
	<d895d47a-7705-4cc5-aefc-5ea87fb79c84@perex.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 80F0861474
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 11 Feb 2025 14:30:42 +0100,
Jaroslav Kysela wrote:
> 
> On 11. 02. 25 11:53, Amadeusz S³awiñski wrote:
> > On 1/31/2025 5:18 PM, Jaroslav Kysela wrote:
> >> On 31. 01. 25 13:41, Amadeusz S³awiñski wrote:
> >> 
> >>> So, as I understand you want something like the following and to
> >>> differentiate cards in UCM using component?
> >> 
> >>> - card: 0
> >>>      id: avshdaudio
> >>>      name: avs_hdaudio
> >>>      longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
> >>>      driver_name: avs_hdaudio
> >>>      mixer_name: Realtek ALC285
> >>>      components: HDA:10ec0285,17aa225c,00100002
> >> 
> >> The short name (name:) may be better like 'AVS HD-Audio' (almost all
> >> ASoC drivers suffers here), but the proposed driver_name is fine from my
> >> view.
> >> 
> > 
> > We had some more discussions, what about something like:
> > 
> > card X: HDAudio [AVS HD-Audio], device X: HDAudio Analog () []
> > card X: HDMI [AVS HDMI], device X: HDMI 1 () []
> > card X: ALC274 [AVS I2S ALC274], device X: Audio () []
> > 
> > - card: X
> >     id: HDAudio
> >     name: AVS HD-Audio
> >     longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
> >     driver_name: avs_hdaudio
> >     mixer_name: Realtek ALC285
> >     components: HDA:10ec0285,17aa225c,00100002
> >     controls_count: 14
> > 
> > - card: X
> >     id: HDMI
> >     name: AVS HDMI
> >     longname: LENOVO-20KH006LPB-ThinkPadX1Carbon6th
> >     driver_name: avs_hdaudio
> >     mixer_name: Intel Kabylake HDMI
> >     components: HDA:8086280b,80860101,00100000
> >     controls_count: 21
> > 
> > - card: X
> >     id: ALC274
> >     name: AVS I2S ALC274
> >     longname:
> > IntelCorporation-CannonLakeClientPlatform-0.1-CannonLakeYLPDDR4RVP
> >     driver_name: avs_rt274
> >     mixer_name:
> >     components:
> >     controls_count: 17
> > 
> > it feels like it is more descriptive.
> 
> It looks much better for driver name and card (short) name. It also
> shows, how the DMI auto-generated long names are really broken and
> confusing for users.

Agreed, let's go ahead with this.


thanks,

Takashi
