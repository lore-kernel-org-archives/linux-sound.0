Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D2841D4D7
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434162; cv=none; b=AwviFHFNmwN7be5MEIFiiXvBlyHQAXc6/ViSOPwJUPoScsDWnQ45XNXGpjumj2B6c+NwyybLU/9/o4ZY5QiuAb4D31Ukp/vIfatNzlOogba+vtEEOuwLj8EUId8bu/N0V7Kl/6BGzwcBoAxhys4i50BWuDmbRUA3SBpDOZAGwuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434162; c=relaxed/simple;
	bh=KA7WpMAnMIbeHJC3+1ryn679PtxjDf8VcOt3lpX5NqM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SCGxpoyVRajq3MWV7BbjA1KFO8uLg0REaQTFXEW167mrs4aMDhwcpdzDElsBFzwTnePNyRsU82lQw5lF6s5yZh2rlwPOzbuVce4remhsOf3dRqe8wf3/PTBdcFk8WMR2Y0YvBKSm6VIAfOiN5Bj/oJjh44aM9eY1mkHKN7rpyZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BIKWEOKH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K8N7Qiud; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BIKWEOKH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=K8N7Qiud; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BIKWEOKH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K8N7Qiud";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BIKWEOKH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K8N7Qiud"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2463E75B81;
	Tue,  7 Jul 2026 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783434155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TmYAtQevC/3FiaC7tNV0HdWX13Upt0GEvMohi23f118=;
	b=BIKWEOKH5T9N9BPxMarm3XDIMicRP1KDxNOGvSYMwofJ8GsQveG4T8QaeuLmRtuAtWR/zf
	LObh+psGHwOXxVWiATkTh136OI/CoxuQXd1PnChksdJpKEnUiyuh6KIvy4AMyUBGlM9rss
	izG6wJO/3/sWu016rs6GxTZJoKsoCdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783434155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TmYAtQevC/3FiaC7tNV0HdWX13Upt0GEvMohi23f118=;
	b=K8N7QiudEn43Fy07UvyR5EsMOK9ya8pNCCVvCihGTAxO43YmGYWgqyAdAfl/ZMZjKulxr4
	CF2sDzw3KiwF9jCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783434155; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TmYAtQevC/3FiaC7tNV0HdWX13Upt0GEvMohi23f118=;
	b=BIKWEOKH5T9N9BPxMarm3XDIMicRP1KDxNOGvSYMwofJ8GsQveG4T8QaeuLmRtuAtWR/zf
	LObh+psGHwOXxVWiATkTh136OI/CoxuQXd1PnChksdJpKEnUiyuh6KIvy4AMyUBGlM9rss
	izG6wJO/3/sWu016rs6GxTZJoKsoCdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783434155;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TmYAtQevC/3FiaC7tNV0HdWX13Upt0GEvMohi23f118=;
	b=K8N7QiudEn43Fy07UvyR5EsMOK9ya8pNCCVvCihGTAxO43YmGYWgqyAdAfl/ZMZjKulxr4
	CF2sDzw3KiwF9jCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04C92779AE;
	Tue,  7 Jul 2026 14:22:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id bUqRO6oLTWpZYwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 Jul 2026 14:22:34 +0000
Date: Tue, 07 Jul 2026 16:22:30 +0200
Message-ID: <87zf026frt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Longlong Xia <xialonglong2025@163.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: firewire: Drop redundant mod_devicetable.h includes
In-Reply-To: <20260706032639.273929-1-xialonglong2025@163.com>
References: <20260706032639.273929-1-xialonglong2025@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 
X-Spam-Score: -3.30

On Mon, 06 Jul 2026 05:26:39 +0200,
Longlong Xia wrote:
> 
> The ALSA FireWire driver headers include <linux/firewire.h>, which
> already provides struct ieee1394_device_id via
> <linux/device-id/ieee1394.h>.
> 
> Drop the now-redundant direct <linux/mod_devicetable.h> includes
> from the per-device headers.
> 
> Signed-off-by: Longlong Xia <xialonglong2025@163.com>

Applied now.


thanks,

Takashi
