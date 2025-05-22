Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1912241695
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946547; cv=none; b=Qp2Q1gab7mSqalgQV7U/9dGPmnCBsBJszV3dE8ZyFFFVbJ0mSNS6Q7uOV4qaSjhCMXKmaTrpvyc3xU1IYGPJzhy1X+2OsNSBgdz++lKraJLF+uQxAIT/wzdOq7jF57nKSwjNnjffvTAcKd3kHhFRHrewU90vkzeBWvE4tyzZv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946547; c=relaxed/simple;
	bh=dp/jIYM6WqZk+vcAH0XvJduAuAkOD7KEaEg1Q9V2gcI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FV4GV62Zjm94kHubPIxMTn+jJzwO4SloC95O0BdxsoOIRpvwSuGOtiUnNT/OpwdHqJzSRp63aaK/y0iHnNSxH3/A5Jjf57s/CelApBOGq1UBPHqUPQbrG68FmRD6tvp519cnZ875t3T/DIG0q+swlBmM4QoY5bopQgWSENU/wXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=SkfljHa4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Yy0XL3yq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=V48WQ0a9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bOiITXi5; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="SkfljHa4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Yy0XL3yq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="V48WQ0a9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bOiITXi5"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DEA2F21B91;
	Thu, 22 May 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747946542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gLNpYFc+mlgcAA1tWX8OkQ12UIgugg0qcebMpSoFN74=;
	b=SkfljHa42fe6n7UzehWFIT63xMvxAvas7SjMvfBWb47cqj5fNgifLC9Hjkg/5+KBYMvdfd
	XBhgITFCBsZmn2pB8ImKvas39mpQEfJ5uZMtzP0j3iMe8k+5T2e/RlANZcHf/pxqrGtXai
	1lYZj7n2FNFwJX3h147YM4hwzlM6ev8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747946542;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gLNpYFc+mlgcAA1tWX8OkQ12UIgugg0qcebMpSoFN74=;
	b=Yy0XL3yqIOaXuf/R3eIcfbdeVhtPPCI7A7rxNZycOgT0FonVwTpBO2gmpBYzoceFJfepKx
	9t7MmLK5eySJ+sBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747946541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gLNpYFc+mlgcAA1tWX8OkQ12UIgugg0qcebMpSoFN74=;
	b=V48WQ0a9LGgCtsw3AaQKf7zTzsXr7Hn3fqNQrPUb6KJ5Hs49ufbNgX9262eu4BQ5qj7Zqz
	+4o8775FKVy12AkM7EcN0oiIfGABu6K3AWrV6oGo2MYKfPFbt24OKgczzl42/D+A2/+/y+
	LOyfwO9SjlMtwdx7iMPRllwgOxObx/U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747946541;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gLNpYFc+mlgcAA1tWX8OkQ12UIgugg0qcebMpSoFN74=;
	b=bOiITXi56mBxnrCq3sSlbqUAsgAeuCTuBs38gJcyPhgFKh3AcDKxj6hWHD7DcqwsqCVGMl
	ahRSGir2D0dP6NDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C7678137B8;
	Thu, 22 May 2025 20:42:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id La4TMC2ML2g2fQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 May 2025 20:42:21 +0000
Date: Thu, 22 May 2025 22:42:17 +0200
Message-ID: <87r00g74ye.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Daniel Dadap <ddadap@nvidia.com>,
	Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda_acpi: eliminate defined but not used warnings
In-Reply-To: <20250522203020.1478369-1-rdunlap@infradead.org>
References: <20250522203020.1478369-1-rdunlap@infradead.org>
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
X-Spam-Score: -0.30
X-Spamd-Result: default: False [-0.30 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
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
	RCPT_COUNT_FIVE(0.00)[6]

On Thu, 22 May 2025 22:30:20 +0200,
Randy Dunlap wrote:
> 
> When CONFIG_PM_SLEEP is not set, the hda_acpi_suspend() and
> hda_acpi_resume() functions are not used and cause build warnings:
> 
> sound/pci/hda/hda_acpi.c:282:12: warning: 'hda_acpi_resume' defined but not used [-Wunused-function]
>   282 | static int hda_acpi_resume(struct device *dev)
> sound/pci/hda/hda_acpi.c:269:12: warning: 'hda_acpi_suspend' defined but not used [-Wunused-function]
>   269 | static int hda_acpi_suspend(struct device *dev)
> 
> Enclose these functions inside an ifdef CONFIG_PM_SLEEP block to
> prevent the warnings.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Daniel Dadap <ddadap@nvidia.com>
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: linux-sound@vger.kernel.org

Err, it just an incorrect use of SET_SYSTEM_SLEEP_PM_OPS() instead of
SYSTEM_SLEEP_OPS().  It seems that v5 patch went back to a wrong
macro, likely mistakenly.

A fix patch will follow.


thanks,

Takashi
