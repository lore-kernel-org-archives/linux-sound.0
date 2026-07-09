Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9136EA99
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 16:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783614895; cv=none; b=k9z0jt8C9w0YtyfDpunlV5udcQn3CYzvdL13aoLiy1qamXW6bwfjybNbSx2EoDOhL6W7/X5XtdxUOcXrj4PX5zBBE0Y/YsKauo/Dcy9Sk/FUxIgIXrRNXtRmtnTp8b7kG2kzgClZmXRsM/Ev2aggXtMxrOiCx9QUf+kvPalxm2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783614895; c=relaxed/simple;
	bh=6D97TrTxBvOsvJqwHbsHD++VYFTZO904WtbO5/P9fFU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cxQlxmoIMFWF7/6Dgf0X8IttMajEvBD3yaJWTYVP4rtdPa7q8PIwl5ed0JjlKhD7TR6oBz1vpkHeeM3GmEf6in2r0xNU3neTVdhe7L9Vj3oNfBA/OOR97y7exAcJ3GcIh1TVC9fJmc8CHeOfUzww9s2ZILKwn0Yi5PKUt72y03E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DkcJgBUt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8gKbAFnx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DkcJgBUt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8gKbAFnx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DkcJgBUt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8gKbAFnx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DkcJgBUt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8gKbAFnx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4058E75FF0;
	Thu,  9 Jul 2026 16:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783614892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrQjW6eBXsv2JlGvbMKiM5JxAKA0qu+/iBO4pU8ugW8=;
	b=DkcJgBUtXbiiqh2fVt8dE31ncDxpfVtjeI1dn7GUEbbYaJQH/IdhB/IqYxGk5XBhQBAvlh
	E8qOdz69apDp7b0aRzPGk4dJ/wGSfFYFQUA/I0bcJnZiktPaoSzmzF+/P16VZo15vE/gaN
	BJ8U/tLYrryYk0HKAH4wfLYimxf5LEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783614892;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrQjW6eBXsv2JlGvbMKiM5JxAKA0qu+/iBO4pU8ugW8=;
	b=8gKbAFnxNvcREm8DCz2xAGEHaXYBBeEE10QSl5lw6zYQQ4VyArDWW+dWD10MuGqTwNgVNi
	btSaXN8GneeJIJBw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DkcJgBUt;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=8gKbAFnx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783614892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrQjW6eBXsv2JlGvbMKiM5JxAKA0qu+/iBO4pU8ugW8=;
	b=DkcJgBUtXbiiqh2fVt8dE31ncDxpfVtjeI1dn7GUEbbYaJQH/IdhB/IqYxGk5XBhQBAvlh
	E8qOdz69apDp7b0aRzPGk4dJ/wGSfFYFQUA/I0bcJnZiktPaoSzmzF+/P16VZo15vE/gaN
	BJ8U/tLYrryYk0HKAH4wfLYimxf5LEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783614892;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RrQjW6eBXsv2JlGvbMKiM5JxAKA0qu+/iBO4pU8ugW8=;
	b=8gKbAFnxNvcREm8DCz2xAGEHaXYBBeEE10QSl5lw6zYQQ4VyArDWW+dWD10MuGqTwNgVNi
	btSaXN8GneeJIJBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 69648779AA;
	Thu,  9 Jul 2026 16:34:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ce44FKvNT2qcZgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 16:34:51 +0000
Date: Thu, 09 Jul 2026 18:34:49 +0200
Message-ID: <877bn42kba.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda/cirrus_scodec: Make Kconfig visible if KUNIT
In-Reply-To: <20260709121224.614350-1-rf@opensource.cirrus.com>
References: <20260709121224.614350-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4058E75FF0
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus.com:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Thu, 09 Jul 2026 14:12:24 +0200,
Richard Fitzgerald wrote:
> 
> Make the Kconfig item for cirrus_scodec visible if CONFIG_KUNIT is
> enabled. This is so that its KUnit test can be enabled by KUnit
> scripts without requiring a large amount of irrelevant additional
> components.
> 
> The general rule for KUNIT_ALL_TESTS is that it should only enable
> tests for components that are already selected. However, the UML
> environment does not support ACPI, which means the HDA codec drivers
> that use cirrus_scodec cannot be selected. But cirrus_scodec does not
> need ACPI.
> 
> By making the Kconfig option visible if CONFIG_KUNIT, the KUnit test
> can be enabled with only the minimal set of functionality that is
> required for cirrus_scodec.
> 
> This is still compliant with the KUNIT_ALL_TESTS rule "only tests
> for enabled modules" because by default cirrus_scodec will only be
> enabled if the drivers that use it are enabled. It must be
> intentionally enabled to force it to be included for testing.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
