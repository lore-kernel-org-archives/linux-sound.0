Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2800030EF6A
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401513; cv=none; b=DrcRXO6ZwcLhobUXSWiuu8tzpnhwd3VgUWqxPuS9UAlLQmRtjdcW2H0cqLxZhVkHb4GEss432FwRt+1pWFxHGDi5IcHdzzZ7V5u24f3/rwKu/gWtyVfN0PRrdzq3gdN4I4skz3J9ULcx3ZQ0hkN2vi0jmWjAVMQ050WRlYNR05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401513; c=relaxed/simple;
	bh=Rs27Usaz7L6HVo4OGKe+9+FAq8qms9/BJ0LhGzdidBs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GMOM1K6edrDSaia/cqkE6XrJIa3Bh7asxoE8TivEGRNV2+XXXq0dMas/NEsrth0BsmXC1aCTX4gXpgC4TN0tB0Tk0b3ZK1LQ4iL3MqNMO9Te6oJ310sP80F1vPZn/WyBZxezr7aWrNMi+CV9Toroi7buWWG+AD+d6XyotlIpUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gv8d0j+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eOlRTJw4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gv8d0j+y; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eOlRTJw4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gv8d0j+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eOlRTJw4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gv8d0j+y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eOlRTJw4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 66E543E6D0;
	Wed, 18 Feb 2026 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771401510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKmsprT47VGrxo1P/ikjK8oWrcJTkXArMt7eRGFLDjQ=;
	b=Gv8d0j+yUDWEYyVSsLMdQaAS9yD7DkWukREaoONRaAhX8g+XXrGVniIktRMYh6SrEz9y/5
	soQhxQGdaPQp5yh5TdUTaPGiNjO6Jl6kzXZLSqj4FqjxyqRseI/ArogQzozBD2WX9IrZXz
	igAys9G6p2ohOPav7Mx41GBiBlRa6So=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771401510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKmsprT47VGrxo1P/ikjK8oWrcJTkXArMt7eRGFLDjQ=;
	b=eOlRTJw4Tphv7eH2UsBXPyR6YALwb0FsvWoZp3odrdw8aakW+SZLY4+dF0Quzn6johe/Dh
	jVh70RjDPcw5nwCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Gv8d0j+y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=eOlRTJw4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771401510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKmsprT47VGrxo1P/ikjK8oWrcJTkXArMt7eRGFLDjQ=;
	b=Gv8d0j+yUDWEYyVSsLMdQaAS9yD7DkWukREaoONRaAhX8g+XXrGVniIktRMYh6SrEz9y/5
	soQhxQGdaPQp5yh5TdUTaPGiNjO6Jl6kzXZLSqj4FqjxyqRseI/ArogQzozBD2WX9IrZXz
	igAys9G6p2ohOPav7Mx41GBiBlRa6So=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771401510;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cKmsprT47VGrxo1P/ikjK8oWrcJTkXArMt7eRGFLDjQ=;
	b=eOlRTJw4Tphv7eH2UsBXPyR6YALwb0FsvWoZp3odrdw8aakW+SZLY4+dF0Quzn6johe/Dh
	jVh70RjDPcw5nwCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2511E3EA65;
	Wed, 18 Feb 2026 07:58:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1+60ByZxlWkGBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 07:58:30 +0000
Date: Wed, 18 Feb 2026 08:58:29 +0100
Message-ID: <87wm0aa3fe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	pochini@shiny.it,
	linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: echoaudio: Add SPDX ids to some files
In-Reply-To: <20260212234928.3739815-1-tim.bird@sony.com>
References: <20260212234928.3739815-1-tim.bird@sony.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,sony.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: 66E543E6D0
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 13 Feb 2026 00:49:28 +0100,
Tim Bird wrote:
> 
> Add SPDX-License-Identifier lines to some files in the
> sound subsystem - mostly in the echoaudio drivers.
> Remove boilerplate GPL headers.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>

Thanks, applied now.


Takashi
