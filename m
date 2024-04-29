Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B442A7E0E8
	for <linux-sound@vger.kernel.org>; Mon, 29 Apr 2024 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714402904; cv=none; b=gGc+8gVVXKrjaGehbCsr2q6J3v5F0CnKhz6QwFPSSnaFWV+MyXxb6kGP2sO0Dk4eZo3fdkZQ1GTH5AFUDFnuzOJbKG8EWNGcEj3yhsw6Y3/s6OAY8AV9D+foReaqTtlLmR8zHSx6a9UVeQguToWOsAlV4rIslaUbOflSXpqvmSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714402904; c=relaxed/simple;
	bh=9hJM6F2TFogmBi4KenmGHTTLDTpj9que+mqroCekLH4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OnjuFqvmTupwEvJCO0lCqGBetLyIeLjCyELH/HaMqMhZqBroC5RUe917UeSKsFhwsfueHPelLKHMWF5Ci0it9ILt2qiw4iiXa3rwPHGIAQvNT847CYDCA4xXhzH5rnIjsvMbcAMMFLZnKnz4J8esqxW00B4JigweQ9HouNEDbOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=2U/VscsN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=V5SyXtyx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vWbn/RJ4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=FBZUYEsG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="2U/VscsN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5SyXtyx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vWbn/RJ4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FBZUYEsG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D353233878;
	Mon, 29 Apr 2024 15:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714402901; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqVHpd8nPRDh1CV1X5AwFaVB+V0j3kK7QZlJNrwv8AY=;
	b=2U/VscsN3vFhPIb3XWpNCl38Nf3vyj2/1L9ObAw35m2FY8uYB2HFtksfmmyGxeM/lpWiXl
	Rlh/dsKCPsEDs8NV99iu99maBALA7MB2VQTSFe6XUvNu0rfvzyK90cxTTfIZwuf81Gf/wF
	JdNBc5b4xnqCvXeWxSB1e/WaifnWDH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714402901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqVHpd8nPRDh1CV1X5AwFaVB+V0j3kK7QZlJNrwv8AY=;
	b=V5SyXtyxOKHvxYNUEtc/dJ3SGn6QOE1KLnJYxIx2oDKl/rnqYLOycXSWoYl1Tbts+TQ3qn
	c/88y94ujtYf6+DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="vWbn/RJ4";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FBZUYEsG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714402900; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqVHpd8nPRDh1CV1X5AwFaVB+V0j3kK7QZlJNrwv8AY=;
	b=vWbn/RJ47o/ZKkmGu7Y4pCI5NcqkgvXV4PRIofqYZ2wBa64wZ4J2hD52EHEPaEgvjFKOws
	m6sC1Zm0RLi7L5cqRR3EGbwoIdNrBMnfFK9QibNxAvBxSusBkA4gVBby18dvrCjBo0ctxh
	OvV6l7nsa2JHdfOFZb/p2+lQ919n4BI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714402900;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqVHpd8nPRDh1CV1X5AwFaVB+V0j3kK7QZlJNrwv8AY=;
	b=FBZUYEsGb7gcXmlM87ZLBgfLuK0ObF5IPIqcvmsQA3EGJ+oN7sRsS/cgnoIAXfVws5lcMD
	tEpuRJrEivdLDVCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AF409138A7;
	Mon, 29 Apr 2024 15:01:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id YjaSKVS2L2bAFQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Apr 2024 15:01:40 +0000
Date: Mon, 29 Apr 2024 17:01:52 +0200
Message-ID: <874jbkp5zz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of device_get_named_child_node()
In-Reply-To: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-5.31 / 50.00];
	BAYES_HAM(-2.80)[99.14%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,intel.com:email];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: D353233878
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -5.31

On Fri, 26 Apr 2024 17:27:31 +0200,
Pierre-Louis Bossart wrote:
> 
> The documentation for device_get_named_child_node() mentions this
> important point:
> 
> "
> The caller is responsible for calling fwnode_handle_put() on the
> returned fwnode pointer.
> "
> 
> Add fwnode_handle_put() to avoid a leaked reference.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Can we have a corresponding Fixes tag?


thanks,

Takashi

> ---
>  sound/hda/intel-sdw-acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
> index 5f60658c6051..d7417a40392b 100644
> --- a/sound/hda/intel-sdw-acpi.c
> +++ b/sound/hda/intel-sdw-acpi.c
> @@ -45,6 +45,8 @@ static bool is_link_enabled(struct fwnode_handle *fw_node, u8 idx)
>  				 "intel-quirk-mask",
>  				 &quirk_mask);
>  
> +	fwnode_handle_put(link);
> +
>  	if (quirk_mask & SDW_INTEL_QUIRK_MASK_BUS_DISABLE)
>  		return false;
>  
> -- 
> 2.40.1
> 
