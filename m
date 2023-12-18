Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586DC129ECD
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/arZdJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702906750; x=1734442750;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GciV73AtidMVgP+beaXPawHqp9+TU47Y89YlELtHGf8=;
  b=I/arZdJNsdwO9DLpx+F11Bw9WLRJnKEJ9fxMvftShS47Ur0+Cceu+Np+
   BNkog3zuHWEHMZxk19SZFcih5Z7VI/IgdGjJS0Vyu92bKyOExdeUWV0P8
   AG6TLLu2VGTlQM9EScl0TKt2iVy7HNVG9I/mrhnlgynx247b7GLPQ4vQS
   m3CbRdfUhbP0yKBkN6CPA2NOkF3gWL8beuYoY71a+qFJkFfkoqk0fp8yY
   +n4MG4bhF4jGxnb037btBzUfA+IgivrTeoqI3QKKJYSY0aIVJ8FgcxSSP
   34Xd/hcxVET3xk+8iN/u1gIz4H8Vv1OW8M0ZZ9zmIKK2KAJzEcl2yKNme
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8868661"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8868661"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1022753550"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="1022753550"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197]) ([10.249.34.197])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 05:39:04 -0800
Message-ID: <4f66f792-79c0-4221-82b5-a0d9ec5a898b@linux.intel.com>
Date: Mon, 18 Dec 2023 14:12:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 broonie@kernel.org, vinod.koul@intel.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, srinivas.kandagatla@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 vijendar.mukunda@amd.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shuming Fan <shumingf@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <ZYAy9ZM0o3uAk2qY@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZYAy9ZM0o3uAk2qY@matsya>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>> +int sdw_bpt_open_stream(struct sdw_bus *bus,
>> +			struct sdw_slave *slave,
>> +			enum sdw_bpt_type mode,
>> +			struct sdw_bpt_msg *msg)
>> +{
>> +	int ret;
>> +
>> +	/* only Bulk Register Access (BRA) is supported for now */
>> +	if (mode != SDW_BRA)
>> +		return -EINVAL;
>> +
>> +	if (msg->len < SDW_BPT_MSG_MIN_BYTES) {
>> +		dev_err(bus->dev, "BPT message length %d, min supported %d\n",
>> +			msg->len, SDW_BPT_MSG_MIN_BYTES);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
>> +		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
>> +			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
>> +		return -EINVAL;
>> +	}
> 
> Is this a protocol requirement?

No, it's an implementation requirement.

We could move this to host-specific parts but then the codec drivers
will have to know about alignment requirements for each host they are
use with. IOW, it's more work for codec drivers if we don't have a
minimum bar for alignment requirement across all platforms.

> 
>> +
>> +	/* check device is enumerated */
>> +	if (slave->dev_num == SDW_ENUM_DEV_NUM ||
>> +	    slave->dev_num > SDW_MAX_DEVICES)
>> +		return -ENODEV;
>> +
>> +	/* make sure all callbacks are defined */
>> +	if (!bus->ops->bpt_open_stream ||
>> +	    !bus->ops->bpt_close_stream ||
>> +	    !bus->ops->bpt_send_async ||
>> +	    !bus->ops->bpt_wait)
>> +		return -ENOTSUPP;
> 
> should this not be checked at probe time, if device declares the support

sdw_bpt_open_stream() would be called by the peripheral driver (or
regmap as a proxy). The peripheral driver could also decide to check for
those callback during its probe, but that's beyond the scope of this
patchset.

These checks are just there for paranoia, in case a peripheral driver
uses BTP/BRA on a host where they are not supported.

It's not science-fiction, we see AMD- and INTEL-based platforms using
the same SoundWire-based codecs.

>> +	ret = bus->ops->bpt_open_stream(bus, slave, mode, msg);
>> +	if (ret < 0)
>> +		dev_err(bus->dev, "BPT stream open, err %d\n", ret);
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL(sdw_bpt_open_stream);
> 
> can we open multiple times (i dont see a check preventing that), how do
> we close..?

there's a refcount preventing multiples BTP streams from being opened.

> Re-iterating my comment on documentation patch, can we do with a async api
> and wait api, that makes symantics a lot simpler, right..?

see reply in previous email, combining open+send is weird IMHO.

>> +
>> +int sdw_bpt_send_async(struct sdw_bus *bus,
>> +		       struct sdw_slave *slave,
>> +		       struct sdw_bpt_msg *msg)
>> +{
>> +	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
>> +		return -EINVAL;
>> +
>> +	return bus->ops->bpt_send_async(bus, slave, msg);
>> +}
>> +EXPORT_SYMBOL(sdw_bpt_send_async);
> 
> Can we call this multiple times after open, it is unclear to me. Can you
> please add kernel-doc comments about the APIs here as well

This can be called multiple times but it's useless: all the buffers are
prepared in the open() stage. This is the moral equivalent of a trigger
step, just enable data transfers.

> 
>>  struct sdw_master_ops {
>>  	int (*read_prop)(struct sdw_bus *bus);
>> @@ -869,6 +913,20 @@ struct sdw_master_ops {
>>  	void (*new_peripheral_assigned)(struct sdw_bus *bus,
>>  					struct sdw_slave *slave,
>>  					int dev_num);
>> +	int (*bpt_open_stream)(struct sdw_bus *bus,
>> +			       struct sdw_slave *slave,
>> +			       enum sdw_bpt_type mode,
>> +			       struct sdw_bpt_msg *msg);
>> +	int (*bpt_close_stream)(struct sdw_bus *bus,
>> +				struct sdw_slave *slave,
>> +				enum sdw_bpt_type mode,
>> +				struct sdw_bpt_msg *msg);
>> +	int (*bpt_send_async)(struct sdw_bus *bus,
>> +			      struct sdw_slave *slave,
>> +			      struct sdw_bpt_msg *msg);
>> +	int (*bpt_wait)(struct sdw_bus *bus,
>> +			struct sdw_slave *slave,
>> +			struct sdw_bpt_msg *msg);
> 
> do we need both bus and slave, that was a mistake in orignal design IMO.
> We should fix that for bpt_ apis

No disagreement. All the routines follow the same template, if we change
one we should also change the others.

The main question as discussed with Charles is whether we want to pass
the 'msg' argument in all routines.

