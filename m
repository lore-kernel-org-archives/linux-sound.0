Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8486E647;
	Thu, 26 Dec 2024 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735229437; cv=none; b=SdBEYAFyEz3CVQn9NaALA1XV6IAUN8XJX++hYvnmhzL343b3HVCFD5kQyxiyih5jSP8UXW4zEudNmj3CreIWMT5qyKIYraWwLd7rMVnOis8WemsYi5tbZmji+67/uKiNXN1cycge4KJEf2INbdUjswu4YnRjZZfisXeTCxp3sLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735229437; c=relaxed/simple;
	bh=wW1O4EO51nXl57hFAX+qXgqIzUHH2a5oHoJZ0qbvJWU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bPcCF0dFV0ams0PlCgWsH2UGo2gLR5m/AHs+l0Tcz3jbSBqCRIz4zK5KF30V6wC4tsLZqy3k28jNH2aNi2NhkAJLMi+/59OgY6l0ZgnHB7wiDIQO5tLxLawzCo/TYtC7l7F4Iof2z5WM6BBOVs1F5Mxk+dX62Y2mXc3k85m2teM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VrNRpaLl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wLHI0b3J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VrNRpaLl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wLHI0b3J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VrNRpaLl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wLHI0b3J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VrNRpaLl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wLHI0b3J"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9506B2214A;
	Thu, 26 Dec 2024 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735229427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T/QcknG6mIojoqa8R8Qd/+7ojAGVsBIgFeiZJhZx/E0=;
	b=VrNRpaLlv6yT4aCIpxmmFytnOnErsC6/Cm+d7CapAcjS0q56fT6VsxmBx4F1whEFNnviCG
	o+A9L+lEttKEmZmLhy3RmsJDdijcuFxidbY74XWFnVhyUs4lOptnO5I574ZKQGKbiVFtPf
	vp91W3G7Vnsd79vwdCX2cHfXg0A+boo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735229427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T/QcknG6mIojoqa8R8Qd/+7ojAGVsBIgFeiZJhZx/E0=;
	b=wLHI0b3JyapRKMY5A1IDbPEjIem86J959YKNaepPmWCyn9D8/Sp+XUT66qysP1YsT1GYU4
	Hgrlxme5dhsA+LCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735229427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T/QcknG6mIojoqa8R8Qd/+7ojAGVsBIgFeiZJhZx/E0=;
	b=VrNRpaLlv6yT4aCIpxmmFytnOnErsC6/Cm+d7CapAcjS0q56fT6VsxmBx4F1whEFNnviCG
	o+A9L+lEttKEmZmLhy3RmsJDdijcuFxidbY74XWFnVhyUs4lOptnO5I574ZKQGKbiVFtPf
	vp91W3G7Vnsd79vwdCX2cHfXg0A+boo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735229427;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T/QcknG6mIojoqa8R8Qd/+7ojAGVsBIgFeiZJhZx/E0=;
	b=wLHI0b3JyapRKMY5A1IDbPEjIem86J959YKNaepPmWCyn9D8/Sp+XUT66qysP1YsT1GYU4
	Hgrlxme5dhsA+LCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EDEA13999;
	Thu, 26 Dec 2024 16:10:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6e2EG/J/bWcYXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 26 Dec 2024 16:10:26 +0000
Date: Thu, 26 Dec 2024 17:10:21 +0100
Message-ID: <871pxu77de.wl-tiwai@suse.de>
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
Subject: Re: [PATCH v7] ALSA: hda/tas2781: Add speaker id check for ASUS projects
In-Reply-To: <20241224085601.426-1-baojun.xu@ti.com>
References: <20241224085601.426-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
X-Spam-Flag: NO
X-Spam-Level: 

On Tue, 24 Dec 2024 09:56:01 +0100,
Baojun Xu wrote:
> 
> Add speaker id check by gpio in ACPI for ASUS projects.
> In other vendors, speaker id was checked by BIOS, and was applied in
> last bit of subsys id, so we can load corresponding firmware binary file
> for its speaker by subsys id.
> But in ASUS project, the firmware binary name will be appended an extra
> number to tell the speakers from different vendors. And this single digit
> come from gpio level of speaker id in BIOS.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

The previous patch has been already merged.

Please create an incremental patch on top of Linus tree with a proper
description about the change of that patch, and resubmit it instead.


thanks,

Takashi
