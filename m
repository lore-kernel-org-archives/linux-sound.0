Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636E3876B7
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076321; cv=none; b=dM5UiF+/gLoBHSaQn1KD7IOWm3TMrsa1klTrV0fn3a9/XhHIKmxxCivcpjrUlw/ywq1pw5mA/6feejpmDOBW8Zk2Acm04KcYyqItso5s0nc5dpiUPTdMHnXpPoAoOi8951zD0U82uxit7m6+awWtbY4tp/qpm4PUt0JqLQK6eUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076321; c=relaxed/simple;
	bh=FOXW7qN9J7q9CmjEz8FYXg/LbWuBSU/0/oneRaSgZRM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBqlhvNE2+rYZdWNGHGgXx2Y3N8/c5OLKcfes/esdjjTMCZ5/R/oC0mzuN3gwdgiY4ERI1f8p77m7+oepwomTQzbUGJtJlksDX+F5jCy/kLlfcHSZlwJshHiYUIW4ru8sNIOzO6M23KvzYimdE8jgogHpd4pIRPU30QDnzllqYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N84jYnSW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=csqrCnUc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=N84jYnSW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=csqrCnUc; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N84jYnSW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="csqrCnUc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="N84jYnSW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="csqrCnUc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B4C40758CD;
	Wed, 10 Jun 2026 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8S0Us72hdU1Lu5ijr1/b6mSrUCA4Nh5glTIc9Io0L+4=;
	b=N84jYnSWvk+qZbJHNrij6eCMeMr3WdlIDOZp+4v/UrqHhslJw0/XvcVVBOT/lMHH4RgCq0
	gh13Gcqy7v9gqPBmD2iXAteglC3GeRa8bHMTwltDpQM5YA553VHPsTG9SzmIfhrZT9urbC
	W+3JM55nQbVWtCBub8KgvM1Me16igZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8S0Us72hdU1Lu5ijr1/b6mSrUCA4Nh5glTIc9Io0L+4=;
	b=csqrCnUcBzj9UhxX+OGwwdGaIFIwI+XLxJ9pkKJA2liGv845Z6BtTmhpksdTuih3SbilUp
	5fwxO6bPfNCywbDA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781076318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8S0Us72hdU1Lu5ijr1/b6mSrUCA4Nh5glTIc9Io0L+4=;
	b=N84jYnSWvk+qZbJHNrij6eCMeMr3WdlIDOZp+4v/UrqHhslJw0/XvcVVBOT/lMHH4RgCq0
	gh13Gcqy7v9gqPBmD2iXAteglC3GeRa8bHMTwltDpQM5YA553VHPsTG9SzmIfhrZT9urbC
	W+3JM55nQbVWtCBub8KgvM1Me16igZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781076318;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8S0Us72hdU1Lu5ijr1/b6mSrUCA4Nh5glTIc9Io0L+4=;
	b=csqrCnUcBzj9UhxX+OGwwdGaIFIwI+XLxJ9pkKJA2liGv845Z6BtTmhpksdTuih3SbilUp
	5fwxO6bPfNCywbDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 875EA779A7;
	Wed, 10 Jun 2026 07:25:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hn7QH14RKWosQAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 10 Jun 2026 07:25:18 +0000
Date: Wed, 10 Jun 2026 09:25:18 +0200
Message-ID: <87tsra6en5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ALSA: Improve style of pnp_device_id array terminators
In-Reply-To: <47ae32220446ec1869898cf5e4b75ec94c32dfdf.1781023479.git.u.kleine-koenig@baylibre.com>
References: <47ae32220446ec1869898cf5e4b75ec94c32dfdf.1781023479.git.u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Tue, 09 Jun 2026 18:46:10 +0200,
Uwe Kleine-König (The Capable Hub) wrote:
> 
> To match how device-id array terminators look like for other device
> types drop `.id = ""` from it and let the compiler care for zeroing the
> entry.
> 
> There are no changes in the compiled drivers, only the source looks
> nicer.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Applied to for-next branch now.  Thanks.


Takashi
