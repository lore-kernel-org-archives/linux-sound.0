Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9C23C4F3;
	Mon, 27 Jul 2026 15:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785165721; cv=none; b=YijTXFNQklKVibPEw9/14gXarW2LWKdrXFfXLeoEUlI/ZY/H/30nR63hdWNxriG1dtho6dxQkBCic52YWN+8jzCSoWyXvEhRKkZTJcLkqzQ0IW44lQGOZ49xtyS6ks5kh6Kf2fTu1axcjjdJff+4RdOzX2GTEdZ77NvWVxrvzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785165721; c=relaxed/simple;
	bh=fdz2AShsLA6ydlVuePUPZoi09uYkmWfXqvf8jou2euM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGpaoo/H03AQbd9l6lHBe58yPpi5LN/ghHq3ZRR3/xlmn/YxMGLz1MpvH1L/f+4z6rRUtwNTg4GuUiIC5wNgnR6Q61VNs9qplZt8YI9f4qwHAef3zHiFoTTLPuQYX/TDSXXIlWvzztWtWyW3XxJNmWjG5VZ8YWUCyl3FV5o5inQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSV8nIHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSV8nIHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D299D1F00A3A;
	Mon, 27 Jul 2026 15:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785165719;
	bh=ZYV5AzlB1knAkV7WFAD2k5eDm8x0Y+rueHdYPqG8iZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nSV8nIHjtHDrmVgvUS5IH9UbGfsffIJz8TRpGjYZSJfqqIeIRHzhFH+jJsVQBvoP8
	 lngegfjLs1dc9VDga2dQgzxRrW3iMAh2kSMeq8sgCHOEx9lAb9UEC+ygdy5IdCjcYp
	 IX1jwFKxhBsSzZdgtnwl1TtZfB8whXfg0DEk2RrXrAT/WWNa0oSsbCGCd6Qv59qXeW
	 uPSl4BAz97lcBHbIPjWZ5SL4XjV1Co/ZvXOp/IG70k10CrUyxMy7DQybRmltfgj0j4
	 EoNQS1GAG5eQ/VQI4sOiKnawrFdQ8856PoHt8wLVh2TzxRryUjXBTsQH56hgBUxR4e
	 o2gcB3SI5Ofow==
Message-ID: <f452de7b-70de-47d2-adf3-8c1b334430c2@kernel.org>
Date: Mon, 27 Jul 2026 10:21:56 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SoundWire: amd: all peripherals stay UNATTACHED after s2idle
 resume (AMD ACP70, ASUS ProArt PX13 HN7306)
Content-Language: en-US
To: Andrey Golovko <andrey.golovko@gmail.com>,
 Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul
 <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org
References: <466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech>
 <d36b1bf93ca7eeae441342cb88d1a2fd@gmail.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d36b1bf93ca7eeae441342cb88d1a2fd@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 03:12, Andrey Golovko wrote:
> Hi Antoine,
> 
> I have the same machine (ASUS ProArt PX13 HN7306EAC, Ryzen AI MAX+ 395,
> ACP rev 0x70, RT721 + 2x TAS2783 on link 1) and have been chasing this
> since May [1], [2].
> 
> Good news: this is already fixed in mainline.
> 
>    5893013efabb ("ASoC: amd: ps: disable MSI on resume in ACP PCI driver")
>    Vijendar Mukunda, in v7.2-rc4
> 
>> drivers/soundwire/amd_manager.c is byte-identical between v7.1.4 and
>> v7.2-rc3, so I have not test-booted 7.2.
> 
> That is why you missed it - the fix is not in the SoundWire manager at
> all, it is in sound/soc/amd/ps/pci-ps.c, and it landed in rc4, one week
> after the rc3 you diffed against. BIOS/firmware re-enables MSI in the
> ACP's PCI config space on system resume while snd_pci_ps only uses
> legacy INTx. With stale MSI address/data, the device writes interrupts
> to a bogus address: hence the IOMMU IO_PAGE_FAULT at 0xfffffffffffffffc
> and, crucially, the slave status-change interrupt never being delivered.
> No status-change interrupt, no enumeration - which is exactly why a full
> ACP unbind/rebind does not help either: the re-init runs fine, the
> interrupt just never arrives.
> 
> So the conditional clock-resume handshake you flagged is not the cause
> here; that branch behaves the same before and after the fix.
> 
> Results on this hardware, on a v7.2-rc4 based kernel:
> 
>   - 14 s2idle cycles, all three peripherals Attached after every resume
>     (previously: UNATTACHED after the first cycle, 100% of the time)
>   - zero IO_PAGE_FAULT, zero "resume: initialization timed out",
>     zero -110 from acpi_subsys_resume, suspend_stats fail=0
>   - in 11 of those cycles the driver logged the smoking gun:
> 
>       snd_pci_ps 0000:c4:00.5: ACP: MSI unexpectedly enabled after resume
>       (flags=0x00f1), disabling
> 
>     i.e. the BIOS really does re-enable MSI behind the driver's back.
>   - confirmed with real deep S0i3, not just a shallow s2idle: cycles with
>     amd_pmc residency of 51.4 s and 38 s (out of ~57 s / ~43 s of sleep)
>     re-attach just as reliably. Worth stressing, because on this board
>     'amdgpu.dcdebugmask=0xE10' (IPS off) silently keeps the platform out
>     of S0i3 and then the bug does not reproduce at all.
> 
> Vijendar, Mark: the commit carries a Fixes: tag but no Cc: stable, and it
> has not been picked up for 7.1.y (currently v7.1.5). Could it be queued
> for stable? Everyone hitting this so far is on a distro kernel: Antoine
> on Debian 7.1.4, Pasquale Fiorillo on 7.0.x/7.1.3 (bugzilla #221584 [2]),
> and myself on 7.0/7.1. A backport would fix the machine for all of them
> without a mainline rebuild.

FWIW - anyone can send a stable patch.  If you or someone else has 
validated it works on 7.1.y (which I expect it works), feel free to send 
it out.

https://docs.kernel.org/process/stable-kernel-rules.html

> 
> Antoine: attach being fixed is necessary but not sufficient on this
> board - with real S0i3 residency the speakers stayed silent here for two
> further reasons (a stale regmap cache in tas2783-sdw, and the ACP
> SoundWire DMA configuration not being reprogrammed on stream recovery).
> I am replying to your firmware thread [3] with the details, so as not to
> mix them up with this one.
> 
> Happy to test patches or provide register dumps - and thanks for the very
> precise write-ups, they saved me a lot of cross-checking.
> 
> [1] https://lore.kernel.org/all/cab8c5d1-6930-4048-a8d3-720db9b3c0dd@amd.com/
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=221584
> [3] https://lore.kernel.org/all/c66ae00a-e878-4af0-a05a-272e9574eaa5@montane.tech/
> 
> Thanks,
> Andrey

