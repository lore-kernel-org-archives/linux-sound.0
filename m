Received: from mta0.migadu.com (out-58.mta0.migadu.com [91.218.175.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415B4426687
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780742; cv=none; b=qsj132Lov3AyuFh1628G9VM1kBMsXyVloIGtAJyCfFPkwv0154uBbA/H6KRKQ2X3jKYKRuQJcyNDwFvDZD6YA6zrVWeeomw/WtygbfSnlS2jmtRv+ej+I4e0jEqq0DHxr8PDXOoSr+YaL7upIHl/wyPybkazaUD19Q4c076wfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780742; c=relaxed/simple;
	bh=INg6VqAtklvciq28q5qGUlhPAHK9C+wvOw+poXjKP5Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hligb8K/UkxxTy22YoKEkONhGDK5+2CbrfHOjXwISe9kaZfhVKl185PNnIB6AURQWmMBLEqTOR+kWp9VVJ1SHhiSpq1JgHHnoOJa1Ue49LDvAVBUjUmJzgAfJcEyIQ3hA4YeIdoIvaXh/SUhbN1V55ZC5NolktVESjMLYtXjxps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mw9nP60h; arc=none smtp.client-ip=91.218.175.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mw9nP60h"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=INg6VqAtklvciq28q5qGUlhPAHK9C+wvOw+poXjKP5Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780738; v=1; x=1789385538;
 b=mw9nP60htUMPSZCQXpDXqMKozh1xnS3OtsDNt7gc5BFGNgWJfIi6DLfpXxg4qAQ6Omvidkwi
 JtcaZxdOecUbd7zOHnsrAdciZttMkxTTWdyfA4i0JtCeUUHB7jg1n+m7CbvTOSzWohy+8QstX/D
 udD8UJv+xI6A9bpjzNHXS0Fg=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ccf605fcea103dc5;
	Mon, 07 Sep 2026 11:32:18 +0000
X-Mizu-Trace-ID: ccf605fcea103dc5
X-Migadu-Flow: FLOW_OUT
Message-ID: <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
Date: Mon, 7 Sep 2026 13:26:05 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 daniel.baluta@nxp.com, Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
Content-Language: en-US
In-Reply-To: <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/7/26 07:25, Péter Ujfalusi wrote:
> 
> 
> On 04/09/2026 22:45, Mark Brown wrote:
>> On Fri, Sep 04, 2026 at 10:31:15AM +0300, Peter Ujfalusi wrote:
>>
>>> The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
>>> dpcm_fe_dai_do_trigger() does it.
>>
>>> +static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
>>> +{
>>> +	struct snd_soc_pcm_runtime *fe = cstream->private_data;
>>>  	int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
>>> +	bool fe_first;
>>>  	int ret;
>>>  
>>>  	if (cmd == SND_COMPR_TRIGGER_PARTIAL_DRAIN ||
>>>  	    cmd == SND_COMPR_TRIGGER_DRAIN)
>>>  		return snd_soc_component_compr_trigger(cstream, cmd);
>>
>> What about SND_COMPR_TRIGGER_NEXT_TRACK...
> 
> That was already missing in the initial patch which added the DPCM
> support for compress.
> 
>>
>>> +	switch (cmd) {
>>> +	case SNDRV_PCM_TRIGGER_START:
>>> +	case SNDRV_PCM_TRIGGER_RESUME:
>>> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>> +		ret = soc_compr_trigger_fe_be(cstream, cmd, fe_first);
>>> +		break;
>>> +	case SNDRV_PCM_TRIGGER_STOP:
>>> +	case SNDRV_PCM_TRIGGER_SUSPEND:
>>> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>> +		ret = soc_compr_trigger_fe_be(cstream, cmd, !fe_first);
>>> +		break;
>>> +	default:
>>> +		ret = -EINVAL;
>>> +		break;
>>
>> ...otherwise it'll end up with -EINVAL instead of getting passed
>> through.  Also a switch statement would be a bit more idiomatic.
> 
> OK, I will add the NEXT_TRACK and convert the if to switch.

ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
'fcplay' application with the '-p 1' argument for gapless playback, not
in the initial cplay application.


