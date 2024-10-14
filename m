Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19382B2DA
	for <linux-sound@vger.kernel.org>; Mon, 14 Oct 2024 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900024; cv=none; b=UbeqNiKy55ToCGTy+IMM2YNcsjFH8krDlQThtFhbdkoN1VXxyoEtmt9ZLnX8OSQDD45mjY6/dR8k5PRbDIMri5NW4/WYTEmuSo+wG8PwEu6KSY+l6nv2HzIV9seboCrsIyVWfbP3pIKthU9phzV3+DjgmIVmkivmZo/Hrv+aIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900024; c=relaxed/simple;
	bh=5UGjYtQm/0rIRuRAqyzITbqvWpbjs3ljd2UDiM7r8EM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTgycnbthcTIrX5Zrg403qZ9NRy49+dfmkTkMsutrOUv9CCPrABNDNuBTlxgqH79EgE0lbQdKqRNVnlQ0pRZypKt390ndApSpe+fMEod0+alsVtEg4IQ2zlFzfMNRpDJgUjEJWIVGL0641IWPK8LTfL+mymRS0isOJ/abyPKspw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CIegclpe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZXapilz8; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CIegclpe; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZXapilz8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CIegclpe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZXapilz8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CIegclpe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZXapilz8"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1802A1FB8C;
	Mon, 14 Oct 2024 10:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728900021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Y7f9bPdoSSo2iXXkT88VXkxIo92IJv0UdG4cppk3YQ=;
	b=CIegclpeRvsTUBoHond7ewcUXw9GPQ8T0Ls837HeWxhACp8yYa7OUNtuTOTqTR3fKAEKXd
	+uBTB7ONMsN72lS7H06fQiTxZzJwmi0fZvADijonWvHPP+pl+bQ42o1SZwtWvm3FWpYf/K
	PwWA7dcHolCToLynwwKE1w0UaLsu0co=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728900021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Y7f9bPdoSSo2iXXkT88VXkxIo92IJv0UdG4cppk3YQ=;
	b=ZXapilz8J/yDIFb+JQoV2UoeJMrnkrby8p7GeLToHbuhlJ2VzEAVAJjmQvypudZrhTlhxm
	KF9Av3gxsexU5QBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728900021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Y7f9bPdoSSo2iXXkT88VXkxIo92IJv0UdG4cppk3YQ=;
	b=CIegclpeRvsTUBoHond7ewcUXw9GPQ8T0Ls837HeWxhACp8yYa7OUNtuTOTqTR3fKAEKXd
	+uBTB7ONMsN72lS7H06fQiTxZzJwmi0fZvADijonWvHPP+pl+bQ42o1SZwtWvm3FWpYf/K
	PwWA7dcHolCToLynwwKE1w0UaLsu0co=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728900021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Y7f9bPdoSSo2iXXkT88VXkxIo92IJv0UdG4cppk3YQ=;
	b=ZXapilz8J/yDIFb+JQoV2UoeJMrnkrby8p7GeLToHbuhlJ2VzEAVAJjmQvypudZrhTlhxm
	KF9Av3gxsexU5QBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAA5213A51;
	Mon, 14 Oct 2024 10:00:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LH3eM7TrDGfuEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 14 Oct 2024 10:00:20 +0000
Date: Mon, 14 Oct 2024 12:01:18 +0200
Message-ID: <87ed4jj95d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Fix all stream interrupts definition
In-Reply-To: <20241014094958.708563-1-amadeuszx.slawinski@linux.intel.com>
References: <20241014094958.708563-1-amadeuszx.slawinski@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,intel.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 14 Oct 2024 11:49:58 +0200,
Amadeusz S³awiñski wrote:
> 
> It is defined in header to 0xFF, which only allows to set values for 8
> streams. In specification it is defined as bits from 0 to 29. In
> practice there is no HW with 29 streams, but as the only place where the
> value is used is chip initialization, it is best to make sure that all
> bits are reset properly.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>

Applied to for-next branch.  Thanks.


Takashi
