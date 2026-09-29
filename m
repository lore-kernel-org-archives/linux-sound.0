Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC664FE2D8
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690088; cv=none; b=rKiaLBfEV1pGYYwnLSq1Zdx3ykBgqA+bGa3mhgDvRSlozGdymNwMBqoahJG0IX7VXkFTjgNt4MS3uFse3QdilwojyZaCpqYmDj6vbPqVmRJpkF76dBAYWAna+xC3lKXmag+ybhRPe9aTRB+bQcvzwuKtJDa7dxZ+8ilGGjibHeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690088; c=relaxed/simple;
	bh=1+Q3CiC7EujZhPwEq4LpkryAc2p7dJ3m3cXU4TeeE24=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXvrfVnZW9pKjsfbJqE8adw+t+dX41jQXWMLCXCwFBjzGGVrrR1jqTAU1J/d+xBoWEmz7jFmE4STVdN50EeMthT8BkFH5d0WjMDjaHhtZBQ/nXnuK3lxWltp+5yOJGORfeYJEHYY/beKEKMfZmyEX7J3zoSILYZSRqQ6e98btZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nGcs2oSg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5NzH0/fD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Q8rXXx1e; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KQyeC1Cd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nGcs2oSg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5NzH0/fD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Q8rXXx1e";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KQyeC1Cd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A31431F7DC;
	Tue, 29 Sep 2026 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790690080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Km2P8Qpx8yfCHB+0xH82eTRQblrPH5sIu2xpbRLdNI=;
	b=nGcs2oSgpgeIq93op/8aTwflCoGl1Eb0iC/KeEgu1EkdXvduy2u4hwwBmEeKY8lvfY/7oS
	KheCFjpuG16J24/hSIR/zju3eeyQoPsqWh1S3ERaKIIMxNRinmEI83VyR+lKPJ4UUPNIVj
	fKPsb9gT/iwWuAeGQojFRJSRh2f2pWI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790690080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Km2P8Qpx8yfCHB+0xH82eTRQblrPH5sIu2xpbRLdNI=;
	b=5NzH0/fDXcm2FcT04eM7+wtTZFfx5jhVrK8kIYdfwPX0UQLOObupAAIO+RL4TfjjdTHj99
	ZDyS+KFKkiu82sBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790690076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Km2P8Qpx8yfCHB+0xH82eTRQblrPH5sIu2xpbRLdNI=;
	b=Q8rXXx1e7UPfH9wKi1WYpqm6yar7CQzoKndAMxV1zJ+dQDxRktIi+BBH+lWKA/i6Anc6KG
	NtiHhtd7KD6C9hOAYJyYxgY2ZTMIwDS+F53vJ6qFZqBAVmFHXgfdw+/kaBbcJNls9xR7jw
	0QJxRyiKuOpZ3L/jO1DrXiNL5j4yzcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790690076;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Km2P8Qpx8yfCHB+0xH82eTRQblrPH5sIu2xpbRLdNI=;
	b=KQyeC1CdRo74223O6nmxG6hRNtg7sk2VOMPyvClzIQNh209jqCYWajBUOTGFSRe/XtRJ5E
	h3btsHcVAD3R14Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6F3E6136D1;
	Tue, 29 Sep 2026 13:54:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TsTqEBzDu2obOQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 13:54:36 +0000
Date: Tue, 29 Sep 2026 15:54:36 +0200
Message-ID: <875wzo17tv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wilson Luiz Prosdocimo <wilson.prosdocimo@eemovel.com.br>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de
Subject: Re: [BUG] ALSA hda/realtek: Acer Nitro AN515-44 (ALC295) has blank PCI SSID 1025:0000, no headset-mode quirk
In-Reply-To: <CAFDY+3cj_KWNE28Hii1ZbWKAhAXf8FT9Bv3Mg-JwwhCC=Ki_7w@mail.gmail.com>
References: <CAFDY+3cj_KWNE28Hii1ZbWKAhAXf8FT9Bv3Mg-JwwhCC=Ki_7w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,alsa-info.sh:url]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Fri, 18 Sep 2026 17:44:16 +0200,
Wilson Luiz Prosdocimo wrote:
> 
> 
> Hello,
> 
> I'd like to report a hardware-detection issue with the Realtek ALC295 codec on
> an Acer Nitro AN515-44 laptop, which prevents any headset-mode / combo-jack
> mic detection from working, and causes speaker output to be incorrectly muted
> whenever anything is plugged into the analog jack (including a mic-only
> device).
> 
> System
> ------
> - Model: Acer Nitro AN515-44 (board: Stonic_RNS, BIOS Acer V1.04)
> - Distro: Omarchy (Arch-based)
> - Kernel: 7.2.5-3-omarchy
> - Codec: Realtek ALC295 (Vendor Id 0x10ec0295), HDA Subsystem Id 0x10251455
> - PCI device: 06:00.6, "Advanced Micro Devices, Inc. [AMD] Ryzen HD Audio
> Controller" [1022:15e3], PCI Subsystem [1025:1455]
> 
> Problem
> -------
> dmesg shows the ALC295 fixup match failing to find a model-specific quirk:
> 
> snd_hda_codec_alc269 hdaudioC1D0: ALC295: picked fixup for PCI SSID 1025:0000
> snd_hda_codec_alc269 hdaudioC1D0: autoconfig for ALC295: line_outs=1 (0x14/0x0
> /0x0/0x0/0x0) type:speaker
> snd_hda_codec_alc269 hdaudioC1D0: hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
> snd_hda_codec_alc269 hdaudioC1D0: inputs:
> snd_hda_codec_alc269 hdaudioC1D0: Mic=0x12
> 
> The fixup name is empty, and the PCI SSID logged for quirk matching is
> 1025:0000 ― i.e. the BIOS does not program a per-model PCI subsystem ID for
> the audio function, even though the HDA verb-reported "Subsystem Id"
> (0x10251455) and the lspci subsystem (1025:1455) are both non-zero. Because
> the 1025:0000 value doesn't match any SND_PCI_QUIRK entry in patch_realtek.c,
> the driver falls back to plain autoconfig with no headset-mode / combo-jack
> handling.
> 
> Pin complex dump for the relevant nodes (from /proc/asound/card1/codec#0):
> 
> Node 0x12 [Pin Complex] ... Pin Default 0x40 ... (internal Mic, autoconfig
> "Mic=0x12")
> Node 0x18/0x19/0x1a [Pin Complex] Pin Default 0x411111f0: [N/A] Speaker at Ext
> Rear (disconnected per BIOS pin table)
> Node 0x21 [Pin Complex] wcaps 0x40058d: Stereo Amp-Out
> Pin Default 0x0421101f: [Jack] HP Out at Ext Right
> Pin-ctls: 0xc0: OUT HP
> 
> Only NID 0x21 (HP-out) is wired to a real, jack-sensed external port ― it's
> the sole physical analog jack on this laptop, shared for headphones/headset
> use. Because no combo-jack/headset-mode quirk is applied, ALSA only exposes a
> single boolean "Headphone Jack" control with no ability to distinguish a
> headphone/headset from a plain external microphone plugged into the same jack:
> 
> numid=12,iface=CARD,name='Headphone Jack' (boolean, real sensing)
> numid=11,iface=CARD,name='Mic Phantom Jack' (boolean, always "on" ― no real
> sensing)
> 
> User impact: plugging a standalone external microphone into this jack (common
> for video calls) flips the Headphone Jack sense bit, and userspace
> (WirePlumber/PipeWire) switches the active output port from "Speakers" to
> "Headphones", silencing the internal speakers, since the driver gives it no
> way to know the difference. On Windows, the Realtek driver's impedance-based
> headset-mode detection handles this correctly (prompts for device type);
> there's no equivalent working here because no fixup is matched.
> 
> This looks like the same class of bug recently fixed for sibling Acer Nitro
> models where the BIOS also fails to program a real PCI SSID, e.g.:
> 
> SND_PCI_QUIRK(0x1025, 0x159c, "Acer Nitro 5 AN515-58",
> ALC2XX_FIXUP_HEADSET_MIC)
> 
> and the recent patches for Acer Nitro ANV15-51 / Nitro 16 AI covering the same
> "SSID reads 1025:0000" pattern.
> 
> Could a similar quirk (ALC2XX_FIXUP_HEADSET_MIC or equivalent) be added for
> this board, keyed on DMI (sys_vendor "Acer", product_name "Nitro AN515-44",
> board_name "Stonic_RNS") since the PCI SSID itself isn't usable for
> disambiguation? Happy to provide more diagnostics (full alsa-info.sh output,
> hda-verb dumps, etc.) and to test any proposed patch on this hardware.

The driver doesn't use DMI matching, so the PCI SSID (or the codec
SSID) matching would be the way to go.

You can try to pass "model=1024:151e" to snd-hda-intel module option
(or it might be "model=,1024:151e" instead (see the comma)) for using
the same quirk for Nitro AN515-45.

If that works, let us know.  I can create a proper patch for adding
the entry for your device.


thanks,

Takashi
