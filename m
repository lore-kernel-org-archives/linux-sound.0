Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9CC413780
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765877; cv=none; b=snN7BAaotP96r4mnheLLGmTZzYkEMcT9LVFpdotf3AOgHsr8IRHnxQZVUJyDcPLe5yfNjSGxlZMf3RtRuSCyzwUBnsBPDkj8u4ZFkwdDGPQ29SFDxWAqBj6oc9/YBG7eVzJO7qmioVg9R0oAhDFImoRuiU/IiVL4DbZq76nsbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765877; c=relaxed/simple;
	bh=HKj++ECgZtd2igCfrhFrKS3DTjIb7u8nb2ilId/fISc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5w7Ps0zVe8plzy4fo5Ln7S1vvGh+1rvB87ugGAEnHO5vUPPS655PeGfKt14X30YnPh6eXZgwUBXF1y5YLNpX90odkt7YwCwWumrG6Isfvzsi3JxBlpx6JzVQUnmmr8DaSgwExaXGm1M2FkgvA9PLNCsI6CKHsv9mMeuHcKosMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XP23mpv9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=6wAnhIYg; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BksUezhU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zPGI9y+f; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XP23mpv9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6wAnhIYg";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BksUezhU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zPGI9y+f"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EE92C7F15D;
	Mon,  3 Aug 2026 14:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765870; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1QcDjJNvq/6mZpbbyb6ZH8FA/A/dO4yZvmvn8cwm8A=;
	b=XP23mpv9fbVBfqP7QOH7+QaNpbOpUTcF9GJk8Ht2sdFNqRqVEwfmH3Aj/iGVBDyGLL7rJv
	FdE/OV391PKzdiLr2Sl+PM/6mkREgNGTyssWqikHxBdGOkXbQIVkZJTJ/QnHZErkU1Q3Ms
	K3l0qp8WSuxh0+28yrB9ZkhUtAKJHLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765870;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1QcDjJNvq/6mZpbbyb6ZH8FA/A/dO4yZvmvn8cwm8A=;
	b=6wAnhIYgFa/zIzeKs/3y/R1F0oyvavY7U3AooRGsYgJnroCuOXKR9s1GhXk/MKAfNU3oV3
	0uaYsxWJ5KjogVAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1785765865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1QcDjJNvq/6mZpbbyb6ZH8FA/A/dO4yZvmvn8cwm8A=;
	b=BksUezhU/CoKvl/aiR03sZHiLyRaYDJKyKoSSdmPRCwmpqSNNsHefD/evZKgw2F3Xta4qJ
	2yNuy0kAsytmyA3zKVaITM0sH6TWEKkQK/lyogNvjfnhVm6GGAg3GbB8H7Sd9yn0fTgD+J
	qY0bwn3TP/BbOf7yM279dvaMgw5NReU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1785765865;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q1QcDjJNvq/6mZpbbyb6ZH8FA/A/dO4yZvmvn8cwm8A=;
	b=zPGI9y+fx4PIEjK72Y93ENEEH2j8WCHrzyynAE26CPuXjIwmq9x516WAye3C+iXnfllgMq
	0htVQp0taX5dhSBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B5D79779C1;
	Mon,  3 Aug 2026 14:04:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hj8QK+mfcGpNKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 03 Aug 2026 14:04:25 +0000
Date: Mon, 03 Aug 2026 16:04:25 +0200
Message-ID: <87h5lb9u6u.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Eric Naim <dnaim@cachyos.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
    linux-sound@vger.kernel.org,
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/9] Remove some duplicate quirks
In-Reply-To: <ab0fe804-4e8e-42dd-a491-8d7f44e74855@cachyos.org>
References: <20260803091102.107570-1-dnaim@cachyos.org>
	<ab0fe804-4e8e-42dd-a491-8d7f44e74855@cachyos.org>
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
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,cachyos.org:email,imap1.dmz-prg2.suse.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,cachyos.org:email]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Mon, 03 Aug 2026 11:18:00 +0200,
Eric Naim wrote:
> 
> Sorry everyone, I fumbled sending the cover letter. Here it is.
> 
> --
> Regards,
>   Eric
> 
> On 8/3/26 4:10 PM, Eric Naim wrote:
> > When looking at a recent review discussion, I noticed that quirk existed
> > because
> > ALC269_FIXUP_LIMIT_INT_MIC_BOOST was chained to
> > ALC269_FIXUP_THINKPAD_ACPI and could not be reused in that case.
> > This led to removing the chain from ALC269_FIXUP_LIMIT_INT_MIC_BOOST
> > and deleting the redundant quirks.
> > 
> > While at it, I also removed other quirks that existed because a generic
> > quirk was chained to another quirk.
> > 
> > Signed-off-by: Eric Naim <dnaim@cachyos.org>
> > 
> > Eric Naim (9):
> >   ALSA: hda/realtek: Remove ALC294_FIXUP_CS35L41_I2C_2
> >   ALSA: hda/realtek: Add ALC269_FIXUP_THINKPAD_LIMIT_INT_MIC_BOOST quirk
> >   ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from
> >     ALC269_FIXUP_LIMIT_INT_MIC_BOOST
> >   ALSA: hda/realtek: Remove ALC233_FIXUP_INTEL_NUC8_BOOST
> >   ALSA: hda/realtek: Remove ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST
> >   ALSA: hda/realtek: Add ALC285_FIXUP_YOGA_SPEAKER2_TO_DAC1
> >   ALSA: hda/realtek: Unchain ALC269_FIXUP_THINKPAD_ACPI from
> >     ALC285_FIXUP_SPEAKER2_TO_DAC1
> >   ALSA: hda/realtek: Remove ALC294_FIXUP_ASUS_ALLY_SPEAKER
> >   ALSA: hda/realtek: Remove
> >     ALC285_FIXUP_ASUS_GA605K_I2C_SPEAKER2_TO_DAC1

Now applied all 9 patches to for-next branch.


thanks,

Takashi
