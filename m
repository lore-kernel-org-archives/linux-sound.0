Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6798437474;
	Thu,  6 Aug 2026 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009794; cv=none; b=hMfYgQ/FvxmrlTL8PTU7irbAhmp+qcdr6rGCWrC1/DXviBzq/MTALZAjaDCR6oSKhmndD+v/h5cXYyCou7mD0Puv747zkz7gIXjH6xkezczvm0FMNDWM/SwG8q3ifOl9ZR5JtW6iZLx8tOn4el7zFCwRzF2OrSDSvxn84wlR1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009794; c=relaxed/simple;
	bh=SA+b48vBreZ7U3AsyF2UgsaYnXQL9DUDkCC11viOkfg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SYmH8+Ws0ZHmFzdaSYpZSGlgQ1qNdLGCnb5eUmHcbMiV6Hqe7mloliqTNYi3D4q9SNGozzl9cK1jdG4HrIYn1nDR4wbGuPZGTONs92WDdmI9chHA+jJtxVUeepXGjLdza3IVjNQYvkpvt2+QENLxhgf9i0Re0oXGum+Xl/8jzG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VL6G13s1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=q6HwhNkB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qAqiuizl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yURbHFbD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VL6G13s1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q6HwhNkB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qAqiuizl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yURbHFbD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71A617FFB7;
	Thu,  6 Aug 2026 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786009786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk7uv05/sXiOH6trFzKTpNhTIl4ZxfAWVkbrsf4I7LQ=;
	b=VL6G13s1YpBmmScelG34h4f2P5SQ12nTdymaA5NFXRMM6G9hAoosxVIMHqFojE7VAqr7aK
	uaFA6rXkWzK1edJC3WEr8ZeifXod2eSGS4Jmgm4Q5Ueq0aViF4XbHmkox2mluJR4Rrd8CX
	/pDXtuGrXEBr005rOOa8RLiXAyULK7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786009786;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk7uv05/sXiOH6trFzKTpNhTIl4ZxfAWVkbrsf4I7LQ=;
	b=q6HwhNkBVbdWmTEQmPb6B6BM+qCuzznwJB7bwKUzTiQvdVlvcXJg+tMtlz23u/5ZTIoKKp
	xtBa732jOeYiaHDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786009782; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk7uv05/sXiOH6trFzKTpNhTIl4ZxfAWVkbrsf4I7LQ=;
	b=qAqiuizlPs5je58bZZsjIekjnJnT8++dbLD+yrxLyzHP0vLqfpP1REiBPUXIpTcYQnr0Pb
	JOmkUqZGXBMfcp18U1ljAXaUE6s3CL/lKVOFnvkOS92SUYdw0TXwY56nQ3w0MVzUS/nc3p
	WueeKAhCfB2wwJiVw7MZEbqx7p7vNKU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786009782;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kk7uv05/sXiOH6trFzKTpNhTIl4ZxfAWVkbrsf4I7LQ=;
	b=yURbHFbDAOjovQqrn1gNmUHReP0ItIfGzPXVno7/5T0O+JA7bHIpgCfjVccU/d9Sf+NAin
	lLfZgos+qbl+6vAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 49E5C779C0;
	Thu,  6 Aug 2026 09:49:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Sj7KELZYdGr4PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 09:49:42 +0000
Date: Thu, 06 Aug 2026 11:49:41 +0200
Message-ID: <87ldajefyi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zhang Heng <zhangheng@kylinos.cn>
Cc: tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Merge duplicate quirk entries for ASUS Strix G615
In-Reply-To: <20260806054505.43717-1-zhangheng@kylinos.cn>
References: <20260806054505.43717-1-zhangheng@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.961];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,kylinos.cn:email,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.29
X-Spam-Level: 

On Thu, 06 Aug 2026 07:45:04 +0200,
Zhang Heng wrote:
> 
> The ASUS Strix G615 series (subsystem IDs 0x1043:0x1204 and 0x1043:0x1214)
> currently have duplicate quirk entries: one using HDA_CODEC_QUIRK with
> ALC287_FIXUP_TAS2781_I2C, and another using SND_PCI_QUIRK with
> ALC287_FIXUP_TXNW2781_I2C_ASUS.
> 
> Since these entries cover the same machines, the duplicate entries are
> redundant and may cause confusion. The correct fixup for these models
> should be ALC287_FIXUP_TXNW2781_I2C_ASUS, as the TAS2781 fixup was
> likely a mistake.
> 
> Merge the two entries into a single SND_PCI_QUIRK entry with the
> correct fixup, removing the redundant HDA_CODEC_QUIRK entries.
> 
> Signed-off-by: Zhang Heng <zhangheng@kylinos.cn>

Applied both patches to for-next branch now.  Thanks.


Takashi
