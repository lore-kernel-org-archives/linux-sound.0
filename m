Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E251426B
	for <linux-sound@vger.kernel.org>; Sun,  4 Feb 2024 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707035837; cv=none; b=XNPuiov1wI+UOmxY54NTeKob73jtjGijTkglOgcdUqK7P1+cx7Al73S+UvdHU4fLp5IBl0ixbpnSay2X1X+HwhSPqQeZ/d+m5qUqm9PIdE5anBRNKwPAIjlGPpAD0bnRNMjtvr5Z3rDbBSz6gGGgZy8gkDw/PW1yloChrjomDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707035837; c=relaxed/simple;
	bh=biNL8Z9YF027mLA8+9hR+WXpRKgCGUnyslxPQcCnS30=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMgeJ7Q6aEroanLGReuUorg76Hu211OVN3QH2nphEVWransdSxc2Po4a2hzv5EI2rhGBffQSJTQcLICnIUZRvCRgjlWfZ93awYPAdeeWH40l9tsmx/8CayE2Jqj3Ea/IsPuXHHKtXka6Rwvd0bv6Y5YymIqSWuK4NNZS6BDD790=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qOXSyVQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S6SGAFZJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qOXSyVQA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=S6SGAFZJ; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qOXSyVQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S6SGAFZJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qOXSyVQA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S6SGAFZJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6953221F3A;
	Sun,  4 Feb 2024 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707035834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWrtnolEZ9NpqWUM9HWy5WDBJgHUHuLsMQKdhSSmK78=;
	b=qOXSyVQAuJvd+201xtzUFUfLMf+m8TZeZ8NSH/VY/vrtEe+F7xZm2qXr6dfcZEb6bLpn+8
	7COv+CK3dQvYLTO2wY54pAzGHTJSc0Q1kfzpKfAHFe28+cYOH4JYv8rg2+wPDZS8NKKQs7
	lGKqk6i3RW8KiklNxoYuHUCt85PPvI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707035834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWrtnolEZ9NpqWUM9HWy5WDBJgHUHuLsMQKdhSSmK78=;
	b=S6SGAFZJawkkQH0m6+4elUbnaNG/gYkbgGbtRrqdOSjUajAQWl5fYMUIzU4EtO61BZ2Wn1
	z4bf4PXNtmLnj/Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707035834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWrtnolEZ9NpqWUM9HWy5WDBJgHUHuLsMQKdhSSmK78=;
	b=qOXSyVQAuJvd+201xtzUFUfLMf+m8TZeZ8NSH/VY/vrtEe+F7xZm2qXr6dfcZEb6bLpn+8
	7COv+CK3dQvYLTO2wY54pAzGHTJSc0Q1kfzpKfAHFe28+cYOH4JYv8rg2+wPDZS8NKKQs7
	lGKqk6i3RW8KiklNxoYuHUCt85PPvI4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707035834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWrtnolEZ9NpqWUM9HWy5WDBJgHUHuLsMQKdhSSmK78=;
	b=S6SGAFZJawkkQH0m6+4elUbnaNG/gYkbgGbtRrqdOSjUajAQWl5fYMUIzU4EtO61BZ2Wn1
	z4bf4PXNtmLnj/Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 45A49132DD;
	Sun,  4 Feb 2024 08:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mfO5D7pMv2VheQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Feb 2024 08:37:14 +0000
Date: Sun, 04 Feb 2024 09:37:13 +0100
Message-ID: <87eddsbp6u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: snd_hda_intel 0000:30:00.6: azx_get_response timeout, switching to polling mode: last cmd=0x00570503
In-Reply-To: <ec1b9e10-9ca5-4500-8997-16b5025a7f34@molgen.mpg.de>
References: <ec1b9e10-9ca5-4500-8997-16b5025a7f34@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [0.90 / 50.00];
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
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[42.72%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: 0.90

On Sat, 03 Feb 2024 21:37:07 +0100,
Paul Menzel wrote:
> 
> Dear Linux folks,
> 
> 
> On an MSI MS-7A37/B350M MORTAR (MS-7A37), BIOS 1.O7 05/09/2023,
> sometimes Linux logs:
> 
>     [ 1154.799353] snd_hda_intel 0000:30:00.6: azx_get_response
> timeout, switching to polling mode: last cmd=0x00570503
> 
> I only have three occurrences with Linux 6.1.12, 6.5.13 and
> 6.6.13. The HDMI audio is not configured to be used on the device, and
> only the Realtek audio¢s headset out in GNOME.
> 
> Also, the LUKS password was entered much earlier
> 
>     [   31.383172] systemd[1]: Inserted module 'autofs4'
> 
> so I am wondering what is timing out.

It's no serious issue.  The response from the chip isn't really great,
so the driver switches to the active polling mode.  Unless it falls
back to the single-cmd mode, it's working just fine, and that's your
case.

There can be various reason of the delayed (or ignored) response from
the HD-audio controller.  All subtle, mostly machine-specific issue,
which is very hard to debug remotely.


Takashi
