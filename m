Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06F424A06D
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776262840; cv=none; b=lmOf6hMbz+hABjgSApxQ4ZobNq+oPES0NF5TNoOJtrU+2yFPtvR6A6oxBr4dECmJLFd7xftLNKfjlC82EtT+5z78EfHwac5EIpnNniwUdgMtZCXe7eNGxdDgPYx09Du9o7ZgDIW5zfN9FkFAls7b6LkDFaxC2l60j+u4k4HUeAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776262840; c=relaxed/simple;
	bh=dLFv+SaZa16RAcza0QWp6IQMSPZdWZz7aMedim5iJSw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/MGzvFjoYebBgxHEI/GTKitKWIz/cxjuz2bw8m+PheF71QLhfY+IeqM0Ndu1LsDnLvg7b/l9IuKUeTBwyjZ7TBXTVHRvAuTXT8DtxVJ/SI+KaDXN0xG+TkfZMnKxXAN642eKoOtHims06ltplHAPoUCpDurWNn0FBsA6VC49YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oDcgdA4N; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AS4yNUFl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IYwWl2QD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pPDfx+5u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oDcgdA4N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AS4yNUFl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IYwWl2QD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pPDfx+5u"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D115E6A7EA;
	Wed, 15 Apr 2026 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776262837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ba0bT2f9pzTet7xzsHDf4UdnERMorSiS/xbN5itVly4=;
	b=oDcgdA4N/Ux8Us3fYjXW8/DYTxiOIY377i9ICPcF0Lg2zzklLyEHduBTYHLPg7p/gkSSwV
	Lo+aHfuXomuPVd95EGNRwOzgMp8ViNW1kcNbkW6g4hYjsk8qbfYY22xUrIt/6b5ciYxnEV
	vyLKboXknywOolGpj3Obpaiu55Oh+MM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776262837;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ba0bT2f9pzTet7xzsHDf4UdnERMorSiS/xbN5itVly4=;
	b=AS4yNUFlYQ5QI+HY1w8qvnVjldEIverN69BiGouZ9JI0u4UZQyBg/4epmk0O2Kzg9Dtroh
	tPz5Gd1zMqSwxgBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IYwWl2QD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pPDfx+5u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776262836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ba0bT2f9pzTet7xzsHDf4UdnERMorSiS/xbN5itVly4=;
	b=IYwWl2QDMZLoDpO5NhJTA7E21JEaZxruhBflPX60jkCI+4WNYNzSMMigiNd2tPpWZiUJrP
	XuyH6V7WjIKCCs16hW+gf5U2Lpm1L4RiG/fgYzj1B7ERZn7CSWXBkFyh99s1asKfqCN6pD
	rjUu/t+uF1Og1JVc6+K6bxUXSd2ycl0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776262836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ba0bT2f9pzTet7xzsHDf4UdnERMorSiS/xbN5itVly4=;
	b=pPDfx+5uTohldG/kaPmDxza9/6Ng9BpfcfRS8o611hhelf4Zb24lV4o2+NN3rHf1OJYYsT
	hma+aSGbOJpruQDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B47704BA55;
	Wed, 15 Apr 2026 14:20:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FXtPK7Se32miGQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 15 Apr 2026 14:20:36 +0000
Date: Wed, 15 Apr 2026 16:20:36 +0200
Message-ID: <87cy00fgp7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel Monteiro Pires
 <cassiogabrielcontato@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in avail paths
In-Reply-To: <1720a3a0-2754-4f12-97b0-5304358e0e54@gmail.com>
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
	<20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
	<0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
	<1720a3a0-2754-4f12-97b0-5304358e0e54@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: D115E6A7EA
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Tue, 14 Apr 2026 19:45:52 +0200,
Cássio Gabriel Monteiro Pires wrote:
> 
> On 4/14/26 13:53, Mark Brown wrote:
> > On Tue, Apr 14, 2026 at 01:47:54PM -0300, Cássio Gabriel wrote:
> > 
> >> Commit 61327f3d817c ("ALSA: compress: Pay attention if drivers
> >> error out retrieving pointers") made snd_compr_update_tstamp()
> >> return driver pointer() failures, but snd_compr_calc_avail()
> >> still ignores that status and continues with stale runtime
> >> counters.
> > 
> >> The fallback for an unsupported pointer callback remains
> >> intentional, so keep ignoring -EOPNOTSUPP there. Propagate
> >> real pointer-refresh failures instead.
> > 
> >> -static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> >> -				   struct snd_compr_avail64 *avail)
> >> +static int snd_compr_calc_avail(struct snd_compr_stream *stream,
> >> +				struct snd_compr_avail64 *avail)
> >>  {
> >> +	int ret;
> >> +
> >>  	memset(avail, 0, sizeof(*avail));
> >> -	snd_compr_update_tstamp(stream, &avail->tstamp);
> >> -	/* Still need to return avail even if tstamp can't be filled in */
> >> +	ret = snd_compr_update_tstamp(stream, &avail->tstamp);
> >> +	if (ret < 0 && ret != -EOPNOTSUPP)
> >> +		return ret;
> >> +	/* Still need to return avail when no timestamp is available */
> > 
> > It's not clear to me that the intent there is to only ignore in the case
> > where we fail to update due to the operation not being supported rather
> > than to also ignore any other runtime errors we might encounter (eg, due
> > to the stream configuration).
> 
> Cool, thanks for replying!
> 
> I rechecked the current tree, and the hard-failure class does exist:
> wm_adsp_compr_pointer() can return -EIO and switch the stream to
> XRUN when dsp->fatal_error, !buf, or buf->error, so that is a
> real in-tree case where pointer() failure means the stream itself is
> broken rather than timestamp data simply being unavailable.
> 
> That said, I agree this does not fully justify the generic change as I
> sent it. In particular, SNDRV_COMPRESS_AVAIL and poll() both recheck
> the stream state after the pointer refresh, and there are other drivers
> such as SOF where pointer() can return -EBUSY for a not-ready case,
> which is not the same class as the wm_adsp -EIO/XRUN path.
> 
> I also agree that the current patch is too broad because it uses the raw pointer()
> errno as the policy boundary for avail handling, and that conflates hard
> stream-failure cases such as wm_adsp's -EIO/XRUN transition with
> other conditions like SOF's -EBUSY not-ready return. I can rework patch
> 2 so the behavior is based on a better-defined failure condition instead
> of treating every non-EOPNOTSUPP return as fatal for avail.
> 
> WDYT?

IMO, keeping the behavior could be safer for now.
The erroneous timestamp can be identified by zeros, at least.


thanks,

Takashi
