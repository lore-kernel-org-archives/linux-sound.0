Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8B1362143
	for <linux-sound@vger.kernel.org>; Thu,  2 Apr 2026 07:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114336; cv=none; b=ZESrM26kUjLoTGNwpvks6p/EL2P1m3HiWKZVS5mOQ5vN6ijDIOX4SIDQaBa3snajwpeGcAI6DRxRbfiJztza44JIBq0Pyje/qsEQPTxXY50NdFdjEkfOLaZPjveP/TbOLQAp1AD8PyaTqitghxRbRCV/Gs75N9vQatknVkErVDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114336; c=relaxed/simple;
	bh=uLlkYedEbTs0yI4v5XAelQqvZg1zucx4gL/A6ZjSWy8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1OFsTDSnRsCStSx03pxm4iZZm11YgBI2SDax1pw/wOeJ13OWkpsvt4d36sMj1Zw408lXXbk2oFRWX6GvO5qkTqmHUischgrVLPR7+yKNxjR3tRrJTk8kg4nZID0V5/TObB5+fPUwRNmFeFEwFKAwQvqdfmiMYqhBQiP1VwGTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ae5KY6M9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZsNRja8g; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BBgY/lUT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o3PSPb4+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ae5KY6M9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZsNRja8g";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BBgY/lUT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o3PSPb4+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B0455BD36;
	Thu,  2 Apr 2026 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775114333; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBD0QMd4C2rTXRwwaObQxnFMaT347UkCxyObmJCrWtY=;
	b=ae5KY6M9+L7BY/Owo0dbURWVuqGF10X9Z9h81KUU5y+8+hf5xDo87Kyz+NkL0StI9OfvK3
	ycPCk1duE2GkHlPXdLB4jFBRsnDhkZFlaJMnx+/tHEhfCWqX5mE6xoYAcLGaUto0O2Hu27
	v5deF8VljnbkLTjkHeXa0/Do08kOuvg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775114333;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBD0QMd4C2rTXRwwaObQxnFMaT347UkCxyObmJCrWtY=;
	b=ZsNRja8gLsZn8uYsGhRsXZsqkH+QjqHuRZoWXJMe4K4ImXYeslFQ7DLcX85q0tXHRUMcjQ
	PVW9Dchsy32iePCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775114332; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBD0QMd4C2rTXRwwaObQxnFMaT347UkCxyObmJCrWtY=;
	b=BBgY/lUTK0zWrQTMliz9yftm2fPSP77ZWKqhsVn3OkZOnK3OuXhZ4yZqDLdPA7k8zmodse
	Moh/ixvSgkFufGJ64Yfw9bnfMHfwTDohSqHxgfNDbcDF8X7YYZBLpZa7ujhg/TKhDI6elA
	VELCF6u7IkJUyaYebMCgOMfy/q0fYyY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775114332;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBD0QMd4C2rTXRwwaObQxnFMaT347UkCxyObmJCrWtY=;
	b=o3PSPb4+4XvXSiHAFYxKVcfVDzcy/6JhuL5DJiwIGzSqdKvrfdAk06XV59Rbs3GQ6RA2Td
	3vXegMxXepYrguCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9BBD4A0B0;
	Thu,  2 Apr 2026 07:18:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qKWZM1sYzmkfZAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 02 Apr 2026 07:18:51 +0000
Date: Thu, 02 Apr 2026 09:18:51 +0200
Message-ID: <87wlypq17o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v7.0-rc6
In-Reply-To: <c736ee7c35c9676f3c71335e74d1d157@kernel.org>
References: <c736ee7c35c9676f3c71335e74d1d157@kernel.org>
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
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Wed, 01 Apr 2026 19:24:06 +0200,
Mark Brown wrote:
> 
> The following changes since commit 7aaa8047eafd0bd628065b15757d9b48c5f9c07d:
> 
>   Linux 7.0-rc6 (2026-03-29 15:40:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc6
> 
> for you to fetch changes up to e74c38ef6f170179c0029b5744d6a14dfd543108:
> 
>   ASoC: amd: ps: Fix missing leading zeros in subsystem_device SSID log (2026-04-01 13:08:47 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v7.0
> 
> Another smallish batch of fixes and quirks, these days it's AMD that is
> getting all the DMI entries added.  We've got one core fix for a missing
> list initialisation with auxiliary devices, otherwise it's all fairly
> small things.

Pulled now.  Thanks.


Takashi
