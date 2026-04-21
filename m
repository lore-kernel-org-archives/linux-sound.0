Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA578175A87
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 08:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776758846; cv=none; b=KmNEMEjFpolxF+dF5jGQ8/sDVJ+rMyxdxlrzk46s+Ztf8D1ji/d5f86itjaNt0Amkcxud4T1wiOsDX4JBWwC/Ji2gZIvVGza6Z2qajakvl6/l1PPLqSB6mT848gWIJUN9D2VGfsH+FS5Tt1Qg/PxQ1tetujqzTu1J/AkPj5mIhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776758846; c=relaxed/simple;
	bh=Osj3wZfj8k3k1Kp8cMPW67eU3hsGW8MtCSE9NS8TCls=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iFy1NjcjBbtD5qvZ+ntB/qyfFiHNXFQcxgrYEAlKLF/QT5/gV7adfkoKIgnfl9e2Ny4S8XKYAx810WdyRoTl+P5Tr195fe5c8zwY7CkDp/OKOxEGmHb6IZNFi5ii+OEiMSu9ewOKKYExS/fplQJvGbm+ujSpLvhY00xId8usKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fIotBdlM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SRxwKt/N; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fIotBdlM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SRxwKt/N; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fIotBdlM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SRxwKt/N";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fIotBdlM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SRxwKt/N"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1622F6A810;
	Tue, 21 Apr 2026 08:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776758843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqp5nvi6JUNz7QkrEAjj8RNxXibJHcXo+M2GwJ6X2RY=;
	b=fIotBdlMdzvGJg2VTwNIsv2K1KUW5693gY2WG1iRMTTA9WjSiuXqdnDLwvCNzJNvhs7Li3
	qygZ8yPXI0MEV6MJ/ZZMV8LAKJmKWPWEhyNKiqPReXP4kQZMH5iHbt5UiNTLFNCz/jCdoX
	Mm9pizKTbQotEQDqP4CTV+oSjShbU1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776758843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqp5nvi6JUNz7QkrEAjj8RNxXibJHcXo+M2GwJ6X2RY=;
	b=SRxwKt/NI8uKVKf+d7yCl3d40MttGjEQzLVIEvyZVHIok0MsOEf6P93lxESFMmQwsuxKil
	cugflLDFBojUSQDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776758843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqp5nvi6JUNz7QkrEAjj8RNxXibJHcXo+M2GwJ6X2RY=;
	b=fIotBdlMdzvGJg2VTwNIsv2K1KUW5693gY2WG1iRMTTA9WjSiuXqdnDLwvCNzJNvhs7Li3
	qygZ8yPXI0MEV6MJ/ZZMV8LAKJmKWPWEhyNKiqPReXP4kQZMH5iHbt5UiNTLFNCz/jCdoX
	Mm9pizKTbQotEQDqP4CTV+oSjShbU1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776758843;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kqp5nvi6JUNz7QkrEAjj8RNxXibJHcXo+M2GwJ6X2RY=;
	b=SRxwKt/NI8uKVKf+d7yCl3d40MttGjEQzLVIEvyZVHIok0MsOEf6P93lxESFMmQwsuxKil
	cugflLDFBojUSQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D41E9593AF;
	Tue, 21 Apr 2026 08:07:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id f1aYMjow52mgTwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 21 Apr 2026 08:07:22 +0000
Date: Tue, 21 Apr 2026 10:07:22 +0200
Message-ID: <87y0igag91.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chris Chiu <chris.chiu@canonical.com>
Cc: tiwai@suse.com,
	kailang@realtek.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add LED fixup for HP EliteBook 6 G2a Laptops
In-Reply-To: <20260421023429.3723154-1-chris.chiu@canonical.com>
References: <20260421023429.3723154-1-chris.chiu@canonical.com>
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, 21 Apr 2026 04:34:28 +0200,
Chris Chiu wrote:
> 
> The HP EliteBook 6 G2a laptops requires specific LED control method
> ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF to work.
> 
> Signed-off-by: Chris Chiu <chris.chiu@canonical.com>

Applied now.  Thanks.


Takashi
