Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D6319F43A
	for <linux-sound@vger.kernel.org>; Wed, 20 Nov 2024 13:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732108751; cv=none; b=NPBdeoVGL/amR9GvFrdCK/9Uyn2+lDAYS+tVdj4fpT/lrqkX7qoqoaY/Q/ieRhFQeU24Z+T4sLqrNFPt9jzJUHyUz6m9zXzhrKsiI4k0jTzN3G/1fc9ZwBCvDJHxMiarb55afKwUX56rJPxR7WrUvbyKGWZMDmuX2QfxcqwpJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732108751; c=relaxed/simple;
	bh=s/XzTgPugzuCi/yLeGTplYpfzdnvSrez69QQE8JpPeU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JbhxYfmuDgngW8dDtzCUfgp6fAGzxWt+d4U3UtGLBmiTC6ClzAKicZAdY6Dc8VGtRE0CXEywVw9TRJjx39rAIImZPXLs/10M0DhS+Ilq0vsLdqZqpiiAOz5w8jLZE/oolXq7e7nPq/7l6IKd+MWHkd0evwPJUS2Zap3seOyq/zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qoc2Gshw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gi9rmRb4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qoc2Gshw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gi9rmRb4; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qoc2Gshw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gi9rmRb4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qoc2Gshw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gi9rmRb4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A45C6211B3;
	Wed, 20 Nov 2024 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732108747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TklAZcaqG3Z9+1tviYCZcgfMy6EOcLXRF0z4J/a+i90=;
	b=qoc2GshwtABqZAkbe7/hKn14PduS+NCIqQfJLWgM3fVxHtLOe2RDtLt4/Rh0BbCw30zfW8
	miIk4M2m9nTnfbhDpipR6D0Lav2s1mac3EUp0nekGAOFVlsnBnjXZ/Q81mGcVxme368Dlv
	M/np3/ek+iA6dhIOl4bow6v4xhiKl2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732108747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TklAZcaqG3Z9+1tviYCZcgfMy6EOcLXRF0z4J/a+i90=;
	b=Gi9rmRb4OQn2LXBSikmsRiFI2vi2fNDyP45Xc+mvlZrGEZ4G4uRUq0f9/hGMDhOsw88KrN
	ugmiW4/bZPbuDoBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qoc2Gshw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Gi9rmRb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1732108747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TklAZcaqG3Z9+1tviYCZcgfMy6EOcLXRF0z4J/a+i90=;
	b=qoc2GshwtABqZAkbe7/hKn14PduS+NCIqQfJLWgM3fVxHtLOe2RDtLt4/Rh0BbCw30zfW8
	miIk4M2m9nTnfbhDpipR6D0Lav2s1mac3EUp0nekGAOFVlsnBnjXZ/Q81mGcVxme368Dlv
	M/np3/ek+iA6dhIOl4bow6v4xhiKl2A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1732108747;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TklAZcaqG3Z9+1tviYCZcgfMy6EOcLXRF0z4J/a+i90=;
	b=Gi9rmRb4OQn2LXBSikmsRiFI2vi2fNDyP45Xc+mvlZrGEZ4G4uRUq0f9/hGMDhOsw88KrN
	ugmiW4/bZPbuDoBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 83D3213297;
	Wed, 20 Nov 2024 13:19:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BwamH8vhPWfBHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 20 Nov 2024 13:19:07 +0000
Date: Wed, 20 Nov 2024 14:19:03 +0100
Message-ID: <87ttc22gc8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?=22Beno=EEt_Sevens=22?= <bsevens@google.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH v3] ALSA: usb-audio: Fix potential out-of-bound accesses for Extigy and Mbox devices
In-Reply-To: <20241120124144.3814457-1-bsevens@google.com>
References: <20241120124144.3814457-1-bsevens@google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A45C6211B3
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 20 Nov 2024 13:41:44 +0100,
Benoît Sevens wrote:
> 
> A bogus device can provide a bNumConfigurations value that exceeds the
> initial value used in usb_get_configuration for allocating dev->config.
> 
> This can lead to out-of-bounds accesses later, e.g. in
> usb_destroy_configuration.
> 
> Signed-off-by: Benoît Sevens <bsevens@google.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@kernel.org

Thanks, applied now.


Takashi
