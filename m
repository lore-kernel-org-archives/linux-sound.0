Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9201FC110
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789372093; cv=none; b=NoNBFwT650HdUyYczVNshLU3I1Lqk74umo403wo2uq0RAiBFxjTumZtwGCLgGt8zDEhNuWrmaNa/TKOM1auj7KVlJgKs37Y8ZXvpwPX70QFPKzfadsjHcnExbhahdyb2HKEQH3iKwO4+P/ccZCmFdDN54omvjuv6TTs68ZTs51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789372093; c=relaxed/simple;
	bh=TD1VsMw4ljjDBopDcdkpyG+R1TO7dK3Dna4zZBtYNFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K3sFxsKCyju28XhFmWLuFF598w7R41rD6Y+D/IwguPDnWtIDCml5v4/TZDMapA6GSfeMNbMe+kVtP343AGe8QCmR2vvTauS4nQ8Nh/zFaY8v37RdUdTlWQnYlXW1vZq9fTwpdkdbNQ314YgWv+koTMwGFShB7s2nrialP4UT7mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IN3U2j1x; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IN3U2j1x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789372091; x=1820908091;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TD1VsMw4ljjDBopDcdkpyG+R1TO7dK3Dna4zZBtYNFQ=;
  b=IN3U2j1xmehngMXKm+H2H6oz4ZNDWEHDajm7Mpkr1AhSDwJMcmmoSGvc
   nfmel1VzQnhlSWaKegrqcvXtj7E6AiTeoMsgWKQ2MBcPLuacdU7ALLx1N
   7PPNRzeVjoKCte2QeQWNIjPSjI6t0IzjpqTJcanS3rYLpeKinDAWAMQvc
   UG2BEBCzE7GVVTtz+yE+/96DlIPGolmn6LZwvmMt5UYk/y7jQta4taa01
   UEmEms4bUdZxc2H/+GWWZcn/SzANBkuNV2gdMz6K6kGGG868NbjTeDNdv
   fKAb6PkqjTkNF3YdWzFt5GfgAsNV66X0w8BaUOFUzfImps1PKtmBdFBk1
   g==;
X-CSE-ConnectionGUID: X6L/LritT1qhwnliVl1aCw==
X-CSE-MsgGUID: ugiJ/xfjRVyzfmRltDcOIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89734569"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89734569"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:48:11 -0700
X-CSE-ConnectionGUID: YHBqglqoR3SBpQH58TYMxA==
X-CSE-MsgGUID: AZQY6xc1RU6axrafG3A0gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="296064838"
Received: from alekseim-mobl.ger.corp.intel.com (HELO [10.245.245.32]) ([10.245.245.32])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:48:08 -0700
Message-ID: <9112300c-c26d-4fbf-9cde-40fa94c1e880@linux.intel.com>
Date: Mon, 14 Sep 2026 10:48:20 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/26] ASoC: SOF: Add support for IPC4 compressed
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
 <20260911112152.28528-23-peter.ujfalusi@linux.intel.com>
 <aqRpp_AZseE86hhn@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <aqRpp_AZseE86hhn@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/09/2026 23:50, Mark Brown wrote:
> On Fri, Sep 11, 2026 at 02:21:48PM +0300, Peter Ujfalusi wrote:
> 
>> Set and define the compressed ops for IPC4.
>> The initial implementation supports basic features: PAUSE PUSH/RELEASE,
>> DRAIN and progress reporting.
>> Tested with PCM, MP3, AAC and VORBIS codec.
> 
>> +static int sof_ipc4_compr_set_params(struct snd_soc_component *component,
>> +				     struct snd_compr_stream *cstream,
>> +				     struct snd_compr_params *params)
>> +{
> 
>> +	/* Use correct format based on the used codec */
>> +	switch (params->codec.id) {
>> +	case SND_AUDIOCODEC_PCM:
>> +		snd_mask_set_format(fmt, (snd_pcm_format_t)params->codec.format);
>> +		break;
> 
> snd_mask_set_fmt() ends up as:
> 
>   #define MASK_OFS(i)     ((i) >> 5)
> 
>   ...
> 
>   static inline void snd_mask_set(struct snd_mask *mask, unsigned int val)
>   {
>           mask->bits[MASK_OFS(val)] |= MASK_BIT(val);
>   }
> 
> but we have done no validation on the format and snd_mask only has 63
> elements in the array.  That looks like we're allowing writes to go off
> beyond the end of the buffer unless I'm misreading things.

I see, if we do a check like this:
snd_pcm_format_width((snd_pcm_format_t)params->codec.format) <= 0

That would return error with incorrect format ID

-- 
Péter

