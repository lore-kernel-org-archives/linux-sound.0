Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7A8391E44
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370914; cv=none; b=naSY8LRY4G8dCCaB/LZODKBF1KyZSaLJ3pgJm6ZXBm8I4efNVqNbGMydN1WJyT1mfJIHHZ9fR27NGwzFLylpBL9fStXKOOKeuAXM6cdF2joO49lMA8iozlt4X6nPsmOYOUPBvY60Jv8BOiTo8owZc9KOhfnAqQDAFBvYItj27ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370914; c=relaxed/simple;
	bh=3ax/ymwZNx8xLZo6Y0czXfjEBbuwpeapWRjEeLMiiuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fHsvrz6a/LhWpLM+o4rwMrtZFb+cGJa4x8QbGV7de+38dBQj+jEAeCqrGksSRWj61PW75VrawHwwfiveekejrKtO+13coyozWK4Czy2EV0xaWr9OE+BpWWmH4l4WG0Jy5V3xI6HDaZDKgWzFECX0MdKP/tfoLVhzXR8Z3C9IHPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llIYbGSl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llIYbGSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789370912; x=1820906912;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3ax/ymwZNx8xLZo6Y0czXfjEBbuwpeapWRjEeLMiiuU=;
  b=llIYbGSldLKH9WpKb/5R3+1wda0koSYiM4T7aOPTlmNfNDBI3dT/Jcn7
   rJWebResrqygUJbhrDBuZS2ir/i0aGoapnxP63qsN5P9wfAI1l2Rbqyz/
   NAqZMXaIWuHA1c3FuktSEC2r9FXwvZUritX8KTEk27EJb61a7uPQMg8jo
   PuEosulW9MdxXUrJG4Deb5ngWn46EMblYL2yAPi35F8NaiuWuckeQZN8M
   1U9MnH3jAK4JkYn78nVpKVQ3oLzdcgWQZdrlE/w9I2WVUWzPBObXJGZeM
   hSuM2zrZCd2IMMw6f/8OEZFTqSgJ/IpLWLzyTLsQH3YXZzXlzxVVm/keg
   w==;
X-CSE-ConnectionGUID: Mkt5OQH1R4Wp4JkpBB01nQ==
X-CSE-MsgGUID: NregeQiXQlWyZElioyn7YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="92231064"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="92231064"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:28:32 -0700
X-CSE-ConnectionGUID: bQBIxncKQVC7peuAgLt3vQ==
X-CSE-MsgGUID: 1fuw2iZ2SSmmdLuSvWalOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="269284808"
Received: from alekseim-mobl.ger.corp.intel.com (HELO [10.245.245.32]) ([10.245.245.32])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 00:28:29 -0700
Message-ID: <30950a7e-25ea-4b32-94ee-70c7357ffcaf@linux.intel.com>
Date: Mon, 14 Sep 2026 10:28:41 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/26] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and
 CODEC_INFO to fw_config_params
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
 <20260911112152.28528-19-peter.ujfalusi@linux.intel.com>
 <aqRsL8fZercsabgU@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <aqRsL8fZercsabgU@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/09/2026 00:01, Mark Brown wrote:
> On Fri, Sep 11, 2026 at 02:21:44PM +0300, Peter Ujfalusi wrote:
> 
>> +static int sof_ipc4_query_sof_info(struct snd_sof_dev *sdev,
>> +				   void *sof_info_data, u32 sof_info_size)
>> +{
>> +	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
>> +	struct sof_ipc4_tuple *tuple;
>> +	size_t tuple_size;
>> +	size_t offset = 0;
>> +	int ret = 0;
> 
>> +	while (offset < sof_info_size) {
> 
>> +		tuple = (struct sof_ipc4_tuple *)((u8 *)sof_info_data + offset);
>> +		tuple_size = sizeof(*tuple) + tuple->size;
>> +		if (tuple_size < sizeof(*tuple) || tuple_size > sof_info_size - offset) {
> 
> tuple->size can be 0...

It cannot be 0, the tuples are built in firmware and they are guarantied
to be correct.

I guess I have added this check based on comments, but I would rather
remove them.

s for the specific CODEC_INFO, it is also granted that the tuple->size
is not 0:
https://github.com/thesofproject/sof/blob/main/src/audio/base_fw.c#L111

In fact, all tuples are added in a way that the size cannot be 0, but
the check in the code is incorrect, it should be:
if (!tuple->size || tuple_size > sof_info_size - offset) {


> 
>> +		switch (tuple->type) {
>> +		case SOF_IPC4_SOF_CODEC_INFO:
>> +			ipc4_data->codec_info = devm_kmemdup(sdev->dev, tuple->value,
>> +							     tuple->size, GFP_KERNEL);
> 
> ...and devm_kmemdup() of 0 returns ZERO_SIZE_PTR which crucially is not
> NULL so things that later check that codec_info is set see that it is
> and try to dereference it.  We should probably also check that the count
> in the codec_info isn't oveflowing the buffer.

We trust  the firmware provided information. If we cannot trust that
then we cannot trust on the size / count it provides either and there is
nothing that we can validate.

We don't have tuple size checking for fw_config or hw_config either.

To have a compromised fw booted it involves obtaining a secret signing
key to sign the compromised fw and a root access to actually deploy to
the system.

-- 
Péter

