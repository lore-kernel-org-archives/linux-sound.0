Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82001D359A
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849153; cv=none; b=mkAZXx30iAiMgYrYigXvnYriWWh3DaK7+caIcB77tqdgcXazNQJzfkRAdOaaMaw6zbcZcZ6+9b3x9/ec2hXn4cZnnuLL+20BOLnKRZCyiw5vVaYJuslWu5XBmYihvvjM+v4jlDFligQ6Z3KTf0cS21eJKBjF39YkAwbb/o0NU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849153; c=relaxed/simple;
	bh=jQ//5HHZH8T6N5pVwaDjObpUIcEBoVlNXkQjjBxrApE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OiklT81As3Ow0ZE412i65KMvpL9UbuQhQwngavoJhGRFnj9fZNdoVxgN1PDexNLzfRYab/1TO8gag3L8ilQZ0ACIe5G8BAPaK6SWZ41uiUptg4mYE8kCB72l7EJbNBsLxhnlUgfFCw3Elt9M+f5gwj0kTtB4yR0Z+H6gzKgg8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oa818Osb; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aOnEYfgr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=L1bDVkOr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yBKIq3/c; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oa818Osb";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aOnEYfgr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L1bDVkOr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yBKIq3/c"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E44461F7E0;
	Fri, 25 Oct 2024 09:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729849149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOGae0MXifI2pSigJrzQ5lwio+kAQy4dTwxC2t7bxJo=;
	b=oa818OsbjphoGO6LxsyQyEayufnvDpnLTyqoZhAl4Od1Vtz3uFoc9G/fwT8bH1hoANQsDz
	PRLpKYuo1wWrlgKE1yhdIsLdl4KAZcGX+k9yT63o2pv7oHrLZvTQh3rnFg4r3mj3ggWsKw
	5cSVLytroakyimgSeyYUploSNUB9ufs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729849149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOGae0MXifI2pSigJrzQ5lwio+kAQy4dTwxC2t7bxJo=;
	b=aOnEYfgrgoYsE0U7r8K9780BPvEEBVDA86C94Hm5LilcNmJzL0ykd+tSKfcxlUOXlMw/VR
	TQYW77b4xObgrECw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=L1bDVkOr;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="yBKIq3/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729849148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOGae0MXifI2pSigJrzQ5lwio+kAQy4dTwxC2t7bxJo=;
	b=L1bDVkOrV2n/VKdLf7R2Kww/oaW4xNPk8o+vj9IYdn8EqiQT5bXmVPh1cWDqNXg36XmGNS
	p3QzIbf8hqPPQ/r2yOPicLZfyisS7NKuEoX0MUKF2whpGSMqK44P1lsan7uK/B46+WySzZ
	mFQfz23Cb5NO9MeyZSXGSt9xDwIjOwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729849148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EOGae0MXifI2pSigJrzQ5lwio+kAQy4dTwxC2t7bxJo=;
	b=yBKIq3/cgb3Kea0fSjUlkmcktX2G7zi4eIOg50+mYS/5X48ttTzn3U0slhkmLHOVTwWPRP
	JoCGenZLLrdG38Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A83AE132D3;
	Fri, 25 Oct 2024 09:39:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wAnrJzxnG2d0egAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 25 Oct 2024 09:39:08 +0000
Date: Fri, 25 Oct 2024 11:40:09 +0200
Message-ID: <871q04ttae.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,	Jaroslav Kysela <perex@perex.cz>,	Linux
 Sound ML <linux-sound@vger.kernel.org>,	Mark Brown <broonie@kernel.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,	Amadeusz =?ISO-8859-2?Q?S=B3awi?=
 =?ISO-8859-2?Q?=F1ski?= <amadeuszx.slawinski@linux.intel.com>,	Pierre-Louis
 Bossart <pierre-louis.bossart@linux.dev>,	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
In-Reply-To: <CAA+D8AN+x72+898v+VuLqwxT5Vh3KVBabkuArH6Cs49w-ZDs8g@mail.gmail.com>
References: <20241002093904.1809799-1-perex@perex.cz>
	<87seso2pgm.wl-tiwai@suse.de>
	<875xpgtv9o.wl-tiwai@suse.de>
	<CAA+D8AN+x72+898v+VuLqwxT5Vh3KVBabkuArH6Cs49w-ZDs8g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E44461F7E0
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_ALL(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,intel.com:email,suse.de:email,suse.de:dkim,suse.de:mid,linux.dev:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Fri, 25 Oct 2024 11:15:58 +0200,
Shengjiu Wang wrote:
> 
> On Fri, Oct 25, 2024 at 4:56 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Tue, 22 Oct 2024 16:15:53 +0200,
> > Takashi Iwai wrote:
> > >
> > > On Wed, 02 Oct 2024 11:39:04 +0200,
> > > Jaroslav Kysela wrote:
> > > >
> > > > There is a requirement to expose the audio hardware that accelerates various
> > > > tasks for user space such as sample rate converters, compressed
> > > > stream decoders, etc.
> > > >
> > > > This is description for the API extension for the compress ALSA API which
> > > > is able to handle "tasks" that are not bound to real-time operations
> > > > and allows for the serialization of operations.
> > > >
> > > > For details, refer to "compress-accel.rst" document.
> > > >
> > > > Cc: Mark Brown <broonie@kernel.org>
> > > > Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> > > > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > > > Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> > > > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> > >
> > > Are there any objections to this extension?
> > > Otherwise I'd like to pick up for 6.13.
> >
> > Now the patch got merged to for-next branch for 6.13.
> >
> > I opened a topic branch "topic/compress-accel" that is cleanly based
> > on 6.12-rc4.  The further development can be based on this one.
> >
> 
> Should I send v5 to drop this commit from my v4 series?
> [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC

Yes, it's better to have a refreshed series.


Takashi
