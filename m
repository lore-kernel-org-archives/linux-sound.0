Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587641E9B3F
	for <linux-sound@vger.kernel.org>; Sun,  7 Dec 2025 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765109583; cv=none; b=quc0TxaGNd8q38bJ0wSuyOpOcwhbgnve2Re1mSjH9c2iLEBRRw65UVdBu0Ikns5mFCVhnPsvjxOhy+bTXT/JrgPsWJha6wlq6fHmgaYba9iX8lEe9RIQuhBSZ3zl5WIew0JBTlG1s/7XeliSdfLQ++kCN+5ornXI6i8cmOSPiQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765109583; c=relaxed/simple;
	bh=Nx4ziCL8bJ2johbajJHlPK9ijoeqjOTP+lrtvZefkLA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oAOFpcLzAEvYKj2dVT0URTVrxTw5OJmCl6QBXXMa5C9wQMkzaF8fY2VPTPKOtTcOlqMONiB4cXjjtoA6HUVfBY5EkC9YWkbTKAZQdbM9HtEp6t8jI/UONvmU7vBBLMjiZkdBj4Mc2Q50H4cgkvbP7mYUVd4qvoin5NAL9m1rUHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=B9+6ZGSD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OXkCpRHI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QVO2fRAn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1dnriai/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B9+6ZGSD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OXkCpRHI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QVO2fRAn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1dnriai/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 03FF25BCF5;
	Sun,  7 Dec 2025 12:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UwQ2tTjN5GOG1mgKqn4abKHwu6jBIK4lw3HIuwOy7vU=;
	b=B9+6ZGSDh5SZSrMGMYkke7i8oUgkD5DCiPVmmmKfKHBqaaclzjO2GLnplen4dPpylbIGlM
	PtVdwA5ECfJjOL0fYszKqvW6YJS4n5wUdyU0yr5oWqNBIJzhaKc+hO04mAJko4lnXqBEVL
	TDJrM85Gp4gUMth83E5KxYHYYhBmOb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109574;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UwQ2tTjN5GOG1mgKqn4abKHwu6jBIK4lw3HIuwOy7vU=;
	b=OXkCpRHIuj3gtr2foMXb1CYYflwVid0X9bgF97ZwghIC/MBkg4d3/hNyiYHmcHCbKuxtVJ
	n2Fk+2Es4HQPbjCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765109573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UwQ2tTjN5GOG1mgKqn4abKHwu6jBIK4lw3HIuwOy7vU=;
	b=QVO2fRAnXpsQbuZn3Brhyujag7OLxCEteTuNMobnCPACgjylz0z/Fj/Cz8TPGJnp0KGtJa
	fqlFeGBgll4/whp6yKXg/37fvq0L4UXIUjiHGbm6JdBHa+RXwpTQJL9D1vViBNnNGv1G++
	oUCLAb1j8krQEoQnEb+ACeKJ4VmfV0k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765109573;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UwQ2tTjN5GOG1mgKqn4abKHwu6jBIK4lw3HIuwOy7vU=;
	b=1dnriai/vebLCYgkQ+C3XT+toNI1JmjlGtKs1cMmsJ45EtfyUSpbQR6qZYkLMJ2B+ibOBt
	U60iVUNgwaoopFAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BAE5A3EA63;
	Sun,  7 Dec 2025 12:12:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xh52K0RvNWl1IAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 07 Dec 2025 12:12:52 +0000
Date: Sun, 07 Dec 2025 13:12:52 +0100
Message-ID: <87sedmv6bf.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] Add Support for three HP/ASUS laptops using CS35L41
In-Reply-To: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
References: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.25 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.15)[-0.771];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.25

On Fri, 05 Dec 2025 16:05:53 +0100,
Stefan Binding wrote:
> 
> Add support for two HP and 1 ASUS laptops using CS35L41 HDA.
> These laptops use Internal Boost (HP) and External Boost (ASUS) with I2C.
> 
> Stefan Binding (2):
>   ALSA: hda/realtek: Add support for HP Turbine Laptops
>   ALSA: hda/realtek: Add support for ASUS UM3406GA

Applied both patches now.  Thanks.


Takashi
