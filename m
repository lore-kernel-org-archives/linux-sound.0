Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77083A1BE
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715158958; cv=none; b=B1JeFio48hke9w5ZL2rK3lTuXi3H87yc/GFZzch4I4vxnwb2f4YpdeZBEZAnJSyfXLSVqT+wc8HWbbKh5dAJvZCQzHT8+rXmsb4FIjke6tXLSjeCXsXVpQHyoZT3fnACVpWqUvw+IYpSGR22EFWqwjNOPQDmiGVFGPJ0uLDMKM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715158958; c=relaxed/simple;
	bh=Yjem+94BbTDiQ5z0ampfvqQ53LdCc5rdYhzlDICE1z8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISj+dJlh5E6MiBX3HGRv1j1LOUzdQ5PSwnXLCTqbW06oS0JN8HIzQ+jJo0FZE93mpJUiOlW48Q37Fmu211vY5Iw+segARkRBIE5jyFM50JWnL5eW7Awqh7/qLxrq45Zzz68y4z0i6kbtlQ1tQ0OTisZtTgN+8Vc25ejEnZaAZxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eb+GjYg3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wdnq1dd7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eb+GjYg3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Wdnq1dd7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eb+GjYg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wdnq1dd7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eb+GjYg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Wdnq1dd7"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9B4EA5C6E2;
	Wed,  8 May 2024 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715158951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtZXNyNQkaZKSb2bz2AQDxtdcX9JwW4DskgPgkZKkm4=;
	b=eb+GjYg3dWjsvjngn7pa11sQxhNN+bjN9A2SqDXXBh83EefMwhX+izJJHhjxqqFYxDN84Y
	d1AwUryDYvB0r5xHpAWip6S7APpfZmBvgow8agGISOEcCf51+0Mw9Lfn7a/oSS3L4NHbRF
	tLAW3WV2kdwGNNVyv5TNouAafH8ffXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715158951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtZXNyNQkaZKSb2bz2AQDxtdcX9JwW4DskgPgkZKkm4=;
	b=Wdnq1dd7vqAURKRwQgRlzW8RYiTppNcV/eewjm6i9NfBT68oNbBEi/l2k7ir8p4RInKfOx
	K184Vwxj9TEorHCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eb+GjYg3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Wdnq1dd7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1715158951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtZXNyNQkaZKSb2bz2AQDxtdcX9JwW4DskgPgkZKkm4=;
	b=eb+GjYg3dWjsvjngn7pa11sQxhNN+bjN9A2SqDXXBh83EefMwhX+izJJHhjxqqFYxDN84Y
	d1AwUryDYvB0r5xHpAWip6S7APpfZmBvgow8agGISOEcCf51+0Mw9Lfn7a/oSS3L4NHbRF
	tLAW3WV2kdwGNNVyv5TNouAafH8ffXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715158951;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MtZXNyNQkaZKSb2bz2AQDxtdcX9JwW4DskgPgkZKkm4=;
	b=Wdnq1dd7vqAURKRwQgRlzW8RYiTppNcV/eewjm6i9NfBT68oNbBEi/l2k7ir8p4RInKfOx
	K184Vwxj9TEorHCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5656413A27;
	Wed,  8 May 2024 09:02:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id e4/aE6c/O2b8EwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 08 May 2024 09:02:31 +0000
Date: Wed, 08 May 2024 11:02:46 +0200
Message-ID: <87ikzod6bt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 0/9] ALSA: Use *-y instead of *-objs in Makefile
In-Reply-To: <ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
References: <20240507135513.14919-1-tiwai@suse.de>
	<ZjpQm-hxLQtpgkUx@smile.fi.intel.com>
	<ZjqU2rAoHHcrTaVH@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,vger.kernel.org,linux.intel.com,gmail.com,nxp.com,alsa-project.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 9B4EA5C6E2
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 07 May 2024 22:53:46 +0200,
Andy Shevchenko wrote:
> 
> On Tue, May 07, 2024 at 07:02:35PM +0300, Andy Shevchenko wrote:
> > On Tue, May 07, 2024 at 03:55:00PM +0200, Takashi Iwai wrote:
> > > Hi,
> > > 
> > > this is a series of trivial cleanup patches for Makefile in sound/*
> > > (modulo ASoC -- which will be submitted later in a separate series).
> > > 
> > > As Andy suggested in a patch review, *-objs suffix in Makefile is
> > > basically a mis-use nowadays for kernel driver modules.  They should
> > > be replaced with *-y suffix instead.  This is a result of systematic
> > > conversions, separated per directory.
> > 
> > I briefly looked at this and since it's a mechanical conversion I don't see
> > any issues, so
> > 
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Btw, make W=1 nowadays enables modpost checks, which complain about absence of
> MODULE_DESCRIPTION().
> 
> Example:
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
> 
> I'm not sure what the case now for ALSA, just FYI.

Indeed there are lots of code that miss MODULE_DESCRIPTION().
Through a quick grep, there are:

sound/ac97/bus.c
sound/ac97_bus.c
sound/core/pcm_dmaengine.c
sound/core/sound_kunit.c
sound/drivers/pcmtest.c
sound/oss/dmasound/dmasound_atari.c
sound/oss/dmasound/dmasound_core.c
sound/oss/dmasound/dmasound_paula.c
sound/pci/hda/cirrus_scodec_test.c
sound/soc/amd/acp/acp-i2s.c
sound/soc/amd/acp/acp-legacy-common.c
sound/soc/amd/acp/acp-pci.c
sound/soc/amd/acp/acp-pdm.c
sound/soc/amd/ps/ps-mach.c
sound/soc/amd/renoir/acp3x-rn.c
sound/soc/amd/yc/acp6x-mach.c
sound/soc/codecs/ab8500-codec.c
sound/soc/codecs/sigmadsp.c
sound/soc/codecs/wm_adsp.c
sound/soc/fsl/imx-pcm-dma.c
sound/soc/fsl/imx-pcm-fiq.c
sound/soc/mxs/mxs-pcm.c
sound/soc/qcom/common.c
sound/soc/qcom/qdsp6/q6dsp-common.c
sound/soc/qcom/sdw.c
sound/soc/soc-generic-dmaengine-pcm.c
sound/soc/soc-topology-test.c
sound/soc/sof/amd/pci-acp63.c
sound/soc/sof/amd/pci-rmb.c
sound/soc/sof/amd/pci-rn.c
sound/soc/sof/amd/pci-vangogh.c
sound/soc/sof/imx/imx-common.c
sound/soc/sof/imx/imx8.c
sound/soc/sof/imx/imx8m.c
sound/soc/sof/imx/imx8ulp.c
sound/soc/sof/intel/atom.c
sound/soc/sof/intel/bdw.c
sound/soc/sof/intel/byt.c
sound/soc/sof/intel/hda-codec.c
sound/soc/sof/intel/hda-ctrl.c
sound/soc/sof/intel/hda-mlink.c
sound/soc/sof/intel/hda.c
sound/soc/sof/intel/pci-apl.c
sound/soc/sof/intel/pci-cnl.c
sound/soc/sof/intel/pci-icl.c
sound/soc/sof/intel/pci-lnl.c
sound/soc/sof/intel/pci-mtl.c
sound/soc/sof/intel/pci-skl.c
sound/soc/sof/intel/pci-tgl.c
sound/soc/sof/intel/pci-tng.c
sound/soc/sof/mediatek/mt8186/mt8186.c
sound/soc/sof/mediatek/mt8195/mt8195.c
sound/soc/sof/mediatek/mtk-adsp-common.c
sound/soc/sof/sof-acpi-dev.c
sound/soc/sof/sof-of-dev.c
sound/soc/sof/sof-pci-dev.c
sound/soc/sof/sof-utils.c
sound/soc/sof/stream-ipc.c
sound/soc/ux500/ux500_msp_dai.c
sound/soc/ux500/ux500_msp_i2s.c
sound/soc/xilinx/xlnx_formatter_pcm.c
sound/soc/xilinx/xlnx_i2s.c

There are too many stuff in sound/soc/sof/* and I leave them to SOF
people (Cc'ed), while I'm going to submit the fix patches for the
rest.


thanks,

Takashi
