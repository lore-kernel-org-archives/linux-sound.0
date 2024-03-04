Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9B63D0BA
	for <linux-sound@vger.kernel.org>; Mon,  4 Mar 2024 21:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709587557; cv=none; b=TLHpq/8kWSYiBR7Pu74LBkqK6krhb+NqOMo11R8cc19NFyYucDMEolJw1aYalte6+d3pgUZjklc18KtVUd2mZtj4HY6MiZvITXdVbd/e2q7SdaORcijpMdvR84IH3jB+B+IdAawwP9WAlB74er2yHUoFSbh9XLcEHzL7FD+Nt38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709587557; c=relaxed/simple;
	bh=rv/XfYNi4BvAvBRukdMOjwDjaM7kpgWfrZ72HbgE9Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jrP5buhxEBuQbq4/dccvD9dzpeflsOgLdZmt1TvyIvB2vx/N3Ontts0g3ktGOuPJGEzqCPTY4AwGnC3wRoepZFxdFB2gT8p4k9IQ/+1DU5jJUUwya0BFBU+eII707hqTnPlVao32dOeBQoS0RqashupNfPRyTA3ykqGd3XOJUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K53YNDDc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K53YNDDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709587556; x=1741123556;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rv/XfYNi4BvAvBRukdMOjwDjaM7kpgWfrZ72HbgE9Zk=;
  b=K53YNDDcrpk78XUN/DPkJVe71ugFVmfgYyPAgYFSIYfGXy0nD1keoQXX
   SHVkC0g1vQ6R1Pl3XD/6eimRSVd2Q8eB0GJe25fd/4C4NwJJf69bdEDUQ
   LvBtaZ7MwW0NsqjhRvzJYBmgpbNMioPSM/PmE/+rIHArTpjLb+uEYLjJ3
   QuwsHZHru5D64DGXvwjvV86idZNipu9PfNtT8/6A10Ni0+Ks77NWJjwBb
   QhW0+jBwT6NcCi1rnjK6daEoBwvWckbsf+X2jezXhv0LnWJtBxpRFwH0v
   JKA2sGnG4afnfrj41cjHm73bXdmSIoqX7WPsw244WzgVV+rVRQLgcT9Zu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="3967704"
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="3967704"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,204,1705392000"; 
   d="scan'208";a="40128260"
Received: from cryoung-mobl2.amr.corp.intel.com (HELO [10.212.71.160]) ([10.212.71.160])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 13:25:26 -0800
Message-ID: <50fbb243-ab41-411d-9e3f-b8d9f5574768@linux.intel.com>
Date: Mon, 4 Mar 2024 15:25:25 -0600
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: topology: Do not ignore route checks when
 parsing graphs
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, tiwai@suse.com,
 perex@perex.cz, amadeuszx.slawinski@linux.intel.com, hdegoede@redhat.com
References: <20240304190536.1783332-1-cezary.rojewski@intel.com>
 <20240304190536.1783332-3-cezary.rojewski@intel.com>
 <14a2f9b8-7711-47c4-9f57-bd839c700d4e@linux.intel.com>
 <ea72dd2e-587d-4660-9a8b-da3048819e6b@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ea72dd2e-587d-4660-9a8b-da3048819e6b@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/4/24 14:50, Cezary Rojewski wrote:
> On 2024-03-04 8:32 PM, Pierre-Louis Bossart wrote:
>> On 3/4/24 13:05, Cezary Rojewski wrote:
>>> One of the framework responsibilities is to ensure that the enumerated
>>> DPCMs are valid i.e.: a valid BE is connected to a valid FE DAI. While
>>> the are checks in soc-core.c and soc-pcm.c that verify this, a component
>>> driver may attempt to workaround this by loading an invalid graph
>>> through the topology file.
>>>
>>> Be strict and fail topology loading when invalid graph is encountered.
>>
>> This is very invasive, it's perfectly possible that we have a number of
>> 'broken' topologies where one path is 'invalid' but it doesn't impact
>> functionality.
>>
>> This should be an opt-in behavior IMHO, not a blanket change.
> 
> To my best knowledge, soc-topology.c' first "customer" was the
> skylake-driver and the final details were cloudy at best back then.
> 
> Right now sound-drivers utilizing the topology feature do so in more
> refined fashion. Next, in ASoC we have three locations where
> snd_soc_dapm_add_routes() is called but error-checks are done only in
> 2/3 of them. This is bogus.

I don't disagree that it was a mistake to omit the check on the returned
value, but now that we have topologies in the wild we can't change the
error handling without a risk of breaking "working" solutions. Exhibit A
is what happened in the other places where this error check was added...

> If the intended way of using snd_soc_dapm_add_routes() is to ignore the
> return, it should be converted to void and flag ->disable_route_checks
> removed.

Now that would go back to an "anything goes" mode, not necessarily a
great step.

>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>> ---
>>>   sound/soc/soc-topology.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>>> index d6d368837235..778f539d9ff5 100644
>>> --- a/sound/soc/soc-topology.c
>>> +++ b/sound/soc/soc-topology.c
>>> @@ -1083,8 +1083,9 @@ static int
>>> soc_tplg_dapm_graph_elems_load(struct soc_tplg *tplg,
>>>               break;
>>>           }
>>>   -        /* add route, but keep going if some fail */
>>> -        snd_soc_dapm_add_routes(dapm, route, 1);
>>> +        ret = snd_soc_dapm_add_routes(dapm, route, 1);
>>> +        if (ret && !dapm->card->disable_route_checks)
>>> +            break;

you could alternatively follow the example in soc-core.c, with a
dev_info() thrown if the route_checks is disabled and a dev_err() thrown
otherwise. At least this would expose the reason for the failure after a
change in error handling, and a means to 'restore' functionality for
specific cards if the topology cannot be updated.

>>>       }
>>>         return ret;
