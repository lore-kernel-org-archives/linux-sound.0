Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55D6382285
	for <linux-sound@vger.kernel.org>; Fri, 17 Apr 2026 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412316; cv=none; b=P6khsLASVpEu2I88VxhRW/50TRc7hQp/f1Ao0bvS+CG+6uZz4h6c0Je9beXUinTJnyCTzFAgq7vu8pZ/ElD8X3gjaW7HiP/+GcIVGiiS49EKZbRhRD02eSSvYj8M9j5HWtBOIv7a19v9zr4+XHSwpdLta5Qf7BVPZx+S+dtkgd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412316; c=relaxed/simple;
	bh=ZSysHLFBMwdXC7WZu44sb7e2EoqTzSS2xKWaReVAO8Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rSCAuDeLDOg4jqlx4kPZ63xdQL/W/Dpjp55pKU57QSHECCYY9FCvDmMqwcpU1qMjEK5+jNwgSnWUwv1WOWvLhjMDmK4rnAPHpQwozhcWt507d3mwhdYsrd/oH8HMJDeGKtTE/wAeXsYMbzKlBUsHXIN9Q2Y1nfkZrVNqcfYmlqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=X3Aq2x1B; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=W6qWeV7N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=x22WsqZ7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=i/pq48qb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X3Aq2x1B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W6qWeV7N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="x22WsqZ7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="i/pq48qb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E54876A98F;
	Fri, 17 Apr 2026 07:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776412309; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kAZGSUA+k4r+rMElBkdoYtG0Zo+i6bX0IhnrrPaBl4=;
	b=X3Aq2x1BPw1HB0bhiOqfN2t/EXaMHJhL61ZoUaxEwWRwdccybNtxmFsLXyDkvaNOxI1QcX
	BEfd8eV/nCjG4AA4oaq9oGaVvWoVmJZaC7gvnhR3WI4a4GOcxMVaOKM45aN36DFYTvIt+/
	ZmuSVrfvzmVIdozIKbVDEROSPDVjn0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776412309;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kAZGSUA+k4r+rMElBkdoYtG0Zo+i6bX0IhnrrPaBl4=;
	b=W6qWeV7NFyhS2ZyouYdAZvO11d6w+RAQUGH2JhJZ7rcNVx0MkOI3aCDVvs/wc8H2jRTTfy
	XcX3S0fWfMA7K1Cg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=x22WsqZ7;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="i/pq48qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776412304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kAZGSUA+k4r+rMElBkdoYtG0Zo+i6bX0IhnrrPaBl4=;
	b=x22WsqZ7n3kF/OVaC4eOLaLCzhQ1NJxUQxjvW7lFGoL51E9DllWwPPgmS0r3E9puNet3RG
	md8BQiiFWLGvpKq7LC/0EM+0z8HagZMRQ4OU6DA8Tqp9AUnOUl0llwZ0tS6eaJ5TMbJ5AH
	nIwEGjgw64HAw01pHQYUrtdi06ApaNk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776412304;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4kAZGSUA+k4r+rMElBkdoYtG0Zo+i6bX0IhnrrPaBl4=;
	b=i/pq48qbzj0FfpuaK3y3VuHvThuYVtYdcNJ10ZpZe4xo6oYekHLwPzbdw1jA39xHs416NM
	W8/OQPRbrIwyJOCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFCF5593AE;
	Fri, 17 Apr 2026 07:51:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9/kYKJDm4Wn8GAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Apr 2026 07:51:44 +0000
Date: Fri, 17 Apr 2026 09:51:44 +0200
Message-ID: <87ik9qdnxr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Torsten Schenk <torsten.schenk@zoho.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ALSA: 6fire: Fix input volume change detection
In-Reply-To: <20260416-alsa-6fire-input-volume-change-detection-v1-1-ec78299168df@gmail.com>
References: <20260416-alsa-6fire-input-volume-change-detection-v1-1-ec78299168df@gmail.com>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,zoho.com];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,zoho.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: E54876A98F
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 16 Apr 2026 15:24:40 +0200,
Cássio Gabriel wrote:
> 
> usb6fire_control_input_vol_put() stores the analog capture volume
> as a signed offset in rt->input_vol[] (-15..+15), but it compares
> the cached value against the user-visible mixer value (0..30)
> before subtracting 15.
> 
> This mixes two domains in the change detection path. Since the
> runtime is zero-initialized, the visible default is 15; writing 0
> right after probe is ignored, while writing 15 is reported as a
> change even though the cached value remains 0.
> 
> Normalize the user value before comparing it with the cached offset.
> 
> Fixes: 06bb4e743501 ("ALSA: snd-usb-6fire: add analog input volume control")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

Thanks, applied now.


Takashi
