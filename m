Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73C26299
	for <linux-sound@vger.kernel.org>; Fri,  1 May 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777640487; cv=none; b=eC8Zb/oupH+1MFqSxGLxb/J+K6A7QjaFWk1TZgEM3AYu+k/DX2nvlhl+ZUZj4oX3QcQ65HA+VEJOAED6jBm8FgGo4ClIxHfCIonndH0yoeUSzsINPNdLaC4iBJt2/4jV9/M4U5Hy8/EaBjmPC+w4vt9sgYOaV5tbXPjZ4km+WmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777640487; c=relaxed/simple;
	bh=0B2rD8qQnfTeBK5hCS8zMZjhccTPWs11XzIC+Mvm/xg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VI6PwVcqHlK6qOJ/dQLyFi2P2TQrwya6NDcBlVwcKgwISJrI+8xtm8xtvg2YXhLMBxExGIxJppVxaXnBhBskSZ5/9B/pf5o2d77/WNnM1OukkLAntbiIX8eDjinaJK3OVmc9aQ8W5j+UX0pPsnj0bBFfhN2V8GFfz4/xos6DTsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CQcFay0E; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Crm/fq5E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oK7ZFVLN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LSl3sIJB; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CQcFay0E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Crm/fq5E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oK7ZFVLN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LSl3sIJB"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 816326A8B9;
	Fri,  1 May 2026 13:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777640484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inGTKwuzhyO4ML1LJhMUfD/JGYcc4pf/wbUk0xZ/Dn8=;
	b=CQcFay0EOtlH56t+bCV/qsdHUXPX73ypOLRvE/TPqjnrKPqZOsozEiDFAtq8AJQ/vfpJic
	T3sfPOPjuBWPvtFXkEOwBwVq//Ao3XfgGk8rmOjUn0y5XkJCWeVK2r4f22xX7dA7tnwIq8
	sKXxg6PTg1sS/5etWpYiHXc9WkN8e4k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777640484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inGTKwuzhyO4ML1LJhMUfD/JGYcc4pf/wbUk0xZ/Dn8=;
	b=Crm/fq5EqQ+UvGo1MEiBnOB3ngbjI1UfQ7TCVNJ/f3gccbUCN8XGziQTTMzlHUBtHzIZAn
	KZZYtisNXHYIP/CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=oK7ZFVLN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=LSl3sIJB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1777640483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inGTKwuzhyO4ML1LJhMUfD/JGYcc4pf/wbUk0xZ/Dn8=;
	b=oK7ZFVLNONGKDAA0LFUN1Y8t9zKXZSvPQ+H55JFI2oPCCDLe60Aw+FC6eAZInHD04wAXHQ
	nLGouazSknNsF5BrrXTOex5MZJbeXAfdvjDdOsy4MS79Rpr4ryiWVM104vXc5zlY6WHy+3
	DHXNn8HiUzD63QIskvqtSUzWAAgWc4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1777640483;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=inGTKwuzhyO4ML1LJhMUfD/JGYcc4pf/wbUk0xZ/Dn8=;
	b=LSl3sIJB+0k2Rbx+CKkMN4Ql+1nwB0E7C3YB5TzhtSWv+D6DMVt563xHWqpDFSFGfZSO+3
	z62RNNHcb/T9a7DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5CB01593B0;
	Fri,  1 May 2026 13:01:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2v+IFSOk9Gk3dwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 May 2026 13:01:23 +0000
Date: Fri, 01 May 2026 15:01:23 +0200
Message-ID: <87fr4bl1wc.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?R=E1mon?= van Raaij <ramon@vanraaij.eu>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add codec SSID quirk for Lenovo Yoga Pro 9 16IMH9
In-Reply-To: <20260430191224.patch1-ramon@vanraaij.eu>
References: <20260430191224.patch1-ramon@vanraaij.eu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,vanraaij.eu:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 816326A8B9
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Thu, 30 Apr 2026 21:12:24 +0200,
Rámon van Raaij wrote:
> 
> The Yoga Pro 9 16IMH9 (codec SSID 17aa:38d6) shares PCI audio device
> subsystem ID 17aa:3811 with the Legion S7 15IMH05. The existing
> SND_PCI_QUIRK entry for the Legion routes both machines to
> ALC287_FIXUP_LEGION_15IMHG05_SPEAKERS, which does not bind the TAS2781
> smart amplifiers, resulting in near-silent built-in speakers.
> 
> Add an HDA_CODEC_QUIRK entry immediately before the conflicting PCI quirk
> that matches the Yoga Pro 9's unique codec SSID and routes it to
> ALC287_FIXUP_TAS2781_I2C. Codec quirks are evaluated after PCI quirks and
> take precedence, leaving the Legion S7 15IMH05 entry unaffected.
> 
> This follows the same pattern used to disambiguate PCI SSID 17aa:3847
> (shared between Yoga Pro 7 14IMH9 and Legion 7 16ACHG6), where a
> HDA_CODEC_QUIRK for codec SSID 17aa:38cf resolves the conflict.
> 
> Signed-off-by: Rámon van Raaij <ramon@vanraaij.eu>

Applied now.  Thanks.


Takashi
