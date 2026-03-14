Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B41CFBA
	for <linux-sound@vger.kernel.org>; Sat, 14 Mar 2026 13:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495080; cv=none; b=WQ0xKaI2j+GJgRSRGOVmuRpg1V2UAyfaxt5iPKLxpWIckhXJLtMfGlS+q/WS29MkhxrIfCNllJcNysUQJNoZtADeUB0iM4piyRsw35ryXinvjw4sMhBvScz8tL5NJOdid9msMD13qTG/onUd3MmEVHcn6KI807Cbs0161UuNew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495080; c=relaxed/simple;
	bh=zhIEZP5KzASg+FXGYlH4qwX49bhR8SXSFE1nlHPiSfk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qgoLxVvx8G4R1O0DpvyC15YPHlQgCr67yTb0gpgOQL6BLEIMppFyfrGE00c3b5zA49animnmdjE7TzsSV/6+IqY/FCGo89TdkX+hglk8BGkb4youauxErEV+gjFzqPVq3IEgb9EWZRwyD7KcM0gmT+VzPtgL6AtnraewRhKeb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dDdovwU5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=nqS4jHB/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PdGA2Gmw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3QwFgaWy; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dDdovwU5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nqS4jHB/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PdGA2Gmw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3QwFgaWy"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B57D54D31C;
	Sat, 14 Mar 2026 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495077; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhV1AJPNBcT60oTJMMijqMbgX+pRSTyVwtpEjOzaaTo=;
	b=dDdovwU5UA6wJoKGRT/uwPws4gdWPNHQs3agOUATKIbvkOL7gm4e/HEKFaIsa+nU46a25j
	2TFjZs2r1D1hmkHBjbjB9w/HkS9PY+BQ3o80MUHgwHfOxZ9gcQX/i12hGC2uy2Q/vvS0lj
	u/TLgBT8IsLn157zKLcRCJmE18eVl5A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495077;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhV1AJPNBcT60oTJMMijqMbgX+pRSTyVwtpEjOzaaTo=;
	b=nqS4jHB/x3YPxS20FhF9T4wcqmM6bV2FKfL1PnYRliKjKzEfqu4JVliLmYPCYqqNrZwtif
	s3yQUTwymDMBZKAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PdGA2Gmw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3QwFgaWy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhV1AJPNBcT60oTJMMijqMbgX+pRSTyVwtpEjOzaaTo=;
	b=PdGA2GmwjgBSQ9xCKpvWyikB58GDvXjiu1NNBSwDUGlS8T8lGSnHWaxss4m6BRIHvR35ZB
	B/4xhge3IgLlSxMIvdKMpNE1zbra+k5yZqvH6abOaljB377nSq50krUK2cOcyrofc1Mrx0
	CKN8w1u6sNGEMsNtH4Wsga8Ewh6zHT8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OhV1AJPNBcT60oTJMMijqMbgX+pRSTyVwtpEjOzaaTo=;
	b=3QwFgaWy9sRMT7XhE1jcjp97vd8yssrkveM99oLwYU8Ub9FfVnjgojzhmPBdB09xjetoRc
	TMK2HEsY9refu7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C25A42724;
	Sat, 14 Mar 2026 13:31:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QNy8EyRjtWkJDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:31:16 +0000
Date: Sat, 14 Mar 2026 14:31:15 +0100
Message-ID: <87y0jua670.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Kailang Yang <kailang@realtek.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Zhang Heng <zhangheng@kylinos.cn>,
	Edip Hazuri <edip@medip.dev>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Revert "ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter"
In-Reply-To: <1801fec108ea0047af7b034928f0a5537e6901a8.1773318012.git.sean@starlabs.systems>
References: <1801fec108ea0047af7b034928f0a5537e6901a8.1773318012.git.sean@starlabs.systems>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:32098, ipnet:2800::/6, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B57D54D31C

On Thu, 12 Mar 2026 13:20:20 +0100,
Sean Rhodes wrote:
> 
> The shutup delay workaround fixes the runtime suspend pop, but further
> hardware testing showed that the StarFighter speaker path can be
> controlled more directly.
> 
> The ALC233 speaker path uses LINE2 EAPD on NID 0x1b together with GPIO2
> for the external speaker amplifier, so a better fix is to sequence those
> controls at playback start and stop instead of sleeping in the shutup
> callback.
> 
> Revert the previous workaround before adding the runtime sequencing fix.
> 
> This reverts commit 1cb3c20688fc8380c9b365d03aea7e84faf6a9fd.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Stefan Binding <sbinding@opensource.cirrus.com>
> Cc: Kailang Yang <kailang@realtek.com>
> Cc: Chris Chiu <chris.chiu@canonical.com>
> Cc: Edip Hazuri <edip@medip.dev>
> Cc: linux-sound@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

I don't think we need two steps, but rather fold your update into a
single patch (but give Fixes tag).  It's a change only for a single
device and model, after all.


thanks,

Takashi
