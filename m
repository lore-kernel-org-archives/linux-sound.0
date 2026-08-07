Received: from out-178.mta1.migadu.com (mta1.migadu.com [37.59.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE35394792
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.59.57.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786094504; cv=none; b=iI2FHYFDY5MeAVDz+p+HUlwYbiE2YNm3IIJxp/4Oz/fyT0HXK3MjR7HLcRNINAAzQgsq5YiONkEvi/FQtCKplyAjqLiASqqdRDsPkkNEVIJffnYRQd7vL9z/87/NaNTh+luPSJjvd9fM74R+4ZIbJkV6bEBZ7i9fUKE9sKBV9yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786094504; c=relaxed/simple;
	bh=p5fjWGz288lKj9oUPc6QDT4NJUXTiTYSQzbI8se/Ehg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqaIf4falRSIlvNYj3REo71uLUD9FkwQXIhesAfoD1hR/R7UDQwrzV9Gd/CFuTaCVNXED/wYN8v11k7Q6AZf3oPTk6sm8J15plikX1DmTTO6EDIwyLxFpUxLVjPToojlfcnU+aV6VB/8Ro0ysXFDe0gdxUPRnf3XZHv7zRVw6Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BBQBA0rW; arc=none smtp.client-ip=37.59.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BBQBA0rW"
Message-ID: <15034aea-2108-4fd3-a352-3940b19d280f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786094497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rkX7zmCKgqx/xS7EFUvpOtXbRvAP+ACZnCgpSR8Vrbc=;
	b=BBQBA0rWDK5m2ztd6heoEBmxjT7+3OCJmdZFeP7lkNwOYT0aBLaXGDIXVcBp6xCTG/1Qob
	8t8vo952BcP3wn4lht7oDqiKQe+T7qiBH8NHp0ZXDG4YTgTx7eBYhdqhuzapDb5U7csC7w
	jPlgXQb3wstiyMWdzTzxM96x6tkrYtU=
Date: Fri, 7 Aug 2026 11:19:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: ASoC: tas2783-sdw: no stereo channel split for two mono amps ->
 mono output (AMD ACP SoundWire, ASUS ProArt PX13)
To: Andrey Golovko <andrey.golovko@gmail.com>,
 Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Robin Everaars <robineveraars@pm.me>, linux-kernel@vger.kernel.org
References: <29e8c08b-9475-4aba-bce0-6d4a45a26d3b@gmail.com>
 <20b6c100ec50c0b9eb1dd31a338dbc9e@gmail.com>
 <778f017a-e1c2-4ab6-9968-6e4c6285180b@montane.tech>
 <cf25e8d6e9625f774c793e66f8a59b8d@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <cf25e8d6e9625f774c793e66f8a59b8d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/7/26 07:21, Andrey Golovko wrote:
> On 7/27/26 13:21, Antoine Monnet wrote:
>> I logged name_prefix against the resulting ch_mask and got tas2783-1 = 0x8
>> = left, tas2783-2 = 0xb = right; the split is correct by ear and by per-amp
>> mixer mute. Since your unit is the same HN7306EAC the prefix ordering is
>> identical, so this should give correct L/R for you too - a Tested-by from
>> the second machine would be welcome if you get a chance, but nothing needs
>> re-deriving.
> 
> Tested-by: Andrey Golovko <andrey@golovko.me>
> 
> Confirmed on the second machine: ASUS ProArt PX13 HN7306EAC, v7.2-rc4 based
> kernel, same two TAS2783 at unique_id 0x8 / 0xB plus RT721 on SoundWire
> link 1.
> 
> With your patch applied both amps render, and the assignment is correct by
> physical placement, not merely by control name:
> 
>   speaker-test -Dpipewire -c2 -s1  ->  physically left speaker only
>   speaker-test -Dpipewire -c2 -s2  ->  physically right speaker only
> 
> Both amps at full scale, all four Left/Right Spk[2] switches on. Before the
> patch, -s1 was audible and -s2 was silent, with only one amp contributing at
> all - so this is exactly the behaviour you predicted for an identical
> HN7306EAC: the prefix ordering matches, tas2783-1 takes the left channel and
> tas2783-2 the right, and that lines up with the physical speakers.
> 
> One caveat, measured since by Robin Everaars, who reported the same
> issue on yet another HN7306EAC (added to Cc):
> 
>   https://lore.kernel.org/all/20260805183517.8665-1-robineveraars@pm.me/
> 
> The ch_mask *value* is not what selects the channel:
> sdw_compute_slave_ports() assigns payload offsets positionally along
> slave_rt_list, and Robin showed that inverting the two masks between the
> amps does not move the audio. A one-channel mask fixes mono because it
> stops the mirror-mode offset reset; L/R then follows the codec order in
> the DAI link, which on this platform happens to match the speakers. The
> Tested-by stands - the split the patch produces is correct on both
> machines - but the name_prefix -> BIT(n) mapping reads as if the bit
> picks the channel, which is worth a comment or a reword before a formal
> submission. Where the binding should really come from is being discussed
> in Robin's thread.

Selecting a mono channel at the port level is indeed a solution but not
quite what SDCA designs are supposed to implement. As discussed in the
other thread, all amps are supposed to receive *all* channels and use
mapping/processing to generate the per-amp desired output. That
generation can be dynamic depending on 'posture'.

Looking at the SmartAmp topology in the SDCA spec, my guess would be
that the mapping is really handled in the UDMPU23 and FU 23 entities.
The topology has a 'Amp Transducer Mapping' label which seems to be the
right location to make the left/right speaker selection.

FU23 looks like a dead-end, it is a 'platform' FU not supposed to be
modified by the class driver. The Channel Gain is a platform-specific
value set with OEM defaults, the drivers shouldn't muck with those values.

The UDMPU23 has a 'ClusterIndex' control at offset 0x10, it's not
exposed to userspace but is part of regmap

case SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_UDMPU23,
			  TAS2783_SDCA_CTL_UDMPU_CLUSTER, 0):

It might be worth experimenting with different non-zero cluster indices
for each amp. If the index is zero then the channel selection is
bypassed, whatever is provided to the UDMPU input pin will flow on the
output.

Unfortunately the cluster index is not a direct representation of the
channel selection, it points to a table in which the channel selection
is defined. Nothing requires that the indices be continuous, and that
table can in theory be platform-specific...

One would hope that the codec vendor has guidelines on which cluster
uses what index... Someone at TI should really comment on whether this
UDMPU cluster selection is the correct direction, as usual the caveat
that such experiments might blow the speakers...

