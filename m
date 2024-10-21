Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713121D12E5
	for <linux-sound@vger.kernel.org>; Mon, 21 Oct 2024 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495207; cv=none; b=GuBLDdFhrqJ9jvOI0CNP2eVHD8zHOFCrlsz3cHz1/d9ZdkoPlcJe3Ty0YY4Cp5PD5UQ80+Eq2fYkP8GbV9w4TfrBh/Hmzfb3nNGKN8o/RUEkBk97fqDz7Gx7Mf8w5um3gMeTp+3eaP3vI4SzgNbaCwyvMZvA67DyKOfE97Zc5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495207; c=relaxed/simple;
	bh=3mxBKDdg+tPO9pXfDnS7rILWKB7T/dfh61TBH9neoy8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OED0wuWFfZagoDkO70VD7f9rGKXgOGxbz8c9Wwr8ZKgEoDh3VtkrHiX54mCLBSUNohDclujdnbS+j+wxoNiQwWIZoigNbOOgDuav17vyLB6Ol5Uy3FOs7goWpQ0lS97UeRiGhq+9nQBYwjJhO8S0HFWgxdmaYF0IQdmvXww+YYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RCIPfjDj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o0ktpACa; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=RCIPfjDj; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=o0ktpACa; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCIPfjDj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o0ktpACa";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCIPfjDj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="o0ktpACa"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 385231F839;
	Mon, 21 Oct 2024 07:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729495198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQe66vKfbMWBTFQCWG5iuiihKO1Q6SwnXFyelxYcSfE=;
	b=RCIPfjDjn6IfXfxSND5gXGuRS41lGjia4vTBCCQ54mcBXOqgKqpTH8k4Ih2i4RvRoQ9aAm
	hVYFRaSZxKFqBBMB4DIWDHaJgvFOtj8HUn7lYfmu++PcJ/57ZVux+jmhvy1XWh3UKkogv8
	IUwNTVrv5/+WFWzJblDTv/PZmejpM4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729495198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQe66vKfbMWBTFQCWG5iuiihKO1Q6SwnXFyelxYcSfE=;
	b=o0ktpACaK8RyKJOOMhLMaXm+m3ZxkL04ko2M0AK1LtJNn3rtwSUve5Uk2RmwC6Mv9JWbGb
	d7rE8KzjEcYlmkCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729495198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQe66vKfbMWBTFQCWG5iuiihKO1Q6SwnXFyelxYcSfE=;
	b=RCIPfjDjn6IfXfxSND5gXGuRS41lGjia4vTBCCQ54mcBXOqgKqpTH8k4Ih2i4RvRoQ9aAm
	hVYFRaSZxKFqBBMB4DIWDHaJgvFOtj8HUn7lYfmu++PcJ/57ZVux+jmhvy1XWh3UKkogv8
	IUwNTVrv5/+WFWzJblDTv/PZmejpM4Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729495198;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LQe66vKfbMWBTFQCWG5iuiihKO1Q6SwnXFyelxYcSfE=;
	b=o0ktpACaK8RyKJOOMhLMaXm+m3ZxkL04ko2M0AK1LtJNn3rtwSUve5Uk2RmwC6Mv9JWbGb
	d7rE8KzjEcYlmkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1891D136DC;
	Mon, 21 Oct 2024 07:19:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id X8SGBJ4AFmdMTQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 21 Oct 2024 07:19:58 +0000
Date: Mon, 21 Oct 2024 09:20:58 +0200
Message-ID: <871q09kjl1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?Jos=E9?= Relvas <josemonsantorelvas@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH V2] ALSA: hda/realtek: Add subwoofer quirk for Acer Predator G9-593
In-Reply-To: <20241020102756.225258-1-josemonsantorelvas@gmail.com>
References: <20241020102756.225258-1-josemonsantorelvas@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Sun, 20 Oct 2024 12:27:56 +0200,
José Relvas wrote:
> 
> The Acer Predator G9-593 has a 2+1 speaker system which isn't probed correctly.
> This patch adds a quirk with the proper pin connections.
> 
> Note that I do not own this laptop, so I cannot guarantee that this fixes the issue.
> Testing was done by other users here:
> https://discussion.fedoraproject.org/t/-/118482
> 
> This model appears to have two different dev IDs...
> 
> - 0x1177 (as seen on the forum link above)
> - 0x1178 (as seen on https://linux-hardware.org/?probe=127df9999f)
> 
> I don't think the audio system was changed between model revisions, so the patch
> applies for both IDs.
> 
> Signed-off-by: José Relvas <josemonsantorelvas@gmail.com>

Thanks, applied now.


Takashi
