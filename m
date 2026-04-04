Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BC27E1A1
	for <linux-sound@vger.kernel.org>; Sat,  4 Apr 2026 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775317949; cv=none; b=q+FEHjq41YQfJoiTAOEku9p5b5ZIJXYghN8nqTJgE15Q0E9Ub+HI4RwQQ/IpyEAhWsjcAukIf7GNDhPqX1d+50+URM7QkSR0U3dUZBiK+9uCiGBsh84wRoIIqSjx9oQtX/bOW3VrWiz6DbD15i62YzhQQ5puZkftGr/M/FJnGkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775317949; c=relaxed/simple;
	bh=+G7o4ly9GEGC++X9pqe1/PkjqXnHPJ3dsCAkmOOImGE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LwCT81Icrh64SNe6skv/IbY/YbnUflVliYFgUGu0sgdMKZxluATAn8Q1Zv4RBshUc/qh+8mQPX7CLacU47V98wU5VdtqKOsEHdn0wf7P87nEELu1ctUNDqNc4SaHY1YkoEXmnt+SWHr87ic0sbVg27RP2R6MAX6wfxIlSGfIeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlsH2fOH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nt87AOhW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XlsH2fOH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Nt87AOhW; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlsH2fOH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nt87AOhW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XlsH2fOH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Nt87AOhW"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5F1D55BCE0;
	Sat,  4 Apr 2026 15:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775317946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azBOAOfj959TfWxJdZRAv/IxZeriHB0vRyKOeE2ylGU=;
	b=XlsH2fOHuw3tGeAuGePVtha9EKcluUFettU7LSJaPWeG9wOiEdYLD3fP6fdgMXNdAii16x
	lryFWIM8yGmth7OQL9W6AaTeQisUCM9nLEOY6E+ol6L1vPSfx51Ws1DFvwoewk65HJbElg
	jX6/7Qc/CPia0h7tPeJhRdpDtIJ+O9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775317946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azBOAOfj959TfWxJdZRAv/IxZeriHB0vRyKOeE2ylGU=;
	b=Nt87AOhWJI9S8TW/GB7YQ2f98x95qOhMN3zey4aohIqRMIwBWmjmCuG+Ipd+qjB+5Lasgk
	bZuDaLirS29ZawAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XlsH2fOH;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Nt87AOhW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1775317946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azBOAOfj959TfWxJdZRAv/IxZeriHB0vRyKOeE2ylGU=;
	b=XlsH2fOHuw3tGeAuGePVtha9EKcluUFettU7LSJaPWeG9wOiEdYLD3fP6fdgMXNdAii16x
	lryFWIM8yGmth7OQL9W6AaTeQisUCM9nLEOY6E+ol6L1vPSfx51Ws1DFvwoewk65HJbElg
	jX6/7Qc/CPia0h7tPeJhRdpDtIJ+O9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1775317946;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azBOAOfj959TfWxJdZRAv/IxZeriHB0vRyKOeE2ylGU=;
	b=Nt87AOhWJI9S8TW/GB7YQ2f98x95qOhMN3zey4aohIqRMIwBWmjmCuG+Ipd+qjB+5Lasgk
	bZuDaLirS29ZawAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B68B4A0B0;
	Sat,  4 Apr 2026 15:52:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NhB4Bboz0Wm3HwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 04 Apr 2026 15:52:26 +0000
Date: Sat, 04 Apr 2026 17:52:25 +0200
Message-ID: <87wlymhgee.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Antti =?ISO-8859-1?Q?Jalom=E4ki?= <antti@nevaberry.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Force legacy HDA on Lenovo ThinkPad X1 Yoga Gen 5
In-Reply-To: <CAK=qmGDEk46xMeA22SScAA0U86XHEWOTt7nq4W6bE1fX+nAU5Q@mail.gmail.com>
References: <20260404144743.46466-1-antti@nevaberry.com>
	<87zf3ihhu0.wl-tiwai@suse.de>
	<CAK=qmGDEk46xMeA22SScAA0U86XHEWOTt7nq4W6bE1fX+nAU5Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nevaberry.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: 5F1D55BCE0
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Sat, 04 Apr 2026 17:46:08 +0200,
Antti Jalomäki wrote:
> 
> Hi Takashi,
> 
> Thank you for the review. I re-tested without the workaround on kernel
> 6.19.10 (Fedora 43) with the latest SOF firmware available
> (alsa-sof-firmware 2025.12.2, firmware
> version 2:2:0-57864, ABI 3:22:1).
> 
> The SOF driver detects 4 DMICs in NHLT tables and attempts to load,
> but fails with a CSE IPC timeout. Full dmesg:
> 
> sof-audio-pci-intel-cnl 0000:00:1f.3: Digital mics found on Skylake+
> platform, using SOF driver
> sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PCI
> class/subclass/prog-if 0x040380
> sof-audio-pci-intel-cnl 0000:00:1f.3: hda codecs found, mask 5
> sof-audio-pci-intel-cnl 0000:00:1f.3: using HDA machine driver
> skl_hda_dsp_generic now
> sof-audio-pci-intel-cnl 0000:00:1f.3: DMICs detected in NHLT tables: 4
> sof-audio-pci-intel-cnl 0000:00:1f.3:  Firmware file:     intel/sof/sof-cml.ri
> sof-audio-pci-intel-cnl 0000:00:1f.3:  Topology file:
> intel/sof-tplg/sof-hda-generic-4ch.tplg
> sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:1
> sof-audio-pci-intel-cnl 0000:00:1f.3: cl_dsp_init: timeout with
> rom_status_reg (0x80000) read
> sof-audio-pci-intel-cnl 0000:00:1f.3: Boot iteration failed: 3/3
> sof-audio-pci-intel-cnl 0000:00:1f.3: 0x06000021: module: ROM, state:
> CSE_IPC_RESET_PHASE_1, waiting for: CSE_CSR, running
> sof-audio-pci-intel-cnl 0000:00:1f.3: extended rom status:  0x6000021
> 0x0 0x0 0x0 0x0 0x0 0x1811102 0x0
> sof-audio-pci-intel-cnl 0000:00:1f.3: error: dsp init failed after 3
> attempts with err: -110
> sof-audio-pci-intel-cnl 0000:00:1f.3: error: hda_dsp_core_reset_enter:
> timeout on HDA_DSP_REG_ADSPCS read
> sof-audio-pci-intel-cnl 0000:00:1f.3: error: dsp core reset failed: core_mask f
> sof-audio-pci-intel-cnl 0000:00:1f.3: error: sof_probe_work failed err: -110
> 
> The DSP gets stuck at CSE_IPC_RESET_PHASE_1, waiting for CSE_CSR. This
> appears to be a communication failure between the SOF driver and the
> Intel CSE, not a firmware
> version issue.
> 
> With snd_intel_dspcfg.dsp_driver=1, the legacy HDA driver works
> correctly (ALC285 codec, PCI SSID 17aa:22be).
> 
> System info:
> - Lenovo ThinkPad X1 Yoga Gen 5 (20UBCTO1WW)
> - BIOS: N2WET51W (1.41)
> - PCI: Intel Comet Lake PCH-LP cAVS [8086:02c8]
> - Kernel: 6.19.10-200.fc43.x86_64
> - SOF firmware: alsa-sof-firmware-2025.12.2
> 
> I'm happy to adjust the patch approach if you suggest a better way to
> handle this. Would using FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE with a
> different fallback be preferred
> over .flags = 0?

Let Intel folks check the error above at first (added a few to Cc).
If it's really a device that shouldn't be dealt with SOF, we can add a
quirk entry.


thanks,

Takashi

> 
> Best regards,
> Antti Jalomäki
> 
> On Sat, Apr 4, 2026 at 6:21 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Sat, 04 Apr 2026 16:47:43 +0200,
> > Antti Jalomäki wrote:
> > >
> > > The SOF driver fails to initialize on the Lenovo ThinkPad X1 Yoga Gen 5
> > > with Intel Comet Lake PCH-LP cAVS [8086:02c8]. Add a DMI quirk to force
> > > legacy HDA driver selection for this device.
> > >
> > > Link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1120554
> > > Link: https://bugzilla.redhat.com/show_bug.cgi?id=2455066
> > > Signed-off-by: Antti Jalomäki <antti@nevaberry.com>
> >
> > Have you tested with the latest kernel together with the latest
> > SOF-firmware?  Just to be sure, as your reports above didn't indicate
> > it, and ....
> >
> > > ---
> > >  sound/hda/core/intel-dsp-config.c | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/sound/hda/core/intel-dsp-config.c b/sound/hda/core/intel-dsp-config.c
> > > index f0a44fd11..179fe4d59 100644
> > > --- a/sound/hda/core/intel-dsp-config.c
> > > +++ b/sound/hda/core/intel-dsp-config.c
> > > @@ -269,6 +269,21 @@ static const struct config_entry config_table[] = {
> > >               .device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> > >               .codec_hid =  &essx_83x6,
> > >       },
> > > +     {
> > > +             .flags = 0,
> >
> > ... there is no other quirk entries setting like this.  It already
> > looks very special, and such a case is often due to other problems.
> >
> >
> > thanks,
> >
> > Takashi
> >
> > > +             .device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> > > +             .dmi_table = (const struct dmi_system_id []) {
> > > +                     {
> > > +                             .ident = "Lenovo ThinkPad X1 Yoga Gen 5",
> > > +                             .matches = {
> > > +                                     DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> > > +                                     DMI_MATCH(DMI_PRODUCT_FAMILY,
> > > +                                               "ThinkPad X1 Yoga Gen 5"),
> > > +                             },
> > > +                     },
> > > +                     {}
> > > +             }
> > > +     },
> > >       {
> > >               .flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
> > >               .device = PCI_DEVICE_ID_INTEL_HDA_CML_LP,
> > >
> > > base-commit: 9f2a23bd5d30dc0968e56a2b6e5edb58aff1bc6d
> > > --
> > > 2.53.0
> > >
