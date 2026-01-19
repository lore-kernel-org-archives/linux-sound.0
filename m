Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C57533987B
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810331; cv=none; b=n3KRCOhCUWY+wLflYAT6KI6V7vk7M70QtekoDtg/8B5zG5/2TggckRKfaty5OcDkjz4P+LvLgBe3fUDD4mOSWbJxYxvoB2cMyGkNMciYVw9nfVPfBv8stRdCPmLLdgPxfSh4deBLDDtEiTrH4bu+SRYsHSzm+9+etyi5PVUHesk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810331; c=relaxed/simple;
	bh=zllHT9qWFlIEHOtXpNX4pgL4XR00hxK7qL9n1LnVAtY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6K0zlOZgTPi/gu2CsqpzTzVPRN/LguLBKTJ1ENFJOXerWupRjR8WUnpDztwD4g+joQ4cvaSgIyy1RrvdFog6VW1hKYgIhnj+9HGWSLTH7YjeAp1ok0IRgYDoviMMxA0Ow+dAmAsHkFN5V8+5oPQqkn7/k+51IAXA8dhV6oSRzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1hPVxAGL; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AMY9pEbi; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VVqfhKol; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=v7DkO27c; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1hPVxAGL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AMY9pEbi";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VVqfhKol";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="v7DkO27c"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC812336A6;
	Mon, 19 Jan 2026 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768810328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSoLFFyt7uu6y/2/SKt7mQ7oTDq4OL2rQd/rgJrxHPY=;
	b=1hPVxAGLEtol2zrHfvj6m98U89XjIJlW7WlWxjGVRWQSCrodMdAqC4wtmFI9mKJYcFYytB
	IFlNOgTlM7/ZHlN/gvUOIbkKWkW3glOQA9r/CHzuZ8EAUiqpf6kMQ5sL8kKtmwJahuc2By
	4vN2Ot5Q/Z8Q1hiyOFeDMOEiEwg2fIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768810328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSoLFFyt7uu6y/2/SKt7mQ7oTDq4OL2rQd/rgJrxHPY=;
	b=AMY9pEbiWbYUPbx/HdEVQzN/4n6IuH8nLkDyNv9PcOfIvkg4GrqjGEkzPs3CtVRj4tHPXn
	wlSTXtjDStDmNlAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768810326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSoLFFyt7uu6y/2/SKt7mQ7oTDq4OL2rQd/rgJrxHPY=;
	b=VVqfhKolxf8UhtqzU7b0d8FuUGjCvGZRtBVzkZTG3tsW1M+Mc4kCJUVqDkAg8l91XMh1hT
	yQmrs7KTzYiCCQibZC/S2krHEE8RO/WZMNP3UiLuMxXF5VJEVGHfYGrIRr5rGmyGJ9WE32
	rXa8WxB/BUv2c2E/mpZXMfyJQ6hP/t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768810326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HSoLFFyt7uu6y/2/SKt7mQ7oTDq4OL2rQd/rgJrxHPY=;
	b=v7DkO27cvSPsUWaKevv613ovfSRSzCEXWFoojvhuC9vBCTAGKYNojaBBjpE4x0GV/TYtjp
	minH2woiBsZ42+DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 774363EA63;
	Mon, 19 Jan 2026 08:12:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id po/iG1bnbWkfBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Jan 2026 08:12:06 +0000
Date: Mon, 19 Jan 2026 09:12:05 +0100
Message-ID: <87qzrm81ii.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?GB2312?B?uvrBrMfa?= <hulianqin@vivo.com>
Cc: "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	Cryolitia PukNgae <cryolitia@uniontech.com>,
	"pav@iki.fi" <pav@iki.fi>,
	"jussi@sonarnerd.net" <jussi@sonarnerd.net>,
	"roy.vegard.ovesen@gmail.com"
	<roy.vegard.ovesen@gmail.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: usb-audio: Add delay quirk for MOONDROP Moonriver2 Ti
In-Reply-To: <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB6217911EFC7E9224935FA507D28DA@TYUPR06MB6217.apcprd06.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,uniontech.com,iki.fi,sonarnerd.net,gmail.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,vivo.com:email]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Fri, 16 Jan 2026 07:33:03 +0100,
ºúÁ¬ÇÚ wrote:
> 
> Audio control requests that sets sampling frequency sometimes fail on
> this card. Adding delay between control messages eliminates that problem.
> 
> usb 1-1: New USB device found, idVendor=2fc6, idProduct=f06b
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: MOONDROP Moonriver2 Ti
> usb 1-1: Manufacturer: MOONDROP
> usb 1-1: SerialNumber: MOONDROP Moonriver2 Ti
> 
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>

Applied now.  Thanks.


Takashi
