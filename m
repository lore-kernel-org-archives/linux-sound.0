Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12373B2FFC;
	Mon, 17 Aug 2026 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786967611; cv=none; b=LZPg0eXs5NxozIDrAQsy8tFyWPQYjQpHkCABNIsIoKdB4Qt+v6YWrm/ZoZH3i60MuQqOva3DuwCiX9wo6rmT9adDsqi8AEVMYRY3zueGIYF7zLTfc8L+r2QnPggh1kXs3N22Itx98/aUF/B+5K3+MXrM6RtaV3qLTcJWvI7pr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786967611; c=relaxed/simple;
	bh=l8xcl/eK0EC2zc06yZNG2ELvG8t1rtwcGiew3d8eKQs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j0ezxPIaNxPveEU72ev6Zjy1wCkTdMpeh+x3D49JMcy0/6cziSyVTljebfck0/il5COwSoI7qz9qs6e7k9Z/KiOSxJZGPvZDR/Hvvlp8tPRI3/9H2DW0s3js5UWsIi/jgwuE50GP7AtJLmiC/K7NF/cGYfbtjIc6+7hFC8lHV2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=y2Gs1IIF; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=w12fQkP4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RXdhAfxS; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2UgWCQMx; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="y2Gs1IIF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w12fQkP4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RXdhAfxS";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2UgWCQMx"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D4B5583F5E;
	Mon, 17 Aug 2026 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786967604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPXil13DcPH4bcyvFn6BDJOT/CRLRlQorr8tHyNRxaU=;
	b=y2Gs1IIF5G+hBYctG8VIHy7VvL2VEE1ZdXhLQ0n6OWZ3pXFO8YjxUVWIImE2yZnuYE/CFr
	gyzsB0wLxdGYLFGQ3UuqQPyHJpMsgD5ymG1jG8sFtrJF2SXdsQM5ewLLP3gPm3LzW4XBDN
	MRYntPPwWGJhCMH2ZX1sGbXHwgTTLr8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786967604;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPXil13DcPH4bcyvFn6BDJOT/CRLRlQorr8tHyNRxaU=;
	b=w12fQkP4onpGUR8hAHlS6z6Vl122RzbxJPER/oR8vKrUd3uwPPanVp6YBPYPamPfe72/DQ
	ksy0R44TDT6+ZrBQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786967599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPXil13DcPH4bcyvFn6BDJOT/CRLRlQorr8tHyNRxaU=;
	b=RXdhAfxSsu3oPpn4pgcsOKxwoz0IcclH0GQHF2+Vq3pDbvMYCxe/86MoYRio41ZQxyJCCR
	lIFTpCXo1+TWh5p/ivdGBYYN2PnlqojJF4nrJhBeHmp69mScfLx+qLr5xaORomxbi9iWvo
	/fv9v7jrS/7RmMnxXlS9uTSDGVFLLdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786967599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KPXil13DcPH4bcyvFn6BDJOT/CRLRlQorr8tHyNRxaU=;
	b=2UgWCQMxUh8R8EKj2B3PVOqJ5bDrPzbcO5LEqevrLLatdv1BgE3f5TU+4CEUi8EHsXkKOc
	RYvxtCsNZavqu0Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB4C279451;
	Mon, 17 Aug 2026 11:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yHqZKC/2gmqEUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Aug 2026 11:53:19 +0000
Date: Mon, 17 Aug 2026 13:53:19 +0200
Message-ID: <877blprmj4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for SPACETOUCH USB Audio
In-Reply-To: <TYUPR06MB6217D93F595D9995413C9721D2A72@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217D93F595D9995413C9721D2A72@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 17 Aug 2026 13:19:42 +0200,
ºúÁ¬ÇÚ wrote:
> 
> Audio control requests that set sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> usb 1-1: New USB device found, idVendor=0666, idProduct=0880
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: USB Audio
> usb 1-1: Manufacturer: SPACETOUCH
> usb 1-1: SerialNumber: 000000000
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
