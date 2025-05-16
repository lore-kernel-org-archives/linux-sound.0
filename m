Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78DF21ADC6
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382180; cv=none; b=Gz7vYsWnqh9jll6sSNhSg/DHBcuCqBWNhthXzMQ7Djoql02ZF5enPma8qiiTu8Ez3sr3MQuhRRKYZoBPSIu3o2DlwTsMLkF8OJJLer5jOMWB0XzlBIa8re0GC8PuoWQmt+lHrm9DBLgWiLeXhdK8cyKX0K2JztiKiDDePejfF5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382180; c=relaxed/simple;
	bh=ZRTjwmJw/eZLPcLrmLOjzPFOiZjJLbc0M2yb+OSSGvk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mdqBdtoSRoDM1iP9KyDRHuuaEGys9ekcTW8/R3hkWQ54oP8OMafD34QJViucS+dAUoUelvqAxs9RD2z14TCSbDPCs5PLYoos1Cu8Eexfu4qMVAQ45yro8ywZ4nYBkvsQTDVM2FpK/ukTxRfAukAVLeTmct98gQRQgsGJnd/8RMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Na3gcjbR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=saw9WAAu; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Na3gcjbR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=saw9WAAu; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Na3gcjbR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="saw9WAAu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Na3gcjbR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="saw9WAAu"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 55EB3216E6;
	Fri, 16 May 2025 07:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=Na3gcjbR9mHKjyGDlTYRhLQT/yRNIQSNrdpGWpst1pGxsGfhs8WIhYcA4WNvDpzGku5VnT
	mVg7GAhcwnjGF9I9PeMu0RLt1wUaV9uNaOPMo0X4Y9P4avlg6Os1ScBx7T37pBtUrEnyNq
	jPlA8fMWPJblsMal7gfNnZ0v7IrEzlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=saw9WAAud9lNyNFi001js0hc9S2+iji4rBnefIWKX7SNIEfb49J8QJE9WUYeyNPI6YMbqt
	38DgXeMaRsNAfiDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747382174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=Na3gcjbR9mHKjyGDlTYRhLQT/yRNIQSNrdpGWpst1pGxsGfhs8WIhYcA4WNvDpzGku5VnT
	mVg7GAhcwnjGF9I9PeMu0RLt1wUaV9uNaOPMo0X4Y9P4avlg6Os1ScBx7T37pBtUrEnyNq
	jPlA8fMWPJblsMal7gfNnZ0v7IrEzlY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747382174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wD8Jmu+k4FWlBpQQQ/UCpVQl1dBXd05RO2icxgX+7AY=;
	b=saw9WAAud9lNyNFi001js0hc9S2+iji4rBnefIWKX7SNIEfb49J8QJE9WUYeyNPI6YMbqt
	38DgXeMaRsNAfiDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A7CA13977;
	Fri, 16 May 2025 07:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gCJ/CJ7vJmjNTAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 16 May 2025 07:56:14 +0000
Date: Fri, 16 May 2025 09:56:13 +0200
Message-ID: <87zffdvvj6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda - Add new driver for HDA controllers listed via ACPI
In-Reply-To: <aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
	<87r00qx78f.wl-tiwai@suse.de>
	<aCYMjYrfFIPjN9Fi@ddadap-lakeline.nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30

On Thu, 15 May 2025 17:47:25 +0200,
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
>             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>             {
>                 Memory32Fixed (ReadWrite,
>                     0x36078000,         // Address Base
>                     0x00008000,         // Address Length
>                     )
>                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
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
> which are not actually enumerated on the PCI bus. This is because it depends
> upon the Intel "Azalia" infrastructure which has traditionally been used for
> PCI-based devices.
> 
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>

Thanks.  Now I checked with checkpatch, and it complained a few
things:

WARNING: Block comments use a trailing */ on a separate line
#168: FILE: sound/pci/hda/hda_acpi.c:79:
+	 * devm_platform_get_and_ioremap_resource() */

ERROR: code indent should use tabs where possible
#182: FILE: sound/pci/hda/hda_acpi.c:93:
+^I                       IRQF_SHARED, KBUILD_MODNAME, azx);$

ERROR: code indent should use tabs where possible
#308: FILE: sound/pci/hda/hda_acpi.c:219:
+^I                   THIS_MODULE, 0, &hda->card);$

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure th)
#405: FILE: sound/pci/hda/hda_acpi.c:316:
+MODULE_LICENSE("GPL v2");

Care to address those and resubmit?


thanks,

Takashi
