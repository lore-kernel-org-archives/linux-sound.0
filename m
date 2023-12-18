Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6F19BCC
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ltj8GEYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702896403; x=1734432403;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mcPSUOAGjfY08Qx2cmJ9a57p94qEa9iM9JCFVofj1Ck=;
  b=Ltj8GEYPJOgCwI4/N02yqIh2tLDXimaEHnv4TiZYlj/Oi7LETR1EUbRr
   P1xL2ZqAItGhUEVf914bEey2jgoPIv3KaMlEFISJ6zH6d+gkpAtJ9VsDx
   UxQsZ3xeRppOaoSUblklT6//p71elr13AOvvplBdL5NU7+H3PWQfwXCUG
   /OLxfkKSQA0dTY8FguNwC7pbzYFqy67SWBMzZLszeEoUJ94I/wQ8kLENY
   4xqu9k0IhLKpxHDR7aCIrmb4+HD1VIcrBaopzsiRBPojeYrxj9VGWWt/d
   LLIGH4vaPCgNC7W/Qnu3LE5svoiIyfMUGqEMzOM93ozCyQquC9qOL4/Vw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8851378"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8851378"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 02:46:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="779048192"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="779048192"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197]) ([10.249.34.197])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 02:46:37 -0800
Message-ID: <d4e93e28-2b7b-48e8-a7bc-698916446b60@linux.intel.com>
Date: Mon, 18 Dec 2023 11:45:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/16] soundwire: stream: reuse existing code for BPT
 stream
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-7-pierre-louis.bossart@linux.intel.com>
 <20231212123045.GY14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231212123045.GY14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/23 06:30, Charles Keepax wrote:
> On Thu, Dec 07, 2023 at 04:29:34PM -0600, Pierre-Louis Bossart wrote:
>> DP0 (Data Port 0) is very similar to regular data ports, with minor
>> tweaks we can reuse the same code.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> ---
>> -	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
>> -					  s_rt->direction,
>> -					  t_params->port_num);
>> -	if (!dpn_prop)
>> -		return -EINVAL;
>> +	if (t_params->port_num) {
>> +		struct sdw_dpn_prop *dpn_prop;
>> +
>> +		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
>> +						  s_rt->direction,
>> +						  t_params->port_num);
>> +		if (!dpn_prop)
>> +			return -EINVAL;
>> +
>> +		read_only_wordlength = dpn_prop->read_only_wordlength;
>> +		port_type = dpn_prop->type;
>> +	} else {
>> +		read_only_wordlength = false;
>> +		port_type = SDW_DPN_FULL;
>> +	}
> 
> Would it be nicer to just add a special case sdw_get_slave_dpn_prop
> to return dp0_prop and avoid all this special casing in the rest
> of the code?

There are multiple cases in the same function where we need to check for
DP0. We could move the read_only_wordlength and port_type to the
sdw_get_slave_dpn_prop() helper, but then we would spread the special
cases in multiple locations. It's not pretty either way.


