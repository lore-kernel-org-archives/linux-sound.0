Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BC43D75C4
	for <linux-sound@vger.kernel.org>; Thu, 30 Jul 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404150; cv=none; b=UjX0cMpupbimWni2Ci+oP69qQiQHK8XBLbJvkNK4CyzfxR/RZmguVUgGNfQPRrkqPsBwUUHG9nTXCpFqZQE3A/eafG2MAyC6FTCPLwlavozqrXGmcqoQoU3zmggyxWSaqEW/JXP6WUV5Q90PnInOSxuM3ZrJ8JpdM0jkQtlSf4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404150; c=relaxed/simple;
	bh=xywUfXkhaNnZmSL8mwCyRoXzQOSLc5pYc6rkcX05lVQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jb7o4968uhvelXieokC8hDMHB4OqnPWdSZIOAX1/4ZEDZ4Jjn2gzxfI5STEK05gOXk04kW75mjDePsuugdCGApGjK3euq+aZfAIGR9uGB5diq6niQoBdm9yHMuKa9Va40OQ0pcnwgKO1bzgIEhUdkrWRm7MrZ5y0UAUYrYw0wbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ihpYwWcj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9SSIDN+z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y4dtd7eT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aymO8aLw; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ihpYwWcj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9SSIDN+z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y4dtd7eT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aymO8aLw"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD7813F71;
	Thu, 30 Jul 2026 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785404143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jh7WSx/ssSCWmo+m5yi6SfT9kWlx/JtTqUG795cZVzY=;
	b=ihpYwWcj7Axez+v2BS1VpOseoq+Q6zASnVITr2IpFAX8n/Sz++Bo34owolyB89N63vysWW
	tSth1wSayqulprMKf5Xut4znpaWnZ5ipCQoIzmxnAGYLfMO36He5M0tOdwyOJ+3oCg4Lsi
	oMSy/TVQtYW8mLn+4Ci3EB9dcd8MCiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785404143;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jh7WSx/ssSCWmo+m5yi6SfT9kWlx/JtTqUG795cZVzY=;
	b=9SSIDN+zrMsgSx2ghJC9zLqAmd8N9L5HOA4GQ+Z/fVYpa5rS7afisRw51xWqFFXIa1g1V2
	V4wQpoh3/eH+3OBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785404138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jh7WSx/ssSCWmo+m5yi6SfT9kWlx/JtTqUG795cZVzY=;
	b=y4dtd7eTWmKUsoVB55z05Hyur2YaNcuStQfqtmL5FfHSk78VjOJZAs+RWC8obQgO0HddLX
	bhDuvfV2n/JuGJok+WTNaI3ZejwwoWZIdxNgouczGgr8n1+A3cCZdoVTottVD2MvGjInfa
	L2S2qb5H1N0Ax4bNHWbJIavXpu1EXKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785404138;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jh7WSx/ssSCWmo+m5yi6SfT9kWlx/JtTqUG795cZVzY=;
	b=aymO8aLwKFt0TUmjgpIEvLDNWKzhu9mDxJyya6IGZPkTzu4OGN8Rp2S1ivW47xiXZ9QDgA
	n63uvTDFUn/2yZCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A485779D0;
	Thu, 30 Jul 2026 09:35:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ARHHIuoaa2owewAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 30 Jul 2026 09:35:38 +0000
Date: Thu, 30 Jul 2026 11:35:38 +0200
Message-ID: <87mrv83jmd.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/realtek: add missing NULL check for codec->bus->pci
In-Reply-To: <20260730015302.253008-2-songxiebing@kylinos.cn>
References: <20260729063803.1453980-1-songxiebing@kylinos.cn>
	<20260730015302.253008-1-songxiebing@kylinos.cn>
	<20260730015302.253008-2-songxiebing@kylinos.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Thu, 30 Jul 2026 03:53:02 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> In alc269_probe(), codec->bus->pci is dereferenced without a NULL check
> for the ALC236 vendor ID case. Add the missing check, consistent with
> the existing pattern used elsewhere in the same function.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
> v2:
>  - Separate processing of return values from reading COEF and
> null pointer detection for device.

Applied to for-next branch now.  Thanks.


Takashi
