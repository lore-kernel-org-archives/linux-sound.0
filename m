Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0070535CA
	for <linux-sound@vger.kernel.org>; Fri,  8 Mar 2024 11:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709899201; cv=none; b=m3JFr3TBTjLJIod0bKwUPWnGo27gXOTLy3dj639Yb0LSUmISaz31ljPVslyTZjxfN/A46KMv1Sz36yCyA78IzJDn4P1uCjq+zJAXKnWCHpbFanFMw0ynhYvNt69z2af18qY4PjFV1hdViLxj4EM/kG52h8rPBDtdAQlPVpK+9v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709899201; c=relaxed/simple;
	bh=IvuVaaiHnfQWveNLqU1485ZEz4gl2gi+73FvOoV8OD4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BrVK9v3R7mP/naC+Pz5AjH8jPJlT/SV5fH8U/mgu2OgyxUMNMBclwxdK2aWA5MWFsloGGky1Bqu92ZTY4dvYTLorymbUEDi0GhS7oedEgA3UFBCZvB9LW5wlqAeSyAvBVrd3tXuOr/bR6CVyF4A2DSWT+QVWyO1iLEk3gWCi3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=upUjxbLI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O/Z+4VAs; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=upUjxbLI; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=O/Z+4VAs; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="upUjxbLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O/Z+4VAs";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="upUjxbLI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="O/Z+4VAs"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 57C2E37A20;
	Fri,  8 Mar 2024 08:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709885778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Q97NHEuky/hA3Mq2WfYgCyNueahZcmFUxiRzul7/tM=;
	b=upUjxbLIbNJKUIh9BwKGl40GzBtiB/SOuCFe6LESePrzMXNyK3maNSi1MsmF0HHNxOgcgX
	H/Pd9SQdWSRNvj1nyP41yXHawJYfjq2T+VMF4Ll7kWMj8UpG9toWCBt+n+EcxiiBpkhvuR
	MnDLfu9aJO1/Bh6uuIcWWYsOEL1yTyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709885778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Q97NHEuky/hA3Mq2WfYgCyNueahZcmFUxiRzul7/tM=;
	b=O/Z+4VAsn6sIK0qi2a8nh6csTFQdPhE+o+u5TbpV/Fx9CyomDfAmhRsxYt/VgaQFSjk29x
	JNItTGG6rSO44VAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709885778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Q97NHEuky/hA3Mq2WfYgCyNueahZcmFUxiRzul7/tM=;
	b=upUjxbLIbNJKUIh9BwKGl40GzBtiB/SOuCFe6LESePrzMXNyK3maNSi1MsmF0HHNxOgcgX
	H/Pd9SQdWSRNvj1nyP41yXHawJYfjq2T+VMF4Ll7kWMj8UpG9toWCBt+n+EcxiiBpkhvuR
	MnDLfu9aJO1/Bh6uuIcWWYsOEL1yTyA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709885778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Q97NHEuky/hA3Mq2WfYgCyNueahZcmFUxiRzul7/tM=;
	b=O/Z+4VAsn6sIK0qi2a8nh6csTFQdPhE+o+u5TbpV/Fx9CyomDfAmhRsxYt/VgaQFSjk29x
	JNItTGG6rSO44VAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1791A13310;
	Fri,  8 Mar 2024 08:16:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id BkwyBFLJ6mXiTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 08 Mar 2024 08:16:18 +0000
Date: Fri, 08 Mar 2024 09:16:17 +0100
Message-ID: <877cidxhny.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Cc: linux-sound@vger.kernel.org,
	kailang@realtek.com.tw,
	pshou@realtek.com.tw,
	tiwai@suse.de,
	jwoithe@just42.net
Subject: Re: [PATCH 1/1] ALSA: hda/realtek: fix ALC285 issues on HP Envy x360 laptops
In-Reply-To: <20240308005912.456727-1-foss@athaariq.my.id>
References: <20240308005912.456727-1-foss@athaariq.my.id>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

On Fri, 08 Mar 2024 01:59:12 +0100,
Athaariq Ardhiansyah wrote:
> 
> @@ -9862,6 +9923,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x880d, "HP EliteBook 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8811, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
>  	SND_PCI_QUIRK(0x103c, 0x8812, "HP Spectre x360 15-eb1xxx", ALC285_FIXUP_HP_SPECTRE_X360_EB1),
> +	SND_PCI_QUIRK(0x103c, 0x85de, "HP Envy x360 13-ar0xxx", ALC285_FIXUP_HP_ENVY_X360),
>  	SND_PCI_QUIRK(0x103c, 0x881d, "HP 250 G8 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8846, "HP EliteBook 850 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8847, "HP EliteBook x360 830 G8 Notebook PC", ALC285_FIXUP_HP_GPIO_LED),

The table is sorted in PCI SSID order.  Could you put the entry at the
right position?


thanks,

Takashi
