Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E6A4D37A2
	for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 13:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604001; cv=none; b=L2OBhv52SzNsi0XLPkPlfFab3LXUCVDoIqIQ+t8F5If6Z8Bl+Uo6KM8ZJTKYAsJpI4Oe8o223wueU16J7CNw9o4PkHLWl6tDuxdeSDeYr+D0YrSSLcN6WN5Sf8dShKPmrNUbef85LDlGDyUJtZ50IgCxlcg5DpU2HG8VDHUNFUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604001; c=relaxed/simple;
	bh=CTdZ0Cb2ljQs05wjENhxAwk73l1VIOFfm7CaGa4tfFE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjIE1owMZnv5ilELErqQRxJHoohLX/OBwtQcABwmwfrunutkTqdWb5MWZ4UIqW++sz2ofw3728UMmkfZTvIBQGXmVyc2BGAXAFnbBJr8vdzvR9hLZ7F+vIIDZKKqarWS4+4iqDKMmXK39Jii75soG4v7t9A+Vg5BuaT9a0Id9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GskN78tR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=BsAwHPgJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W+LX0SRQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uK1E3p9u; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GskN78tR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="BsAwHPgJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W+LX0SRQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uK1E3p9u"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C5E3021B79;
	Mon, 28 Sep 2026 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790603993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wh5MliJti1F/AxSEcuzh/ArJ1CI9HK38mA/OXgh+uuM=;
	b=GskN78tR1P2qerZGjbr1xOlz2sIbwMInT7LCgqhfyF5kAvjWRPIgnIN38/s8p80tR+vhZ9
	Fuc+9Jnb1X86FJkc6yNa9Hw2pH1gCA+kOWbbj5GdDaGpLKfMr8+eIj0yD94TrLaMLgbe+Z
	EEla0CdGX3CRr0JLwaw5VxIl0VS/wzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790603993;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wh5MliJti1F/AxSEcuzh/ArJ1CI9HK38mA/OXgh+uuM=;
	b=BsAwHPgJYT0rHi+3vP5FZ1T7WEfz8rO+v6qhn581i0uX1V7zKi65Rdl9EgG5n3EXRuAGCy
	3X4jnFgwIo/E4/CA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790603989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wh5MliJti1F/AxSEcuzh/ArJ1CI9HK38mA/OXgh+uuM=;
	b=W+LX0SRQ2rH29NpkF4ac3GKAEEwazRECfDgatVTL/7/oY3ajoY/KH5YodU7rwGymojFAw7
	LZ6Bv/84hnJr0z43RyARK490XQKwWPdhmd7goz1TVVBjtgkwE7eyCDngnWAzcFtCsOq4Fa
	b3FAk+RUCQqQkMv9p5Q8ibqjrUi3HeU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790603989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wh5MliJti1F/AxSEcuzh/ArJ1CI9HK38mA/OXgh+uuM=;
	b=uK1E3p9uFd/6wcM/dvPEL6IsO+0ODmccH/UVbJYP+EazpKtne6IduiyI6ASobtIa0ukNi5
	IzPuDX+HmvtbbiBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 42A881340F;
	Mon, 28 Sep 2026 13:59:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2T/fBtVyumqsXQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 13:59:49 +0000
Date: Mon, 28 Sep 2026 15:59:48 +0200
Message-ID: <87mrt14gtn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?wfUgtrA=?= <liudongxjtu@outlook.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: ALSA: hda/conexant: Fix silent speaker on Huawei MateBook 14  (SN6140)
In-Reply-To: <ME3PR01MB75042406F30EE48AB6DA3595BD862@ME3PR01MB7504.ausprd01.prod.outlook.com>
References: <ME3PR01MB7504E1F31E26F760F73DF639BDBD2@ME3PR01MB7504.ausprd01.prod.outlook.com>
	<87a4pjom3r.wl-tiwai@suse.de>
	<ME3PR01MB75042406F30EE48AB6DA3595BD862@ME3PR01MB7504.ausprd01.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]

On Sat, 19 Sep 2026 15:46:33 +0200,
Αυ Ά° wrote:
> 
> 
> Resubmitting as v2 with the patch attached, since the web mailer
> mangles whitespace in inline text.  Please apply from the attachment.
> 
> Changes in v2 are listed after the --- line in the patch file.

Applied to for-next branch now.  Thanks.


Takashi
