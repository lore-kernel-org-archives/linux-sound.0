Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8C53EF0A0
	for <linux-sound@vger.kernel.org>; Thu, 23 Apr 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776949287; cv=none; b=j3gf8MGHGpYpenbxzW6Tl+HDaxcN1UKi1tZpbKg/PdsDSAdk6EdOlBNmXMxVgFJJVek5W3UQf7vigEeRF1boPUoo3kQNzvUHTZQs8EFKtikZgQ7bRrqpUkrsSLAnjSlHAOu1QzLiPeHjvkQ6X3tIVMfDNC5UuzWQ9GjdP3e/YUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776949287; c=relaxed/simple;
	bh=GLLyhq8DMxwH/bN06srUFSVE2jJWYRAPIworfqBdDOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1GElw6G8E5hX0IPkJsQp/GGZAPmoHLZS08EyqPGgYj9ptdi/Y8XEUbrKrjK71SwviOLoyMa4YbnNkGy5lAPc41GK983jyZTg1pcKcKIWIWwLKHQVGO/1/5ZZ5y5D8hAmpnf5dSnW9/X10djwR2OiEp0IKH2TKmkGjL/zidCFe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YmJqqFwa; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YmJqqFwa"
Message-ID: <3db73eda-d7e2-4494-8efb-98d93b9268b9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776949283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYeUYXYJw3tnmickFcsi/KmOOQsfRGtwOmK9TMbLWdc=;
	b=YmJqqFwa86kYHOV/pXtyRv+NAuZrAeviIcm34MFzb7a38J/Kly4roumqI2Jo6jhd9x+Mb8
	qG03JeX1xZ/bjvO35KOKcXLF1H0oav7LKn8ANiJsvqiW6gv1l8qYzcKxwj4otKf9swpu3r
	Mz/No0K1w38xY7sCVLe4NAsKb47pCsI=
Date: Thu, 23 Apr 2026 14:47:45 +0200
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
 <5daa3c5c-efeb-48d7-91b3-99e47f54894b@linux.dev>
 <aend22OeU/96DrBN@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <aend22OeU/96DrBN@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 4/23/26 10:52, Charles Keepax wrote:
> On Wed, Apr 22, 2026 at 07:56:09PM +0200, Pierre-Louis Bossart wrote:
>> On 4/22/26 10:26, Charles Keepax wrote:
>>> On Tue, Apr 21, 2026 at 06:21:09PM +0200, Pierre-Louis Bossart wrote:
>>>> On 4/21/26 17:57, Charles Keepax wrote:
>>>>> On Tue, Apr 21, 2026 at 09:18:01PM +0530, Niranjan H Y wrote:
>>> That is what is happening in the above code setting the
>>> reg/mask/on_val/off_val, DAPM uses that information to do the
>>> register write.
>>
>> Since we have two different ways of doing this PDE management,
>> do we need two helpers, one with the write and one without?
> 
> I would really vote for just the polling helper, most of the time
> the register should be written by DAPM and for drivers that don't
> those drivers will likely be writing a bunch of other registers in
> the event handler anyway so what is one more.

I don't really see what drivers could possibly do between writing REQUESTED_PS and waiting on ACTUAL_PS...

They may have other registers to tweak *before* or *after* the sequence, this two-step power sequence doesn't really offer much room for interleaving other commands.
FWIW, this sort of sequence is exactly the same for HDaudio, you set the desired power and wait for it to be reached. We never did anything else in the mean time..

At any rate, not going to lay on the tracks for a helper. Fine if you want to keep the write to REQUESTED_PS out...
