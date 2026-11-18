Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006542;
	b=Q2ecZ35WIf+KG5yI7vx3W86DcbmkOjasr3Ogd0lF+2dF5PfGo+AfypOdNlXkcXVDp6/7
	 aoklxkmGK/Z6vdSyain+cOO3C0OY2zmToG/lP+COjjvyq1wDO/EoUYIaflN8GvAdxqGex
	 AXBvjn+9J1ebr2TLsv0R4X9nZnj60523qzku4SYri6DTHNJZjUQMArwHZKi8Sdpzxej6E
	 ozRoV2euSK0M0V7glyQQPQFMwtt+RPVt4ef5h5pGRqlZoWtqZi5HEfZ7zjixA82EwRrU0
	 fhj8AVc/377SZlPVN45aU1rTrUafasxy0F32o/+Z0l53tH1krTdrYXNmIA8M77y1feg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006542;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id:X-Spam-Level:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spamd-Result:X-Spam-Score;
	bh=+flOIuRsDgaUdgenqJlGfsS30MQnWZ8TolCs3eNV6RY=;
	b=WoQw+D53PYMyZTjKErArccNeU5EVF35L3oHYCRhJXZHDko8BaQLO1v3wQwDAYtyqaGX1
	 zu0vDsjUEPcFb1lH9IzTz4pboP4+aNuKYOqUcBIb+tj/NVGwKUiFE4fKcvkhbcrzAk4ou
	 F8xoyJLlKMlKT5DFJSBW/fM66+VBj7+UnRgVFhIWPwh1O4wt9zmyoT7kke2NftsPOgzxB
	 KUz82uH5XTerYoHbGqJLvA0IQY6GSsmHxdcGXZrCFthDPxmyq8LVWboK7zTzMqh2o4kn0
	 dQNUUh8r70UqA3UXbJgxDaGyHriObze5fixs2NRV679HTuRfmr5KNjgBGiigVDwoIqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zTmcqC13;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tzCHwuin;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zTmcqC13;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tzCHwuin;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3D1606A31C;
	Wed, 18 Nov 2026 12:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B3D1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zTmcqC13;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tzCHwuin;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=zTmcqC13;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tzCHwuin
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7125B1F76B;
	Wed, 18 Nov 2026 12:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+flOIuRsDgaUdgenqJlGfsS30MQnWZ8TolCs3eNV6RY=;
	b=zTmcqC13AUK66h4XVqBn3mOiQHEfgcjZ5iILBdYfDp0KM2Ahf/c+EWr0HIqrpm4uaYcEgH
	GvqeSKnC1DkPYP9wOvQooLhcUByB3pdgYH0WI0PEfCa4a8LTn9pQ8qDeAMht2PO+bfDDBY
	dKqTveyycA68u9dXHfd4RIv5IjGE1As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+flOIuRsDgaUdgenqJlGfsS30MQnWZ8TolCs3eNV6RY=;
	b=tzCHwuinySe8434dx6QvGisz8aalmtO+GXd/oEPd5go0DR1P1QGC1mFhSks7hBB3AqNC0t
	3txDLUVPiwKi26Cg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zTmcqC13;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tzCHwuin
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006540; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+flOIuRsDgaUdgenqJlGfsS30MQnWZ8TolCs3eNV6RY=;
	b=zTmcqC13AUK66h4XVqBn3mOiQHEfgcjZ5iILBdYfDp0KM2Ahf/c+EWr0HIqrpm4uaYcEgH
	GvqeSKnC1DkPYP9wOvQooLhcUByB3pdgYH0WI0PEfCa4a8LTn9pQ8qDeAMht2PO+bfDDBY
	dKqTveyycA68u9dXHfd4RIv5IjGE1As=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006540;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+flOIuRsDgaUdgenqJlGfsS30MQnWZ8TolCs3eNV6RY=;
	b=tzCHwuinySe8434dx6QvGisz8aalmtO+GXd/oEPd5go0DR1P1QGC1mFhSks7hBB3AqNC0t
	3txDLUVPiwKi26Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 230EE134E9;
	Wed, 18 Nov 2026 12:55:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dsz+OUug/Wq2WgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:55:40 +0000
Date: Wed, 18 Nov 2026 13:55:39 +0100
Message-ID: <87tslewb78.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ALSA: hda/realtek: Add codec quirk entries
In-Reply-To: <20261118015552.201306-1-zhangheng@kylinos.cn>
References: <20261118015552.201306-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 7125B1F76B
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -12.51

On Wed, 18 Nov 2026 02:55:48 +0100,
Zhang Heng wrote:
> 
> This series fixes four laptops by adding the corresponding codec quirk
> entries: a THUNDEROBOT Gravity16G2Pro that loses speaker output after
> S3 resume, an HP Pavilion 15-cw1xxx with silent internal speakers, a
> Lenovo Yoga Pro 7 14ASP9 whose bass speaker is not bound due to a PCI
> SSID collision, and an HP Laptop 15-fd1xxx with non-working mute and
> mic-mute LEDs.
> 
> v2: Drop patch 1/4 (cs35l41 UX582ZM). Stefan Binding pointed out that
> 10431A8F uses internal boost, and Slaton Christie already sent the
> correct configuration for this SSID on 30 Oct. Add a quirk for the HP
> Laptop 15-fd1xxx mute/mic-mute LEDs instead. The other three realtek
> quirks are unchanged.
> 
> Zhang Heng (4):
>   ALSA: hda/realtek: Add quirk for THUNDEROBOT Gravity16G2Pro
>   ALSA: hda/realtek: Add quirk for HP Pavilion 15-cw1xxx
>   ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7
>   ALSA: hda/realtek: Enable mute LEDs on HP Laptop 15-fd1xxx

Applied all four patches now.  Thanks.


Takashi
