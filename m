Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172B66B54
	for <linux-sound@vger.kernel.org>; Fri,  9 Feb 2024 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707474218; cv=none; b=WqqrR4QxzyNeyMa6WNoH5sLRIVuEvvkemjgIUn22sOcUD9u17bcFVBtfyZy8dGU/xzX4qufkviQehC+UUhpB+V4JDZ004bZBZt7zcmtUQg8S6tny+3tk2e5/9AZ4nZeDsn7SJEEL2x0gVCSCaPFAr5sM8pwRZB7p7EO6Kiw5f68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707474218; c=relaxed/simple;
	bh=sdi01ZfluEWDzqjNdxBvXJbcUO9OXdPuD0npJBz6uQ8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qvGMi9uxY9IUk9eEiO/kDhZfVb3nltKxLNsMdiiMmbrEt00N3s3EzJKtN/DSGO5Dbj9WXsEPVokCRSY07UFMKehL3K/LsQ/Q8fQFSJ9pdE8k7qb892H9vmgHzpqocFAxXbSYyJbINO/2a33WIKEqbedgaLt1EWwkWvEbB81hu80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=liPzKtHC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GT6hYNM4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=liPzKtHC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=GT6hYNM4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="liPzKtHC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GT6hYNM4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="liPzKtHC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GT6hYNM4"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 49C611F7F9;
	Fri,  9 Feb 2024 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707474215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PvaT/dZkp2quusHYG8Dxxqgv4fqwkawiCvHExV1R0z0=;
	b=liPzKtHC7o2R+2ebIEFMxP5M5yFytKPp4QTSVGPXz8cdeZEnvvt+EbOR0/38Y5Jo4O4Jdb
	DaLwi1ZQ5uc1V1lLlzJ43kSn5TMdvsv1r4GKodpW4YImKzKG02pbxeG7qsjq+mLN1DBUY8
	bEpMzNMzJk6blM+hm9gyigDlfHxU3PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PvaT/dZkp2quusHYG8Dxxqgv4fqwkawiCvHExV1R0z0=;
	b=GT6hYNM4axa+QR7dsA+ZBfqdlnXtYQVKBl/FA1pZhzFpLR/MOTyA6K4+xXnMXUU/NrqxnV
	u86b5qF34vCzkICA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707474215; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PvaT/dZkp2quusHYG8Dxxqgv4fqwkawiCvHExV1R0z0=;
	b=liPzKtHC7o2R+2ebIEFMxP5M5yFytKPp4QTSVGPXz8cdeZEnvvt+EbOR0/38Y5Jo4O4Jdb
	DaLwi1ZQ5uc1V1lLlzJ43kSn5TMdvsv1r4GKodpW4YImKzKG02pbxeG7qsjq+mLN1DBUY8
	bEpMzNMzJk6blM+hm9gyigDlfHxU3PI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707474215;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PvaT/dZkp2quusHYG8Dxxqgv4fqwkawiCvHExV1R0z0=;
	b=GT6hYNM4axa+QR7dsA+ZBfqdlnXtYQVKBl/FA1pZhzFpLR/MOTyA6K4+xXnMXUU/NrqxnV
	u86b5qF34vCzkICA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 020771326D;
	Fri,  9 Feb 2024 10:23:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hzCnOib9xWVTIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 09 Feb 2024 10:23:34 +0000
Date: Fri, 09 Feb 2024 11:23:34 +0100
Message-ID: <874jei2axl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	broonie@kernel.org,
	vkoul@kernel.org,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ALSA: HDA: intel-sdw-acpi: add kernel parameter to select alternate controller
In-Reply-To: <20240208163750.92849-1-pierre-louis.bossart@linux.intel.com>
References: <20240208163750.92849-1-pierre-louis.bossart@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=liPzKtHC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GT6hYNM4
X-Spamd-Result: default: False [0.16 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.53)[80.59%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: 0.16
X-Rspamd-Queue-Id: 49C611F7F9
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /

On Thu, 08 Feb 2024 17:37:50 +0100,
Pierre-Louis Bossart wrote:
> 
> Existing DSDT or SSDT platforms hard-code clock and frame shape
> configurations. For validation, we'd like to use alternate
> configurations. It's not always possible to generate new tables due to
> missing symbols, and modifying existing objects usually leads to
> AE_OBJECT_EXIST errors.
> 
> The mechanism suggested in this patch is to add a NEW ACPI controller
> device with a different _ADR value. e.g.
> 
>  Scope (_SB_.PC00.RP08.PXSX.HDAS) {
> 
>   	Device (SDWP)
>             {
>                 Name (_ADR, 0x40000001)  // _ADR: Address
> 
> The desired _ADR can be passed as a parameter with
> 
> options snd-intel-sdw-acpi sdw_ctrl_addr=0x40000001
> 
> This solution leads to minimal tables with just what the developers or
> validation engineers need, and without overriding any of the existing
> firmware definitions. It's consistent with the recommendation to
> extend ACPI definitions and not redefine them with a risk of conflict.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>

Thanks, applied now.


Takashi
