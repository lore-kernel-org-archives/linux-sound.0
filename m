Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299BD2D876A
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 05:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777441837; cv=none; b=jN8NCPSPLU96gRFgFKQNa5dHGDFQXDeypt4vCVyOtPyDiyHMFgZZZ1Ios/tyDVIvWJu5DzHy3cg5UY4voAlUbICr4IK3/UqBiSabOFRl9wTiboHg2ual2S1zIL9auyZaAnArs5/Tk6dIEgVGmPtahtnM3TKQReqFKS5Y2+/U7Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777441837; c=relaxed/simple;
	bh=yMIgXuIDAWhEfSPFZTES3gRdNz0Jib3+sAEZm+vFFgI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F4vsCCvJBXkFFwpv2tYrpeyEPgQ31dNKqINj/Wjl9OZtxyW+rjrh3XQkPotbSmHlkevqREc+TSGg6TKNPMn4iuprXUYG31cqVpNCfxHFPsVRfiuI/p7eAV2DEv9ljkbOu6xuyfNr/p84b8UuUY2xVY40alD7jIX2iXRWl93axMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=by0I9iJl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gJFs5Dpb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=by0I9iJl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=gJFs5Dpb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="by0I9iJl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gJFs5Dpb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="by0I9iJl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gJFs5Dpb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7AE4F5BCD5;
	Wed, 29 Apr 2026 05:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtJqTz5xj2UVPx47IF78unGGzz1bAj01J+xehDGXzJc=;
	b=by0I9iJl5kWsq909vewki0fvZ/PqqmxhEzpVslwRfF0RIEkd4U56WCt+zSv0uLyhBcUac2
	qVb5Owe6hwySeL4MVQ5WfvWH+XSIthadbvqphHD98WXqZyDN+ADsciTGPH1dIyWh4Zmwlo
	8nNc1PXX7ewfINxtRPmxBLK65HJC09c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtJqTz5xj2UVPx47IF78unGGzz1bAj01J+xehDGXzJc=;
	b=gJFs5DpbwolfqlWjqF6PlaD6LBT5Rk1KJXCmUZ8os227VQsWB2wci2yzFRw9Kz/Ob0aoQx
	K+FDoOiTtpG3u0Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777441834; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtJqTz5xj2UVPx47IF78unGGzz1bAj01J+xehDGXzJc=;
	b=by0I9iJl5kWsq909vewki0fvZ/PqqmxhEzpVslwRfF0RIEkd4U56WCt+zSv0uLyhBcUac2
	qVb5Owe6hwySeL4MVQ5WfvWH+XSIthadbvqphHD98WXqZyDN+ADsciTGPH1dIyWh4Zmwlo
	8nNc1PXX7ewfINxtRPmxBLK65HJC09c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777441834;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xtJqTz5xj2UVPx47IF78unGGzz1bAj01J+xehDGXzJc=;
	b=gJFs5DpbwolfqlWjqF6PlaD6LBT5Rk1KJXCmUZ8os227VQsWB2wci2yzFRw9Kz/Ob0aoQx
	K+FDoOiTtpG3u0Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4657C593B0;
	Wed, 29 Apr 2026 05:50:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NGTWDyqc8WkILwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 29 Apr 2026 05:50:34 +0000
Date: Wed, 29 Apr 2026 07:50:33 +0200
Message-ID: <875x5aqpqu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: cs35l56: Fix uninitialized value in cs35l56_hda_read_acpi()
In-Reply-To: <20260428130531.169600-1-rf@opensource.cirrus.com>
References: <20260428130531.169600-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
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
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Tue, 28 Apr 2026 15:05:31 +0200,
Richard Fitzgerald wrote:
> 
> Eliminate the uninitialized 'nval' in cs35l56_hda_read_acpi() if a
> system-specific quirk overrides processing of the dev-index property.
> The value is now stored in a new 'num_amps' member of struct cs35l56_hda
> so that the quirk handler can set the value.
> 
> The quirk for the Lenovo Yoga Book 9i GenX  replaces the values from the
> dev-index property with hardcoded indexes. So cs35l56_hda_read_acpi() would
> then skip reading the property. But this left the 'nval' local variable
> uninitialized when it is later passed to cirrus_scodec_get_speaker_id().
> 
> Fixes: 40b1c2f9b299 ("ALSA: hda/cs35l56: Workaround bad dev-index on Lenovo Yoga Book 9i GenX")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/linux-sound/aenFesLAStjrVNy8@stanley.mountain/T/#u
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
