Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F02D876A
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441686; cv=none; b=EBlI4WPweliZR973FS/YMDMLMy1NNC2dqpxLYQyBA2GIaNEMQJ32/AMri4uASavawv7Cn2BVuX+IGoR1WV7m1/C5D+nopFV6hyprPuWBacAWi3Sffcnq+VSqhQSlc3W703HVn0ZPtKLAp252jxC1pex/BvdcxH0767bm9j9SvFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441686; c=relaxed/simple;
	bh=A1n/UYUoaphToXYwryyWX67OkpMd2DZ5NYLGb86kJh8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFcR/Jl/G9B0wT/VpnWldMXr7Nl6Ihe5XV849AaKqN3hHZZhCUBBnIiUvi6wTIqd6l1Anz8ASuvN7/DWDAXQdkUar2Ctr79D7MIvZWpLrCdge9Vptv+4wxBy88awvvOvr63sHRGb2hrmyNxIvjXSDcM3K4i5RsfcmivQkdQYn/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QNBRHiIg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZgztFsBw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QNBRHiIg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZgztFsBw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QNBRHiIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZgztFsBw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QNBRHiIg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZgztFsBw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 73DD16A7FC;
	Wed, 29 Apr 2026 05:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eL+eQAyLzVtGBKlIdMNqOhpSWygpw3z8gnUGxknB18c=;
	b=QNBRHiIgo+w3SNigjVkEDHKUodUaGZYbG6NanBForgjK1xoROnA+AwoQ+kozvQGegRpapE
	CIqKsscltNUETJ/xWzu3zFRqduLs7PBTk4UirAYGp8dsk8H+08q31swSAYql0X8EB/m+Nx
	MqWOj5DDitpgvHXqTi/POta7oFvXG64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eL+eQAyLzVtGBKlIdMNqOhpSWygpw3z8gnUGxknB18c=;
	b=ZgztFsBw8MnHGRhWPbvDkqSgFMqXQunEdV1sjLv4nEnKM+xPF8E8GEq7tzhl8FUCRBAmcp
	EKA+0CPMf1u+QDAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441683; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eL+eQAyLzVtGBKlIdMNqOhpSWygpw3z8gnUGxknB18c=;
	b=QNBRHiIgo+w3SNigjVkEDHKUodUaGZYbG6NanBForgjK1xoROnA+AwoQ+kozvQGegRpapE
	CIqKsscltNUETJ/xWzu3zFRqduLs7PBTk4UirAYGp8dsk8H+08q31swSAYql0X8EB/m+Nx
	MqWOj5DDitpgvHXqTi/POta7oFvXG64=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441683;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eL+eQAyLzVtGBKlIdMNqOhpSWygpw3z8gnUGxknB18c=;
	b=ZgztFsBw8MnHGRhWPbvDkqSgFMqXQunEdV1sjLv4nEnKM+xPF8E8GEq7tzhl8FUCRBAmcp
	EKA+0CPMf1u+QDAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39543593B0;
	Wed, 29 Apr 2026 05:48:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NV7RCpOb8WnVLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 05:48:03 +0000
Date: Wed, 29 Apr 2026 07:48:02 +0200
Message-ID: <878qa6qpv1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Abhinav Mahadevan <abhi220204@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ALSA: usb-audio: Fix quirk entry placement for PreSonus AudioBox USB
In-Reply-To: <20260428155117.5170-1-abhi220204@gmail.com>
References: <20260410143335.5974-1-abhi220204@gmail.com>
	<20260428155117.5170-1-abhi220204@gmail.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 28 Apr 2026 17:50:00 +0200,
Abhinav Mahadevan wrote:
> 
> The quirk entry for PreSonus AudioBox USB was mistakenly placed inside
> a disabled #if 0 block. Move it to the correct position after the
> 
> Fixes: 34fe4a9df247 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
> Signed-off-by: Abhinav Mahadevan <abhi220204@gmail.com>

Applied now.  Thanks.


Takashi
