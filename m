Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006700;
	b=NXrMhthYNEiXrZlXFP88E2WV3e6kl9r5C0+hCnw+LsJfcdIFC8eAD5MGSNhQHo7O6Og7
	 hmyKoRf9Y60mEcaV8+IYY1s0UAMlNO+TATGE4gAL456do9GqhcJXuVwm5p66TXVb9kqSA
	 FKKTSihufHbANAjys8ohf8KewSmJ+MCiDHuQythL0idMOUXR5dnNAdGFvY3zZCT3SquSX
	 UbtA7DBZGP1FL05Qz83GVUX7U7ynvaTNvPU7vjXUDHX/Rg/CR+3i+LJdLUHyV1/+HouaX
	 SfZ1jVb13uO1V42HS0kbsu56Hs99vbJHkStwChKEVCS/s4JyM/IaCd0jEDB/x2j4UgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006700;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=X6sW34hXTjPMbsbahPwOQLQlbcy6jCirB8tB5Xx3WgA=;
	b=VLL0h2JYbf6MGzlMFE0IbqnVeudKJEvf6ZLJfDVllTiBVBQLjp0P6IGclK3phzguZTnF
	 iKbuWjNzuSorUvy9tM9ESfE2rM3H16s19aI3mM+/ejUwSGZOg2JS819sEmuwcLj6QA5vr
	 3iVPHfilMwe0ZqfPYEp9OexqJfnHu00XbGGrKwEH0rEnDuKqXkQQ15CqwYUAa7B+5U7y8
	 0wCDP8Gygz1uf5luSoLqvlr+GPBRuMmjhqMo866bTpFMHsOs2oHDvg9bvnITWgP4pjOQs
	 ixtTVgRDvq7J/lJXvfcF35Z8iN5LtanJpZgj8AtEJNer9HbxLXpXh3uJ8AQSx1y+4xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AXw+veP6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=blyAv3ye;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AXw+veP6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=blyAv3ye;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84663606A31C;
	Wed, 18 Nov 2026 12:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84663606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AXw+veP6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=blyAv3ye;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AXw+veP6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=blyAv3ye
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A3E5F22134;
	Wed, 18 Nov 2026 12:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6sW34hXTjPMbsbahPwOQLQlbcy6jCirB8tB5Xx3WgA=;
	b=AXw+veP6CWNUmY57RcRL9aHi9H4qzFUgDHbpCW3S6JAmgRa3uAQBAI1SBmwHGjtLtqqBYQ
	Lxc2TxenWHkQI48wrjftCno3NyiGm+WrmEQf/W3qOu1WYttcQMEwJerIJjz0kNmpn+yFi+
	wLbjMdSlQtXlbiJ2eHpPdBS0dvtZK1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6sW34hXTjPMbsbahPwOQLQlbcy6jCirB8tB5Xx3WgA=;
	b=blyAv3yeEH94052UUpSB8DLYDK/J3Za2Vexk0LJJn70Feg1m9iskV+fLbK98WvTz5MUZ3v
	KJhPYbxJJgr3L7AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795006697; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6sW34hXTjPMbsbahPwOQLQlbcy6jCirB8tB5Xx3WgA=;
	b=AXw+veP6CWNUmY57RcRL9aHi9H4qzFUgDHbpCW3S6JAmgRa3uAQBAI1SBmwHGjtLtqqBYQ
	Lxc2TxenWHkQI48wrjftCno3NyiGm+WrmEQf/W3qOu1WYttcQMEwJerIJjz0kNmpn+yFi+
	wLbjMdSlQtXlbiJ2eHpPdBS0dvtZK1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795006697;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X6sW34hXTjPMbsbahPwOQLQlbcy6jCirB8tB5Xx3WgA=;
	b=blyAv3yeEH94052UUpSB8DLYDK/J3Za2Vexk0LJJn70Feg1m9iskV+fLbK98WvTz5MUZ3v
	KJhPYbxJJgr3L7AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 58761134E9;
	Wed, 18 Nov 2026 12:58:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YfY5DOmg/WqPXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Nov 2026 12:58:17 +0000
Date: Wed, 18 Nov 2026 13:58:16 +0100
Message-ID: <87pkw2wb2v.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Correct Boost values for several laptops with overridden ACPI
In-Reply-To: <20261118120932.61495-1-sbinding@opensource.cirrus.com>
References: <20261118120932.61495-1-sbinding@opensource.cirrus.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[cirrus.com:email];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Wed, 18 Nov 2026 13:09:27 +0100,
Stefan Binding wrote:
> 
> Four laptops have incorrect Peak Boost values:
> - 103C8CDD
> - 103C8CDE
> - 103C8E60
> - 103C8F07
> 
> Update the values to the correct settings.
> 
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>

Applied now.  Thanks.


Takashi
