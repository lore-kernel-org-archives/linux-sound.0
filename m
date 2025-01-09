Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95FE215048;
	Thu,  9 Jan 2025 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417677; cv=none; b=VpxQoyKlqxvHbjbL8JJ7mjpTnvsGC8OPxmgWJl+6b3xgFj++lBmoeTB9GK8+0rBr9vyGx+FDrzXx2NMgN8cDYnVvN6jqasvOUp8MtFPpu/tvj4ihE2PBedw6EpD8hflW2xjD4ZQrL5bYsDjUWfpRWtGoLnpRqVw/88QesPdiFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417677; c=relaxed/simple;
	bh=24crXvUI8LdrTDQ21xEeDo2jDAWjtmWZnP1IpfKWPX8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJ7xYaZlg57hwe3fHpeKR1ScHZTXW7LL56c+4Tc95DYLoBf9nl5II5hZ+LenQWhHaCzSr+QnbfgW41dYAp8h7589RrhZ1xPaee1oMFKzK31/KDh/Itoi69Xb/4kEa3Hlz3p8KmQfBq9APQZ4angpSj4UnL3LDYw/Tiy7NwadgvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dTkCLYc5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zlxtf2ww; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dTkCLYc5; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Zlxtf2ww; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dTkCLYc5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zlxtf2ww";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dTkCLYc5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Zlxtf2ww"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0A5C41F385;
	Thu,  9 Jan 2025 10:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736417674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJgrlbr/uCM0Pa1TmK6KPKFqmT5rMgL0Od0o97O/t08=;
	b=dTkCLYc5IXw1VyQdfODbMq2Ta+tlUMi4+olllT6cnWAZTACLspUMhwSepH9wY3Q8Ib0gQf
	55AvaTymJfajcqqD/DMOLO6Y5g8sLXZWgSb5zJiSq7CTuPsSGG5MHetnOeCKWUXcuCPft1
	QzdlEUTlFEQLVngTudN6NE0LIcOl2vY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736417674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJgrlbr/uCM0Pa1TmK6KPKFqmT5rMgL0Od0o97O/t08=;
	b=Zlxtf2wwQz2XyDkYT5oaYrGPDjJSCPgMsTPRAu9WXcp9ieH3UXFw2ZRq/hNbG+ikvcerQ2
	ENPZoOT3MRgViaBQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dTkCLYc5;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Zlxtf2ww
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736417674; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJgrlbr/uCM0Pa1TmK6KPKFqmT5rMgL0Od0o97O/t08=;
	b=dTkCLYc5IXw1VyQdfODbMq2Ta+tlUMi4+olllT6cnWAZTACLspUMhwSepH9wY3Q8Ib0gQf
	55AvaTymJfajcqqD/DMOLO6Y5g8sLXZWgSb5zJiSq7CTuPsSGG5MHetnOeCKWUXcuCPft1
	QzdlEUTlFEQLVngTudN6NE0LIcOl2vY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736417674;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJgrlbr/uCM0Pa1TmK6KPKFqmT5rMgL0Od0o97O/t08=;
	b=Zlxtf2wwQz2XyDkYT5oaYrGPDjJSCPgMsTPRAu9WXcp9ieH3UXFw2ZRq/hNbG+ikvcerQ2
	ENPZoOT3MRgViaBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B960A13876;
	Thu,  9 Jan 2025 10:14:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3/HSK4mhf2fbDQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jan 2025 10:14:33 +0000
Date: Thu, 09 Jan 2025 11:14:33 +0100
Message-ID: <87ldvkqoom.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: emu10k1: Use str_on_off() and str_yes_no() helpers
In-Reply-To: <20250109093110.3850-2-thorsten.blum@linux.dev>
References: <20250109093110.3850-2-thorsten.blum@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 0A5C41F385
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmx.de,suse.de,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Thu, 09 Jan 2025 10:31:08 +0100,
Thorsten Blum wrote:
> 
> Remove hard-coded strings by using the str_on_off() and str_yes_no()
> helper functions.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

A part of those changes have been already fixed in sound.git tree
for-next branch.  Could you rebase and resubmit the missing piece?

BTW, a few other yes/no changes in sound/* are already on my queue,
which will be submitted in today.  I'll drop emu10k1 from there,
supposing you'll resubmit.


thanks,

Takashi

> ---
>  sound/pci/emu10k1/emuproc.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emuproc.c b/sound/pci/emu10k1/emuproc.c
> index 737c28d31b41..67a9216d3f4d 100644
> --- a/sound/pci/emu10k1/emuproc.c
> +++ b/sound/pci/emu10k1/emuproc.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/slab.h>
>  #include <linux/init.h>
> +#include <linux/string_choices.h>
>  #include <sound/core.h>
>  #include <sound/emu10k1.h>
>  #include "p16v.h"
> @@ -32,9 +33,9 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
>  	snd_iprintf(buffer, "\n%s\n", title);
>  
>  	if (status != 0xffffffff) {
> -		snd_iprintf(buffer, "Professional Mode     : %s\n", (status & SPCS_PROFESSIONAL) ? "yes" : "no");
> -		snd_iprintf(buffer, "Not Audio Data        : %s\n", (status & SPCS_NOTAUDIODATA) ? "yes" : "no");
> -		snd_iprintf(buffer, "Copyright             : %s\n", (status & SPCS_COPYRIGHT) ? "yes" : "no");
> +		snd_iprintf(buffer, "Professional Mode     : %s\n", str_yes_no(status & SPCS_PROFESSIONAL));
> +		snd_iprintf(buffer, "Not Audio Data        : %s\n", str_yes_no(status & SPCS_NOTAUDIODATA));
> +		snd_iprintf(buffer, "Copyright             : %s\n", str_yes_no(status & SPCS_COPYRIGHT));
>  		snd_iprintf(buffer, "Emphasis              : %s\n", emphasis[(status & SPCS_EMPHASISMASK) >> 3]);
>  		snd_iprintf(buffer, "Mode                  : %i\n", (status & SPCS_MODEMASK) >> 6);
>  		snd_iprintf(buffer, "Category Code         : 0x%x\n", (status & SPCS_CATEGORYCODEMASK) >> 8);
> @@ -46,9 +47,9 @@ static void snd_emu10k1_proc_spdif_status(struct snd_emu10k1 * emu,
>  
>  		if (rate_reg > 0) {
>  			rate = snd_emu10k1_ptr_read(emu, rate_reg, 0);
> -			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", rate & SRCS_SPDIFVALID ? "on" : "off");
> -			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", rate & SRCS_SPDIFLOCKED ? "on" : "off");
> -			snd_iprintf(buffer, "Rate Locked           : %s\n", rate & SRCS_RATELOCKED ? "on" : "off");
> +			snd_iprintf(buffer, "S/PDIF Valid          : %s\n", str_on_off(rate & SRCS_SPDIFVALID));
> +			snd_iprintf(buffer, "S/PDIF Locked         : %s\n", str_on_off(rate & SRCS_SPDIFLOCKED));
> +			snd_iprintf(buffer, "Rate Locked           : %s\n", str_on_off(rate & SRCS_RATELOCKED));
>  			/* From ((Rate * 48000 ) / 262144); */
>  			snd_iprintf(buffer, "Estimated Sample Rate : %d\n", ((rate & 0xFFFFF ) * 375) >> 11); 
>  		}
> -- 
> 2.47.1
> 
