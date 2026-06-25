Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA13D8103
	for <linux-sound@vger.kernel.org>; Thu, 25 Jun 2026 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388641; cv=none; b=houmsHpEHQFu0Vt30P1M/OmsxLghcOulmQkH3CHRqTOQf1iUh/uHLoVu9EHQK8n6/MNBiMWMpxL9T6e55bEw4VS2+W3llkBOwnuS7P01WdpTgWo0kl3uXMtRdq46OEBG1iSVgpG+TP3visg5aQvAj3a9fyUnh9bLEfOEt/52lJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388641; c=relaxed/simple;
	bh=y/LJVaL07uK5MX03+rM7oPl5GvzfyUaoW5x15/+mFz8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKf3rf+dD/41YQe3D5J6BA9HOhVzGZPVx+RykNMFBOBN43SQ+FCj8zoIbjolKv/CiXYA903VUQC3WBHdg5g6uW3u3TrGzaXEgIAZV6U+RVTazj03rIJgswMc/uoFV855YBwfc/fh7Zt3l1Csf4uH/8j0dttZDzydZOULz9PjcXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hxS6VfId; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wCLtMnTT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hxS6VfId; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=wCLtMnTT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hxS6VfId";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wCLtMnTT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hxS6VfId";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wCLtMnTT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 642CB760C0;
	Thu, 25 Jun 2026 11:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782388638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsnvEJZ6OH/n5OnMosXpav6VOH5t8sLso1O+vDk7y2o=;
	b=hxS6VfId6dul1cVTV9UrpZJCLT+ntBVXa5gguCu2NRDt3weVHhqbhefG43UlOZuhFeCqEW
	1b61pwKYFTX9KbWtLq3gl8KTaYb3Eg6+gEMdH3QwfPVKPW+fZ0WV4cg0nCk9/elgIYwOUK
	hSZ2r1eA1UNMPuMR1y7ST+L7qKPZPa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782388638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsnvEJZ6OH/n5OnMosXpav6VOH5t8sLso1O+vDk7y2o=;
	b=wCLtMnTTCyqF7F2qA8I/37uV2xCkp/17nfKTay+wbp1K8KP16reO6vZ355mvbeuv+W/wvJ
	UVT771La3YbStIAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1782388638; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsnvEJZ6OH/n5OnMosXpav6VOH5t8sLso1O+vDk7y2o=;
	b=hxS6VfId6dul1cVTV9UrpZJCLT+ntBVXa5gguCu2NRDt3weVHhqbhefG43UlOZuhFeCqEW
	1b61pwKYFTX9KbWtLq3gl8KTaYb3Eg6+gEMdH3QwfPVKPW+fZ0WV4cg0nCk9/elgIYwOUK
	hSZ2r1eA1UNMPuMR1y7ST+L7qKPZPa0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1782388638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CsnvEJZ6OH/n5OnMosXpav6VOH5t8sLso1O+vDk7y2o=;
	b=wCLtMnTTCyqF7F2qA8I/37uV2xCkp/17nfKTay+wbp1K8KP16reO6vZ355mvbeuv+W/wvJ
	UVT771La3YbStIAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32204779A8;
	Thu, 25 Jun 2026 11:57:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AoI8C54XPWoyAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 25 Jun 2026 11:57:18 +0000
Date: Thu, 25 Jun 2026 13:57:13 +0200
Message-ID: <878q82vnmu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: raoxu <raoxu@uniontech.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	wangdicheng@kylinos.cn,
	cassiogabrielcontato@gmail.com,
	kees@kernel.org,
	guanyulin@google.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: qcom: Free QMI handle
In-Reply-To: <9108EC860F3F87DF+20260623071308.2549182-1-raoxu@uniontech.com>
References: <9108EC860F3F87DF+20260623071308.2549182-1-raoxu@uniontech.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kylinos.cn,gmail.com,kernel.org,google.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 

On Tue, 23 Jun 2026 09:13:08 +0200,
raoxu wrote:
> 
> From: Xu Rao <raoxu@uniontech.com>
> 
> qc_usb_audio_probe() allocates svc->uaudio_svc_hdl separately from the
> uaudio_qmi_svc object.
> 
> qmi_handle_release() releases the resources owned by an initialized QMI
> handle, but does not free the memory containing the struct qmi_handle
> itself. The probe error path and the remove path currently release the
> handle and then free svc, losing the last pointer to the separately
> allocated handle.
> 
> This leaks one struct qmi_handle on each affected probe unwind and on
> each successful probe/remove cycle.
> 
> Free the handle after qmi_handle_release() in both paths.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> ---
> Changes in v2:
> - Fix the subject prefix for a single patch.

Applied now.  Thanks.


Takashi
