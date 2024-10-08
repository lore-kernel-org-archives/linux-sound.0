Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F71F131E
	for <linux-sound@vger.kernel.org>; Tue,  8 Oct 2024 08:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728375103; cv=none; b=KVl+EYkKnwNY9wiQoTMtI1wo3gLTAEJrdPF7ILVAWVVTI5dUkge7IESCW8RLIh3inEHoEqPtRNiEvzp0HdMxq74W3b/t6CG2DuUQvNVKoheVXMxGzrsaex6WUYwSAl5bHCsAdcYuX08zTMg8RgUIzi/pxu+W1uKyegvWD97zbhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728375103; c=relaxed/simple;
	bh=Zw0DeTqfT8f6lMaL8LZenMn+79v88tDxVgIChGCGn70=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AtxCb2gKZUEjxBwe7YeO/6Vnc3qr3TgY2OwLpC1980TVNmTvXhXbHcWQdbhO1AVBSlfUKjE2towIHY84+ZPmgTSyk612z2HdH9U6C8h3M15J5tRdhoOPIgy3zkVhQSNsoWLFnUeN5UByQi6oboH6fKc9d1D85MDaTS7Y0lonUJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=luvjwroB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cRj7f14Y; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=luvjwroB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cRj7f14Y; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="luvjwroB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cRj7f14Y";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="luvjwroB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cRj7f14Y"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 668C31F8D7;
	Tue,  8 Oct 2024 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728375099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mL7GcEGGZKUlNFe71zr/Jh7lShMZmmbTSf+iv+6sW7Q=;
	b=luvjwroBhlmP/8mbkWvfonSJOPtbXxLZ/dXh11R+Qwz31OTOfZiXqGaW2/P6BI+/5VT3XD
	ICV4GbWiI/K6ABXv8FUEiMLqJK7WSNjUikW56bxNDkQcJteTzeCNg7JfurLh/Q7X8bkeNZ
	MyR6ZmdxpRRgZoVOiKO2h/UQxWL+S5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728375099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mL7GcEGGZKUlNFe71zr/Jh7lShMZmmbTSf+iv+6sW7Q=;
	b=cRj7f14YhB/nBP9A2heXNbIjFGg8S5AwQP+t74KBs0LhWSt2GcAHbmiUWDGOsK6qU4YbCL
	4sK/VhEY84KvmMAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728375099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mL7GcEGGZKUlNFe71zr/Jh7lShMZmmbTSf+iv+6sW7Q=;
	b=luvjwroBhlmP/8mbkWvfonSJOPtbXxLZ/dXh11R+Qwz31OTOfZiXqGaW2/P6BI+/5VT3XD
	ICV4GbWiI/K6ABXv8FUEiMLqJK7WSNjUikW56bxNDkQcJteTzeCNg7JfurLh/Q7X8bkeNZ
	MyR6ZmdxpRRgZoVOiKO2h/UQxWL+S5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728375099;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mL7GcEGGZKUlNFe71zr/Jh7lShMZmmbTSf+iv+6sW7Q=;
	b=cRj7f14YhB/nBP9A2heXNbIjFGg8S5AwQP+t74KBs0LhWSt2GcAHbmiUWDGOsK6qU4YbCL
	4sK/VhEY84KvmMAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 469F71340C;
	Tue,  8 Oct 2024 08:11:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lC7CDzvpBGcRHQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Oct 2024 08:11:39 +0000
Date: Tue, 08 Oct 2024 10:12:34 +0200
Message-ID: <87o73vvwr1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/5] ALSA: scarlett2: Small fixes + device map retrieval
In-Reply-To: <cover.1727971672.git.g@b4.vu>
References: <cover.1727971672.git.g@b4.vu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.985];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[3]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Fri, 04 Oct 2024 16:27:22 +0200,
Geoffrey D. Bennett wrote:
> 
> Hi Takashi,
> 
> This patch series contains:
> 
> - 3 small fixes, I don't think need to be backported.
> 
> - Simplification of linked channel handling to match how the firmware
>   works. This is needed to be able to handle the recently-announced
>   big 4th Gen models correctly.
> 
> - Addition of support for device map retrieval: the Vocaster and
>   Scarlett 4th Gen series added a new operation allowing the host to
>   retrieve a base64-encoded zlib-compressed JSON representation of the
>   device and the location of each control. This patch makes that
>   available through /proc/asound/cardX/device-map.json.zz.b64
> 
> Regards,
> Geoffrey.
> 
> Geoffrey D. Bennett (5):
>   ALSA: scarlett2: Fix redeclaration of loop variable
>   ALSA: scarlett2: Fix mixed declarations and code warning
>   ALSA: scarlett2: Return ENOSPC for out-of-bounds flash writes
>   ALSA: scarlett2: Simplify linked channel handling
>   ALSA: scarlett2: Add support for device map retrieval

Applied all five patches to for-next branch now.  Thanks.


Takashi
