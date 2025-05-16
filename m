Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F213B22A7FC
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 07:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382063; cv=none; b=AqBERheE7J1tmXrqZwuNtGcQAuxd9q9cmErhXKqR+Kcbx3lrsFzblH+QGX89Tpk0/cpmddtB0yRH+QrQWeF94EshnVhDaAlBHonOYzcEeXz2DMR2rbMuhHsCzma2JM6mypQtNxP72ZkvXiMNhUUDrtj4r5++LGv7GWzgwKMJKD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382063; c=relaxed/simple;
	bh=jTVzraWDhWUGVehLWXnwAD3J270PlDp2S/+LxFI5n74=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AscKIvasVS73n51ezNWKINIdzih3PsixqzGrjwPAz+OGueIDeYjWRO2NWgHIhSFoaXdSwPoyXBL+Ufn6QyqS15GBIp+wuXEEDRZO28yWkUNowLMfXgdbyOAElsPbPS5Dqc+Imp9BCDJU5v+5YwVQ8eQyxm3n90RMurbVXHGnjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P21U1FEn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UX/i7Bhj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P21U1FEn; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UX/i7Bhj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P21U1FEn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UX/i7Bhj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P21U1FEn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UX/i7Bhj"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B052D1F7EE;
	Fri, 16 May 2025 07:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5R03PkO4CMXcwKuj9qCPi7qM9ntVe6SK81tysXKq/I=;
	b=P21U1FEn2MN51UesjZp+AKGZfIYm6qTBRes5PfvueP7fJ9Un9YOoTg5F98Rq3P6/SI80H4
	oxu7/SLt6h0eDGusdGhNEsPqSwZqL2ckxTtKMP/DyOL8+h14xUC6BxNyTtjEe8qgX5nTOW
	CdnO7SHZtUovFaozl94WbapDsWyBVcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5R03PkO4CMXcwKuj9qCPi7qM9ntVe6SK81tysXKq/I=;
	b=UX/i7Bhj9FrvtWiqNiOSLKys1172CPdsZn1UkIKvYQeWEcHNf8XsJPTk4z70vaox9XnesI
	WNPqs+SlFgt+M1AA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382054; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5R03PkO4CMXcwKuj9qCPi7qM9ntVe6SK81tysXKq/I=;
	b=P21U1FEn2MN51UesjZp+AKGZfIYm6qTBRes5PfvueP7fJ9Un9YOoTg5F98Rq3P6/SI80H4
	oxu7/SLt6h0eDGusdGhNEsPqSwZqL2ckxTtKMP/DyOL8+h14xUC6BxNyTtjEe8qgX5nTOW
	CdnO7SHZtUovFaozl94WbapDsWyBVcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382054;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5R03PkO4CMXcwKuj9qCPi7qM9ntVe6SK81tysXKq/I=;
	b=UX/i7Bhj9FrvtWiqNiOSLKys1172CPdsZn1UkIKvYQeWEcHNf8XsJPTk4z70vaox9XnesI
	WNPqs+SlFgt+M1AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B6A813977;
	Fri, 16 May 2025 07:54:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RfbVICbvJmg9TAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:54:14 +0000
Date: Fri, 16 May 2025 09:54:14 +0200
Message-ID: <871pspxa6x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-2?Q?Franti=B9ek_Ku=E8era?= <franta-linux@frantovo.cz>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: usb-audio: Rename Pioneer mixer channel controls
In-Reply-To: <20250515122345.3911-2-franta-linux@frantovo.cz>
References: <20250515122345.3911-2-franta-linux@frantovo.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30

On Thu, 15 May 2025 14:23:46 +0200,
Franti¹ek Kuèera wrote:
> 
> so alsamixer can show the controls in correct categories: capture/playback
> 
> Fixes: 171bb5123fbc ("ALSA: usb-audio: Add Pioneer DJ DJM-V10 support")
> Signed-off-by: Franti¹ek Kuèera <franta-linux@frantovo.cz>

Thanks, applied.


Takashi
