Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27D156F5E
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741792081; cv=none; b=gC9DuVtRJdLwE7Xl9oAghsb1agzja0QC7MeGX1Cfv+YVQk1cI9+RZGgfIMNDTPRB0qtU5PSHeMy2q5CbKfdUdX1DQaUTuRaSegZytvGPa0NF9Gy1IVUWPm40DrpHbC7qXIdwDSIYj14YVt9KBGf5Jaw2tbhnCw+dVT5ZBS3xs7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741792081; c=relaxed/simple;
	bh=wz3A+DVbwpNWqSnLUFxNs4xoMIR4k5/3OSCvtxH1jJk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DAB7fkW6BWXCjjQKk8AC+JF+NbW46uSn8lIrSD1OV9tvC084WY8BDNvC0o/u2B7lu0CT8piXMBvFkv4eSS5H7/Q7RCVAPfq/JZyqi4ASmEEtcJFWrcJfbEH8OTJr4ASMpmUEODWPVsVyWVKfKUBaAW38YfJwfil+9J29ae17sJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yc2/ZJd0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pU9MppCK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yc2/ZJd0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pU9MppCK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yc2/ZJd0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pU9MppCK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yc2/ZJd0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pU9MppCK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8CF031F388;
	Wed, 12 Mar 2025 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741792072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXy7eADrwtO8va9WAyK5H90N5CdgnOu4t8g9zet3ISs=;
	b=yc2/ZJd0lDYrNinq0DbMqzPoNlLl0H1LVWnIOhlp39n7hbhcLgZmWeZMhTnx80oUFZO68T
	s5QkREJXrPRhvyInPFW4y9z4wtU/WNoE6lJc1kYPudPDZf0ia+4HqadsIK0SO4NUfPmU22
	kCnv+5LjOVabqs18IGykfBpS1AJrRcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741792072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXy7eADrwtO8va9WAyK5H90N5CdgnOu4t8g9zet3ISs=;
	b=pU9MppCKo/csEyBBKA+sm8fmqKbAuzTk4X7pQY8tv7GHsvoh9liU3BX41lrw5ZYxxHXoiS
	ERKbiG7JQ5E2s/CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="yc2/ZJd0";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pU9MppCK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741792072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXy7eADrwtO8va9WAyK5H90N5CdgnOu4t8g9zet3ISs=;
	b=yc2/ZJd0lDYrNinq0DbMqzPoNlLl0H1LVWnIOhlp39n7hbhcLgZmWeZMhTnx80oUFZO68T
	s5QkREJXrPRhvyInPFW4y9z4wtU/WNoE6lJc1kYPudPDZf0ia+4HqadsIK0SO4NUfPmU22
	kCnv+5LjOVabqs18IGykfBpS1AJrRcc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741792072;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXy7eADrwtO8va9WAyK5H90N5CdgnOu4t8g9zet3ISs=;
	b=pU9MppCKo/csEyBBKA+sm8fmqKbAuzTk4X7pQY8tv7GHsvoh9liU3BX41lrw5ZYxxHXoiS
	ERKbiG7JQ5E2s/CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5FBBA132CB;
	Wed, 12 Mar 2025 15:07:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TiHUFUij0WfdBQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Mar 2025 15:07:52 +0000
Date: Wed, 12 Mar 2025 16:07:51 +0100
Message-ID: <87a59qz3qw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
In-Reply-To: <20250312145642.26646-1-tiwai@suse.de>
References: <20250312145642.26646-1-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8CF031F388
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[suse.de:query timed out];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Wed, 12 Mar 2025 15:56:39 +0100,
Takashi Iwai wrote:
> 
> Put __maybe_unused to work around the build error without CONFIG_PM
> or CONFIG_PM_SLEEP for the newly defined system suspend callback.

I think a better alternative would be to wrap with pm_sleep_ptr().
Will resubmit.


Takashi
