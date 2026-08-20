Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088A531354C
	for <linux-sound@vger.kernel.org>; Thu, 20 Aug 2026 08:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216208; cv=none; b=s6K0tpx4X1+bMNQhFlHisV1cv6CU9HiZUvLsqhPfD+BQoaHLK22vPYBHEAs8ADLn85+HY6q9MEsbiP4CLVIr2MRM6RfZt9p8n3cbZOxTb8T40ztpD0rUFrI5Y2DmwPD8FV6D/rK3dAwWaMmnQxWwelUcg/bJ43CLYUuz4nLRs2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216208; c=relaxed/simple;
	bh=jdfPUdXETkgNA8U/SbJgsUAdEVKRxFketd7TvTHl9iM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzdIKwbfZy5j4Yiq/SQK5fpEshihyLQk+m4FXivqrdA1RvbxcIq/fIv1LL7ILrd0WzTqxQ0M5GKJKbZAuIOaReeTDt5R7Ws+7H4KvBAPb5E50oCxW78eYGDfMzydnCY4crzIQS9+0NPP+AmZ5wRAQXurLfOaVMrQD3g7QiJr4J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sCASw5ir; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=G/zkVkMa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MJqTT5Ri; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TvaBaFFA; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sCASw5ir";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="G/zkVkMa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MJqTT5Ri";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TvaBaFFA"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D44FF3E58;
	Thu, 20 Aug 2026 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787216188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8Atsqo+xh722xZYSpelppZyMLLViAr5o4uy363YUsk=;
	b=sCASw5ir40OkrYXCm/GtCfVo497Inc9b2Rw3/OhDAWsPwKznyWvlnaI7anNjmQdniI0yQK
	ChvX/NNEWzgf0eaFX9OYQguC8vn1geOwXwpfKaPOeOqZwFlsUFe/eqncyvMi2dKtMcJUpj
	ZfeWXguo++1oX2auELdB1wyLNL5Jco4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787216188;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8Atsqo+xh722xZYSpelppZyMLLViAr5o4uy363YUsk=;
	b=G/zkVkMakIU+Z/qNEZzf/P8hYIiFI8YJfm2tm5eaOzU/vMENwHvs2dZ9yBuwUK6qFZ6TEt
	j6IeRitpSpek0ACQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787216183; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8Atsqo+xh722xZYSpelppZyMLLViAr5o4uy363YUsk=;
	b=MJqTT5Riz/MeLIaGZcEqmmvdJgiQako9E3CLWrukAbRu/fcJauED81aDkkJfB+8F+nJq6F
	Ipe6ORM2B2Lo6HU3bgLEVjPeZICPzWHp8sIC1528I+/jo4uUOIqOTmOiWV5ZOR6DdgyqPh
	5FbwL0mkakI74PjHI97ZGsP6sltvkJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787216183;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v8Atsqo+xh722xZYSpelppZyMLLViAr5o4uy363YUsk=;
	b=TvaBaFFAW6Kgbx0aQvdYpxu+Nlaw8hNKetLL6R4EvRf7xpWmPUiJecu02rTjjzPmEPuBag
	wl9XSxPtXmMfewAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A3E57351D;
	Thu, 20 Aug 2026 08:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ywV/JjfBhmqHKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Aug 2026 08:56:23 +0000
Date: Thu, 20 Aug 2026 10:56:23 +0200
Message-ID: <87ik55maq0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Habil_Eren_T=FCrker=22?= <habilerenturker@gmail.com>
Cc: perex@perex.cz,	tiwai@suse.com,	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,	Habil Eren =?ISO-8859-1?Q?T=FCrker?=
 <habilerenturker@hotmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP Laptop 15-fd0039nt
In-Reply-To: <20260819170919.3172-1-habilerenturker@hotmail.com>
References: <20260819170919.3172-1-habilerenturker@hotmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,alsa-project.org,vger.kernel.org,hotmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 19 Aug 2026 19:08:59 +0200,
Habil Eren Türker wrote:
> 
> This patch adds a quirk for the HP Laptop 15-fd0039nt (SSID 103c:8bb6)
> to fix the micmute LED functionality.
> 
> The micmute LED is controlled via GPIO 0 with active-low polarity.
> 
> Tested-by: Habil Eren Türker <habilerenturker@hotmail.com>
> Signed-off-by: Habil Eren Türker <habilerenturker@hotmail.com>

Applied now.  Thanks.


Takashi
