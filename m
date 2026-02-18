Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D744230CDBE
	for <linux-sound@vger.kernel.org>; Wed, 18 Feb 2026 07:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771401330; cv=none; b=YDFbMNENepw/zX0KwluxePWAshc6+zuTSmOAhl6HedCnKFFGgW94XqDWK2heM/MkmVhMBCY8FiCSgSSAzlUTFRxxe3kE4M3rT0VKg/xZb5/bxIJt5Ua/JA8l9wO0+pP5peNHYPs/FVC7D5c19tqQpxCP9V0MNKROmuG+iAG+bSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771401330; c=relaxed/simple;
	bh=yXMFFPqvcZEsxpn76YAMkASwAOQXBEUNN7AGmNOuPWA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GAV9LUqPuIEYoPYEvtEz37gjUamdS4o1XKTgJ51tL3WVm/mRERAmVW/bBb479CXT9otAclYno/iVs1U/gkbWSVHwNBv/gLAmSC2uBH4guhEWZGA70eXpiGGBzJdUarMtT5Up3t96jR9hlru2ytRbl2cjAKXoDdBRUSdkTpcr1sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2LfhNgzF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CggfRVmx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2LfhNgzF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=CggfRVmx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2LfhNgzF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CggfRVmx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2LfhNgzF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CggfRVmx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 323035BCC1;
	Wed, 18 Feb 2026 07:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771401327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUOCgsAZslz0cvdmQRS8OqilxMVx46Kp3LBKjbgm4GY=;
	b=2LfhNgzFodfnMSaeqTYohT26eH33J0vMjU8hMo7edz/9xoFun/VJTMJ7sP1PeHWLCF/Fqh
	Ww87v5/0BlZTxKHdqf1EPWGqO8CFDuPfi8o03hfxw3XbysGzA1a9rj/ASFgPV3q4cLk7I2
	yHlDHO+NMtiQTWWOoT5R/504+bO/dH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771401327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUOCgsAZslz0cvdmQRS8OqilxMVx46Kp3LBKjbgm4GY=;
	b=CggfRVmxTftK+enTCSB2fYvHSzIQzeLq1/YziK5/KQCz7/kh5u51N8FOjS1LgEyX27gmAC
	fn4KkbO6hipQemBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1771401327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUOCgsAZslz0cvdmQRS8OqilxMVx46Kp3LBKjbgm4GY=;
	b=2LfhNgzFodfnMSaeqTYohT26eH33J0vMjU8hMo7edz/9xoFun/VJTMJ7sP1PeHWLCF/Fqh
	Ww87v5/0BlZTxKHdqf1EPWGqO8CFDuPfi8o03hfxw3XbysGzA1a9rj/ASFgPV3q4cLk7I2
	yHlDHO+NMtiQTWWOoT5R/504+bO/dH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1771401327;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xUOCgsAZslz0cvdmQRS8OqilxMVx46Kp3LBKjbgm4GY=;
	b=CggfRVmxTftK+enTCSB2fYvHSzIQzeLq1/YziK5/KQCz7/kh5u51N8FOjS1LgEyX27gmAC
	fn4KkbO6hipQemBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E9A743EA65;
	Wed, 18 Feb 2026 07:55:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3kHBN25wlWnYAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Feb 2026 07:55:26 +0000
Date: Wed, 18 Feb 2026 08:55:26 +0100
Message-ID: <87zf56a3kh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tim Bird <tim.bird@sony.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-spdx@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound: core: Add SPDX license id to files
In-Reply-To: <20260212183103.3720788-1-tim.bird@sony.com>
References: <20260212183103.3720788-1-tim.bird@sony.com>
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
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 12 Feb 2026 19:31:03 +0100,
Tim Bird wrote:
> 
> Add an SPDX id of LGPL-2.0+ to files in the
> sound core sub-system that are missing ids.  Remove
> boilerplate text.
> 
> These files were originally submitted in a big commit
> for the ALSA sound system for kernel version 2.5.4,
> by Jaroslav Kysela, in Feb 2002.
> 
> Signed-off-by: Tim Bird <tim.bird@sony.com>

Thanks, applied now.


Takashi
