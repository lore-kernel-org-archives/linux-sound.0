Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1583CB0
	for <linux-sound@vger.kernel.org>; Mon, 29 Apr 2024 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403722; cv=none; b=h8b46FZqTL5Z7xYBqY9aHuhylmH3791GV2JnbBYFx4WcchPi+eNwB2dJ3TmijPXJXgTNhfeWXHApXoKTqdjS8st1FAsawFHD5ZRTq5ZxWkEK858vYkoKCF9E69O5Fy1x6AOcWWQWRGHbYUWFE9W8Yf0jh1J5JbtkYE5VnlDrsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403722; c=relaxed/simple;
	bh=B70cHC5B2+Mi8fKnsDPo/GoKjmjKzMFW4JNazblknHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k18k+KJ15q72QwmECyNXMmPSm0+rLj21MbjeSNXKMb99Taulp6bw1foW8DoBBurR8vE4tKPIwp7Ngw1LoL/HVtkf9bWcgZNahCeImZ5VYcx2bw3d3KWL1c42vIBG6fFAa3R3uaVAHtnBbpsSq2mMExVcAkUYwVx0Q642tTV9rHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtcwBGxp; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtcwBGxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714403721; x=1745939721;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=B70cHC5B2+Mi8fKnsDPo/GoKjmjKzMFW4JNazblknHQ=;
  b=WtcwBGxpV4k1GL3btJVZpfeJH5CNAy4AmFyoiMwjvU748STlp+pFyZlr
   wsYwahUP2Yp28n9p97xZZKzuuKBWKunM5qGr1D3NXR8YrZtzYdHj0SsCW
   62FKUx1XxM34ZWjx9Ci0WKhGn1jnxLJzrkvyIUJbuee3NLDf0Z0tyakil
   Q2DCLK9uPQ/tuhdXTapBevZfAG4KEv5AnqniH5VoPP1E+soNcLKwszqax
   u1djItJ0lnwaBPnTlLmfOLcEbK2zYfRGjy4NTh8+8m6lkSmkF4wFzLgf2
   v4A/KBIEyo+VUT5/oLz7KsdPVQwPFHp0LIUaz8GXZX19j/7oUYQSv7Zuu
   w==;
X-CSE-ConnectionGUID: 5M22FzNiQYuZ91lGhs0qgQ==
X-CSE-MsgGUID: UwaJftxiQ4e6EV0neKJNNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="9945183"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9945183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:15:20 -0700
X-CSE-ConnectionGUID: u85Xn9esQbiNAOHLNB2I7Q==
X-CSE-MsgGUID: uvcJBmBaTs+Er142l9OU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30587851"
Received: from pingchan-mobl.amr.corp.intel.com (HELO [10.212.49.248]) ([10.212.49.248])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 08:15:20 -0700
Message-ID: <8c87a931-9e9b-4922-a126-867da5e0b3df@linux.intel.com>
Date: Mon, 29 Apr 2024 10:15:19 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: intel-sdw-acpi: fix usage of
 device_get_named_child_node()
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20240426152731.38420-1-pierre-louis.bossart@linux.intel.com>
 <874jbkp5zz.wl-tiwai@suse.de>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <874jbkp5zz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Takashi,

>> The documentation for device_get_named_child_node() mentions this
>> important point:
>>
>> "
>> The caller is responsible for calling fwnode_handle_put() on the
>> returned fwnode pointer.
>> "
>>
>> Add fwnode_handle_put() to avoid a leaked reference.
>>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Can we have a corresponding Fixes tag?

Good question.

The initial code was in

6d2c66695bf3 ("soundwire: intel: transition to 3 steps initialization")

but then moved with

08c2a4bc9f2a ("ALSA: hda: move Intel SoundWire ACPI scan to dedicated
module")

I guess a Fixes tag for the latter is good enough, it's a 2021 commit
and that would probably cover most SoundWire platforms.
