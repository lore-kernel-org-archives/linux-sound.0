Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2C1DB95E
	for <linux-sound@vger.kernel.org>; Mon,  8 Dec 2025 21:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765229883; cv=none; b=XPufIrKhD+/7IfmxB5sRsT80Y5Ihp+k3GA9cNtX0dgPH3NOkQzGZ/uK7p07CloyxM6kwt75HN+kxL2u2wssyYqlkVUdZ5+K+yokYNb9jOvuQ0YwI6Q3IpfJfnp8I9RaQThfTP0S4IQ+UewSAPGrMIEHQUmfJYmUKsyYJ0Bx1BSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765229883; c=relaxed/simple;
	bh=GNjdGrenXAng06XLUG8kpn4IuZEQcgE565NldEPKlnI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LabZ7s+kA8sSre+/Jq39PL3Gr/pp2KZ4uN3c/r/O2CL9cTqocf7GunDZwtUdBu1gfSr6iJc9skf5tLXs9Vv6Ez0Yb1kiUCxQ6enbrtkaP0bh2rWMVZtSBBDTCLhIGYR5m+uXUoDuEEndHCke5Wj5SFDZNkTxhrgQDuWj2RHoasU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z2RsaqLM; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z2RsaqLM"
Message-ID: <2d8b782c-a97c-4521-9307-a2cf8934802a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765229868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+y2/vMbMxZSt8Rk39k+RmNNvGvECsT6Zy+zuiWOYu4=;
	b=Z2RsaqLMNrP1+NyfCIySWidaKT8q1p7nTfhvbAfEUSNs5wIzocOQk2aS5Bf0Uj1jrQIQPu
	LvMxde1xJAHlZaHZUoYzjmX6KEpx1MiFHTJpvOKVNznGoJPd7OGapQJ9hcC2FwRLJsY6pW
	0+PCriP2BiKEPHNKGoA8OE10F4RVT9E=
Date: Mon, 8 Dec 2025 13:37:41 -0800
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [BUG] hda/tas2781: ASUS ROG Xbox Ally X audio issues with default
 firmware
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Baojun Xu <baojun.xu@ti.com>, Shenghao Ding <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>, tiwai@suse.de
References: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
Content-Language: en-US
In-Reply-To: <0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/3/25 5:47 PM, Matthew Schwartz wrote:
> Hello,
> 
> I have an ASUS ROG Xbox Ally X which uses hda/tas2781 for the speaker amplifiers. I am splitting this out into a new thread based on the suggestion from [1] to fix the remaining issues with the device's audio separately. 
> 
> I built a kernel from tags/sound-6.19-rc1 in tiwai/sound and included [2], which seemed potentially relevant to the issue that I describe below.
> 
> By default, my system loads /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst. With this firmware file, any sound above the 70% volume limit range starts to become distorted and frequently drop out from either one or both speakers. I've included an alsa-info.sh report with this default firmware at [3].
> 
> If I run sudo mv /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13841.bin.zst /usr/lib/firmware/ti/audio/tas2781/TAS2XXX13840.bin.zst and force the other firmware file for Xbox Ally models, my speakers work up to 100% without any of the drop outs I experience on the default firmware. I've included an alsa-info.sh report with this renamed firmware at [4].

Hmm, I did just boot into Windows to confirm which firmware blob loads, and it looks like Windows also uses TAS2XXX13840 for my unit. So the driver doesn't appear to be loading the wrong firmware on Linux...

> 
> I took an acpidump at [5] and extracted the dsdt table at [6]. Please let me know if there's any additional information I can provide from the device to further debug the sound issues with the default selected firmware.
> 
> Thanks,
> Matt
> 
> [1]: https://lore.kernel.org/linux-sound/87zf8jesp0.wl-tiwai@suse.de/
> [2]: https://lore.kernel.org/all/20251126141434.11110-1-baojun.xu@ti.com/
> [3]: https://alsa-project.org/db/?f=840337cab11f6aa70cf48b15d55ac45e4027ff41
> [4]: https://alsa-project.org/db/?f=6e482f72765d89520ea171f15641228bcadefcf0
> [5]: https://gist.githubusercontent.com/matte-schwartz/d7ff3c857b45cca197f3d3adc16df0bc/raw/2e3267b8d1a9d619ecd8157e4da426be756b6497/acpidump.txt
> [6]: https://gist.githubusercontent.com/matte-schwartz/4042dcd3779c3738af60536a9d4050d6/raw/5227717c6d40a2dc4012b95f7fefc6cd50ba784d/dsdt.dsl

