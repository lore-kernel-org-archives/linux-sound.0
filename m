Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744A8238C39
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570953; cv=none; b=SlaATtDBX9wBj4JDtDMYDD3bXNe16Cjye5rCyou9JjgkVvKzJVpyylYZKYJoJhbBBc2ciU8O2jqqEOv4SfGAtu0iWmynfbekI312xxAbvoAbCgDe+h/wQg233PC5xNVW1w7/0xDMnzoNaex+3S1VPR+7JZi1o1RTeH6ouJeYX0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570953; c=relaxed/simple;
	bh=zITek1tPMH8nu+uwzGmzcj+Sb8Rew32WOd6mh6FHoKo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CuIwsC3ba0SfataExc/B5iyOKovwn1+pu/iOFsGn2l0k+VGMJN/Gf3JydP7sQSw4Mps3EDD3Bw9t3TUMNE8K1WsMorA1v26j4blRT8D4i0CNXyKD1LVkgY+tq9/G83sJ6DGuOA5zx1212n0xswFWkpKXCR9WPEfrLpuzbrwbKlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2O+oOpTV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=76dskv/o; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2O+oOpTV; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=76dskv/o; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2O+oOpTV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="76dskv/o";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2O+oOpTV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="76dskv/o"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B457021225;
	Tue, 10 Jun 2025 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749570949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8n+HIyzlvQcN4PmPb5WHhmiYWzOTq/9YQsKNFG0gS6A=;
	b=2O+oOpTVvxrtznLTzJk/PULJ010y7FBmxagrDWiHC2SOzuU5IpIkevtwn0N4smEnXItiwu
	+DcixkfDau8xy0kYezoJAKvhgAG6/lhQL6zoT1W3CsNLHEo38wbVKF4Aq7ziSHffW7cO+t
	1BZ/hygTKYi9KTHvHkZAKoKOQx35KHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749570949;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8n+HIyzlvQcN4PmPb5WHhmiYWzOTq/9YQsKNFG0gS6A=;
	b=76dskv/ogJDy9bMdE7ilcBm4QdgkkhACZRZfYs+85nADx8G/DNInuyB+HtgVrk4VQVvXv2
	C3WT3mbvEOct0VDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749570949; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8n+HIyzlvQcN4PmPb5WHhmiYWzOTq/9YQsKNFG0gS6A=;
	b=2O+oOpTVvxrtznLTzJk/PULJ010y7FBmxagrDWiHC2SOzuU5IpIkevtwn0N4smEnXItiwu
	+DcixkfDau8xy0kYezoJAKvhgAG6/lhQL6zoT1W3CsNLHEo38wbVKF4Aq7ziSHffW7cO+t
	1BZ/hygTKYi9KTHvHkZAKoKOQx35KHI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749570949;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8n+HIyzlvQcN4PmPb5WHhmiYWzOTq/9YQsKNFG0gS6A=;
	b=76dskv/ogJDy9bMdE7ilcBm4QdgkkhACZRZfYs+85nADx8G/DNInuyB+HtgVrk4VQVvXv2
	C3WT3mbvEOct0VDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 849A113964;
	Tue, 10 Jun 2025 15:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lr4PH4VVSGgPWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Jun 2025 15:55:49 +0000
Date: Tue, 10 Jun 2025 17:55:49 +0200
Message-ID: <87bjqvy4je.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Lucy Thrun <lucy.thrun@digital-rabbithole.de>
Cc: tiwai@suse.de,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	lkp@intel.com
Subject: Re: [PATCH 1/2] ALSA: hda/ca0132: Use NULL instead of 0 for pointer assignment
In-Reply-To: <20250610122438.820-1-lucy.thrun@digital-rabbithole.de>
References: <20250610122438.820-1-lucy.thrun@digital-rabbithole.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Tue, 10 Jun 2025 14:24:37 +0200,
Lucy Thrun wrote:
> 

Thanks for the patch.
But please put some proper patch description.  An empty description is
already a bad sign.  There must be some reason to change the code as
you proposed, and please explain it.

> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506100842.d8lwwdwU-lkp@intel.com/

Those tags should be put without the quite ("| ").


thanks,

Takashi
