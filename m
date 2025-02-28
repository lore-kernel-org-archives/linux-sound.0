Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7A31E492
	for <linux-sound@vger.kernel.org>; Fri, 28 Feb 2025 09:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740735925; cv=none; b=DYmXLra+kDmVctoj58oz0rwwk3sMzSHYgR/xo4GeSjJS6JvNGuiOBfeKEnwyc50jcINneWCNetVbazVcPPYJhn2ztJOKw6F+5tZGtr1e63PFy5MFnNTBiWsUlCPLjhQIUSGBZjOCcO9j4aIps4p7jBigJ89k7LmiF7WiXWida0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740735925; c=relaxed/simple;
	bh=0JCerKlrD1J4ZOG71HdFL5SOCFUL1nJTUxKwuCgBqvk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qSzs9ZRU2B0Iv3RYKOSFBUQpezReYIJxZWPX7pPoegffwigV5PD3SL/Kbu8rigWKbQN521RDLKcU0u7VAR8aeo9WtXTgyBE0N6ifF4zlWL/V9BakZc2k4b/Oxz5WqcWQPO4dUZ/jqrYOoh20y+R2Xxn+XW11eYMrwTnEBVRi410=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w94Seuay; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IjDl0axT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w94Seuay; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IjDl0axT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w94Seuay";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IjDl0axT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w94Seuay";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IjDl0axT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7406121162;
	Fri, 28 Feb 2025 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740735921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evhCa8YSYws/rx6wH6x9M86mfsCuLduea+a/iSVSAlc=;
	b=w94SeuaypfWThRaH/Ea9RB8h/4q2BjwgL7SVlEhWtW3ERLcTYw7tDa76pnPX96xZmqVbYX
	64moZKDZEbv43zlprbGKzEyzxNvv2GK3FQJ+AZjonJf1HdsAR0sL4n08YLkxwddhEnTpWC
	Jfg3SUSfZku0nU2r2P2xtj0qtGVUDso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740735921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evhCa8YSYws/rx6wH6x9M86mfsCuLduea+a/iSVSAlc=;
	b=IjDl0axTTJsU/IssOMzThUYJxTt0Cz51m8vZ4LbNbbyS0Ov7m62iHw6rpS823y5R3VnOv3
	/041fxqphcPt0aAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w94Seuay;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IjDl0axT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1740735921; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evhCa8YSYws/rx6wH6x9M86mfsCuLduea+a/iSVSAlc=;
	b=w94SeuaypfWThRaH/Ea9RB8h/4q2BjwgL7SVlEhWtW3ERLcTYw7tDa76pnPX96xZmqVbYX
	64moZKDZEbv43zlprbGKzEyzxNvv2GK3FQJ+AZjonJf1HdsAR0sL4n08YLkxwddhEnTpWC
	Jfg3SUSfZku0nU2r2P2xtj0qtGVUDso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1740735921;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=evhCa8YSYws/rx6wH6x9M86mfsCuLduea+a/iSVSAlc=;
	b=IjDl0axTTJsU/IssOMzThUYJxTt0Cz51m8vZ4LbNbbyS0Ov7m62iHw6rpS823y5R3VnOv3
	/041fxqphcPt0aAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D0881344A;
	Fri, 28 Feb 2025 09:45:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a/o7DbGFwWeoUwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Feb 2025 09:45:21 +0000
Date: Fri, 28 Feb 2025 10:45:20 +0100
Message-ID: <87a5a6csi7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel =?ISO-8859-1?Q?B=E1rta?= <daniel.barta@trustlab.cz>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ALSA: hda: Fix speakers on ASUS EXPERTBOOK P5405CSA 1.0  
In-Reply-To: <20250227161256.18061-2-daniel.barta@trustlab.cz>
References: <20250227161256.18061-2-daniel.barta@trustlab.cz>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7406121162
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

On Thu, 27 Feb 2025 17:12:55 +0100,
Daniel Bárta wrote:
> 
> Good day,
> speakers on ASUS EXPERTBOOK P5405CSA 1.0 are not working out of the box.
> 
> After some digging around I have found that this laptop has Cirrus's smart
> aplifiers connected to SPI bus (spi1-CSC3551:00-cs35l41-hda).
> 
> To get them correctly detected and working I had to modify patch_realtek.c
> with ASUS EXPERTBOOK P5405CSA 1.0 SystemID (0x1043, 0x1f63) and add
> corresponding hda_quirk (ALC245_FIXUP_CS35L41_SPI_2).
> 
> Signed-off-by: Daniel Bárta <daniel.barta@trustlab.cz>

Applied now to for-linus branch.  Thanks.


Takashi
