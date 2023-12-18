Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89201A5B2
	for <linux-sound@vger.kernel.org>; Mon, 18 Dec 2023 10:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IU5Q/9IZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702896397; x=1734432397;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nNx8IOyoe9wSKpu7fSaxa0rrkyT5QqLIjrJ8zQSuISg=;
  b=IU5Q/9IZEgKlinNW3W0rte5rCXNpdw4zgXmlmCyYk88booGVDW0Y8x7j
   +w2t/480rimKC4Cy6DfBPSWZ8EkpHExUzJQ9lBifCRjyDDItvmeNeyyaf
   53syJyA/x6PttmWzLaDahcDIHR5fd0wN7cRkbWqdgDDflqbDbE3Mmaln6
   Qmi1O/gSKcDLdYJFai4n4EKZc2OdRtJhv/zgqDyf83mDCXCbq5F5L7zT6
   MWSqbZ/5l6mQwrr9Hr6O5KRCcZtlA/bPxhk/Ip87Tg4T8u9NUvuIjtKSJ
   Ct5qJLy2hfadAcNITEyCRl9Vmg1BCXS2FKf+jsvapDyHAkc6z/ycMhcna
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="8851373"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="8851373"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 02:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="779048167"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="779048167"
Received: from mmaiores-mobl1.ger.corp.intel.com (HELO [10.249.34.197]) ([10.249.34.197])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 02:46:30 -0800
Message-ID: <0511b851-52e3-4e0d-bca1-552b7c79e889@linux.intel.com>
Date: Mon, 18 Dec 2023 11:38:37 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 07/16] soundwire: bus: add API for BPT protocol
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
 <20231207222944.663893-8-pierre-louis.bossart@linux.intel.com>
 <20231212121931.GX14858@ediswmail.ad.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231212121931.GX14858@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/12/23 06:19, Charles Keepax wrote:
> On Thu, Dec 07, 2023 at 04:29:35PM -0600, Pierre-Louis Bossart wrote:
>> This patch suggests a minimum bound of 64 bytes, for smaller transfers
> 
> 128 in the code.

indeed, that's a left-over from an earlier trial. Will fix.

>> +int sdw_bpt_close_stream(struct sdw_bus *bus,
>> +			 struct sdw_slave *slave,
>> +			 enum sdw_bpt_type mode,
>> +			 struct sdw_bpt_msg *msg)
>> +{
> 
> Seems weird to pass the message to close?

It's not necessary in my current solution, but I opted to keep the
arguments aligned.

>> +int sdw_bpt_open_stream(struct sdw_bus *bus,
>> +			struct sdw_slave *slave,
>> +			enum sdw_bpt_type mode,
>> +			struct sdw_bpt_msg *msg)
> 
> Ditto, here does it make sense to pass the msg to open? I guess
> the idea is that one only sends a single message in one
> open->send->wait->close cycle? Would be much nicer if multiple
> send/waits could be done in a single open/close, or if the
> limitation is unavoidable why split out open/send into separate
> calls at all? Just have send and wait and wrap open/close into
> them.

it's needed for the Intel solution, the open() will allocate the
required DMA buffers and copy the data from the messsage into the DMA
buffers with the required formatting expected by the IP.

An alternative would be to simplify open/close but then we have to add a
hw_params/prepare and hw_free steps. I didn't see a need for such a
split, unlike for audio the arguments are not going to be variable.

But yes it's a good question, what exactly is an open/startup callback
supposed to do in ALSA/ASoC?

> 
>> +	if (msg->len % SDW_BPT_MSG_BYTE_ALIGNMENT) {
>> +		dev_err(bus->dev, "BPT message length %d is not a multiple of %d bytes\n",
>> +			msg->len, SDW_BPT_MSG_BYTE_ALIGNMENT);
>> +		return -EINVAL;
>> +	}
> 
> Should this really be here? My understanding is this alignment is
> a limitation of specific hardware so should this check not be in
> the Cadence master code.

As discussed earlier, we *could* move this to host-specific parts, but
then the codec driver would need to know about host alignment
requirements. One of those 'be careful what you ask for' things where
you may have more work to do on the codec driver side...

>> +int sdw_bpt_send_async(struct sdw_bus *bus,
>> +		       struct sdw_slave *slave,
>> +		       struct sdw_bpt_msg *msg)
>> +{
>> +	if (msg->len > SDW_BPT_MSG_MAX_BYTES)
>> +		return -EINVAL;
> 
> Does this check make sense since this was already checked in
> open? I guess the user could pass in a different message at this
> stage, but that I guess is part of what feels weird about passing
> the message into open.

The error check is a big open, we could assume that all the previous
steps were done the right way and skip tests, or we would add a set of
paranoia checks.

The primary intent of those checks is to help the integration of codec
drivers, it's better to get an error code and a clear error message than
a kernel oops because the expected sequence is not followed. Once the
integration is done, those tests are probably not very useful indeed.

>> +/**
>> + * struct sdw_btp_msg - Message structure
>> + * @addr: Start Register address accessed in the Slave
>> + * @len: number of bytes to transfer. More than 64Kb can be transferred
>> + * but a practical limit of SDW_BPT_MSG_MAX_BYTES is enforced.
> 
> Where is the 64kb coming from here?

Ah, this is a reference to the 16 bit address limitation in the regular
read/write commands.

>> +/*
>> + * Add a minimum number of bytes for BPT transfer sizes. BPT has a lot of
>> + * overhead, enabling/disabling a stream costs 6 write commands, plus the bank
>> + * switch that could be delayed in time. In addition, transferring very small
>> + * data sets over DMA is known to be problematic on multiple platforms.
>> + */
>> +#define SDW_BPT_MSG_MIN_BYTES      128
>> +
> 
> Is it really necessary for the core to enforce a minimum transfer
> size (well except for the required alignment thing)? Yes small
> transfers don't obviously make sense, but there is nothing inherently
> wrong with doing one, which makes me feel it is excessive for the
> core to block more than it has to here.

I think it's really better to have a clear design intent that BRA is not
meant for small transfers. It would be opening a can of worms if we
start seeing uses of this protocol beyond the intended firmware/table
download and history buffer retrieval.

> I would be of the opinion its up to driver writers if they have
> some reason to do small BRA transfers. Firstly, since we are so
> keen on allowing BRA and normal writes to overlap, one could see
> use-cases when you want to do something through BRA such that it
> doesn't block the normal command stream. Also there is already 1
> feature on cs42l43 that can only be accessed through BRA, yes that
> is a heroically questionable hardware design choice. Whilst we are
> mostly ignoring that for now, I can see this being something some
> other hardware teams decide to heroically do at some point as well.

To be clear, I would like to allow BRA in parallel with normal writes
*to a different set of registers* to deal with alerts, etc.

A set of registers only accessible through BRA is a very questionable
design indeed. That's not what the SoundWire spec intended and it's not
what this patchset had in mind. You'll have to tell us more on what
exactly the hardware is and does, and how strongly you want this
capability supported...
