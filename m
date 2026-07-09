Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D73932C9
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614909; cv=none; b=WBM9blbMjlSwR8ChDjw6ccuT5OSLlx9CK52k4up5jhEu1wrdE7dD2ljKh6O0torCzjqj/+cuzw8hxHeeBnuN3u9Py4nSWA8PfodcEEuPDeoJDTpXSjZKHkOOpwVSDlnRdL9MjavJQHcEptLciW73/cyLlkgmExVydw8/9C3gHHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614909; c=relaxed/simple;
	bh=UcozPpYKKd4RJJcgqEvwp5SJkrrPhhwkS3yRE7w3zRA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u+ueSvme+LeEjcuPfqY58QM5h+80GeUGflFUy0xfwpaT1blbJiP94ZO0a5qaADdMXQO3ec77QqirhbM5rfjBW0ZoYCXRd1K2dNOrUHykbQF0Sbk/ziwGAK7i3afXoRzIk4QubGEBUsrCE+VNrxtyOMU167aY0+3jf+sxEv94zM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SnkoFEs/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZsO2EZRl; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SnkoFEs/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZsO2EZRl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SnkoFEs/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZsO2EZRl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SnkoFEs/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZsO2EZRl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A10CA75FF0;
	Thu,  9 Jul 2026 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783614906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=96/157cpoonDRPt13XrUnLMoamhmE8Pbkj2Y49bizm8=;
	b=SnkoFEs/0aEXFoFfqFgZ4Yi2O86njOH7eCE+ENOV6lPmXo9kSOKlc6QQTNblGXVnI2d8rD
	FkvFPpskf/qNngLP86ILoIAjQBxvIpN6eeuO0zz6lXF5TljUSSBBdndMr9e5+C+ZLg+os3
	DOu0dgiuvMUrWhOBV1xpB/iTKdr4RvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783614906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=96/157cpoonDRPt13XrUnLMoamhmE8Pbkj2Y49bizm8=;
	b=ZsO2EZRlfRpZPhoyH3cogaFa+8VenC8aVOz+LNodxSBV6xdh1gtrxIqNGB8M3b3gBGXp8n
	UhHV3gL4X/AKEBBA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="SnkoFEs/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ZsO2EZRl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783614906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=96/157cpoonDRPt13XrUnLMoamhmE8Pbkj2Y49bizm8=;
	b=SnkoFEs/0aEXFoFfqFgZ4Yi2O86njOH7eCE+ENOV6lPmXo9kSOKlc6QQTNblGXVnI2d8rD
	FkvFPpskf/qNngLP86ILoIAjQBxvIpN6eeuO0zz6lXF5TljUSSBBdndMr9e5+C+ZLg+os3
	DOu0dgiuvMUrWhOBV1xpB/iTKdr4RvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783614906;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=96/157cpoonDRPt13XrUnLMoamhmE8Pbkj2Y49bizm8=;
	b=ZsO2EZRlfRpZPhoyH3cogaFa+8VenC8aVOz+LNodxSBV6xdh1gtrxIqNGB8M3b3gBGXp8n
	UhHV3gL4X/AKEBBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4E861779AA;
	Thu,  9 Jul 2026 16:35:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JoUpEbrNT2qsZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 16:35:06 +0000
Date: Thu, 09 Jul 2026 18:35:05 +0200
Message-ID: <875x2o2kau.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: MAINTAINERS: Fix missing cirrus* file reference
In-Reply-To: <20260709122211.615785-1-rf@opensource.cirrus.com>
References: <20260709122211.615785-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
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
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A10CA75FF0
X-Spam-Score: -3.51

On Thu, 09 Jul 2026 14:22:11 +0200,
Richard Fitzgerald wrote:
> 
> When the HDA source was reorganized some of the cirrus* files were moved
> into a new 'side-codecs' subdirectory. But MAINTAINERS wasn't updated to
> add a cirrus* file reference to cover these moved files.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
