Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A6F3B42CB
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332985; cv=none; b=H7Y+Y8w/BUZ20wIKkLjmv9bG5ZAhPyuClQETMEvQpZOvA+o1SHWgZJY+4bDfZP1NZnxgVJhAr0arxDlmS6hb2KNB1SEe1DqgYH8tiEc58m9zVIoZK/YulRgArF/zQJetXORyD6VJ3KcPll9tIvbrUrpFeWHlmZ3iYG1n/rR/d1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332985; c=relaxed/simple;
	bh=+1zrzxl/hqAwpKJE51uxdYdRvLR++eYm4lyBD9ZijoE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpQFEoDCYvwOaYUsyZQwXigYyYhDW+bLGjlNc+cRAVyEdN/UHmo10QH8dmUsIHqMjhsHJVF++6kDl+f+9akUfUf11ELDkesV0nTIZ9IKJvtiXpAnjUQY4UQ77HuQ9jlMoajyaoHfc5g5MJfpPALrZ7gqZ9f+mNRrRCdVZtmX/Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mrYH88xd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uP+T5hDw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=sSPu6Y15; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WVTI+g7v; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mrYH88xd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uP+T5hDw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="sSPu6Y15";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WVTI+g7v"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1EE2D1FAD4;
	Wed,  2 Sep 2026 07:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788332977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyCETI3ufdXRMllTeFducKsXamrCUaI5TAN3yXFyEMk=;
	b=mrYH88xdvHir9AUPmy1bcGFKg7qchGeCXlZzN4UeQK3kUGBWvY8kKrIC0Ip2f2j4RpW8fS
	Q4rQo+wGaLQKv+oIo2vuzG+63PGkMYv5jN3fSl5S6pPfrT2zJ0/ti4crewS8YX6Llz3Hm0
	mxR2kAm3Aimj5ZRMAOOzs083/FFnDKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788332977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyCETI3ufdXRMllTeFducKsXamrCUaI5TAN3yXFyEMk=;
	b=uP+T5hDwpal8x3Ddi1A+5HlYotwtApaVRXW92aUU5vTJudzrfa9Z8ooc4IMG959fwSTt3y
	evEh4Ee2hgq5BkAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788332973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyCETI3ufdXRMllTeFducKsXamrCUaI5TAN3yXFyEMk=;
	b=sSPu6Y15yWVOhpD9BvTlRMg+zUPK8OxiaeP/13uMXXqPrZytP9AOnaojkv9OilzySNit5y
	Y3cATlhEDGoXB4RSBrZJzigsTT+O//3AUa8zo6oU3delKMsPshnv3rG8F/8hLR9NnT+vv6
	ELyyEwXjgZmeTyNsyMKcSUQGKEqRYS0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788332973;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qyCETI3ufdXRMllTeFducKsXamrCUaI5TAN3yXFyEMk=;
	b=WVTI+g7v6mv8eLAf7qhQJVK0j+UCMBLt4GYqxu9/UC6V0WQuYnq72ZaJ0rBS4lYlRJ2ob+
	hDBwcb2X88rJiNCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9D4113738;
	Wed,  2 Sep 2026 07:09:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xNYoKKzLl2qWVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 07:09:32 +0000
Date: Wed, 02 Sep 2026 09:09:32 +0200
Message-ID: <87fqzsb043.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
Cc: linux-sound@vger.kernel.org
Subject: Re: snd-hdspm: add PCI ID 1d18:3fc6 for RME HDSPe AIO firmware 200
In-Reply-To: <178674392532.7.10140952469564861620.1550442282@slmail.me>
References: <178674392532.7.10140952469564861620.1550442282@slmail.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	DISPOSABLE_ENVRCPT(0.00)[slmail.me];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DISPOSABLE_TO(0.00)[slmail.me];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid]

On Fri, 14 Aug 2026 23:45:17 +0200,
AtmanActive wrote:
> 
> Hello,
> 
> I have an original RME HDSPe AIO PCI express audio card (not an AIO Pro).
> RME's current Windows driver identifies it as:
> 
>     AIO, Revision=200
> 
> After the RME DriverKit firmware update, the card enumerates as:
> 
>     08:00.0 Multimedia audio controller [0401]: RME Device [1d18:3fc6]
> (rev d4)
> 
> The current snd-hdspm module only advertises the older alias:
> 
>     pci:v000010EEd00003FC6sv*sd*bc*sc*i*
> 
> Consequently, no driver binds automatically.
> 
> The PCI revision is d4, which matches HDSPM_AIO_REV (212/0xd4) in
> sound/pci/rme9652/hdspm.c.
> 
> I tested the stock snd-hdspm driver by adding the ID dynamically, with:
> 
>     modprobe snd_hdspm
>     echo '1d18 3fc6' > /sys/bus/pci/drivers/snd_hdspm/new_id
> 
> Result: The card is working 100% correctly for single-speed clocks
> (sample rates 44.1KHz and 48KHz).
> 
> 
> Could PCI ID 1d18:3fc6 please be added to snd-hdspm for original HDSPe
> AIO cards using RME's DriverKit-generation firmware?
> 
> Please let me know if additional tests or diagnostics are required.
> 
> Thanks.
> 
> Regards,
> 
> AtmanActive

Could you verify whether the patch below works?


thanks,

Takashi

-- 8< --
Subject: [PATCH] ALSA: hdspm: Add a new PCI device ID (1d18:3fc6) for RME HDSPe AIO PCI express audio

The RME HDSPe AIO PCI express audio card has a new PCI vendor ID (1d18)
while keeping the same device ID (3fc6).  The card seems working fine by
just adding the new ID.

While we're at it, use the standard macro to cleann up the existing PCI
ID entry, too.

Reported-by: AtmanActive <alsa.atmanactive.3dfqt@slmail.me>
Closes: https://lore.kernel.org/178674392532.7.10140952469564861620.1550442282@slmail.me
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdspm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index d8bbedbc8ff6..95fd82bb1c6d 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -1071,14 +1071,8 @@ struct hdspm {
 
 
 static const struct pci_device_id snd_hdspm_ids[] = {
-	{
-	 .vendor = PCI_VENDOR_ID_XILINX,
-	 .device = PCI_DEVICE_ID_XILINX_HAMMERFALL_DSP_MADI,
-	 .subvendor = PCI_ANY_ID,
-	 .subdevice = PCI_ANY_ID,
-	 .class = 0,
-	 .class_mask = 0,
-	 .driver_data = 0},
+	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_XILINX_HAMMERFALL_DSP_MADI) },
+	{ PCI_DEVICE(0x1d18, 0x3fc6) }, /* RME HDSPe AIO PCI express audio */
 	{0,}
 };
 
-- 
2.55.0
