Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB93BED1B
	for <linux-sound@vger.kernel.org>; Thu,  9 Apr 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745701; cv=none; b=HLj7ojxzzm8uufmBPNyejtor0mGTWxvqKG+zP1zyhRo+rmwn39JZpPe8/LAJjw5+cv5NDlbv6OdnWOj2tOqT9RlG5imWSbx8Bxr7pNlDXPpOlUQelst6r/14O4jowFGS4lvTQEf0u61JDLCKvsjZyBiAfojzng63p2sd4sGvjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745701; c=relaxed/simple;
	bh=0sy4ujAvPxUIKbzGhq8CdbiotH0OfgrKvV0n3psoQSs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KUDYyDxCAXEYbyzv2OJM51hm/VZWuzWM9BlDrgBYaXf9VRVK0SGB6ynbZrrdv2eKgxXS1JM5UjH9T0d01GdsdZfCiN/ErGz6DnmOy3xd59M8aAyJ1no4VcG5Urdygp44ac2n82G9TwGmib2QgwrjP7Y4IpiYtQh4RKQbNYWz9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NTdUOf82; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1YBk3imX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NTdUOf82; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1YBk3imX; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NTdUOf82";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1YBk3imX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NTdUOf82";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1YBk3imX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8C48B5BD68;
	Thu,  9 Apr 2026 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHWUPYChQrYIgJX4sxKrOu/sgCAr5p6g++NtW/Gjwtw=;
	b=NTdUOf82/bTJOMKG/4CyaJ76D+4XJrQtg55qufdszaHMOvE7MbyZt2Vq1z5SVdhmwOTcdW
	3KnV4OjHTdoqdfZwae8F+rVB3RvIB3vRkRYgK8W5Nu4gwCoiyqbosCUubZ3BdvLJxX87ad
	PhetIOEvMynCGJN/h11P9m1TpvcOmQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHWUPYChQrYIgJX4sxKrOu/sgCAr5p6g++NtW/Gjwtw=;
	b=1YBk3imXHvhMdMU1jRU/dtRSxlH+LRP4hpiReRDabvc6bFz21o3OM1HCnFJfUzqsTZhTJJ
	fEm+//xStmcukrDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NTdUOf82;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1YBk3imX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775745697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHWUPYChQrYIgJX4sxKrOu/sgCAr5p6g++NtW/Gjwtw=;
	b=NTdUOf82/bTJOMKG/4CyaJ76D+4XJrQtg55qufdszaHMOvE7MbyZt2Vq1z5SVdhmwOTcdW
	3KnV4OjHTdoqdfZwae8F+rVB3RvIB3vRkRYgK8W5Nu4gwCoiyqbosCUubZ3BdvLJxX87ad
	PhetIOEvMynCGJN/h11P9m1TpvcOmQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775745697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FHWUPYChQrYIgJX4sxKrOu/sgCAr5p6g++NtW/Gjwtw=;
	b=1YBk3imXHvhMdMU1jRU/dtRSxlH+LRP4hpiReRDabvc6bFz21o3OM1HCnFJfUzqsTZhTJJ
	fEm+//xStmcukrDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52E7F4A0B3;
	Thu,  9 Apr 2026 14:41:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lkDgEqG612kgDAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Apr 2026 14:41:37 +0000
Date: Thu, 09 Apr 2026 16:41:36 +0200
Message-ID: <87h5pki4bj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] ALSA: usx2y: us144mkii: fix NULL deref on missing interface 0
In-Reply-To: <2026040955-fall-gaining-e338@gregkh>
References: <2026040955-fall-gaining-e338@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8C48B5BD68

On Thu, 09 Apr 2026 16:01:56 +0200,
Greg Kroah-Hartman wrote:
> 
> A malicious USB device with the TASCAM US-144MKII device id can have a
> configuration containing bInterfaceNumber=1 but no interface 0.  USB
> configuration descriptors are not required to assign interface numbers
> sequentially, so usb_ifnum_to_if(dev, 0) returns will NULL, which will
> then be dereferenced directly.
> 
> Fix this up by checking the return value properly.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Fixes: dee1bcf28a3d ("ALSA: usx2y: Add native ALSA driver for TASCAM US-144MKII")
> Cc: stable <stable@kernel.org>
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Applied to for-next branch now.  Thanks.


Takashi
