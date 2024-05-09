Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACB1130E2F
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 12:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715258142; cv=none; b=DdsKRwsGrBZb94E8pJ5dSzm4O3kf1qW7IlwXcajR0+hr4aWRLADUKWJPP99ZpJpKxhtflxIK4AI0EPfqyQSrKqAJZaIbSEangKKv7h64KY7K4Fp4ludPe/sRosfrJDg3v48EtlbGLGcsiisemXYQYURmJURfXJ8gXlZnCF9X2fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715258142; c=relaxed/simple;
	bh=Fj8omHF8ylUlA60RBjdpH3HVi8ILFq0vOl/GG7E2y4U=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kajJBKoD6UHj2J31KaN4+JDm4f1yYsf7LBRk5W4MNaqIqrnsb45GiCsUXwO41mT/Rk3JRWc31XhT+dLeHhlyaUUjCYEnOVT0mc+5PihXsN7z/NsKNpjgF4LYzUuMYIl34byP/fC3AjggD6Tl+JKsCRaGf9yRV7v3zO1qC1x8sV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mMijdsPW; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aPcV3dR6; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bEWqv0eC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TFuymDdz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mMijdsPW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aPcV3dR6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bEWqv0eC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFuymDdz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 123F85FF2B;
	Thu,  9 May 2024 12:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715258133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb2qGrkh8sxFA2PtI6qRyIFyKz3KBq0Hn09BKwdAyGA=;
	b=mMijdsPWAJ7DoA14LXlJBuG8GZjNXzu6P/xw9ycoWnM+cUeeQcr6TzAZCsYXREeqafH/3N
	PXVXSJVt4/3314QWib5vqQPbtr8Xxb39bhXv5ZEzj4tzkbkVWu9t2r660wwKEQgS82kmNm
	Xwl26WW6F1d7MFCbJDXuqLH8eD90pjw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715258133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb2qGrkh8sxFA2PtI6qRyIFyKz3KBq0Hn09BKwdAyGA=;
	b=aPcV3dR6AcS7BkgwveKZhOiR+oif4MPMBTFkB9BnyrLVh5kRu2qVY6GLxNGJ5YMJmINT+3
	NppiakcENUUfOkCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715258132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb2qGrkh8sxFA2PtI6qRyIFyKz3KBq0Hn09BKwdAyGA=;
	b=bEWqv0eCfScfBm5rPh2wzHKsy6zvYpi0jz2Wr8GK+OgYptXnMMgYTFGx2GoYU+6vsUumD8
	gxlPObfjkh5QEa6SSBra5ffna6JC/Cx2/TvSkbW3FqU7M7P/OS5kBmH2MY01eu7T4i4rq8
	dMaILezntlCVKkTeKWyKPzYmUxV/P5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715258132;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nb2qGrkh8sxFA2PtI6qRyIFyKz3KBq0Hn09BKwdAyGA=;
	b=TFuymDdzK4IDl3DQT79YG3m0TijIKMk6xKkeG9a7rzwsIycceP20GnPRVERGcNfbPeH3+K
	0NRIR4AZiDsO2rBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C735F13A24;
	Thu,  9 May 2024 12:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QuFoLxPDPGbLYgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 May 2024 12:35:31 +0000
Date: Thu, 09 May 2024 14:35:46 +0200
Message-ID: <87zfsz9n8d.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	<alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>,
	<perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>,
	<hdegoede@redhat.com>,
	<rafael@kernel.org>
Subject: Re: [PATCH 1/2] ALSA: hda: intel-dsp-config: Switch to ACPI NHLT
In-Reply-To: <892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
References: <20240419084307.2718881-1-cezary.rojewski@intel.com>
	<20240419084307.2718881-2-cezary.rojewski@intel.com>
	<892ad456-cfe5-4ff1-ab67-7709677608cd@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Thu, 09 May 2024 13:15:15 +0200,
Cezary Rojewski wrote:
> 
> On 2024-04-19 10:43 AM, Cezary Rojewski wrote:
> > From: Amadeusz S³awiñski <amadeuszx.slawinski@linux.intel.com>
> > 
> > Now that NHLT support in ACPI framework was introduced, migrate
> > intel-dsp-config driver to new API.
> 
> Hello,
> 
> I see that this patch has not landed in Mark's for-next. Takashi,
> what's the verdict here? Should this go entirely (entire patchset)
> through Mark or should the NHLT changes [1] plus this patch alone be
> incorporated into for-next of yours separately?

OK, I took the patch now to my tree.


thanks,

Takashi


> 
> 
> [1]:
> https://lore.kernel.org/linux-acpi/20240319083018.3159716-1-cezary.rojewski@intel.com/
> 
> 
> Kind regards,
> Czarek
