Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46998139D19;
	Mon, 30 Dec 2024 10:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735555233; cv=none; b=RpTaLHmBFCHQ6vaExoZWa2+skADA6Xk66jSIL/srzlaBpSIpo+tdHq9WgeDEAU46uSbIRdIPWUMkM/HkmzGDoj6CzvinimHRjcz3SdfhJqkfDJtwCNux/1bNNi2tPjJQuGQdL22GBc5sCf/xRxNdeoTajOxdrdlMUKSmaNzS6JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735555233; c=relaxed/simple;
	bh=lX/6zJNDGWLjMSGGGKdCLnt5cA20a0pUU7vDIAX22J0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZfLkdPpjUbxphWNTESG35ha5sKQgNHLkVLQ9RCtXYqbAhRw64fdSjl1aNEVLbDsMVNzZ1BVMJjY331ulEWEAJlmyZqGPA8/OYV0YQ58ktLMrLWvUkkJ4scOpLFZ2TQ41Ce8AaF4pQA77Vd8QzMFSehy19ASqPjzBwPTv/9Ni4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K0U/tBc+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JgOShUX3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=K0U/tBc+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JgOShUX3; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K0U/tBc+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgOShUX3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K0U/tBc+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JgOShUX3"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A1A821F381;
	Mon, 30 Dec 2024 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735555222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta5BTekU8SiRwRX7lMwcPscXnxXyEQPDpdeOyRnj5ns=;
	b=K0U/tBc+FoPrbc4PX3xMoLi7tGTVpn1L9DR9sLJkS7EeU0UIRihFXeHtmj5ZdUi5TMqqXU
	FiZE7Urc9+19RukJjLe5/6K/BZf3//Ht4UXswiC5iLORNkbtZEqbdC04ZbdRB/4JQnIap+
	d2t81x6sWPOzmyAx7CaR+OEnHKAbvk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735555222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta5BTekU8SiRwRX7lMwcPscXnxXyEQPDpdeOyRnj5ns=;
	b=JgOShUX3z4UBWYoi29NYkk4prbvUlGPQ3SRHi28E3uwflIpRKzlo9NeZrW3IrMfUN1B6vq
	mksmYuofaq1bGEDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735555222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta5BTekU8SiRwRX7lMwcPscXnxXyEQPDpdeOyRnj5ns=;
	b=K0U/tBc+FoPrbc4PX3xMoLi7tGTVpn1L9DR9sLJkS7EeU0UIRihFXeHtmj5ZdUi5TMqqXU
	FiZE7Urc9+19RukJjLe5/6K/BZf3//Ht4UXswiC5iLORNkbtZEqbdC04ZbdRB/4JQnIap+
	d2t81x6sWPOzmyAx7CaR+OEnHKAbvk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735555222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ta5BTekU8SiRwRX7lMwcPscXnxXyEQPDpdeOyRnj5ns=;
	b=JgOShUX3z4UBWYoi29NYkk4prbvUlGPQ3SRHi28E3uwflIpRKzlo9NeZrW3IrMfUN1B6vq
	mksmYuofaq1bGEDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2822413A30;
	Mon, 30 Dec 2024 10:40:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GA4GCJZ4cmcTaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 10:40:22 +0000
Date: Mon, 30 Dec 2024 11:40:21 +0100
Message-ID: <87ttalwj1m.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <tiwai@suse.de>,
	<robh+dt@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<lgirdwood@gmail.com>,
	<perex@perex.cz>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<liam.r.girdwood@intel.com>,
	<yung-chuan.liao@linux.intel.com>,
	<broonie@kernel.org>,
	<antheas.dk@gmail.com>,
	<stuart.a.hayhurst@gmail.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Ignore SUBSYS_ID not found for tas2563 projects
In-Reply-To: <20241230064910.1583-1-baojun.xu@ti.com>
References: <20241230064910.1583-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,vger.kernel.org,intel.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Mon, 30 Dec 2024 07:49:10 +0100,
Baojun Xu wrote:
> 
> Driver will return error if no SUBSYS_ID found in BIOS(acpi).
> It will cause error in tas2563 projects, which have no SUBSYS_ID.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Thanks, applied now.


Takashi
