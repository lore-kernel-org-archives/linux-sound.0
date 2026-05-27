Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952B048CFC
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779860119; cv=none; b=fnZL4XITKck9tgI21aapCVWjjkBgRzMjvEENYZpsXO9BWNgjewj0AYg+LQiZMqZeG8HAL3Rvhapgy7p2IqVghSVcGGQKtJzZjwUPjJOZycr1bpgO7aTkqcs3nczmeDPuz8aCEogehj9Izd0KThk2popaEijEyHxfM2vYJ74WXqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779860119; c=relaxed/simple;
	bh=wgpEzBRNi1uM3apEu8xmmdasS7mzHu9d323StmesBSs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iSvly/75na/f9QlyMgK2dSyX0mlkeGIPe77YT5dv+2QkH5qgxYkZsKC0iRwtoB9ASHOuuCP+DDZxmQ0SIp/EdWB6lfs5p2EpCZhx3LZ7luhLsH+d0DeCCcANHEZDsZgSJtWmqr0LX4/blLGyWmATb7Xpz9MFwFBx1MV3XYdgILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Z0IYVs+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=COuhey7h; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1Z0IYVs+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=COuhey7h; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Z0IYVs+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="COuhey7h";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1Z0IYVs+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="COuhey7h"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BA82D66D62;
	Wed, 27 May 2026 05:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Vkiko7cFGTlyPl2uXKeWw/nGz1H3K3CntYFp544GyQ=;
	b=1Z0IYVs+x2Gn5r9wneaJfJ7YlDeZ+toih8ZkCPFMhYQ5XUQq5LzHazmgQCEDnNUsX2Xv3E
	/FHTZSHOMHa9oVMTrDojx1eH0Eb6jDkvAYDIFHsK1MIkhUKxhv1yR4fZAcCVQ93PVQh0tx
	x/WBRx8jwMxSUlARKU6afOPpSMhykmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Vkiko7cFGTlyPl2uXKeWw/nGz1H3K3CntYFp544GyQ=;
	b=COuhey7hCQ/aJwqLSu6df0TOk2UTlpJNBliWViKU1qTm8r2xguyizpy4uxKIi2J9IODYay
	mgGx9vj1LbglBsAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1779860116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Vkiko7cFGTlyPl2uXKeWw/nGz1H3K3CntYFp544GyQ=;
	b=1Z0IYVs+x2Gn5r9wneaJfJ7YlDeZ+toih8ZkCPFMhYQ5XUQq5LzHazmgQCEDnNUsX2Xv3E
	/FHTZSHOMHa9oVMTrDojx1eH0Eb6jDkvAYDIFHsK1MIkhUKxhv1yR4fZAcCVQ93PVQh0tx
	x/WBRx8jwMxSUlARKU6afOPpSMhykmo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1779860116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Vkiko7cFGTlyPl2uXKeWw/nGz1H3K3CntYFp544GyQ=;
	b=COuhey7hCQ/aJwqLSu6df0TOk2UTlpJNBliWViKU1qTm8r2xguyizpy4uxKIi2J9IODYay
	mgGx9vj1LbglBsAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 906F65A66F;
	Wed, 27 May 2026 05:35:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uzP6IZSCFmoDNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 May 2026 05:35:16 +0000
Date: Wed, 27 May 2026 07:35:16 +0200
Message-ID: <87v7c9wh2j.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe Kuechler <uwe@kuechler.org>
Cc: linux-sound@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: usb-audio: Add quirk for Novation Mininova
In-Reply-To: <20260526162033.7513-1-uwe@kuechler.org>
References: <20260526162033.7513-1-uwe@kuechler.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
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
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Tue, 26 May 2026 18:20:33 +0200,
Uwe Kuechler wrote:
> 
> Add a device-specific quirk for the Novation Mininova synthesizer
> (USB ID 1235:001e) to enable proper recognition and functionality
> as a MIDI device.
> 
> Signed-off-by: Uwe Küchler <uwe@kuechler.org>

Applied to for-next branch now.  Thanks.


Takashi
