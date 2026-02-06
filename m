Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A085D35E521
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770388417; cv=none; b=TIACw3WelJB+QTt6x5RVdnzT722Nvavoe3rnkeGnBSElkfEVhNzfadg2YSA/wIU39F01mQDVC9jwBGQJ2kB+7tcX50I7a/7MjvFyheqrQtIWPZZfqytejNAGGQITcfG4b875DFcbfzP2HA0sRcZqnewkXLTVYDwvgmi8ZeF40kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770388417; c=relaxed/simple;
	bh=iVNVu0QQzGwcSP+WjEU33FXFexLQhI6D2GpZDnb83ZI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=po9srTRBI/zo/9vh7ldviN1kl8b93Umwh1v+E45bbAlTBaGp3JfS8M/GJADTwKb5u6Mz4ra/DlM+MgYNIJwnF3aUAHrHOp8ZPXBdxdTtySR1pjddHAoCmnkwFeRK5hA1DiAqGA3rHv+397ZItJlFdK1zBvnRzK4RNRHQzwQtOMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XysHrvHc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BKzijw/z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=JsecJ7Ke; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xXNntUYT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XysHrvHc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BKzijw/z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="JsecJ7Ke";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xXNntUYT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B430A5BCC5;
	Fri,  6 Feb 2026 14:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770388416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y6f+MkcGYqfvv6xqTq6HcrUMs6OvYxVnPVutpfuUFs4=;
	b=XysHrvHcG4qqSuXs+2TSTXEgTdUGlAjHtoTmNd5ZFDrCn9P57TEO4PcYjludRB0Xfz2kkc
	VVqah3GrARnayIz7hw2M7vtmNQOkKQgAIOcFLVY/KA3dAE8knOZCaqty35UWOH/sFL4Ezz
	NSvtrkYd0sMa8rqNdoq92l8L0Qbbwsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770388416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y6f+MkcGYqfvv6xqTq6HcrUMs6OvYxVnPVutpfuUFs4=;
	b=BKzijw/zcigmuQ455gq0IxcCU4pB9Qwv9CmzrbMLtZ/qPZglxCsQYteZBsyHAizUFQob9o
	eByGbFh+JaIZqjCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=JsecJ7Ke;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xXNntUYT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1770388414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y6f+MkcGYqfvv6xqTq6HcrUMs6OvYxVnPVutpfuUFs4=;
	b=JsecJ7KeWKJNzcd37/V+nZPAjH74xmcbAx5vtMaRC1eZij91lTjf2JyuD3n1vQicZLTx4u
	igAfuItQJKOHH7MUMXQzrbsnnSMt+w8OZeAfcV1vnGKW9tFwIEvegMjeEaecjeccseuBHj
	+Q6lUINyf/O26PL3JclDSGHlgu+qxH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770388414;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y6f+MkcGYqfvv6xqTq6HcrUMs6OvYxVnPVutpfuUFs4=;
	b=xXNntUYT81G3DuUPFyWjIaIqE2szNgSnOHHvbmFQfTf8Y5jBtsiQ2qXTnMOTz2DlWP2dBj
	vIriMXiXfj4DdnBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 745A13EA63;
	Fri,  6 Feb 2026 14:33:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p8sdG777hWnmHgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Feb 2026 14:33:34 +0000
Date: Fri, 06 Feb 2026 15:33:34 +0100
Message-ID: <871piy9c1t.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
In-Reply-To: <aYX13LsGaMjO8X92@sirena.co.uk>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
	<87ms1m9htu.wl-tiwai@suse.de>
	<aYX13LsGaMjO8X92@sirena.co.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: B430A5BCC5
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Fri, 06 Feb 2026 15:08:28 +0100,
Mark Brown wrote:
> 
> On Fri, Feb 06, 2026 at 01:28:45PM +0100, Takashi Iwai wrote:
> > Cezary Rojewski wrote:
> 
> > > +	if (retcmp == ret)
> > > +		pr_info("kctl->put() returned the expected value of '%d'\n", ret);
> > > +	else
> > > +		pr_warn("expected kctl->put() to return '%d' but got '%d'\n", ret, retcmp);
> 
> > So this prints out a message at each access even if it succeeds.
> > I believe this would flood too many messages unnecessarily.  Can it be
> > better to be with debug level?
> 
> > Also, this message doesn't show any relevant information about which
> > card, device and which control caused the error, and that makes
> > debugging harder.  Put some prefix to identify the problematic
> > control.
> 
> Might it be worth considering doing this via trace_printk() or possibly
> tracepoints?  They're very low overhead and with tracepoints they're
> strutured so they're more suitable for very high volume logging.

If we want to record each kcontrol access indeed, then yes, I agree
with tracepoint as the best way to go.  But, IIRC, trace_printk()
leads to a kernel warning, so better to avoid.


Takashi
