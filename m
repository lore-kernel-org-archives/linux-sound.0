Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B80437F8A6
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880619; cv=none; b=sCVpntKOwKRBhfkFV+fbzWhCZx+r6ClD8LuJcQVigBfkXRDaUbdznhoXHsSE2sz71Wg5c0qrirBOCQGGqrUi+Eqt1tv1rYtGEa36/Qtn67omFlbV2G/YppDKKTx6mxqErwcQ8oYAjB2dI66903zbrBCJUh4aqfBY8Fj286iQkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880619; c=relaxed/simple;
	bh=c/9lTL0X6RJ0wo2btlFkatjrAeMqa/aqTDr84ZmziEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JlHOcYvQo7uPBxpFb3kKt6cV/kelypv/s3VwYsQfM4mhvfKRNLfvOE7V8nb7jqk3kalRqklnVK8keqGfTcFkqmWaS/r/VtPJPGOf0n/LB5+OJSheW/7/eoeD8tooDw9Oy5poGFDslsDYNxlGjqrX7d2XB+mMcrCfFyAbLhY/geM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C7afEupX; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C7afEupX"
Message-ID: <5daa3c5c-efeb-48d7-91b3-99e47f54894b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776880614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QRh/WaVcTRCEQc+yZqBv+6er9MCyz2GWVppwpAocztc=;
	b=C7afEupXR2pfRDD5j4IiEfXyuGzcnEmV/XSF2C4M3Lac9O22O3EWFuoSJCiPTc6wzRfdn/
	slWXmlgs7jPdigH8uQ918kvieyZbhyleeAsRX0DLS4jai0+lYBPRXSSCMGbITdDsiXhDV4
	qegvNR676+dL/dvbjDhn1TDxAKBYHS0=
Date: Wed, 22 Apr 2026 19:56:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v10 1/4] ASoC: SDCA: Add PDE state transition helper
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 baojun.xu@ti.com, shenghao-ding@ti.com, sandeepk@ti.com, v-hampiholi@ti.com
References: <20260421154804.2670-1-niranjan.hy@ti.com>
 <aeeehYTuNON2cGKJ@opensource.cirrus.com>
 <e13e6934-fb5b-4ea3-8517-85d482ad25da@linux.dev>
 <aeiGIpYwZz/dBuqQ@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aeiGIpYwZz/dBuqQ@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/22/26 10:26, Charles Keepax wrote:
> On Tue, Apr 21, 2026 at 06:21:09PM +0200, Pierre-Louis Bossart wrote:
>> On 4/21/26 17:57, Charles Keepax wrote:
>>> On Tue, Apr 21, 2026 at 09:18:01PM +0530, Niranjan H Y wrote:
>>>> Per SDCA specification, after writing REQUESTED_PS, drivers must
>>>> poll ACTUAL_PS until the target power state is reached.
>>>> Implement sdca_asoc_set_pde_state_sync() helper function for
>>>> changing the power state of the PDE widget and wait for the power
>>>> transition to happen or timeout.
>>>>
>>>> Changes include:
>>>> - Add sdca_asoc_set_pde_poll_sync() to handle write
>>>>   REQUESTED_PS register and poll ACTUAL_PS register until
>>>>   the target state is reached or timed out.
>>>> - Export function via sdca_asoc.h for use by SDCA-compliant drivers
>>>> - Refactor entity_pde_event() in sdca_asoc.c to use the helper
>>>>
>>>> Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
>>>> ---
>>>>  static int entity_parse_pde(struct device *dev,
>>>> @@ -449,8 +492,8 @@ static int entity_parse_pde(struct device *dev,
>>>>  	}
>>>>  
>>>>  	(*widget)->id = snd_soc_dapm_supply;
>>>> -	(*widget)->reg = SDW_SDCA_CTL(function->desc->adr, entity->id, control->sel, 0);
>>>> -	(*widget)->mask = GENMASK(control->nbits - 1, 0);
>>>> +	(*widget)->reg = SND_SOC_NOPM;
>>>> +	(*widget)->mask = 0;
>>>
>>> Hmm... yeah I am really sorry I totally overlooked this. Yeah we
>>> should leave the write outside the helper it is much nicer to
>>> have DAPM do it.
>>
>> Not following that comment, there are quite a few codecs that
>> trap a DAPM event, do a regmap_write then wait with a loop,
>> see e.g. rt722_sdca_pde47_event
> 
> If you have a good reason to do the write manually you can
> (typically because it needs sequencing with other writes), but
> generally if the DAPM widget can do the write its better to do it
> that way. Just cleaner.

The existing code I was referring to pre-dates the introduction of sdca_parse_pde()...

It doesn't really need sequencing with other writes, DAPM is used to deal with PRE_PMU and POST_PMD events, it does not deal with register writes in all cases.

> Apologies totally my bad on this I should have realised the
> implications of this change the first time.
> 
>> I haven't seen DAPM deal directly with the write?
>> what am I missing?
> 
> That is what is happening in the above code setting the
> reg/mask/on_val/off_val, DAPM uses that information to do the
> register write.

Since we have two different ways of doing this PDE management, do we need two helpers, one with the write and one without?

