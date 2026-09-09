Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ECA2D2488
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936507; cv=none; b=hbXCD6yl1rdYZf5S+zlnV47r4gzRpcX5pLNg2W0CWQVKERVCVsVosN6ImZwOIkh94/Imn2ALSjX9X1CaJ1OMDfVcsMyA290Ar1fuDjQdk8lraOOlgg61vzqDUw8Ip5KIZ9OkJOU17EoScHSG7WKfhh/kUwoCupp9JCHXF908sv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936507; c=relaxed/simple;
	bh=nD2qU7Ke/0DHGdbboCFhjU80yQJ0C5HTFU752GQGefk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ScBHguK+ab0IkWm49/sQ5DHcaby1PNnwciOdIqtI3vtH/KB1CzOEDa1+V4qQhjFQJ4R4Tt97EN7e+l5YvWjtpwjebGIzBSmc5Nryf3QKbyYsdfxeAPgp/iggq4jo4h/iIDTVaBHGC1HQJve3678Z52BVaFZ1u5sav/N8+VNuvrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZQkG8Em; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZQkG8Em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788936505; x=1820472505;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=nD2qU7Ke/0DHGdbboCFhjU80yQJ0C5HTFU752GQGefk=;
  b=DZQkG8Emp58vYCfs10IFOCHdfiIoLKLI7mtRTIPHqmKQhPr5Zc+5MNm4
   c+YouKYH9VA28HfJAmtSaOxhs0usz4qgNzz0vpUn2WWtmVkvgbgnddgFX
   Wasq9wLNBZzmZr7cy37CXtk+uGc/ECk0ytb7Pm0ULDBiytTAEbkQ3N7dD
   9nTGhvQebEYehUwm80zi2kzWmAdqUXICfbtngYRo9Fvhgnk5EqvqDByfp
   dX5ZBhgd7UlDrTWxhssnQDLhMHne5nCb/zwacmuxOtQVn10MECyy1crGw
   nQ30PRjBzYyLkeurSTtmlEWITZFx72LxnArbr9MKi9+PeiBo1N8PjalDX
   g==;
X-CSE-ConnectionGUID: 8du3wCQtTC+qSliYS8MBrA==
X-CSE-MsgGUID: tTvG6YDUT6yD1oFFDyEKBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89390972"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89390972"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 23:48:24 -0700
X-CSE-ConnectionGUID: EXisrGtRSPyos0l3Re1MbQ==
X-CSE-MsgGUID: icuy6bvJRDK8lTvJyy6fPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="275009936"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.252]) ([10.245.244.252])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 23:48:22 -0700
Message-ID: <fe3369a3-3d0f-4b35-b169-8c6c520f72f8@linux.intel.com>
Date: Wed, 9 Sep 2026 09:48:20 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/23] ASoC: SOF: Add support for IPC4 compressed
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com,
 Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-20-peter.ujfalusi@linux.intel.com>
 <apslMqkO9eXK0RL5@sirena.co.uk>
 <571135ef-fb87-4003-b4a1-253582d776a8@linux.intel.com>
Content-Language: en-US
In-Reply-To: <571135ef-fb87-4003-b4a1-253582d776a8@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/09/2026 08:15, Péter Ujfalusi wrote:
> 
> 
> On 04/09/2026 23:08, Mark Brown wrote:
>> On Fri, Sep 04, 2026 at 10:31:30AM +0300, Peter Ujfalusi wrote:
>>> Set and define the compressed ops for IPC4.
>>> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
>>> DRAIN and progress reporting.
>>> Tested with PCM, MP3, AAC and VORBIS codec.
>>
>>> +static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
>>> +				     struct snd_compr_stream *cstream,
>>> +				     struct snd_compr_params *params)
>>> +{
>>
>>> +	/* Use correct format based on the used codec */
>>> +	switch (params->codec.id) {
>>> +	case SND_AUDIOCODEC_PCM:
>>> +		snd_mask_set_format(fmt, (snd_pcm_format_t)params->codec.format);
>>> +		break;
>>
>> Do we validate the value supplied by userspace here?
> 
> On SOF core side we do not, but on the Intel side in
> hda_dsp_compr_hw_params() we might want to fail in case of S24_3LE,
> which is not supported. by hardware.

On a second thought, this is not needed either, we will reject formats
based on the topology information

-- 
Péter

