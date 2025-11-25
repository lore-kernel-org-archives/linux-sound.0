Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F5E2D12EA
	for <linux-sound@vger.kernel.org>; Tue, 25 Nov 2025 06:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053968; cv=none; b=qadUR6H/sIG5WPio5Cy8938bvaJIZc1NvkXbnvrEUy/RtvvxCOYgrAHQeP6zmVSMt3n/jWrlbQ3xhGb2IAv29+BXwKwcz4Wn1uXDuQxpYo8/CaqOgGSXIBTw5upWmGprL/FgPOQ9kqGRsgTlrO9NfkCkHfRf092U7UvMwNF3ieI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053968; c=relaxed/simple;
	bh=bZFVvC0dtytnaMJyjIJ2och826FDx2sAFysdy1cR4dU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P2YWdd3jViWuo6NIc0eaG5Ze5qIceW9lRq8LHJ2UCeM9lfb0UM3GDBiUbfc/7ndtKzs6KS7wkjT3Y5IXfamYfrcyOoyg13oqZz/jmj5/q9y2Xl/pxVPn+cKBoM4vQpYFs7eez7vJQ7XbUAzTFOQrpfQxgduzFJoTXR6KojoRGrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ah3q49U4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Z6LOJtq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Ah3q49U4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Z6LOJtq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ah3q49U4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Z6LOJtq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Ah3q49U4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Z6LOJtq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B0DE5BCFB;
	Tue, 25 Nov 2025 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764053964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qjlEoMbrJPvDMGHfXbNsOouhL2d9kXnGsjK2Rb3Vxk=;
	b=Ah3q49U4KCIKxKvQNEYp4tRx1KdsdVSmcjBX3KyAZebfEFuHIkstFzBDXSFkj1HbdvBTnJ
	agtpVmNVg6n7DEs36kCVeHkyvy2N5BT20WbzW2JwwlnwlZEbmBnkdSYEreH+81w47kLhyu
	VA4cDJbAEfoStrSaiqX+ySJEA4xP5rM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764053964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qjlEoMbrJPvDMGHfXbNsOouhL2d9kXnGsjK2Rb3Vxk=;
	b=1Z6LOJtqRHihnELVyj2+UldOge80MqhF1rFw34jD5MBGsGc0MKmL3XTX36WLfDWaH6Q+Jq
	HYn2VHp90dqUoTCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1764053964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qjlEoMbrJPvDMGHfXbNsOouhL2d9kXnGsjK2Rb3Vxk=;
	b=Ah3q49U4KCIKxKvQNEYp4tRx1KdsdVSmcjBX3KyAZebfEFuHIkstFzBDXSFkj1HbdvBTnJ
	agtpVmNVg6n7DEs36kCVeHkyvy2N5BT20WbzW2JwwlnwlZEbmBnkdSYEreH+81w47kLhyu
	VA4cDJbAEfoStrSaiqX+ySJEA4xP5rM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764053964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qjlEoMbrJPvDMGHfXbNsOouhL2d9kXnGsjK2Rb3Vxk=;
	b=1Z6LOJtqRHihnELVyj2+UldOge80MqhF1rFw34jD5MBGsGc0MKmL3XTX36WLfDWaH6Q+Jq
	HYn2VHp90dqUoTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ED0FC3EA63;
	Tue, 25 Nov 2025 06:59:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ub6vOMtTJWmMLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 25 Nov 2025 06:59:23 +0000
Date: Tue, 25 Nov 2025 07:59:23 +0100
Message-ID: <87bjkqpph0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Subject: Re: [PATCH] ALSA: usb-audio: Fix max bytes-per-interval calculation
In-Reply-To: <20251124210518.90054-1-dylan_robinson@motu.com>
References: <20251124210518.90054-1-dylan_robinson@motu.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 24 Nov 2025 22:05:18 +0100,
Dylan Robinson wrote:
> 
> The maxpacksize field in struct audioformat represents the maximum number
> of bytes per isochronous interval. The current implementation only
> special-cases high-speed endpoints and does not account for the different
> computations required for SuperSpeed, SuperSpeedPlus, or eUSB2. As a
> result, USB audio class devices operating at these speeds may fail to
> stream correctly. The issue was observed on a MOTU 16A (2025) interface,
> which requires more than 1024 bytes per interval at SuperSpeed.
> 
> This patch replaces the existing logic with a helper that computes the
> correct maximum bytes-per-interval for all USB speeds, borrowing the logic
> used in drivers/usb/core/urb.c.
> 
> Signed-off-by: Dylan Robinson <dylan_robinson@motu.com>

Applied to for-next branch now.  Thanks!


Takashi
