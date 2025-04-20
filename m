Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569C618DB0A
	for <linux-sound@vger.kernel.org>; Sun, 20 Apr 2025 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745138365; cv=none; b=he66EK3w/A6TGVWDDgs8UNPAz+VLCG20JoPnLx2wrm5LYwBw07US7P29X1kyFHAG9c7d9zK70UdNh3DQ9rsfiPbYAqUMJr7NzBpcXuT9vinfEmgQhcfCYZI7+FrWK8cXRrugFfjoTiQC0owzY0Ejjo2L1QXUCQmyy1VDJapTx8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745138365; c=relaxed/simple;
	bh=FD2qO5/DUdWZgmo2sf8ZDwNWO5WsrBrylOdD7DsO/J8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GO3XsQt+Kg7Gj9x7ELp3k9rhgXsE7yCt7PkQgcDlXKJEybvxWS6Zq57t/0UZsAqlRTQD+EtWBWmhgt6vNi8RZXagPFk9luqWvT22dOZLtS2gMBbfhR+dNS8MFTDzt1sWvckMsxLfEtvgEVbaZpte5eX9V8taKB1hA4fL7jvStfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qRSNwEkc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PndnLu9z; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qRSNwEkc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PndnLu9z; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qRSNwEkc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PndnLu9z";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qRSNwEkc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PndnLu9z"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 613BA1F7B6;
	Sun, 20 Apr 2025 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745138361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+NcfftiRYky8qb1CCUCMKQc6zzbVv9Be6+Ng+kmD/w=;
	b=qRSNwEkcLcwCkkxym/AfjYzXpLsFQim4moFB/7YxAeD7t1WPEdOq3/DModWb4fdMokYQb2
	UudNXvDhmQtJPDvBhfmU48ibXpH6iklZyuHINgUYE6FQuGb5cnkE9ToDjABofRPViO80DX
	9SXs8NmOVlFh/ih525dxuctDNCrQhJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745138361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+NcfftiRYky8qb1CCUCMKQc6zzbVv9Be6+Ng+kmD/w=;
	b=PndnLu9zcl57oQ6tPJBRyPG9MyZRtxzlZF+M4v7DE8+bMDSuJIeZxqCOYxbvSAQ6mWnTr/
	ej4OISICpSw2nHAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qRSNwEkc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PndnLu9z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1745138361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+NcfftiRYky8qb1CCUCMKQc6zzbVv9Be6+Ng+kmD/w=;
	b=qRSNwEkcLcwCkkxym/AfjYzXpLsFQim4moFB/7YxAeD7t1WPEdOq3/DModWb4fdMokYQb2
	UudNXvDhmQtJPDvBhfmU48ibXpH6iklZyuHINgUYE6FQuGb5cnkE9ToDjABofRPViO80DX
	9SXs8NmOVlFh/ih525dxuctDNCrQhJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1745138361;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I+NcfftiRYky8qb1CCUCMKQc6zzbVv9Be6+Ng+kmD/w=;
	b=PndnLu9zcl57oQ6tPJBRyPG9MyZRtxzlZF+M4v7DE8+bMDSuJIeZxqCOYxbvSAQ6mWnTr/
	ej4OISICpSw2nHAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E457137CF;
	Sun, 20 Apr 2025 08:39:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TnEADrmyBGhFIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 20 Apr 2025 08:39:21 +0000
Date: Sun, 20 Apr 2025 10:39:20 +0200
Message-ID: <87wmbftefb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add retry on -EPROTO from usb_set_interface()
In-Reply-To: <Z//7s9dKsmVxHzY2@m.b4.vu>
References: <Z//7s9dKsmVxHzY2@m.b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 613BA1F7B6
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
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

On Wed, 16 Apr 2025 20:49:23 +0200,
Geoffrey D. Bennett wrote:
> 
> During initialisation of Focusrite USB audio interfaces, -EPROTO is
> sometimes returned from usb_set_interface(), which sometimes prevents
> the device from working: subsequent usb_set_interface() and
> uac_clock_source_is_valid() calls fail.
> 
> This patch adds up to 5 retries in endpoint_set_interface(), with a
> delay starting at 5ms and doubling each time. 5 retries was chosen to
> allow for longer than expected waits for the interface to start
> responding correctly; in testing, a single 5ms delay was sufficient to
> fix the issue.
> 
> Closes: https://github.com/geoffreybennett/fcp-support/issues/2
> Cc: stable@vger.kernel.org
> Signed-off-by: Geoffrey D. Bennett <g@b4.vu>

Applied now.  Thanks.


Takashi
