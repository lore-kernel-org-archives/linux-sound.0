Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C3C2F7F1C;
	Wed, 26 Aug 2026 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787734138; cv=none; b=IHpzyGxrijEbF+Ej9kXAMNPUfvzeq/VJsNKHdOXVyozM33IMUG1xAqFHe0WtPIPq53gJOb0TGmX0BPsnWG0QzieNoUxLfN/wrRtdEety6ybO+d6znvVl5nzVzJYTjd1eDR31ii5k2mshCGDj6RfoURGCFWOjxNIgmV4p+SeAmOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787734138; c=relaxed/simple;
	bh=mVFXKPxkNZRAylDjXvE+fTBFmT46ipseqeBWKvd/wIw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cixx7CKtVNtwHWibmQwA26bZyZZd0KTSNmdTc67NcJaxWZO/VrDjBw5QqmoON4sklf4lYFggzTP0CSLyDPSRBfWnb0/x/ePruFANozIWTi8mPNx9DpcTnWex3oMdpC2pSiegFDAfiDa20111TeV6wkHkJiuO5uiH8zFNXtUqkcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YeFpJXcU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=l4dC3Qpb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pM7BJtlh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qKrZihsA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YeFpJXcU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l4dC3Qpb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pM7BJtlh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qKrZihsA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B36481F7F8;
	Wed, 26 Aug 2026 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787734130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UGT7giaDrRrb7eB/DnWv9pS4NDyP8MClfSlCC2S2pts=;
	b=YeFpJXcUiUUFPljlvAPu9sXP+k9zeK5QU72PG1wnongH/dofBElrjwgxO4fI1nxJPyycrB
	f4efvKXJrQkMCbfo8WQfBdGsCCo1YWJPvTwtb4UtSk4A2MA1yD7W55Km/mGVI9LtKR3R77
	BXuyYrxhpAoBVhAPPN3DVmTd2ShhGCQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787734130;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UGT7giaDrRrb7eB/DnWv9pS4NDyP8MClfSlCC2S2pts=;
	b=l4dC3QpbRywCrJocava0f2gK/L442B3q1KJoUEBnLIi7tVYtb4CPmt3jqPVjD9kWN2kW6W
	OkqeG7pwIJIpvyAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787734126; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UGT7giaDrRrb7eB/DnWv9pS4NDyP8MClfSlCC2S2pts=;
	b=pM7BJtlh7+QvXm3O0UnDud7ZTNUAvx+kuXnTAujlRXxBnLKED5EsWL2+A360Bf9no3GfKf
	Gz+0ukoQUoGMEhbGlOqIeH2YTSPSEHtsO2sxxJAlkTMpYyQr1QRO9gDrSSp3hXNW7EDXly
	ONLQNAYqG/+r6sdBMfwUHWO8pCSKPPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787734126;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UGT7giaDrRrb7eB/DnWv9pS4NDyP8MClfSlCC2S2pts=;
	b=qKrZihsApeheE5PV69PDSnnsiH4yoA3VFqD2u7p59vN9ko/JrgZo7nYLe+c4JGORZi1jfq
	kAr20afisVMnKpCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7261C1361C;
	Wed, 26 Aug 2026 08:48:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SQWqGm6ojmqSSAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 26 Aug 2026 08:48:46 +0000
Date: Wed, 26 Aug 2026 10:48:46 +0200
Message-ID: <87cxv5gtch.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda/conexant: Refactor headset plug detection
In-Reply-To: <20260826014512.221267-1-songxiebing@kylinos.cn>
References: <20260825023855.394959-1-songxiebing@kylinos.cn>
	<20260826014512.221267-1-songxiebing@kylinos.cn>
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
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 26 Aug 2026 03:45:12 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> Rename cx_process_headset_plugin() to cx_process_headset_detect_plug_type()
> to better describe what it does, and merge the duplicated CTIA/OMTP
> branches since both select the same pin-widget control value for the mic
> pin.
> 
> Move the AC_VERB_SET_PIN_WIDGET_CONTROL write into the caller
> cx_update_headset_mic_vref() so that the mic pin control is applied
> unconditionally while a mic is present, instead of only for CTIA/OMTP
> headsets.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
> changes in v2:
>   - Optimize code logic and description

This doesn't apply on the latest code, as there was already a cleanup
to achieve a part of your code changes.
Could you rebase to the latest sound.git for-linus branch and
resubmit?


thanks,

Takashi
