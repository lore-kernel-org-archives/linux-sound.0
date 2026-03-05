Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931613C2775
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 19:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740199; cv=none; b=g4uag5nDy6tH7pfvLdzQmZZ13nlVrXYr7XrUgsc6VOQx0NO0x1GMTizzBpXfQ5aUISNkWGJ0oTb+GKQwuGOlqrsyZzOZr7dFahDjWfObG51NsxpkSLIgsxDKvt4l7JJaOZ2/B39C4xWUBxRmZ0YwtGiLf+slTqXI3ZA41MOCYyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740199; c=relaxed/simple;
	bh=qlSti5DpZENgsi07jvU39xUxPwxfHv/F34mcYL59KrE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PNckJIuE7NzI3UNS9lL4Vm/2/4gXA23MT+ii6JoCUq4ZqkJaeArLE3BBWhoe1dRRi8mix/k2BzztBpdDxB6m4rGffeyy+HdarHS+SQrPR+XlCha5KKycr1zVB3Zjj2NOLk4kOqX6ls0ChNHA4oypwARrDRrrsEt4+zugETsHTDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C8RPtlUi; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8VZ9Hqvc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VVPAgtur; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=g6GJVhzA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C8RPtlUi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8VZ9Hqvc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VVPAgtur";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="g6GJVhzA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DC8633E75E;
	Thu,  5 Mar 2026 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772740197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFbMs6AM9oEkgX+aR2yN5v1Rfgkxs3pvR0coNM4DIKk=;
	b=C8RPtlUiFhWqHknpSyp359rHsVfXyA+0rW9ECuI0mJeVZo76JQu9+J68k6AHvP04qdGwPe
	ve6pUXy9RMO3WvsCgDQTwFLektqj6My6nIjWWvSbCOHA7mO/fC/lox2k6ZMTIrQ3jwzDmE
	MRxbBAM8qGMLmw9A+dqBHty5HnQTdC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772740197;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFbMs6AM9oEkgX+aR2yN5v1Rfgkxs3pvR0coNM4DIKk=;
	b=8VZ9HqvcpKnnazB1LT1qD86w38oM8MEsSHyI8/KPPeYYp+u39XhL80kLVTj88fq/vVPwdV
	1xw2VjmwUc8kQzBg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772740196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFbMs6AM9oEkgX+aR2yN5v1Rfgkxs3pvR0coNM4DIKk=;
	b=VVPAgturNf0FseloeEnUWgeD8RNb+tMwWaFc9owZeWv5B+Ys4Xt4DjLPWPYTQNp7eM8+v0
	MxqNHTYPGLIY2kO76yMOIeYmaTEfsw94o60KB2quGLw+zvJk0ShqdsuZG7htfGVWmbiCi/
	adZn7IODRcIA7v9nPwjJpFmXS7aIDVI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772740196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFbMs6AM9oEkgX+aR2yN5v1Rfgkxs3pvR0coNM4DIKk=;
	b=g6GJVhzAcV4K2rPLg5UIpqo0Lp3ONsMfcQk1zs6Arwl4lSWTP2+siw/vXfJJFA3p6lOadv
	OiIftDudLWpplFAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CD373EA68;
	Thu,  5 Mar 2026 19:49:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jmgiIWTeqWmsQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Mar 2026 19:49:56 +0000
Date: Thu, 05 Mar 2026 20:49:56 +0100
Message-ID: <87a4wmvyxn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rong Zhang <i@rong.moe>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	Arun Raghavan <arunr@valvesoftware.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>
Subject: Re: [PATCH] ALSA: usb-audio: Refine string-descriptor-based quirk matching
In-Reply-To: <20260305174711.1106324-1-i@rong.moe>
References: <20260305174711.1106324-1-i@rong.moe>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.989];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 05 Mar 2026 18:46:39 +0100,
Rong Zhang wrote:
> 
> Remove snd_usb_get_string() and use the manufacturer and product strings
> stored in struct usb_device directly to match quirk table entries. Their
> NULLity can be checked to determine if the device has no these strings.
> This simplifies the code a lot.
> 
> Meanwhile, allow quirk table entries to match "no string" explicitly, and
> add appropriate comments to show the expected usages of
> DEVICE_STRING_FLG() and VENDOR_STRING_FLG(). These changes are tiny and
> doesn't form another separate patch, so that back-and-forth changes can
> be avoided.
> 
> Suggested-by: Terry Junge <linuxsound@cosmicgizmosystems.com>
> Link: https://lore.kernel.org/r/b59da54a-9c80-4212-a337-c5ea98da52d1@cosmicgizmosystems.com
> Signed-off-by: Rong Zhang <i@rong.moe>

Thanks, applied now.


Takashi
