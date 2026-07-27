Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D2030D40A
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139965; cv=none; b=UtwSuNDw5EWVnJ52UgA9CCzY0x80lGY99GHoaXvWm1Os6dKT01+kJYjOC7MenTJ5TzCn6E+c0SVsrb3p2zBrPEz7pAHktDK0maIF6HPoRZn6gfKmQ83Zbb9QPE95ZNi54HtNyBlP5DmooJ147qWS9b5nUg2t4FS2N8SM+9AUJ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139965; c=relaxed/simple;
	bh=qbGObsBhfYyLrwbWyBuTLur6LwiAyDEQXXRIsYA7WGg=;
	h=Date:Message-ID:From:Subject:In-Reply-To:References:To:Cc; b=rKq8E9nXl4jHKsqUdMWRdsG7EH0tyPUqar3HeI+gZEScSrWF3zjrv7rFQKZpp127q87JVPoQdIXqoA4AIherIvIxSGeFwXtQ/7W07pMUftOkldasl4/OJLu1+e+wTvp4XaVk77oaEc9LDWpwoppAB/u+vEI/2BSw3V5W3+rqX1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+qB40vX; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+qB40vX"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so2937954e87.0
        for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 01:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785139962; x=1785744762; darn=vger.kernel.org;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Y8ZXpe/HWqMK/iDNsEBlLr1e75S/sSC4JyP1RyuRNU=;
        b=H+qB40vXGXf3OJEwA3Ne+ImbF2avPkNovXFOZPRC6kpcJvXx4auL/sGSPRVXF2X0qw
         BihuGjBA/KjOdjsrb4Lv2ElvaNbk5xUrsWfGP/Mgfopb9umGu/UW0u+zHVBSzVADETp2
         X5O1jvDhxyTxKjuv4LljaYmKJqN6K3Yvvf+62ANd31kTWKePb/RWVJyae+qmpiM8/CBc
         c826uA7vu5TtgTBP6BxEtvaosJduxNgh75UcRrv1KUSvufKX1wHsc+c9PtYIJU09U1Er
         Yna+o57KxA7HdxjX220WsleyjS0OmD3GuJ+oH0kAXbd7055ihAWyVGgh84ZMUoZstR1J
         tlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139962; x=1785744762;
        h=cc:to:references:in-reply-to:subject:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Y8ZXpe/HWqMK/iDNsEBlLr1e75S/sSC4JyP1RyuRNU=;
        b=DVK/Wr3LJbXaNYnDP7pmZtHFkk/q8lTRm7Rs8wO9E7o9MJ94oGwLnT0AON0uilXa2y
         c4fKl0pr3QfGUwbuVxSEopX3i+rK2OeVq6N5ghWxBUYBfRn7R2sNkuG6MRWtDOY4L8MO
         XaSXjUNjHQ9XdwOR8zwS7JYKKnz4gUXBHt6w5TW5DAcwxURQaeDVLjIBRQj3IgBNdmAm
         r+LhFIDFnzkCIyLieHAITfxb18Bmif0ZO305hAw7cxlE/8CO1pb4p0cS0VddqjzfxlVX
         8QiWqasiKxbUHsI70im96AFIAywmFkGvk0lfEjzCHN1m1cBgNeqaE7B+PFyYVddbKUvQ
         F3Qg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5u0+L1r4V9FU/X1RSGvHYYOTJSIzyk2NyvrlbFkVUGn6HTREglh7Dw21JVdTq06+f+aOZFbJSDeYzDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwb9Rog54mFpe3a2YevgQfxo/f7KYkBAms8F8vDkKw/391/Xf
	1gOQrFONR3+84UYdzi9Uad4YP0CdqmMuI7Bi21oqyVTBp3JueaxP9Yac
X-Gm-Gg: AR+sD10G8Xq2I4QxG7MlvdHmhgQcdI/O3meY3nbZs1sZ9C1zCF4Hn1WksaLT22cXJJ6
	z+N94wPdxAUeAjHQLsj5ybe50EfpM53aYNQk0gl0R/kXjD3CfB7xG8kEdvgx9fmZdUNfD6q9iqF
	+RaU6iclYPkv4TaJ4tLRQyyUe3t7KaRczEkB9O4vyHCFGF0IVweImP2H3GthVQJPUE1t4GfJPa2
	n/eWmKg1YL3GEPAjUBEjAY0kF4Yt+nkwE3WnJgFvZWwO3XK684v/vI7dTcUG0mVlHTqCLrZ9Cxm
	7sZZdgC/lAVRASqyiNscaQGcLe18xIvpBeO65iOyI/1iCfl+O4yDRkCFTp5IFrnjdNEWn2VMEUT
	fZHPk9UqnuJE0/ll2brgmypioIxgPHfXARMQtPjUdT4RU0ToXVoH4hxnZOi5uXOKxOZVMwrSRM+
	A=
X-Received: by 2002:a05:6512:3b13:b0:5b0:1433:13b9 with SMTP id 2adb3069b0e04-5b2c1b1d902mr1264049e87.25.1785139961569;
        Mon, 27 Jul 2026 01:12:41 -0700 (PDT)
Received: from localhost ([5.227.22.1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be07fd0esm1275638e87.19.2026.07.27.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:12:41 -0700 (PDT)
Date: Mon, 27 Jul 2026 11:12:38 +0300
Message-ID: <d36b1bf93ca7eeae441342cb88d1a2fd@gmail.com>
From: Andrey Golovko <andrey.golovko@gmail.com>
Subject: Re: SoundWire: amd: all peripherals stay UNATTACHED after s2idle resume (AMD ACP70, ASUS ProArt PX13 HN7306)
In-Reply-To: <466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech>
References: <466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech>
To: Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
    Mario Limonciello <superm1@kernel.org>,
    Vinod Koul <vkoul@kernel.org>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
    Mark Brown <broonie@kernel.org>,
    Liam Girdwood <lgirdwood@gmail.com>,
    Shenghao Ding <shenghao-ding@ti.com>,
    linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Hi Antoine,

I have the same machine (ASUS ProArt PX13 HN7306EAC, Ryzen AI MAX+ 395,
ACP rev 0x70, RT721 + 2x TAS2783 on link 1) and have been chasing this
since May [1], [2].

Good news: this is already fixed in mainline.

  5893013efabb ("ASoC: amd: ps: disable MSI on resume in ACP PCI driver")
  Vijendar Mukunda, in v7.2-rc4

> drivers/soundwire/amd_manager.c is byte-identical between v7.1.4 and
> v7.2-rc3, so I have not test-booted 7.2.

That is why you missed it - the fix is not in the SoundWire manager at
all, it is in sound/soc/amd/ps/pci-ps.c, and it landed in rc4, one week
after the rc3 you diffed against. BIOS/firmware re-enables MSI in the
ACP's PCI config space on system resume while snd_pci_ps only uses
legacy INTx. With stale MSI address/data, the device writes interrupts
to a bogus address: hence the IOMMU IO_PAGE_FAULT at 0xfffffffffffffffc
and, crucially, the slave status-change interrupt never being delivered.
No status-change interrupt, no enumeration - which is exactly why a full
ACP unbind/rebind does not help either: the re-init runs fine, the
interrupt just never arrives.

So the conditional clock-resume handshake you flagged is not the cause
here; that branch behaves the same before and after the fix.

Results on this hardware, on a v7.2-rc4 based kernel:

 - 14 s2idle cycles, all three peripherals Attached after every resume
   (previously: UNATTACHED after the first cycle, 100% of the time)
 - zero IO_PAGE_FAULT, zero "resume: initialization timed out",
   zero -110 from acpi_subsys_resume, suspend_stats fail=0
 - in 11 of those cycles the driver logged the smoking gun:

     snd_pci_ps 0000:c4:00.5: ACP: MSI unexpectedly enabled after resume
     (flags=0x00f1), disabling

   i.e. the BIOS really does re-enable MSI behind the driver's back.
 - confirmed with real deep S0i3, not just a shallow s2idle: cycles with
   amd_pmc residency of 51.4 s and 38 s (out of ~57 s / ~43 s of sleep)
   re-attach just as reliably. Worth stressing, because on this board
   'amdgpu.dcdebugmask=0xE10' (IPS off) silently keeps the platform out
   of S0i3 and then the bug does not reproduce at all.

Vijendar, Mark: the commit carries a Fixes: tag but no Cc: stable, and it
has not been picked up for 7.1.y (currently v7.1.5). Could it be queued
for stable? Everyone hitting this so far is on a distro kernel: Antoine
on Debian 7.1.4, Pasquale Fiorillo on 7.0.x/7.1.3 (bugzilla #221584 [2]),
and myself on 7.0/7.1. A backport would fix the machine for all of them
without a mainline rebuild.

Antoine: attach being fixed is necessary but not sufficient on this
board - with real S0i3 residency the speakers stayed silent here for two
further reasons (a stale regmap cache in tas2783-sdw, and the ACP
SoundWire DMA configuration not being reprogrammed on stream recovery).
I am replying to your firmware thread [3] with the details, so as not to
mix them up with this one.

Happy to test patches or provide register dumps - and thanks for the very
precise write-ups, they saved me a lot of cross-checking.

[1] https://lore.kernel.org/all/cab8c5d1-6930-4048-a8d3-720db9b3c0dd@amd.com/
[2] https://bugzilla.kernel.org/show_bug.cgi?id=221584
[3] https://lore.kernel.org/all/c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech/

Thanks,
Andrey
