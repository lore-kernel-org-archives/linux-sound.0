Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEABA3EAC68
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918952; cv=none; b=oCGxOj9cQXku/qo6GObsHhcaBfdzWdS6uuV63Qu1S8TPe0Y4s3iMj7rk8nLf6va0sS9ZRMHiJzJ++qC4HnGkGdhGh8FZDJBXI7ydYxQ1tl4cER67j/aQUnoYBD0A67SfBvZQ1en+hNiyYN27P9GoJSrUVACbxko8mMTDCuhhHUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918952; c=relaxed/simple;
	bh=j2JcVIWF2DCSav0Ug1suruejedxpEDdjenq32JMcrlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IwSvt3G+VtWkwCp7gMCzb+45Px45P5lZ6emA0zb22Fyv7XZfda+m1Pvu0MschcIH/z6MB22HRJAJevUMZCM5aFj/vZ1wZjWI+KXd79EvmES0unQZYoLTHCII1avBnUDPQirCnpH7jkwHL4OMOM3gNtrZxYs9bS1pba6ePdRJFSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V1qx9siG; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V1qx9siG"
Message-ID: <467504ea-c111-4149-9d37-62d55b2b83a9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785918947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vtWh/wuD5wPZtszNWlAcU3OMmRWbcJlKGhaJqa7AFSk=;
	b=V1qx9siGy+9fwYEHCfMsqUqwoQrXsfPbun/HFVfgBddp+xOL1TWlY7c7sT/GED+x6l3Xb8
	Q9sbqBtM1B39G5EBHbrtVjnqiZT8yC+nnaHedpsGg9fX+Z8T/rhYwtit08v0X63xPyZ33c
	xVKW+/CPaYTng41tCTyPTAY361f/fnY=
Date: Wed, 5 Aug 2026 10:33:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] ASoC: SOF: Intel: hda: duplicate _ADR entries share
 one amp index
To: Sergey Lebedev <lsa.uz@pm.me>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20260804225853.31585-1-lsa.uz@pm.me>
 <20260804225853.31585-4-lsa.uz@pm.me>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260804225853.31585-4-lsa.uz@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 8/5/26 00:59, Sergey Lebedev wrote:
> find_acpi_adr_device() assigns each amplifier a name prefix carrying an
> index ("rt1320-1", "rt1320-2", or Left/Right) and advances that index
> once per _ADR entry. Firmware that describes one physical part with two
> _ADR entries therefore consumes two indices for one device.
> 
> The Microsoft Surface Pro 11 (Intel) does exactly that. Link 0 carries:
> 
>   SWRA  _ADR 0x000030025D132000   SDCA class 0
>   SWRB  _ADR 0x000030025D132001   SDCA class 1
> 
> identical but for the class id: same link, same manufacturer, part and
> version, same unique id 0. The part reports class 1, so SWRB is the one
> that enumerates and SWRA never attaches on any boot or firmware version
> tested.
> 
> Both still reach this function, so SWRA takes index 1 and the real
> amplifier is named "rt1320-2". Its controls appear as "rt1320-2 OT23 L/R
> Switch". The stock sof-soundwire UCM profile expects the first
> amplifier, so it enables switches on a device that is not present, and
> the speakers stay silent while everything else reports success.
> 
> Compare entries that differ only in class id and give the later one the
> earlier one's name prefix, jumping past the amplifier-index increment so
> a repeated description consumes one index rather than several.
> 
> Testing the peripheral's attach status instead does not work here, and
> was tried: at machine-select time neither entry has attached yet, so a
> status test finds both unattached, no amplifier is matched at all, and
> the card falls back to the HDMI-only HDA machine driver. Comparing
> addresses needs no runtime state.

yeah but that means two methods to detect the presence of this ghost
device...

> 
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
>  sound/soc/sof/intel/hda.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 4dbba9186..1d60a8caa 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1245,6 +1245,22 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
>  			((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
>  			((u64)(sdw_device->bus->link_id & 0xF) << 48);
>  
> +	/*
> +	 * Firmware may describe a single physical part with more than one _ADR
> +	 * entry, differing only in SDCA class id. Those entries are the same
> +	 * device: they must share a name prefix, and only the first of them may
> +	 * consume an amp index. Otherwise the part that actually enumerates is
> +	 * named as though it were the second amplifier, and UCM profiles
> +	 * written for the first one address a device that is not there.
> +	 */
> +	for (j = 0; j < index; j++) {
> +		if ((adr_dev[j].adr & ~SDW_CLASS_ID_MASK) ==
> +		    (adr_dev[index].adr & ~SDW_CLASS_ID_MASK)) {
> +			adr_dev[index].name_prefix = adr_dev[j].name_prefix;
> +			goto done_name_prefix;
> +		}
> +	}
> +

The DMI quirk removes the need for the two patches that detect the
presence of the ghost device through two different mechanisms.

Can you try with a DMI quirk and let us know if this is good enough?


