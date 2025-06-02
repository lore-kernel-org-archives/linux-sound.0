Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA31225A24
	for <linux-sound@vger.kernel.org>; Mon,  2 Jun 2025 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875755; cv=none; b=Dxvuo/wSI0ZR+AFZNpSlX0OEHHC8A6VWYIvPVhhlcHsxGXFyDCbgMfrGOzWMsxjzTK7DwFTEAYQ3Nr4RY+JrW+MNdoKBd072vPa6/OdV282i0cIwQV9lh2eYQiq6w76XtAI4iSzj8PqJMax6uBNbQAB4aNMVG1M6ixu7ZLGAjb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875755; c=relaxed/simple;
	bh=d9ctya9buO5j4uDlFRCuKRlV6/l3wpccp8oCDMkKaQ4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crCIytpfLC0SaZ3yPJ7jBBPeuN27A4ly7NW7z+fjvELxE1Hfa2/rbezxonLZewRIfRt5EwSc7A6RDfIWyBtxSg9KooThalNbcmu9HHR0bOp3l7qX3ukCCCqxFEvGmz3DlryadlGkzrQpYVhH38EvupmmtCHLDHNsNLa+DLJzfTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HKiO6hZR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YEFIUeBd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HKiO6hZR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=YEFIUeBd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HKiO6hZR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YEFIUeBd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HKiO6hZR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YEFIUeBd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2468021169;
	Mon,  2 Jun 2025 14:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1wNWF+l0D0VrY77V5QDMICTeAsBQ6pS5EZ7fWBLK9Y=;
	b=HKiO6hZRjjK7U1gouRwICieC2z33iK7hFijuRr5hp5CJkel7B/uGiJEHHjBQzo3yjrJfHl
	z92t62TzxzQ8TKwTLFKOvNZcY45vubMBW65FHNidgrLi11XbFfyjhbyXG87lBdbL1y9pQV
	dkVZb37VixMvc9j0TErGUPvCvdU+tYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1wNWF+l0D0VrY77V5QDMICTeAsBQ6pS5EZ7fWBLK9Y=;
	b=YEFIUeBd4oWdeMaUuVhC5nH9cf4V0XUw0os3nDT30Wk7iA/i2M8tkJOjgjsCe/iNaq+LcG
	5f2L0qNCoVcORIDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1748875752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1wNWF+l0D0VrY77V5QDMICTeAsBQ6pS5EZ7fWBLK9Y=;
	b=HKiO6hZRjjK7U1gouRwICieC2z33iK7hFijuRr5hp5CJkel7B/uGiJEHHjBQzo3yjrJfHl
	z92t62TzxzQ8TKwTLFKOvNZcY45vubMBW65FHNidgrLi11XbFfyjhbyXG87lBdbL1y9pQV
	dkVZb37VixMvc9j0TErGUPvCvdU+tYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875752;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p1wNWF+l0D0VrY77V5QDMICTeAsBQ6pS5EZ7fWBLK9Y=;
	b=YEFIUeBd4oWdeMaUuVhC5nH9cf4V0XUw0os3nDT30Wk7iA/i2M8tkJOjgjsCe/iNaq+LcG
	5f2L0qNCoVcORIDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D261613AE0;
	Mon,  2 Jun 2025 14:49:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /2S7Mee5PWiwXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:49:11 +0000
Date: Mon, 02 Jun 2025 16:49:11 +0200
Message-ID: <87r002xkpk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com,
	broonie@kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Ignore unsol events for cards being shut down
In-Reply-To: <20250530141309.2943404-1-cezary.rojewski@intel.com>
References: <20250530141309.2943404-1-cezary.rojewski@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,intel.com:email]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Fri, 30 May 2025 16:13:09 +0200,
Cezary Rojewski wrote:
> 
> For the classic snd_hda_intel driver, codec->card and bus->card point to
> the exact same thing. When snd_card_diconnect() fires, bus->shutdown is
> set thanks to azx_dev_disconnect(). card->shutdown is already set when
> that happens but both provide basically the same functionality.
> 
> For the DSP snd_soc_avs driver where multiple codecs are located on
> multiple cards, bus->shutdown 'shortcut' is not sufficient. One codec
> card may be unregistered while other codecs are still operational.
> Proper check in form of card->shutdown must be used to verify whether
> the codec's card is being shut down.
> 
> Reviewed-by: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Thanks, applied now.


Takashi
