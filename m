Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246119D060
	for <linux-sound@vger.kernel.org>; Tue, 22 Oct 2024 14:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607505; cv=none; b=Kz6z9nTfnQJ+PUjY85hTu8ZPiuiN8XyR2cKrIHKPmCRZmMJaGX9+WkmU3XJyF7khsVp0Zf5V0nsPZt8Jd8wggucUmK1BvFUXPsrAJYK/CwCFVBSy1K7SwgG1w6s3HZgw/2Yq3yTyXLbt5Kti4ky9CGGZHpQCuyyAMvV8783MzK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607505; c=relaxed/simple;
	bh=8df0sSHegyTK/fSGWcBEBoQMPtG31vTZfGR0D2TbPw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jweiI4n6cBrFhkokr3H8zFjSodGPuf98N0QWyW+WMIA38kaOD3iQnOfn42IxK8ZHxJFo3wcZJa9f90AYNKskzTlfV1SSCWIuumXVw2VGiRyq1UtMwmsL/tbqx373hMyODs89plKbuWIzRFaefF10epM2zcqMzoW26rYF+fs0CgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jt/rhPpc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jt/rhPpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729607503; x=1761143503;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8df0sSHegyTK/fSGWcBEBoQMPtG31vTZfGR0D2TbPw8=;
  b=jt/rhPpcKZ1hSeREOzfSmelTG5ypl3FwW+EAAYYzvNtvW1KOcgliJ01N
   ZR9UNchKHr/fSf+qAQ4pxotGOPmTf8hUoHxuswqobq14tprnrSoYyR2vY
   4L+u+mJBXDfQzxUKpcYbfZGMEvW3YvIjWSja7V93cUnvt7lc4hdEeGpMZ
   NXXbke+y2T+TjnngOt6CrsP946Ysp2gmQAkF4h4NDdr/HwUWq6htGbMO1
   YfBf/TSWLPIy15cgvKmqlHV3r+CtWqklPai/A87fEcNJsiBKUl4ZXPlhW
   hBBysA4viDilxdsr5CVx8LOrohhMf/7sd1dW4Pl5pRhCbKHBHrzGqRWQl
   w==;
X-CSE-ConnectionGUID: oR8p0OApSm6RxBh0D/0UOw==
X-CSE-MsgGUID: 6Lm+pRuOR/qIGOMlhRPsUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="29255603"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="29255603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 07:31:42 -0700
X-CSE-ConnectionGUID: kfWnN4RLQn6I1NaYhsDZ6w==
X-CSE-MsgGUID: oWLfVLlkRSy5WBN4+BcDhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="84964821"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 07:31:40 -0700
Message-ID: <aa9a6f72-7ef5-4f60-8afa-086f5f741046@linux.intel.com>
Date: Tue, 22 Oct 2024 16:31:37 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
To: Jaroslav Kysela <perex@perex.cz>,
 Linux Sound ML <linux-sound@vger.kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>
References: <20241002093904.1809799-1-perex@perex.cz>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20241002093904.1809799-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/2024 11:39 AM, Jaroslav Kysela wrote:
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
> 
> For details, refer to "compress-accel.rst" document.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> ---

Looks good to me.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
