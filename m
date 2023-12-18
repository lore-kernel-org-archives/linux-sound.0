Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3FE18E1A
	for <linux-sound@vger.kernel.org>; Tue, 19 Dec 2023 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJ2hldmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702988834; x=1734524834;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=AR/FTncpP3HZDm6f9IH+uJbJm+jxlPJQsQuijcUY4ak=;
  b=WJ2hldmmoX8+fSuJuyl55196Q+EkNeLG48Gta3yV5v9OsGzYo8W4moXA
   i6uGCUhDzf+5laBslkZHmwbpu0p4f9DDlz9p1OhhlIlTSa0p4JmJusXqC
   4wyBbLz7nlLKAlTdkzD7QNS78iDZaTx53NoUgcLL4vAmpn8bUOBbrexyx
   Vq/amW+fk0YaSlrWQcSL4ecrLKrSs7YhrnSKLKGSPT1P3OzhTjN1xay5R
   YzbC5i/YtNYFvz6Kk0QqhRuoQrv+e2S9GEFe9vetJKaiB/Sdi9u1EmzKA
   L8sLMkycHyhhSBvkGENwOHMM6v6mA6Q7PuoBsm5/LDp/uw598JMcYC7Fc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="14338227"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="14338227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:27:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1107335078"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="1107335078"
Received: from hierlema-mobl.ger.corp.intel.com (HELO [10.252.34.230]) ([10.252.34.230])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:27:08 -0800
Message-ID: <a4bfdc56-b323-4c13-a09e-c0f5baf40450@linux.intel.com>
Date: Mon, 18 Dec 2023 17:33:02 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/16] Documentation: driver: add SoundWire BRA
 description
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org,
 vinod.koul@intel.com, Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-2-pierre-louis.bossart@linux.intel.com>
 <ZYAvoFbEP8RH_x0Y@matsya>
 <a5d0e3a7-e45c-4971-8ad7-7ba19702acf1@linux.intel.com>
 <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231218142946.GZ14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/18/23 08:29, Charles Keepax wrote:
> On Mon, Dec 18, 2023 at 01:58:47PM +0100, Pierre-Louis Bossart wrote:
>>> why not have a single API that does both? First check if it is supported
>>> and then allocate buffers and do the transfer.. What are the advantages
>>> of using this two step process
>>
>> Symmetry is the only thing that comes to my mind. Open - close and send
>> - wait are natural matches, aren't they?
>>
>> We do need a wait(), so bundling open() and send() would be odd.
>>
> 
> I agree send->wait->close would be odd, But you just bundle close
> into wait. So the API becomes just send->wait, which seems pretty
> logical.

Fair enough, send()/wait() would work indeed.

I guess I wanted to keep the callbacks reasonably small (already 200
lines for the open), but we can split the 'send' callback into smaller
helpers to keep the code readable. There's no good reason to expose
these smaller helpers to codec drivers.

>> But you have a point that the open() is not generic in that it also
>> prepares the DMA buffers for transmission. Maybe it's more natural to
>> follow the traditional open(), hw_params(), hw_free, close() from ALSA.
> 
> I think this just makes it worse, you are now adding even more
> calls. The problem I see here is that, open and close (at least to
> me) strongly implies that you can do multiple operations between
> them and unless I have misunderstood something here you can't.

That's right, the open was not compatible with multiple operations.
Collapsing open/send and wait/close sounds more logical, thanks for the
feedback.
