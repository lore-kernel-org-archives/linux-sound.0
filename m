Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0F3CB2EF
	for <linux-sound@vger.kernel.org>; Wed,  1 Apr 2026 09:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034168; cv=none; b=kOOEi9/lTi5D4Ug26stAqIpcjVXU3gNMEfDOT5Eb9o0QNAmXmlmfdiyXjJOx4Zypn3quRik1zzkuGe8FkbV7SXuEnmP+xcz8t5dA3lyQ7sp8v49H5pLCtlx+oRR3C29Hdtx9apvGOYpzpRt+iKKhkKF8hUUn/HNMMtQsg107w0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034168; c=relaxed/simple;
	bh=md+OcktnaqsQiumjQp4oxdp9YmTZcWFthEJkwEBUylw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOosRzW0AZtRMQZ+qK0ShwTYhvXe1Q10n6ry3jn5MzJFKz/QrFtS7N0iNQw4RYIX+DVO8RZeO3STdIvfVYUnQxSME9zI3E8hMpezjWstqc1aspOaEe16871GjcBQIRK0/24qN8EgYnhwhnocxNV9wuL8tl5jrStT5ZaaasAMgAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TTC6hYxS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZoMXMM6E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sXNyCIVj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=x+aOf/sm; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TTC6hYxS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZoMXMM6E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sXNyCIVj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="x+aOf/sm"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9784E5BD44;
	Wed,  1 Apr 2026 09:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775034162; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=189kQLwuNnnJHPOnLldFMVas7wmub/3WbznDS7qqRFk=;
	b=TTC6hYxSaJzPfwffYEPK7PgdrvBAfGfQYmeEFFUv57WcynXRbR/AvwufGoLsgi6aCMLNAq
	u2QwJyfhdr9bs158zWFe/PtEcWuk+7RZi6b7InmIwWO44nGBzFmddVDoEMiTijspheGFZC
	xr5AHZQZgxd9bg4F0u0m+TFjXx8jWvs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775034162;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=189kQLwuNnnJHPOnLldFMVas7wmub/3WbznDS7qqRFk=;
	b=ZoMXMM6ES9oatLA9rhWjMxnUdtnCmzRz1nbDy6133KjPesQ8Q7N7gIApdBb5kRebyCB1MG
	kTnY340K95M9qpBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sXNyCIVj;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="x+aOf/sm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775034161; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=189kQLwuNnnJHPOnLldFMVas7wmub/3WbznDS7qqRFk=;
	b=sXNyCIVjSF65d2taof5HOsH6EHjgrDLblEcXdGwlw+OoeqqJnWv7MBah3D6JOvEggcJXCk
	wbFYlzBrui85ySIg0TuToUrswUPURPcHr/4vHO0tn6hR7DdmXgEy7rHnncZFCtpZDt6xXL
	I87sy8KVl5+tsqnPfQI9dJ+6GVQ/Kp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775034161;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=189kQLwuNnnJHPOnLldFMVas7wmub/3WbznDS7qqRFk=;
	b=x+aOf/smveUGWNu9vOwV5lPijoU8W/mf5q3lfstfyxyBQ95U0rfD0BYwNEAS56rRLcCE58
	x0CRMctQLaquRXAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4EF834A0B0;
	Wed,  1 Apr 2026 09:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mnDhETHfzGn0KQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 01 Apr 2026 09:02:41 +0000
Date: Wed, 01 Apr 2026 11:02:40 +0200
Message-ID: <87qzozqci7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: wangdich9700@163.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	kees@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/cmedia: Remove duplicate pin configuration parsing
In-Reply-To: <20260401082625.157868-1-wangdich9700@163.com>
References: <20260401082625.157868-1-wangdich9700@163.com>
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
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[163.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,kylinos.cn:email,suse.de:dkim,suse.de:mid]
X-Rspamd-Queue-Id: 9784E5BD44
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Wed, 01 Apr 2026 10:26:25 +0200,
wangdich9700@163.com wrote:
> 
> From: wangdicheng <wangdicheng@kylinos.cn>
> 
> The cmedia_probe() function calls snd_hda_parse_pin_defcfg() and
> snd_hda_gen_parse_auto_config() twice unnecessarily. Remove The
> duplicate code.
> 
> Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>

Oh, that was a silly mistake that was introduced at the big code
change.

Applied now with the Fixes tag.


thanks,

Takashi
