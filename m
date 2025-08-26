Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883C22E004
	for <linux-sound@vger.kernel.org>; Tue, 26 Aug 2025 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756197314; cv=none; b=uNvNiX+9QNAA4aox7MIiky1o+Uz3I6biYN2ivndW7cst7rvbg9OpA9adADJZULO/IMrCchwt2dZMEDr8mgWpgeY/0ctbC/eCCeWQlc+tYNF407bQAohGFk+rMPmdmF27hbqLimKbk+kFZcYN86k1dC86+j3i/R8eiI1cL/2CJEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756197314; c=relaxed/simple;
	bh=fIGkeLONFrX7mfKnTU+0rDqDf6uylyY2QC5W+MrWVCQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twSm6/bnl4Ln6GTm8xvPTPFOVzBFoQ7uub3vYy8NTWbDLoVub0wr5rLl1dzHczb8nMZ3I00XMJxTS0/UcOU5tox8GwZBhZNfHAIMgFUNkoYhE1TKDPXdq5H+e00ujSOTBqf3ixkrdgrx/MGnWe64HP1aLH7Ahcbf5XX10J72phI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m7dlpXBp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1wEnXBap; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=m7dlpXBp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1wEnXBap; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m7dlpXBp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1wEnXBap";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="m7dlpXBp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1wEnXBap"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 78CE11F78B;
	Tue, 26 Aug 2025 08:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756197310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hD1zU5W7VdMJcb2nze9gemiChZKOODEXPq8T1w/3Dns=;
	b=m7dlpXBpWFe3iKMEhLnFlmnVnD+m+LZbfhg4hgzdRBL+ZEB9LrjMM4Ctj9IYKvoPtPNV2K
	IOZyn+JJ/FQIpIR/rfDXxHyJL/LJoI+y3J/EoKpcAB3tOAkZCs1Mvq6IrFT1ARdHrCEdkQ
	TaeDZ3oo3zMSUJHvfLGhkhQTsJnn18Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756197310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hD1zU5W7VdMJcb2nze9gemiChZKOODEXPq8T1w/3Dns=;
	b=1wEnXBap1f0p2ouO4sr5kQ58rOeMSW+5zLRBd79tCfzvgOFuH12K4TXZIiKDcVuNm5+oVA
	9SDBPGOmv5nP/DAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=m7dlpXBp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1wEnXBap
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756197310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hD1zU5W7VdMJcb2nze9gemiChZKOODEXPq8T1w/3Dns=;
	b=m7dlpXBpWFe3iKMEhLnFlmnVnD+m+LZbfhg4hgzdRBL+ZEB9LrjMM4Ctj9IYKvoPtPNV2K
	IOZyn+JJ/FQIpIR/rfDXxHyJL/LJoI+y3J/EoKpcAB3tOAkZCs1Mvq6IrFT1ARdHrCEdkQ
	TaeDZ3oo3zMSUJHvfLGhkhQTsJnn18Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756197310;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hD1zU5W7VdMJcb2nze9gemiChZKOODEXPq8T1w/3Dns=;
	b=1wEnXBap1f0p2ouO4sr5kQ58rOeMSW+5zLRBd79tCfzvgOFuH12K4TXZIiKDcVuNm5+oVA
	9SDBPGOmv5nP/DAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5B50A13A51;
	Tue, 26 Aug 2025 08:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id mFIDFb5xrWgxUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 26 Aug 2025 08:35:10 +0000
Date: Tue, 26 Aug 2025 10:35:10 +0200
Message-ID: <87sehe32gx.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Daniel Dadap <ddadap@nvidia.com>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [PATCH] ALSA: hda/hdmi: Restore missing HDMI codec entries
In-Reply-To: <aK0hfo9k1BZGVhTE@ddadap-lakeline.nvidia.com>
References: <aK0ghvagXy740rxd@ddadap-lakeline.nvidia.com>
	<aK0hfo9k1BZGVhTE@ddadap-lakeline.nvidia.com>
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
X-Rspamd-Queue-Id: 78CE11F78B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Tue, 26 Aug 2025 04:52:46 +0200,
Daniel Dadap wrote:
> 
> Hi Takashi,
> 
> I noticed the reorganized HDA codebase (I really like the new structure
> BTW) when looking something up in the Linux source tree. It seems that
> the reorganized code, including the missing codec ID entries, has landed
> in the v6.17 RCs. It would be good to address this before v6.17 to avoid
> regressions on the relevant HDAs.

Yes, my bad, I must have handled badly there.
Now applied.  Thanks!


Takashi

> 
> On Mon, Aug 25, 2025 at 09:48:40PM -0500, Daniel Dadap wrote:
> > Commit ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
> > rewrote the HDMI codec ID tables to a new format. In doing so, recently
> > added codec IDs from commit e0a911ac868 ("ALSA: hda: Add missing NVIDIA
> > HDA codec IDs") were dropped from the tables. These tables had recently
> > been split from the unified table that existed in patch_hdmi.c, and did
> > contain the entries in question after the split but before the codec ID
> > entries were rewritten to the new format.
> > 
> > Restore the missing codec ID entries to nvhdmi.c and tegrahdmi.c. There
> > do not appear to be any additional missing entries in any of the other
> > codec ID tables when compared to the patch_hdmi.c at the final revision
> > before the split.
> > 
> > Fixes: ad781b550f9a ("ALSA: hda/hdmi: Rewrite to new probe method")
> > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > ---
> >  sound/hda/codecs/hdmi/nvhdmi.c    | 17 +++++++++++++++++
> >  sound/hda/codecs/hdmi/tegrahdmi.c |  2 ++
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/sound/hda/codecs/hdmi/nvhdmi.c b/sound/hda/codecs/hdmi/nvhdmi.c
> > index b513253b1101..94671ad24b5e 100644
> > --- a/sound/hda/codecs/hdmi/nvhdmi.c
> > +++ b/sound/hda/codecs/hdmi/nvhdmi.c
> > @@ -198,15 +198,32 @@ static const struct hda_device_id snd_hda_id_nvhdmi[] = {
> >  	HDA_CODEC_ID_MODEL(0x10de0098, "GPU 98 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de0099, "GPU 99 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de009a, "GPU 9a HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de009b, "GPU 9b HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de009c, "GPU 9c HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de009d, "GPU 9d HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de009e, "GPU 9e HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de009f, "GPU 9f HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de00a0, "GPU a0 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00a1, "GPU a1 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de00a3, "GPU a3 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de00a4, "GPU a4 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de00a5, "GPU a5 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de00a6, "GPU a6 HDMI/DP",	MODEL_GENERIC),
> >  	HDA_CODEC_ID_MODEL(0x10de00a7, "GPU a7 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00a8, "GPU a8 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00a9, "GPU a9 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00aa, "GPU aa HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00ab, "GPU ab HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00ad, "GPU ad HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00ae, "GPU ae HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00af, "GPU af HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00b0, "GPU b0 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00b1, "GPU b1 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00c0, "GPU c0 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00c1, "GPU c1 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00c3, "GPU c3 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00c4, "GPU c4 HDMI/DP",	MODEL_GENERIC),
> > +	HDA_CODEC_ID_MODEL(0x10de00c5, "GPU c5 HDMI/DP",	MODEL_GENERIC),
> >  	{} /* terminator */
> >  };
> >  MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_nvhdmi);
> > diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
> > index f1f745187f68..5f6fe31aa202 100644
> > --- a/sound/hda/codecs/hdmi/tegrahdmi.c
> > +++ b/sound/hda/codecs/hdmi/tegrahdmi.c
> > @@ -299,7 +299,9 @@ static const struct hda_device_id snd_hda_id_tegrahdmi[] = {
> >  	HDA_CODEC_ID_MODEL(0x10de002f, "Tegra194 HDMI/DP2",	MODEL_TEGRA),
> >  	HDA_CODEC_ID_MODEL(0x10de0030, "Tegra194 HDMI/DP3",	MODEL_TEGRA),
> >  	HDA_CODEC_ID_MODEL(0x10de0031, "Tegra234 HDMI/DP",	MODEL_TEGRA234),
> > +	HDA_CODEC_ID_MODEL(0x10de0033, "SoC 33 HDMI/DP",	MODEL_TEGRA234),
> >  	HDA_CODEC_ID_MODEL(0x10de0034, "Tegra264 HDMI/DP",	MODEL_TEGRA234),
> > +	HDA_CODEC_ID_MODEL(0x10de0035, "SoC 35 HDMI/DP",	MODEL_TEGRA234),
> >  	{} /* terminator */
> >  };
> >  MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_tegrahdmi);
> > -- 
> > 2.47.2
> > 
