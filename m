Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEAC23EAB3
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 05:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451381; cv=none; b=b04DCvtghdwuXCzqDxnWugYgMDYOADqTKNRSs7PLqzrjF7GtL4HN7sUXLNC3jNQMumB96docXPa4stKKGpdJGWTH9w3wBt4gn5iWuPlmwwXKc1H5pyGC5T9YfmAXehvWBbFEqc6u0QiecqyJGayHAVRVY7HLO9ujErkxj92nnvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451381; c=relaxed/simple;
	bh=l+3QHRncoILm3N7IaDd/iHYsMXXyCHGho0b7Gk/lsa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPyMqLEk0b0O/fM+fZlg5XDkI/7vp62oAPAFoUNYNKSJsbtLaWUM5QfTb6FbHQxG7LJLNM2LlmywrSUdesZQfg3GXmCAFAG2bBsp9XjdPlfnnRMzOwztmJSRLu0P66nUg93x+KpdZxiI2J8pPYBcO9xvE++IZFXX6v855OoFiJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jRsXJhrn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jRsXJhrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789451379; x=1820987379;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l+3QHRncoILm3N7IaDd/iHYsMXXyCHGho0b7Gk/lsa0=;
  b=jRsXJhrnwLiFTWWY8lJKeFbmikC2Y1I8DLGP7R0vfkQUAHTKPvqNKZgS
   b/DLygYPPZrrna7XOJD9gF9NbJxCLEb9N6R/AAimD9LMZDQrvXoexzRoe
   btnyQHa4TYB37Czx4wq/+9INiMj4osHJ5SYM8mwuSEPkwWehoaRm/SJ78
   Mjwfr4y+6nZd6SZAnuU9JpuLFPFoRdWmgazbsO4pqab6/tcEUkyR0AxLv
   I/huJGoA3FoM/KZtDLxDaU9+1JqS9MZbCS+eNV76ilHqQhCnLgrgntNOU
   6vNtyXKtS1DtZkOikMqLUF9faaxXkeivBMP94qH0WZqM9jX19kh6qgkfZ
   w==;
X-CSE-ConnectionGUID: A4M/7y3mRpiNnKH/bmqg9w==
X-CSE-MsgGUID: QlSn/S5HS8O+tliHi4VpkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92315270"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="92315270"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:49:39 -0700
X-CSE-ConnectionGUID: 7jiuk3IGQ3aXld8xSynmTg==
X-CSE-MsgGUID: liK8iSB0T2CopzH9ikYkAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="278131020"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.194]) ([10.245.245.194])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 22:49:36 -0700
Message-ID: <f86a27ae-83ab-4a0c-8560-86f0ab2143f3@linux.intel.com>
Date: Tue, 15 Sep 2026 08:49:48 +0300
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
 <30950a7e-25ea-4b32-94ee-70c7357ffcaf@linux.intel.com>
 <aqhEqOUf90j9YDzu@sirena.org.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <aqhEqOUf90j9YDzu@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 14/09/2026 22:02, Mark Brown wrote:
> On Mon, Sep 14, 2026 at 10:28:41AM +0300, Péter Ujfalusi wrote:
>> On 12/09/2026 00:01, Mark Brown wrote:
> 
>>> tuple->size can be 0...
> 
>> It cannot be 0, the tuples are built in firmware and they are guarantied
>> to be correct.
> 
>> I guess I have added this check based on comments, but I would rather
>> remove them.
> 
>> s for the specific CODEC_INFO, it is also granted that the tuple->size
>> is not 0:
>> https://github.com/thesofproject/sof/blob/main/src/audio/base_fw.c#L111
> 
>> In fact, all tuples are added in a way that the size cannot be 0, but
>> the check in the code is incorrect, it should be:
>> if (!tuple->size || tuple_size > sof_info_size - offset) {
> 
> It's not always super clear when reading a diff what's being parsed
> from a file loaded from disk (which could just have been corrupted) vs
> what's been sent from the DSP.

True, I will relocate sof_ipc4_query_fw_configuration() and it's static
dependency to ipc4.c, there were a reason why it ended up in loader file.
If I recall it was that this is the past part of the fw loading/booting
sequence where we read back some information from the booted firmware to
see what it can and cannot do in it's current form.

I will do that later as separate patch.

About dropping the tuple size checks: adding a comment that the data is
coming from a trusted source might be better.
As you have pointed out we check the tuple, but don't check the
codec_info, so it is a mismatch, gives half backed feel.

I a tuple is found, it is given that it's size is correct, tuple with
size=0 cannot be present.

-- 
Péter

