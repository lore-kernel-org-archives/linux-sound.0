Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9854341D4D0
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 06:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789108307; cv=none; b=TqmQyfjaXk2u7vkb63yVvTZCWNf5QuwbwopUedhiXTp1/SB/2kSAj3TxlXz1ZvT8UQDcmdWYzhkl0WWx1QYYQfEUAmh1XPDl5jpTcG/Ac2uy9sNuvZsJGEKh4hXblpv864mwin7R000oMqlyJVjnrn8/xjqsVdIrhBfbhRc2oRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789108307; c=relaxed/simple;
	bh=+J5VSXuO5GctXIp5wrXhWp9wUaFQTQEgyQOeMWHO0oI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuH5So5zTD4bZgqA2Q6LUrTZr6k6/XHlnw5Z5DjkaN5dxvkrqoNzC//IQpD5gVqr84ElbBKAOyCFUWEvphVxqVLPZsYM4olwnEbDtQUnDxydXavtPzebSBTv79raN0sQdaxWn5oQ2BSxe2WZWK+C24wQF0fyjWUspk3/feGpDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AeT3znSX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AeT3znSX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789108302; x=1820644302;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+J5VSXuO5GctXIp5wrXhWp9wUaFQTQEgyQOeMWHO0oI=;
  b=AeT3znSXAIebUmwo+jYZI8SFK2HcFC7NNxl3rboPwbCRKETdXtSifPi/
   mqfLgBIoY1REW8vUY0mvuGB418gXkPFcfui/w2CHWxgc6+qrYgcAiZn0n
   0azfpzSJrbKyaBFp+bEm8NZSOx3Jm7p0sv3Olv9hvxsr2G0ueIbfZd07f
   fXOOg48o/lTc4uOd2OfW1aEj+qWlKNNQhXSuit4ZClMkA6DvpXO5Tj8r9
   K01rN11ntB8aY2TnqfoCjDLnAb0KmdFJsc5XpVbHCqEpCfadBhiUxOgU8
   LUcRGB50D2y2SC79R5MfVvIlVbR3DSlqLb6KCMBXa5yepnAJr0g0JBz/M
   A==;
X-CSE-ConnectionGUID: LyjK7WT7SLyrUfUPz4Y8lw==
X-CSE-MsgGUID: Knu69vveSKy4iXIAoKb8YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="99899595"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="99899595"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 23:31:39 -0700
X-CSE-ConnectionGUID: HaBaESAuSziN8D6xDzOxaQ==
X-CSE-MsgGUID: r0R65f8rQU2MLbpY1AFYJw==
X-ExtLoop1: 1
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.83]) ([10.245.244.83])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 23:31:37 -0700
Message-ID: <3a0e5da9-0971-4136-af9c-45e1bca48861@linux.intel.com>
Date: Fri, 11 Sep 2026 09:31:47 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/24] ASoC: SOF: intel: hda-stream: Clear the current
 position when releasing stream
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-13-peter.ujfalusi@linux.intel.com>
 <f0dfb60a-27e4-40e6-8ba4-401634ef7fd7@linux.dev>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <f0dfb60a-27e4-40e6-8ba4-401634ef7fd7@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/09/2026 15:45, Pierre-Louis Bossart wrote:
> On 9/9/26 11:09, Peter Ujfalusi wrote:
>> From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>
>> After the host DMA ID is released, reset the curr_pos to 0 for a clean
>> start for subsequent stream starts. This is not needed for PCM streams
>> but for compressed streams.
>>
>> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
>> ---
>>  sound/soc/sof/intel/hda-stream.c | 1 +
>>  1 file changed, 1 insertion(+)
> 
> move to preparation patch to reduce the volume of this patchset?

The reason I kept these together instead of sending them separately is
that on their own they lack the context: all of them are needed to get
compress working via IPC4 in a more open ecosystem.

The ALSA and soc-compress patches alone can be NAKed on the grounds that
things work right now - that's my assumption at least.

The SOF preparatory patches are in the same bucket: things work fine,
why do the churn?
In the context of compress they make sense, as there are several system
level differences between how PCM and compress work and the code we have
is perfectly fine as long as it is confined to PCM.

Splitting also raises a dependency tracking question between the series.

I can do the split if you prefer, but the flip side is that the core
changes would land without the users that justify them. FWIW the series
has been tested with IPC3 as well, so the soc-compress changes are not
Intel/IPC4 only in practice.

> 
>> diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
>> index c95230487a1b..5097a497188d 100644
>> --- a/sound/soc/sof/intel/hda-stream.c
>> +++ b/sound/soc/sof/intel/hda-stream.c
>> @@ -317,6 +317,7 @@ static int _hda_dsp_stream_put(struct snd_sof_dev *sdev, int direction, int stre
>>  		if (s->direction == direction && s->stream_tag == stream_tag) {
>>  			s->opened = false;
>>  			found = true;
>> +			s->curr_pos = 0;
>>  			if (pair)
>>  				link_stream = hext_stream;
>>  		} else if (!(hda_stream->flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE)) {
> 

-- 
Péter

