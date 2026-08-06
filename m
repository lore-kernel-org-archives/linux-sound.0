Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866412F6577
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 13:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021445; cv=none; b=RqZfrlABADec9xEEIxfdRIHDSJetVz9iqyhct1nP5LI0dQGGDYbsfddp1I7maQwPjXaOXmFob3CwTIcORZ04JYGkpd9DCg+LQPuSND/qPWW/jziuLTJ1JJG6qTsb+NQBVRsbFFycsesHCGUBwUldW+N+uhLkQ8D8+HbY/6CwSH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021445; c=relaxed/simple;
	bh=YXBbGjqUqsVW4rUpaz7/nrXYuDvRB2EvEVi5K/N1Hks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CV6+3fR7iWUUZhWHO2Ic/E4iIHwXWBEy/h1PtiBY7BxDAxICcyjqXn92ePwErA5QL+1PH2bq9Fm1gBCN8Sr5X44qewOo821kw3w1IGynVMeYCgOIrsjqnT22caQ8JNTUWpP+dHrl/U/IEWJX8hQ3bbPuG+trDad4hMoYlD8RumQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZ9rCSKt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZ9rCSKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786021441; x=1817557441;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YXBbGjqUqsVW4rUpaz7/nrXYuDvRB2EvEVi5K/N1Hks=;
  b=HZ9rCSKtm6ujMj3QKGmKZbChU9Q/KgO+Y9aiibETof74JABazZIi6dCt
   c6/35FzCRCGtT/QG1z4jVmubWiwWDkRb6WZNNIp7pR1RJaF9pkxZVZ3aq
   ROCTXCSY9eGgYgv4dy3ArsvPOgcznTwTLF5r9frWElbIbosS7n1+/6dHQ
   UkMaZ4I0pemVRAitY9TSImW0tgpMVUci/MNCOZMObIi88WGwHBb27PNkZ
   D3m161POaTRKduzBvDppQSAp4PNq3prCGqQN4QE0SDGJrTvwYGJ74uxFB
   FNwlOILRXqQA1KHNz3bik+T3wHFtzBYCqdV5LDiZ7WQPY4t6MzcrOpRZZ
   w==;
X-CSE-ConnectionGUID: 4I8FPPCbTYWIv6F+b9tmyw==
X-CSE-MsgGUID: Ht8RESUfRjCnggcMlbf4og==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86378972"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86378972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:03:58 -0700
X-CSE-ConnectionGUID: 9ixq+BB6SxWWlaOGbeuMsw==
X-CSE-MsgGUID: D/ttpJ/kTs2oGorhuoWLRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="264091954"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.7]) ([10.245.246.7])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 06:03:55 -0700
Message-ID: <c603df64-4f9b-4759-bc6b-ce4fbca4b499@linux.intel.com>
Date: Thu, 6 Aug 2026 16:04:33 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/31] ASoC: SOF: Use auto-cleanup for firmware loading
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-32-tiwai@suse.de>
 <a06c0cde-e321-4fa6-9743-23bf9826edf6@linux.intel.com>
 <874ih7e9mb.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <874ih7e9mb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/08/2026 15:06, Takashi Iwai wrote:
>>> -	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
>>> -				profile->fw_name);
>>> +	const char *fw_filename __free(kfree) =
>>> +		kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
>>> +			  profile->fw_name);
>>>  	if (!fw_filename)
>>>  		return -ENOMEM;
>>>  
>>> +	const struct firmware *fw __free(firmware) = NULL;
>>
>> can we keep this at the head of the function?
> 
> We can, but for the auto-cleaned stuff, it's rather recommended to put
> the declaration at the position that actually starts using it.  Then
> you can avoid the unnecessary handling of the auto-cleanup.

The only mention I have seen is the header and it does say that one
should avoid having the declaration and allocation split _if_ the
pointer is not initialzied, or do it in one line.

Where it will get a bit blurry is when you have
{
const struct firmware *fw __free(firmware) = NULL;

...
ret = something_which_might_fail();
if (ret)
	goto out;

ret = request_firmware();
}

out:
...

> (I don't find whether it's mentioned, though; the documentation about
> the auto-cleanup isn't well organized yet, unfortunately...)

OK, let's leave it as it is, my ack and tested tag still stands ;)

> 
> 
> thanks,
> 
> Takashi
> 

-- 
Péter

