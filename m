Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D852BD030
	for <linux-sound@vger.kernel.org>; Wed, 19 Nov 2025 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763565218; cv=none; b=rt6++6fXGOXDgcg/Nv/FuC7J2UywDtwZOBg6RI5V/Ii/HRyvJaiFO+AnCMlmHDtZ3sV4usMWPlKhcZzQbipWhxGOV+XE4DxLU61NlgnTD3unIJ5B13DJSJ/1HBmimJzRGh1Oi2Q6iihjHH9MX4F77YV9PGA3jQ7xgdvzgajYtIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763565218; c=relaxed/simple;
	bh=cIsAn/v7ITjK9tgw9IKUmaG/cYp7Ebg079J4VJQxH40=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxHiLXpzQdZOUvBwMnRnCzV4q8T8oFM9napfPss7yUNrWJMNS7isFZYqtLKMT44t+Y4wr8LuB3QRcGmF3Fx95BdTBmQIPQhyNqFOk4XvnEStpnba5Ka7LFbW9OTa5qxk41bOHyrYG3xS4SRpM+TIeqwuKkFucI491s/5UcjXQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nu56K2+R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1pRPjraV; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YotZa+bn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ojt2OXGC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nu56K2+R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1pRPjraV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YotZa+bn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ojt2OXGC"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2400D21196;
	Wed, 19 Nov 2025 15:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763565214; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SL7ms7kzxEqmGffq6DrmOgGm2rlVAuRnJB49No1aGJk=;
	b=nu56K2+RlFO/PWrtJpco5MdhqpAnJQ+hjm7Dy3L8otl1GQrcohyae+YgqoM/qAeHAJH9ZD
	Q69Hcm6chfiKiFTGoyK8kTmhVqi8J/pAe7xMGKEmqQVzDVbAXQ9VN+SlNwJiInNyMTFY42
	cp9u/xea6b50jf5kppYHSsxXfSrNtC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763565214;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SL7ms7kzxEqmGffq6DrmOgGm2rlVAuRnJB49No1aGJk=;
	b=1pRPjraVBhl33WcRgksmdZnbttseQAC0RXNJkupm/+2liHEX6akTeom9ON01qi2VUWAu8/
	LAN8p/Uum5XNQ2DA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=YotZa+bn;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Ojt2OXGC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763565213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SL7ms7kzxEqmGffq6DrmOgGm2rlVAuRnJB49No1aGJk=;
	b=YotZa+bnXZ2u48VMhjZGMXl5G8nZHNFcb2GLfMSVPwshHdWPCQLKvqe0ymrRg+CpdIBJh9
	2B8Cs31wmhnEHn1RmmwKMKMTOTOxgHVSI3swJc/wRHdE6v4aykqqoj8pOBcv2FRtbtWhJz
	8/fHkDvhXJP+etHkJrjfaa0w+Oa5NIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763565213;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SL7ms7kzxEqmGffq6DrmOgGm2rlVAuRnJB49No1aGJk=;
	b=Ojt2OXGCK0gPn5BMdcE9ZlWz4cMp0npubcBZVj4GFIYPs/x9C9Cz4kAiZM3n6pG/mxrJ/r
	AkanSCp3gA5uIfAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 016373EA61;
	Wed, 19 Nov 2025 15:13:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EojaOpzeHWlxIQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 19 Nov 2025 15:13:32 +0000
Date: Wed, 19 Nov 2025 16:13:32 +0100
Message-ID: <87a50icaxv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Ren=E9?= Rebe <rene@exactco.de>
Cc: tiwai@suse.de,
	linux-sound@vger.kernel.org,
	kailang@realtek.com
Subject: Re: [PATCH] fixup realtek/alc288 headphone for MS Surface 2, 3 and 
In-Reply-To: <20251117.210734.507304067570791021.rene@exactco.de>
References: <20251116.162633.1272923634893984527.rene@exactco.de>
	<87ikf8fx70.wl-tiwai@suse.de>
	<20251117.210734.507304067570791021.rene@exactco.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2400D21196
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[2a07:de40:b281:104:10:150:64:97:server fail,2a07:de40:b281:106:10:150:64:167:server fail];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email]
X-Spam-Score: -3.01

On Mon, 17 Nov 2025 21:07:34 +0100,
René Rebe wrote:
> 
> On Mon, 17 Nov 2025 17:20:03 +0100, Takashi Iwai <tiwai@suse.de> wrote:
> 
> > On Sun, 16 Nov 2025 16:26:33 +0100,
> > René Rebe wrote:
> > > 
> > > The Surface Pro 2 and 3 have a strage frequency response and miss most
> > > of the bass. I discovered connecting the HP out to the main DAC fixes
> > > this.  Maybe the other is mono or whatever strangely mixed signal for
> > > the built-in speakers?
> > > 
> > > I later noticed the Lenovo Ideapad 720S (AMD) exhibited the same
> > > problem, so this may be a more wide-spread general bug w/ Realtek
> > > codecs and the hda_auto_parser, ...
> > 
> > Usually in a case like this, we provide a fixed wiring by a static DAC
> > table, or do some other tricks instead of directly writing a verb.
> > 
> > Could you give the alsa-info.sh outputs from those?
> 
> Sure, here is an slightly older 6.16 kernel I had at hand that did had
> my fixes applied:

Thanks.  Could you give the output from the unpatched kernel, too?
Just to make sure.


Takashi
