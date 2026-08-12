Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAA4477F9
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786539730; cv=none; b=nJUqmTGBR7b0Bz0wuMuPV36VYO/zbuxGJmM/pZCvuY4DH59zyoED8gBI7nxm8TY+VWDachL3XAuOb4zCu1txcZQLAWSoLnn2WOb7UkJVk79L5V888V8LZ337I6fdPhKg9lBuJm04NDYTTWxHaFONu+u46ZzMiBCMqXc/WiaopqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786539730; c=relaxed/simple;
	bh=y0fOd6upMZE3+99aww0UUmPmo/a4DLhAD4AY+kzarZA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AMGOr6l1JT+z5/dUrcVrdaze4dQWYJR+jq9WgKR+xY0pncPMmi/+v5aP/K4QtfwRYmB6Yx//TNFip4F5MJbfO0gey8jYtRSAXzBMbfYlg/ocv7O5ua8/Gr0ob0ScnIs/FihHKjAduchTKP5qKUq3qRqQslg7ZIaPjNlU1T0YjFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=qNA8aFXD; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FLiBqccS; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Hq4pYAYr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Xs6Yu69f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qNA8aFXD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FLiBqccS";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Hq4pYAYr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Xs6Yu69f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1D8D5822ED;
	Wed, 12 Aug 2026 13:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786539722; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRy9oGx9sVImnzpErbBVYnVIo+nO2VQzCCsgEAstDgY=;
	b=qNA8aFXDqs3aS9BOcobIgI/ofxkwQk8AaW3TkNhCap/3iolGzgzr/j2I0wKnEuVoGuH73H
	7XWUYunMwZyMByYktKXzFxTdzr/UWYR5AjI8PLb8FMQoJ6vGib20tZxoG4atO10LHVvNP6
	wQpU4wxhwIXDQNF4fldmDjt/ls6aj3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786539722;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRy9oGx9sVImnzpErbBVYnVIo+nO2VQzCCsgEAstDgY=;
	b=FLiBqccS1q4RCUvRYu5eKAgiEFDX47HWZzzZRjhTfE6hLECR/EADpcsgkhJkjhX6T0J8Kq
	eUVzazRREnGrcECw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786539718; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRy9oGx9sVImnzpErbBVYnVIo+nO2VQzCCsgEAstDgY=;
	b=Hq4pYAYrfmapNP/WgmIQOKwmD032EVNv9zKzHZ+iRXWzxGgUsa7dMlMBo2vKrQ3DL79jk8
	0Hwsy8QVJ5f5fw+W7qzGwYJ1j5Hiv3yz/aDZ+LSonhtahDRuxpAvNtN3L/Z3BQUPwJO7jv
	0NHLJqsaPH1p8qgj59jA2nrYjai5COM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786539718;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NRy9oGx9sVImnzpErbBVYnVIo+nO2VQzCCsgEAstDgY=;
	b=Xs6Yu69ffTFj3Ybz2Rin4MXTfqIRszYaCOUtD7I/AJcItFAggLljuHNOYbLp45zuV/DmIQ
	9n1Eftfk7ITY4tCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B156779B1;
	Wed, 12 Aug 2026 13:01:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o+UGAsZufGpPSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 12 Aug 2026 13:01:58 +0000
Date: Wed, 12 Aug 2026 15:01:57 +0200
Message-ID: <87qzk3ze4a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dmytro Moroziuk <dmorozyk1@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/conexant: Add mute LED quirk for HP ProBook 440 G5
In-Reply-To: <20260812121856.30353-1-dmorozyk1@gmail.com>
References: <20260812121856.30353-1-dmorozyk1@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 12 Aug 2026 14:18:56 +0200,
Dmytro Moroziuk wrote:
> 
> The HP ProBook 440 G5 requires the CXT_FIXUP_MUTE_LED_GPIO quirk to
> properly toggle the physical mute and mic-mute LEDs via the CX8200 codec.
> Without this quirk, the LEDs remain permanently dark.
> 
> Signed-off-by: Dmytro Moroziuk <dmorozyk1@gmail.com>

Thanks, applied to for-next branch now.


Takashi
