Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3C3ED3C2
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 10:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878121; cv=none; b=JKUAPpAnrah+SU9+V1KrPTM6trbGIugNCDDzHabi7ho3BpPuACC0KUmvHBd8dTY3KYGWZ6qJO66lSlxo5JlzW4Stl6DgS3EAIg9WCiPJ9ebXzyiN7q6pzZxCcn259O36eyQBNxLCzA3OmArrvWFnGhw4jNt1NDopxHoLbpI/A2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878121; c=relaxed/simple;
	bh=LB+5eGiR7TQZMlxG7o/1UWa3YqGvJPw2bGzdR6/VOUo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVTi0xSqou00ocsbLTbwgUWA3O5QQroVAFv52/OgDgD1tcfWzOOq9hlSkmCDe0t/MxFisvzvFdKncQy4bzIBUTQLDsI88Y4XlBIbadKewfbBDjD04FOfgXIzefN7dNqB4V6fJSM7m8jeUBJ0EIpc4TsB/Sas8GDIKCHata0NMxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eTubr7is; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9CzXJLiP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ud1PsR7P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vCqftJt4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eTubr7is";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9CzXJLiP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ud1PsR7P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vCqftJt4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E82F266E24;
	Wed, 27 May 2026 10:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779878119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGoekyknkCSDvTeIAlTtqJOquMzvq2hEme0IWIUBcdo=;
	b=eTubr7isLmE6Yp6D6essGXIRSerR/8e43xop6DnEVYvLwndN6ah9UgKt4i+By+p/QiRI1u
	EUciM0660gK2JzM86rGkgXTAPAr1sOsfO19JWU8gEv9vdQZ/GionDCEe7MhgS61i/+MjeN
	3oIpS5kcxjgYBR7GtZlXWPxk50MkE80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779878119;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGoekyknkCSDvTeIAlTtqJOquMzvq2hEme0IWIUBcdo=;
	b=9CzXJLiPyknja2Npyl2fQlFJ2rgq2ZMWMsITVDb2hUhFl4yU4FosuvTwvL5G7bR4/kd+vU
	vox/vs3/H0AFpyCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Ud1PsR7P;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vCqftJt4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779878117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGoekyknkCSDvTeIAlTtqJOquMzvq2hEme0IWIUBcdo=;
	b=Ud1PsR7PhjLicI7h4naVmVdNcoLWql71caGLDwW+ZBcyLOBAf5JdbMlUabotCBCC5AU+nM
	gJEDFBZo3cF16vnK+DLOq+XmCD+TK369YigzxR6YkezHHgEPysokFk2o6a5hdaYDdyE284
	BkFnQWb8OyaOAXwF071+KbALD0S5KJ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779878117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hGoekyknkCSDvTeIAlTtqJOquMzvq2hEme0IWIUBcdo=;
	b=vCqftJt4eED33R6v53iutdUHNNCQ233oIyAmbVZh8qy5ETTGyD70edYb9xTRl24VxNM30o
	pnkljDMUImzlK8Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 755CB5A7AD;
	Wed, 27 May 2026 10:35:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4ntpG+XIFmoIcwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 10:35:17 +0000
Date: Wed, 27 May 2026 12:35:17 +0200
Message-ID: <87cxyhw36i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Johny Lin <johnylin@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Mark Brown <broonie@kernel.org>,
	Tim Bird <tim.bird@sony.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: cs35l41: imply SERIAL_MULTI_INSTANTIATE
In-Reply-To: <20260527023350.3067547-1-johnylin@google.com>
References: <20260527023350.3067547-1-johnylin@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: E82F266E24
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 27 May 2026 04:33:50 +0200,
Johny Lin wrote:
> 
> Use a weak reverse selection to suggest the config
> SERIAL_MULTI_INSTANTIATE just like cs35l56 did.
> 
> Signed-off-by: Johny Lin <johnylin@google.com>

Applied to for-next branch.  Thanks.


Takashi
