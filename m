Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C3C2ED
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715279105; cv=none; b=kcy1ht7jwSDh7FkvRdrZW2DQaFWtaNQLVHYil+F9n/DrdjpzKxwB6Yh1PGairqoMmqW2a62T8WvxJemeCO7i1sNmv6BJ/8d7u8mRXRhRKtmXSsSUcmVAlPunMb1fqY9M5xv88vT8t0pP0sFw/3ULhHq6D8Jq1vLHMFLwXup9le4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715279105; c=relaxed/simple;
	bh=OoYgrioelbsOKtHSb3Ts6idZ9W1cRPY/0JdsOVdNjFw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f2U6VhVHVehcl9KhNkbxjXwOKGVRwmGzVU6p9QxIKP1D5ZWO7DxV/17PF40/znSp3IfEDMIoM1CRQgNbGCtj4DRUJdUTIIUE/dsbdlcbkp92he/7aFjWG8SvhgKIKH5emlxC04pLS7mSVH/wkF9Nkxh26MescbVUNazRhf05zdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A8UFbAph; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7uH/ueaK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=A8UFbAph; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7uH/ueaK; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A8UFbAph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7uH/ueaK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="A8UFbAph";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7uH/ueaK"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6445A605B2;
	Thu,  9 May 2024 18:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715279102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=A8UFbAphdpZs5QssilgNZc1S86sSZbWie43aXmrm8oaT5feh2b9cP7zFXh2EbGoHjE2J8r
	AYS6jRM+9ynH6wN6ESLwYEOfR7k+YuEnqI7K322Q86SSaBu7eam5ufL0YqxTRr+4ID1WZ7
	0WzXnqrZZep7fCRsGjWZw2v7GF6UwPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=7uH/ueaKo9p/KhR91KgAOqOd2sP1DjShaEhHL0Om2PFGrHWTIGtgjlp4FrC6nJUAQvI1xL
	F5HDYu0LJN3Vt1Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715279102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=A8UFbAphdpZs5QssilgNZc1S86sSZbWie43aXmrm8oaT5feh2b9cP7zFXh2EbGoHjE2J8r
	AYS6jRM+9ynH6wN6ESLwYEOfR7k+YuEnqI7K322Q86SSaBu7eam5ufL0YqxTRr+4ID1WZ7
	0WzXnqrZZep7fCRsGjWZw2v7GF6UwPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715279102;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KnCVpeZusPnIDUJeLHJVPaKdd2uDQNX1q2chP9jLd20=;
	b=7uH/ueaKo9p/KhR91KgAOqOd2sP1DjShaEhHL0Om2PFGrHWTIGtgjlp4FrC6nJUAQvI1xL
	F5HDYu0LJN3Vt1Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 217ED13941;
	Thu,  9 May 2024 18:25:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C7/WBv4UPWbGRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 18:25:02 +0000
Date: Thu, 09 May 2024 20:25:16 +0200
Message-ID: <87r0eaalmb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	rafael@kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
In-Reply-To: <ZjzuxCqME77ei91Z@finisterre.sirena.org.uk>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
	<20240419084307.2718881-2-cezary.rojewski@intel.com>
	<892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
	<87zfsz9n8d.wl-tiwai@suse.de>
	<87v83n9lpv.wl-tiwai@suse.de>
	<ZjzuxCqME77ei91Z@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Thu, 09 May 2024 17:41:56 +0200,
Mark Brown wrote:
> 
> On Thu, May 09, 2024 at 03:08:28PM +0200, Takashi Iwai wrote:
> 
> > I don't know how Mark applied the ASoC patch, but if that actually
> > worked, it's better to take from his tree.  Or, in such a case, at
> > best to be merged through the tree where the new API got introduced
> > (i.e. ACPI tree).
> 
> The cover letter mentioned a branch that's a dependency - TBH I'd been
> expecting you to apply the core ALSA patch to your tree, but I can apply
> to mine if you prefer?

Ah thanks, I overlooked that.  Now applied to my tree.


Takashi
