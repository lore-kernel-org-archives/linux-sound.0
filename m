Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEF68F6B
	for <linux-sound@vger.kernel.org>; Fri, 21 Mar 2025 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742570917; cv=none; b=HOF0kcCVK0jXvmYJvkVbrCw8i+Wx5ykWQ/dsvTVPqKhp1SkxBq9qjI96Rn6QNS0KZrJPVsxLyqhNvzS6iJR+6GqYlXTLJwNM/WMxrJ7UCMfkaYlHXtMUZAst7hASdjqMDWopyuHkUwkcXDdgrRmLy3FXaSs8ghofzMQHL3C447c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742570917; c=relaxed/simple;
	bh=RMyWWEohdDzqMcSQPGtDr9wXwBc4GdJGIq1ZEc2uC3Q=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqnHHThTaBkQrs/xVKvu8KqNwY9AHhvPOgRdlOpeu95sNDtiUUB78d22OF1Oczjgz4IfhvB9n6xEkfLTzTpmNAgzhk1BKX5njmG2eTi47maGEY8r0xmPzPuYYkqyWJo2GVXZd+jNeBijoP2AY5wzDQ7xLCIrM19b6GNJeG7zJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oAl2hUEc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gSbKs43t; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oAl2hUEc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gSbKs43t; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oAl2hUEc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gSbKs43t";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oAl2hUEc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gSbKs43t"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 728C31F847;
	Fri, 21 Mar 2025 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742570913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hG1Q+spEXnEIds6/6JUHTiLmz2DsbASQWD7CTXrHDQ4=;
	b=oAl2hUEcIRlb9tqvtJaHX3d1MGLE81spyN0tRzu3mNVueuei3ExiGzFhbXQ4OjbkHpQGkC
	RCam6LA3gtltyXZoJRmPrAmDOmJQMKGIU/Cv+qSvgwjQA1PeQtJxGjovFDCSDTHm4V9fV6
	8LaEJKimF6LYF2fXVMCuUbqjDKuVb2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742570913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hG1Q+spEXnEIds6/6JUHTiLmz2DsbASQWD7CTXrHDQ4=;
	b=gSbKs43t/pac94WydGHqoDozbRjblyTmccU4KmWkZHDaf55wwum3v+ZHZj/+dfI6aUsmbD
	67eTGknmNnBYPSDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742570913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hG1Q+spEXnEIds6/6JUHTiLmz2DsbASQWD7CTXrHDQ4=;
	b=oAl2hUEcIRlb9tqvtJaHX3d1MGLE81spyN0tRzu3mNVueuei3ExiGzFhbXQ4OjbkHpQGkC
	RCam6LA3gtltyXZoJRmPrAmDOmJQMKGIU/Cv+qSvgwjQA1PeQtJxGjovFDCSDTHm4V9fV6
	8LaEJKimF6LYF2fXVMCuUbqjDKuVb2w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742570913;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hG1Q+spEXnEIds6/6JUHTiLmz2DsbASQWD7CTXrHDQ4=;
	b=gSbKs43t/pac94WydGHqoDozbRjblyTmccU4KmWkZHDaf55wwum3v+ZHZj/+dfI6aUsmbD
	67eTGknmNnBYPSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A018139AA;
	Fri, 21 Mar 2025 15:28:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +bWHEKGF3WdWFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 21 Mar 2025 15:28:33 +0000
Date: Fri, 21 Mar 2025 16:28:32 +0100
Message-ID: <87r02qtnbz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.14-rc7
In-Reply-To: <2e7905783f8f3541e854a13742ff1c22.broonie@kernel.org>
References: <2e7905783f8f3541e854a13742ff1c22.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 21 Mar 2025 15:38:39 +0100,
Mark Brown wrote:
> 
> The following changes since commit 658fb7fe8e7f4014ea17a4da0e0c1d9bc319fa35:
> 
>   ASoC: cs42l43: convert to SYSTEM_SLEEP_PM_OPS (2025-03-12 16:12:24 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.14-rc7
> 
> for you to fetch changes up to 45ff65e30deb919604e68faed156ad96ce7474d9:
> 
>   ASoC: ti: j721e-evm: Fix clock configuration for ti,j7200-cpb-audio compatible (2025-03-18 12:27:34 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.14
> 
> A couple of small fixes, plus some new device IDs - nothing super urgent
> here.

Pulled now.  But I'll postpone a PR in this week, as we have no urgent
fixes, so likely to be included in 6.15-rc1.


thanks,

Takashi
