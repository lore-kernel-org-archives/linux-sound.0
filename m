Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6421547DC
	for <linux-sound@vger.kernel.org>; Thu,  3 Oct 2024 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727963901; cv=none; b=NVCx0j6uzNYTyEH7SRrlAmwjyzaGsD9KXUAZcg7NGllS40O8+HsDC1Hbu++cslOe1key0ynMbQjGiFPkcD9EmnBUDjztx5GhXC9bCgXnOyh6Amu5iMeTc4hf6VScPORpA+tQqZ16jjNRwkdr7nmeH0SQ+myUQ5FGB0aIj+8/FeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727963901; c=relaxed/simple;
	bh=NNK5nawUYUB8YT90fpu+4B4IFymWPgmsYNzOIoaFRWo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJXb3/urubI32pKdFl7X4nGLRQF6boyPnD/xhjGrhzOv/Gy93BkXaR71m1l3328/x1t7RvOT2bThXwAHfNi8ywNcsDYK7EuXiN6U5qbVlVLK0+mC2npBx/kPQ5NENO1+FybM6DI1TSq+WdbItOfofH8jPPEwv1P+jeWr3M2H8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uhPY5Xmp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4qSOnHl4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uhPY5Xmp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=4qSOnHl4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uhPY5Xmp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4qSOnHl4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uhPY5Xmp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4qSOnHl4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A49791FB60;
	Thu,  3 Oct 2024 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727963890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l801UzA69RykpxKHSOzKjZOM2rWVDS+j18vBoTmeDVk=;
	b=uhPY5XmpdCzuq2V360/O+uiLucGy8COhs5NKrg6Cm1MXL5IXbtEaFdY2fOvbQ+ZgpBXYfV
	osfyvQVQjh+4+Io+FoaAWtROIWq5OtTRGAFfnrmDP/mhKpgTRtXS+EYNt9o1NAZ+NrDFH+
	kXDCffpWuccp9iHIBqvPoNhgsbwUHeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727963890;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l801UzA69RykpxKHSOzKjZOM2rWVDS+j18vBoTmeDVk=;
	b=4qSOnHl4c2DySmk4mjkPbUt+ymdcJGrVYRQF18ueZNrVimxNQkjLRMgLE55ATzuR4e2Hvk
	pydtWsjGxcuBWNCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=uhPY5Xmp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4qSOnHl4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1727963890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l801UzA69RykpxKHSOzKjZOM2rWVDS+j18vBoTmeDVk=;
	b=uhPY5XmpdCzuq2V360/O+uiLucGy8COhs5NKrg6Cm1MXL5IXbtEaFdY2fOvbQ+ZgpBXYfV
	osfyvQVQjh+4+Io+FoaAWtROIWq5OtTRGAFfnrmDP/mhKpgTRtXS+EYNt9o1NAZ+NrDFH+
	kXDCffpWuccp9iHIBqvPoNhgsbwUHeY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1727963890;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l801UzA69RykpxKHSOzKjZOM2rWVDS+j18vBoTmeDVk=;
	b=4qSOnHl4c2DySmk4mjkPbUt+ymdcJGrVYRQF18ueZNrVimxNQkjLRMgLE55ATzuR4e2Hvk
	pydtWsjGxcuBWNCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D02013882;
	Thu,  3 Oct 2024 13:58:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BNpMHfKi/mY7RAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Oct 2024 13:58:10 +0000
Date: Thu, 03 Oct 2024 15:59:04 +0200
Message-ID: <874j5tnv87.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hans Peter Moller Ebner <hmoller@uc.cl>
Cc: "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: [PATCH] ALSA: line6: add hw monitor volume control to POD HD500X
In-Reply-To: <DM6PR11MB3066E77893D89953CE26E242B0712@DM6PR11MB3066.namprd11.prod.outlook.com>
References: <DM6PR11MB3066E77893D89953CE26E242B0712@DM6PR11MB3066.namprd11.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: A49791FB60
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Thu, 03 Oct 2024 13:14:39 +0200,
Hans Peter Moller Ebner wrote:
> 
> Add hw monitor volume control for POD HD500X. This is done adding
> LINE6_CAP_HWMON_CTL to the capabilities
> 
> Signed-off-by: Hans P. Moller <hmoller@uc.cl>

The patch is unfortunately not applicable cleanly, since your mailer
likely broke spaces and tabs.  Could you try to correct the mailer
setup and resubmit (at best via git-send-email)?

Maybe you can try to submit to yourself and test applying it in your
side before submitting to ML, too.


thanks,

Takashi
