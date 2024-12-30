Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB21991D2;
	Mon, 30 Dec 2024 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735556936; cv=none; b=NkMZMDwJAqFSwk9yPa3MnpKad9N2Z/aFQjQH8JDXFFoTax0/1Gh236UGoP+3TP+jBosAXFSZLwppHPIYvIfiQ+VAIhjMXhirIfN8s/AshfVoa+cJaEwygrMr4HHO3BqfPt8mNCql3440A2yen4MavzpWuZ76B54C1reGh3UHYV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735556936; c=relaxed/simple;
	bh=nB68DGOdrHXAL2J/+LuOBWgbkHoioRDfeQw9THx+I68=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=le9vphQxUsQ0dT4sE0Nkd4imvntKTSPmmba+axaumda8u0hv4+CVJfSAdarDbGJzvGabcwUNqYHW72CxuB5Uq2d6Clxs30vETiD7j+JllnAl860xiy3fUHYTIFrtOe8+JoIf9AAMccEKtVgFo/UtWTtqYXBFiPzdbX4jEya5Zho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kCWmNLf8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NIcMlD4P; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kCWmNLf8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NIcMlD4P; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kCWmNLf8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NIcMlD4P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kCWmNLf8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NIcMlD4P"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 033D01F38C;
	Mon, 30 Dec 2024 11:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735556933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vXUz7l4Xv9gILsVOeOR4SCkyS6bbc4NErftyBCrKMA=;
	b=kCWmNLf85iJnzhEkItfkqTc21bwzRLbqvDYOIPBz1wGMDvUmqU5NONju948Z+4hMmGbFtT
	EO+gULQ6DxiSjMHzDdqPJ8M8SU5eV5yqkORm/cr9LCbQjNjHnJ/Xj7lBR9OD9WjcP5AN4p
	ASFo2VT/Ebd5oG/Kkbsovou+8D4DmTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735556933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vXUz7l4Xv9gILsVOeOR4SCkyS6bbc4NErftyBCrKMA=;
	b=NIcMlD4P5OF9JUvGjyT64oPo4JdcN2cPrwtq3Dish78/JmDQ9ywTfauQoYgxtDTuksNH3L
	iUBupgZshZOz+QDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kCWmNLf8;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=NIcMlD4P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735556933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vXUz7l4Xv9gILsVOeOR4SCkyS6bbc4NErftyBCrKMA=;
	b=kCWmNLf85iJnzhEkItfkqTc21bwzRLbqvDYOIPBz1wGMDvUmqU5NONju948Z+4hMmGbFtT
	EO+gULQ6DxiSjMHzDdqPJ8M8SU5eV5yqkORm/cr9LCbQjNjHnJ/Xj7lBR9OD9WjcP5AN4p
	ASFo2VT/Ebd5oG/Kkbsovou+8D4DmTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735556933;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8vXUz7l4Xv9gILsVOeOR4SCkyS6bbc4NErftyBCrKMA=;
	b=NIcMlD4P5OF9JUvGjyT64oPo4JdcN2cPrwtq3Dish78/JmDQ9ywTfauQoYgxtDTuksNH3L
	iUBupgZshZOz+QDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7015A13A30;
	Mon, 30 Dec 2024 11:08:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +lqSGUR/cmd9bwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 30 Dec 2024 11:08:52 +0000
Date: Mon, 30 Dec 2024 12:08:51 +0100
Message-ID: <87msgdwhq4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Cc: tiwai@suse.de,
	13916275206@139.com,
	andriy.shevchenko@linux.intel.com,
	antheas.dk@gmail.com,
	baojun.xu@ti.com,
	broonie@kernel.org,
	lgirdwood@gmail.com,
	liam.r.girdwood@intel.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	navada@ti.com,
	perex@perex.cz,
	philm@manjaro.org,
	robh+dt@kernel.org,
	shenghao-ding@ti.com,
	v-hampiholi@ti.com,
	v-po@ti.com,
	yung-chuan.liao@linux.intel.com
Subject: Re: [PATCH v6] ALSA: hda/tas2781: Add speaker id check for ASUS projects
In-Reply-To: <20241223225442.1358491-1-stuart.a.hayhurst@gmail.com>
References: <87v7wajunp.wl-tiwai@suse.de>
	<20241223225442.1358491-1-stuart.a.hayhurst@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 033D01F38C
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[suse.de,139.com,linux.intel.com,gmail.com,ti.com,kernel.org,intel.com,vger.kernel.org,perex.cz,manjaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01
X-Spam-Flag: NO

On Mon, 23 Dec 2024 23:54:40 +0100,
Stuart Hayhurst wrote:
> 
> This is causing issues with the TAS2563 in my Yoga 7 Gen 7 (14ARB7):
> 
> ```
> [    7.264012] tas2781-hda i2c-INT8866:00: Failed to get SUBSYS ID.
> [    7.264065] tas2781-hda i2c-INT8866:00: read acpi error, ret: -61
> [    7.264109] tas2781-hda i2c-INT8866:00: error -ENODATA: Platform
> not supported
> [    7.264252] tas2781-hda i2c-INT8866:00: probe with driver
> tas2781-hda failed with error -61
> ```

FYI, this should be fixed with the recent patch:
  https://lore.kernel.org/20241230064910.1583-1-baojun.xu@ti.com

It's already in for-linus branch of sound git tree.


thanks,

Takashi
