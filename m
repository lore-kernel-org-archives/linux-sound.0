Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891410E3
	for <linux-sound@vger.kernel.org>; Sun,  8 Jun 2025 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749375097; cv=none; b=okpaobG5v+/gKeMH7WeUgHBYDZk1GGnkSKVJy1dZWg2+mFPMyOaiaPAaqH6XOz5uw9ICoz04+taJ4phN97nsA5rmNJQ6lKOLrbVPW1ycSWHVYmAK3FbahR+mkeEknRYaTClK7oQP+HC/D4TqGdDFqqPTc0DAAbZXoCTRXzLDEAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749375097; c=relaxed/simple;
	bh=tmKn5sFrDdne9kWkZ2AmOOYiNRvmDwooF2jxXnudT2k=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rmuT3JS+5O++917tpomDI9mZcVejZtpjh5rWSW+a9r9u+uiWF9AP7bcQigwdDnJVG+NFoBoR8iv2kZyx9XJ/Co7qH2SJLve+lJzHIkaxBiHXqysszPYbg8ZAQwfvZ0EUM4MX4vkKt40MDJKeGzSmdRB2Hri+JSUSJwGZIlzjuN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P0mNdWIy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eieBow6V; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=P0mNdWIy; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eieBow6V; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P0mNdWIy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eieBow6V";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P0mNdWIy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eieBow6V"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C1FA2127D;
	Sun,  8 Jun 2025 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749375093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YkG+zh38Ozd/gqE0qdVl6LuuIjwDc3TSjxNQwMHzE3c=;
	b=P0mNdWIyJ0JfVHtMuJrXsSJld3MiiKJtxXK0fWHhNZFxeQVM5BzpZuq5Ggs8Z4FqVTerf7
	GM7VsLLBww6bOtI+hXRFFLf5IWwe0AxfTqDadYMShjqbfPCY98L6Hvh8Q4HF9r3/zFKOIb
	djgzltzJucJAkCwj+DusdP3eG3Mclzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749375093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YkG+zh38Ozd/gqE0qdVl6LuuIjwDc3TSjxNQwMHzE3c=;
	b=eieBow6VSXBL5y/56ccm0EgE9Sp4FOLpx+I4GENTJ0ssv2+kJJVEloTlf5+C00EjBx5+rs
	G8YUw+qyeZNgLvAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749375093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YkG+zh38Ozd/gqE0qdVl6LuuIjwDc3TSjxNQwMHzE3c=;
	b=P0mNdWIyJ0JfVHtMuJrXsSJld3MiiKJtxXK0fWHhNZFxeQVM5BzpZuq5Ggs8Z4FqVTerf7
	GM7VsLLBww6bOtI+hXRFFLf5IWwe0AxfTqDadYMShjqbfPCY98L6Hvh8Q4HF9r3/zFKOIb
	djgzltzJucJAkCwj+DusdP3eG3Mclzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749375093;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YkG+zh38Ozd/gqE0qdVl6LuuIjwDc3TSjxNQwMHzE3c=;
	b=eieBow6VSXBL5y/56ccm0EgE9Sp4FOLpx+I4GENTJ0ssv2+kJJVEloTlf5+C00EjBx5+rs
	G8YUw+qyeZNgLvAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60CD913A78;
	Sun,  8 Jun 2025 09:31:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KUNZFnVYRWhqLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 08 Jun 2025 09:31:33 +0000
Date: Sun, 08 Jun 2025 11:31:33 +0200
Message-ID: <87plfe8tqi.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jonathan Lane <jon@borg.moe>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] enable headset mic on Latitude 5420 Rugged
In-Reply-To: <20250529185014.28503-1-jon@borg.moe>
References: <20250529185014.28503-1-jon@borg.moe>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.30

On Thu, 29 May 2025 20:50:14 +0200,
Jonathan Lane wrote:
> 
> ---

Thanks for the patch.  But the patch description is missing, and above
all, your Signed-off-by tag is missing.  The latter is a legal
requirement for merging to the upstream.
The code change itself looks OK, so could you resubmit a properly
formatted patch?

Please check Documentation/process/submitting-patches.rst for
details.


thanks,

Takashi


>  sound/pci/hda/patch_realtek.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index cd0d7ba7320e..261ba1a60015 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10509,6 +10509,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1028, 0x0871, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1028, 0x0872, "Dell Precision 3630", ALC255_FIXUP_DELL_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1028, 0x0873, "Dell Precision 3930", ALC255_FIXUP_DUMMY_LINEOUT_VERB),
> +	SND_PCI_QUIRK(0x1028, 0x0879, "Dell Latitude 5420 Rugged", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE)
>  	SND_PCI_QUIRK(0x1028, 0x08ad, "Dell WYSE AIO", ALC225_FIXUP_DELL_WYSE_AIO_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1028, 0x08ae, "Dell WYSE NB", ALC225_FIXUP_DELL1_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1028, 0x0935, "Dell", ALC274_FIXUP_DELL_AIO_LINEOUT_VERB),
> -- 
> 2.49.0
> 
> 
