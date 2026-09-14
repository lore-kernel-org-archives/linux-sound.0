Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22493998AE
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 08:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374935; cv=none; b=SCKCzeqOJkUA0jyBky8qnOWnN5g3ht+NMCX3mW0r+zKN/w1/8UyiarorEdtmok7DifuCM4hjFv3EmabK9fz2YYSETnaP+aObkZ+Ww9pgUGkIeL3r29kgJx/1GzVaT0lqoCSgoJAz8DGqBn97vfxBcL5uPUNeT2Ux40ULAqe5foI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374935; c=relaxed/simple;
	bh=/rp1MF7X8aRq6mGX5E0hMcu901ncFIsshYOcg4ln0PE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pfGFr2iS3Dknx30Dlrt2FoaszOFBodPp/TzYiEbkrvfRFeUIso/PRKJRkq9GuR4Og1+ceTmGlM5lEg2h5KKIFXI25TF6PSje9xugaSlXvFQQvmpWq9dF6bOHQ9J9QMOjUU6w+WEGKW0O72yi7goKmXJ+HdBm5p75nqk4R27P3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpVNNPiV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpVNNPiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789374934; x=1820910934;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=/rp1MF7X8aRq6mGX5E0hMcu901ncFIsshYOcg4ln0PE=;
  b=fpVNNPiVlltUpB4Ezye59PKQegzWGcGB8DgmUJFQ3Zzub2E4IIUWn6uX
   Mh625NVnC7ZrWBdBcDO6pzsXPAybDQ0sZwzreXrJx6HiMYpdUV9J6yZv8
   aRpqmeUsNtL3qPysrLxqCvUkNKpEj0t8SDwZFN8Vbxko/PPqanQvug9W9
   W8OjS4n/suxLj+hJsEUCHplltMxK6e7/BTxOvAJl1N1+I+1mKNM5R4TwC
   TIG5LcijjBeknCRJZcHqMqpuoBLZSEGbOR+vx2OeWNlO0W/F8zWAnbf3N
   9mjN9NeJqZQ8nNw4libnnCy5tk/c+G6ZNbQ6jX9ACIeLOvFwwMxyY/WsO
   g==;
X-CSE-ConnectionGUID: xg8Y3OpWQ867pg2bJkaKUg==
X-CSE-MsgGUID: s+YzVrVOSAynQvqa12knaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="100318827"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="100318827"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:35:33 -0700
X-CSE-ConnectionGUID: +TUbYSpWTu+lkBuY7MoHxw==
X-CSE-MsgGUID: 9mZ+XywlRySNj6nxGIM5Zg==
X-ExtLoop1: 1
Received: from alekseim-mobl.ger.corp.intel.com (HELO [10.245.245.32]) ([10.245.245.32])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:35:30 -0700
Message-ID: <5a2075f9-a96d-4fca-8f8d-39129e42a23d@linux.intel.com>
Date: Mon, 14 Sep 2026 11:35:42 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/26] ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and
 CODEC_INFO to fw_config_params
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
References: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
 <20260911112152.28528-19-peter.ujfalusi@linux.intel.com>
 <aqRsL8fZercsabgU@sirena.org.uk>
 <30950a7e-25ea-4b32-94ee-70c7357ffcaf@linux.intel.com>
Content-Language: en-US
In-Reply-To: <30950a7e-25ea-4b32-94ee-70c7357ffcaf@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/09/2026 10:28, Péter Ujfalusi wrote:
>>> +		tuple = (struct sof_ipc4_tuple *)((u8 *)sof_info_data + offset);
>>> +		tuple_size = sizeof(*tuple) + tuple->size;
>>> +		if (tuple_size < sizeof(*tuple) || tuple_size > sof_info_size - offset) {
>>
>> tuple->size can be 0...
> 
> It cannot be 0, the tuples are built in firmware and they are guarantied
> to be correct.
> 
> I guess I have added this check based on comments, but I would rather
> remove them.
> 
> s for the specific CODEC_INFO, it is also granted that the tuple->size
> is not 0:
> https://github.com/thesofproject/sof/blob/main/src/audio/base_fw.c#L111
> 
> In fact, all tuples are added in a way that the size cannot be 0, but
> the check in the code is incorrect, it should be:
> if (!tuple->size || tuple_size > sof_info_size - offset) {

if the check is to be kept then it should cover the overflow:

	if (!tuple->size || tuple_size < sizeof(*tuple) ||
	    tuple_size > sof_info_size - offset) {

The codec_info remains trusted data.

-- 
Péter

