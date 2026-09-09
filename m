Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C046EC72
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 15:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966737; cv=none; b=J8PzheUbRjuARXAS+4FG8hHPdm1L0AQJaLFE2Y/irdjbHUjHiv1+lRwxa4CwLrZE/rf0cgDRpoon/ByTjR4AIlEk/cATosG6MW9CUyV0esNsr67kf8IXxo4zxnCU1Gwt46UU71FrEbQXjyVYiBFyn4/to6V90ZLbms1R9QU5XPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966737; c=relaxed/simple;
	bh=5WZDSrKPgi0xuO79ir9/Gynk4at16TR4dGrodnq4vss=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmPMFlIRffCln0m2HhpGWCSF2Gb2i2zTZspt4lMoyt2YYsWtAr3WW1Kgk1ZkwQtSRLplVEMr4CbRQ8TvrX/Em4+EJnwOhEARld5rFcnofTTLPGZanGb+SrRs/gE4ZfQlEFHRY1Ml5n4fCqqkzArEf47iAGrQWgdgRnbzpGoTm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mJjPqFtA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7VbIlz0K; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QUTS3T3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7+0hiIob; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mJjPqFtA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7VbIlz0K";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QUTS3T3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7+0hiIob"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 283B822232;
	Wed,  9 Sep 2026 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788966730; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7k4smYAncgJuhcdGrcROwc4zzwf1LoepRwc8yfDjOs=;
	b=mJjPqFtA039O8YmEaWfoc27wQvA3ZeOdy8ZJTeJEcL0m+EnhKVlIQoJc5vfIE+7kLYOUGB
	Zb+9aDkvXVvORMc6eC04sZzofAGQs3bssrAuP22yvGFDbNX2M6aSTk+NXKobSg4gRlqYGl
	H5tTNS6oyrDxxR5YEUOyUAQ67zQUEVc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788966730;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7k4smYAncgJuhcdGrcROwc4zzwf1LoepRwc8yfDjOs=;
	b=7VbIlz0KnfeOq2KDaPbxGyHK8gE7Hx2gJONoCqAyBR+Cy4s5w3VPJa0dXB3QyDRBCaZQx0
	Nl74GCFPWI5TAmDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788966726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7k4smYAncgJuhcdGrcROwc4zzwf1LoepRwc8yfDjOs=;
	b=QUTS3T3OxuCz4w1mb7zCaqxdCNTUQMs7iRQrSIxD2sa+0K17DnKvQmXPk7a0/v1g5DkGl/
	cucjwi7ugHwRgzVGKgOOFQ9aXmCwyokPGVrKrrbNoQ1z6M8sh0FV5IDlkXuhswTp7s7bCn
	TxIsgWfsG8pFJoXN6nQQDzk+f1tHOco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788966726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7k4smYAncgJuhcdGrcROwc4zzwf1LoepRwc8yfDjOs=;
	b=7+0hiIob3hEXHMUWszVGZr+JqicJLA6zr5RIrJFS0nOHYi4FWwBp+TLbx3lkSNyibDniqg
	EicdVV3hbj1ey2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B69A513223;
	Wed,  9 Sep 2026 15:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xrM3K0V3oWq5CAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 09 Sep 2026 15:12:05 +0000
Date: Wed, 09 Sep 2026 17:12:05 +0200
Message-ID: <87qzj2mpbu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: Re: [PATCH v2 01/24] ALSA: compress: pin card module while stream is open
In-Reply-To: <20260909090949.7503-2-peter.ujfalusi@linux.intel.com>
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
	<20260909090949.7503-2-peter.ujfalusi@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,oss.qualcomm.com,vger.kernel.org,linux.intel.com,linux.dev,nxp.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 09 Sep 2026 11:09:26 +0200,
Peter Ujfalusi wrote:
> 
> Take a module reference in snd_compr_open() and release it in
> snd_compr_free(). This pins the card driver module for the
> lifetime of an open compress stream and prevents card removal
> while the stream file is still in use.
> 
> Adjust the open() cleanup paths to drop the added module
> reference only when it was acquired, and keep release ordering
> safe by dropping the module reference before freeing stream
> data.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>

In case this going through Mark's tree:

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
