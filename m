Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F323E8F66
	for <linux-sound@vger.kernel.org>; Sat, 24 Feb 2024 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708763706; cv=none; b=GAswOI78SSnysMWVOHFKEsxRZUMah+AeFkrU8YmfK5fxOaiV4pu1UoTVEo8T0J9GgXnHW2Ilbz/p7tiv95KKU3z+2L2yfioHqSG0gxHfmOZdhIoogDElG5sNzeyAJ5xixCSVx7YcvL2KDhOSRq/XMR8Yg3kFfwRB0GshyyKMFlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708763706; c=relaxed/simple;
	bh=7JGNRZkYoPDJjnAr+mqF6UujxaH9Ir22F0z1PmTxqMc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lasIJAIhsrtALd/HVBmBO/f8zjwZgBVJ91vCMGBvJlo5SFRX1zFX1/icgnLFd+4A+6MXYn/64cgGgr7hCFlZTMwgKaO87OxfSDT7PzW5rj19B0s1k3OaE75y8dmhrbi+bQv0BiF0sbZCmZXhEbPr3Zbns0KlRsdSSWXqztBVHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hq8hPwm/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMKzyCw2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hq8hPwm/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RMKzyCw2; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hq8hPwm/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMKzyCw2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hq8hPwm/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RMKzyCw2"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2035D1F7DA;
	Sat, 24 Feb 2024 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708763703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=Hq8hPwm/LpUcr9+FbGuu8fHD002yMlSue0pMx7tcEaUbehZv9r780aFN64eiPZx7Y5ZDU5
	zMWiSgwVQgnMwZnMxsQy8jPTHZybL5Ml+uvedBhSbuK60Pmao5oQwvyRrnbYbInmbpVA2M
	93PwRAuusli5t6dGb1WyiDzjry2NCpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708763703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=RMKzyCw2ls9n95FHHac2TfFEOrb46pQCRc24vaAsH/A3EPy9F3diw7qF4NQ+dYv6wmlA0g
	FQrmwBNnZ8qyGiDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708763703; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=Hq8hPwm/LpUcr9+FbGuu8fHD002yMlSue0pMx7tcEaUbehZv9r780aFN64eiPZx7Y5ZDU5
	zMWiSgwVQgnMwZnMxsQy8jPTHZybL5Ml+uvedBhSbuK60Pmao5oQwvyRrnbYbInmbpVA2M
	93PwRAuusli5t6dGb1WyiDzjry2NCpQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708763703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gtu2NMMgC2ZT38NG2DsPyX7+sb/yi/V2b/lqRoT4OEQ=;
	b=RMKzyCw2ls9n95FHHac2TfFEOrb46pQCRc24vaAsH/A3EPy9F3diw7qF4NQ+dYv6wmlA0g
	FQrmwBNnZ8qyGiDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8BAA133DC;
	Sat, 24 Feb 2024 08:35:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yG4hNzaq2WV4cwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 24 Feb 2024 08:35:02 +0000
Date: Sat, 24 Feb 2024 09:35:02 +0100
Message-ID: <87r0h21cqx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Willian Wang <kernel@willian.wang>
Cc: Gergo Koteles <soyer@irl.hu>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: PCI SSID and Codec SSID collision?
In-Reply-To: <170872537997.7.10064075757981956606.273437309@willian.wang>
References: <170869932581.7.612391552809015627.273152461@willian.wang>
	<4786204abbd7acadd27a8cf487be91e524eaa444.camel@irl.hu>
	<170872537997.7.10064075757981956606.273437309@willian.wang>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.78 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 SUBJECT_ENDS_QUESTION(1.00)[];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.12)[66.73%]
X-Spam-Level: *
X-Spam-Score: 1.78
X-Spam-Flag: NO

On Fri, 23 Feb 2024 22:55:40 +0100,
Willian Wang wrote:
> 
> Here is my attempt. I hope it doesn't break with the DuetITL mode, I
> chose to create a special case for it instead of otherwise because
> there is an european version of the 14IRP8 with different codec SSID
> (https://bugzilla.kernel.org/show_bug.cgi?id=208555#c778, 0x17aa38bf
> vs 0x17aa38be).
> 
> This is my first time contributing with a commit and I'm not sure if I
> did everything correctly so please let me know. I also don't know if I
> should send it to a specific email with you as CC or something like
> that.

Looks good.  And yes, could you resubmit only the patch without
hanging on the thread?


thanks,

Takashi
