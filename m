Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4FC79DB6
	for <linux-sound@vger.kernel.org>; Wed, 31 Jan 2024 13:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706706826; cv=none; b=LWHEUAda2ljpwnhnnXegCTe0eskFEwVksONEcc8ZfgZLIH1SRvgb8X2/+X6DsRzL7zVswOL7iP8k1hH5MkZSbNZ4RoqviSXBoJvA7XANLcUeytd/9awLPCCADt+zBB92GocE7dFrkUiUPsXwF1vpSLK4VI9CA5UoJtS9mR/6JvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706706826; c=relaxed/simple;
	bh=VHOAeAYf4Nnn465d5f8AjTzL9eyeXb9sZNor7V0ayLk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3DN6xqQriqfm8MbLTKjVm2RFXXgELujlLBdRaNk+cPf5Jkq/DaVFGpEMnUh8e+nOjMPULAzODr3LsGeK5r+eFKNzoM42A2AumIeGz1OkW/Y6E9lPb8xtSaT0npxM69bEtdKKsmdL9rDBHyMpo1HRxSfyd3Qr5XlJtkIbaJvKPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w4QiGBcZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3PZ9vNs0; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=w4QiGBcZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3PZ9vNs0; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w4QiGBcZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3PZ9vNs0";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="w4QiGBcZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3PZ9vNs0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F1EE220BF;
	Wed, 31 Jan 2024 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706706822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIQC80suH7U4AQNOiyXPRwJomiVUvbW2qOQKp/mknFA=;
	b=w4QiGBcZTj8F8CFrPyRUEP3zixXfhSIn3A67vFKTWsKYbOEdJQYNs3/c7Zbqt5mzhgBgmy
	B24eJVergZdDpUJvqTzH/PluKWTDTo+e1ZQqbJQzrl9PkGTb1B4H7fKzdborfFuNwvRxOA
	R3+wsNOyrHTn2syt1cEwfGhOkw/eDdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706706822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIQC80suH7U4AQNOiyXPRwJomiVUvbW2qOQKp/mknFA=;
	b=3PZ9vNs0dh0lHUHXp+56nf4DEbygiFCOwZEj0vVSxzJCHOZ8jdx0+N7wFmwAva6sRqdWfV
	VYy+0dJN/V0jp/CQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1706706822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIQC80suH7U4AQNOiyXPRwJomiVUvbW2qOQKp/mknFA=;
	b=w4QiGBcZTj8F8CFrPyRUEP3zixXfhSIn3A67vFKTWsKYbOEdJQYNs3/c7Zbqt5mzhgBgmy
	B24eJVergZdDpUJvqTzH/PluKWTDTo+e1ZQqbJQzrl9PkGTb1B4H7fKzdborfFuNwvRxOA
	R3+wsNOyrHTn2syt1cEwfGhOkw/eDdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706706822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIQC80suH7U4AQNOiyXPRwJomiVUvbW2qOQKp/mknFA=;
	b=3PZ9vNs0dh0lHUHXp+56nf4DEbygiFCOwZEj0vVSxzJCHOZ8jdx0+N7wFmwAva6sRqdWfV
	VYy+0dJN/V0jp/CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 685DA1347F;
	Wed, 31 Jan 2024 13:13:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Kq1QGIZHumWkAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Jan 2024 13:13:42 +0000
Date: Wed, 31 Jan 2024 14:13:42 +0100
Message-ID: <87wmrp1w8p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH V2] Apply headset jack quirk for non-bass alc287 thinkpads
In-Reply-To: <20240131113407.34698-3-josemonsantorelvas@gmail.com>
References: <20240131113407.34698-3-josemonsantorelvas@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=w4QiGBcZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=3PZ9vNs0
X-Spamd-Result: default: False [-4.25 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	 RCPT_COUNT_FIVE(0.00)[5];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FREEMAIL_TO(0.00)[gmail.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.94)[99.76%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 8F1EE220BF
X-Spam-Level: 
X-Spam-Score: -4.25
X-Spam-Flag: NO

On Wed, 31 Jan 2024 12:34:09 +0100,
José Relvas wrote:
> 
> There currently exists two thinkpad headset jack fixups:
> ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK
> ALC285_FIXUP_THINKPAD_HEADSET_JACK
> 
> The latter is applied to alc285 and alc287 thinkpads which contain bass speakers.
> However, the former was only being applied to alc285 thinkpads,
> leaving non-bass alc287 thinkpads with no headset button controls.
> This patch fixes that by adding ALC285_FIXUP_THINKPAD_NO_BASS_SPK_HEADSET_JACK
> to the alc287 chains, allowing the detection of headset buttons.
> 
> Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>

Applied now.  Thanks.


Takashi
