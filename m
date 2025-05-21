Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD5221713
	for <linux-sound@vger.kernel.org>; Wed, 21 May 2025 20:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747858632; cv=none; b=Ho+h9ISsNaCQne7jJoslKitT13L28+Oyur7ghXxHamEuTPhiP1b8WznxRyNuFxayxTCefrQm5Emnb1Fd4iprVojOqZltio8zAaO3Xs0vp2l/Mg3jGRTEbML4dcENwRSPjkzrDcPFG5Ginlu9adT3gyLbXLgd9kt83aPbTyqC8uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747858632; c=relaxed/simple;
	bh=ApWcyrroo+2hPS54I+0N5c7FGowDgjsj4rRqtuHkSjI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E7pWyQS7MHPK717I0f72cyVQuWwVNIkOo0SNLw6gUvhNtH/+CMcRrAdlKzUAg8PsmGfuzsiY5q4FnfMjLnrit6lC+PsUkQV+8bMJ2XAvhctC52eqMNlvvH9OJh4ZjDap/+HlT1HFp6fY2kzHJR85Svw53MxkPOD5ZNo4dMBGaTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZxvYvdcT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bVOgQEWz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ZxvYvdcT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bVOgQEWz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZxvYvdcT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bVOgQEWz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZxvYvdcT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bVOgQEWz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A0C2C20A16;
	Wed, 21 May 2025 20:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747858628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DT8o45QVlWn7fUluVCrGuzjTB2ZPfgQE+kq0JTqnQak=;
	b=ZxvYvdcTq0B/ap/9FTyeuy8TmysfhYukmvf6ovJyZG8Cwj5EgqTWil0k1G5rTAusikLrza
	zoYuBdJvpZJNqOreQTrJxZPQxhsItxVcKYwS2m6IDRyt/VFQs3tNzsVIEVRXT8vD79KMN9
	uEcM2HTYBrP94b9jVjXKo9Xe3QjCIWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747858628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DT8o45QVlWn7fUluVCrGuzjTB2ZPfgQE+kq0JTqnQak=;
	b=bVOgQEWzWYTA+akt0hzVyRY1PChoqY2gLRisukr85nvk3U0ulGIFrU7w96QJI3yh8xjcws
	h5sypX19Ml6YhyCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ZxvYvdcT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bVOgQEWz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747858628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DT8o45QVlWn7fUluVCrGuzjTB2ZPfgQE+kq0JTqnQak=;
	b=ZxvYvdcTq0B/ap/9FTyeuy8TmysfhYukmvf6ovJyZG8Cwj5EgqTWil0k1G5rTAusikLrza
	zoYuBdJvpZJNqOreQTrJxZPQxhsItxVcKYwS2m6IDRyt/VFQs3tNzsVIEVRXT8vD79KMN9
	uEcM2HTYBrP94b9jVjXKo9Xe3QjCIWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747858628;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DT8o45QVlWn7fUluVCrGuzjTB2ZPfgQE+kq0JTqnQak=;
	b=bVOgQEWzWYTA+akt0hzVyRY1PChoqY2gLRisukr85nvk3U0ulGIFrU7w96QJI3yh8xjcws
	h5sypX19Ml6YhyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 796DE13AA0;
	Wed, 21 May 2025 20:17:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YNIgHMQ0LmhmagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 21 May 2025 20:17:08 +0000
Date: Wed, 21 May 2025 22:17:04 +0200
Message-ID: <877c29afcv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v5] ALSA: hda - Add new driver for HDA controllers listed via ACPI
In-Reply-To: <aC3ksXJUM9DlKiz6@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
	<87r00qx78f.wl-tiwai@suse.de>
	<aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
	<87zffdvvj6.wl-tiwai@suse.de>
	<aC3ksXJUM9DlKiz6@ddadap-lakeline.nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A0C2C20A16
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:mid,suse.de:dkim,nvidia.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]

On Wed, 21 May 2025 16:35:29 +0200,
Daniel Dadap wrote:
> 
> Some systems expose HD-Audio controllers via objects in the ACPI tables
> which encapsulate the controller's interrupt and the base address for the
> HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> table dump excerpt:
> 
>         Device (HDA0)
>         {
>             Name (_HID, "NVDA2014")  // _HID: Hardware ID
>             ...
>             Name (_CRS, ResourceTemplate ()
>             // _CRS: Current Resource Settings
>             {
>                 Memory32Fixed (ReadWrite,
>                     0x36078000,         // Address Base
>                     0x00008000,         // Address Length
>                     )
>                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive,
>                            ,, )
>                 {
>                     0x0000021E,
>                 }
>             })
>         }
> 
> Add support for HDA controllers discovered through ACPI, including support
> for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> is done with a new driver which uses existing infrastructure for extracting
> resource information from _CRS objects and plumbs the parsed resource
> information through to the existing HDA infrastructure to enable HD-Audio
> functionality on such devices.
> 
> Although this driver is in the sound/pci/hda/ directory, it targets devices
> which are not actually enumerated on the PCI bus. This is because it
> depends upon the Intel "Azalia" infrastructure which has traditionally been
> usedvfor PCI-based devices.
> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
> 
> Patch history:
> v2,3: Remove __maybe_unused, use SYSTEM_SLEEP_PM_OPS (Takashi Iwai)
> v4:   Address checkpatch issues (Takashi Iwai), allow NULL match data
> v5:   Use two-argument strscpy()

Applied now to for-next branch.  Thanks.


Takashi
