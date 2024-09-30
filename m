Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B23E188735
	for <linux-sound@vger.kernel.org>; Mon, 30 Sep 2024 09:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689503; cv=none; b=WKBjToniGmxZOOExscGlyQkZ5KJ6KeuS6aiEM/OJXIQIH+R1lhJWODiwxLnuxBzVvhGVQ1UW95pYuv1T8QsSImfqEpuPWgPDw1P3Nwc2cV4RFOFK2miEym8MMBNEFxgJGoG5SuTllbX2xn4uLwlM/K2WAuJ4hgdSPKWYvR5zGrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689503; c=relaxed/simple;
	bh=Q1AdGozcclP0r+s3Y2IB7CLEYJu+sAnra0/syEMcwxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkcdoDTCzA2957v9ob1DvPq2hAjTP9QBdNYIIugCWJIKmp/U+0qxFWFQGTpGrcnClJwUhajSRiz5YjO/+qArZ8Q18a+lO2+DbcmDvy/nvMx7xvOEUFOrZ6P253MUfa3GXAwFF74Jqz9JxFaITN2fHR2/fr7aZ2Q66ZQN/l2MNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m4FVdwk5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m4FVdwk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727689502; x=1759225502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Q1AdGozcclP0r+s3Y2IB7CLEYJu+sAnra0/syEMcwxE=;
  b=m4FVdwk5pisxcgZKIJUttnVXykhmhAhjF/ldejULIF59X1j5jNEiikwI
   h3D14LKZap3XrhaPtJigAExVD5lA+ZNvtRgUhBCKV5D+cAzIUuJK5nolF
   /zBwrAnKXFN5hfWr5FPxvbmBEvE+s8T6xMoYmcdi2zmYo4+5WfL9ju4v5
   b9qsZH9hY9OJn7X1KDZWjDSCkhBFfUo8gyGV1pmYyIPyBkn+pjxH5W6Xq
   Zxi2n+uEkcEhfxeUxszpO+jAyd+afM1uwtF6ZMetxbgVI6Ksm9b+mYWa/
   vCiypK6Mp55A2fNdeX1ezJH9Ljn88vTN32ISw3pYqmPciJnaDH1TbiaMP
   Q==;
X-CSE-ConnectionGUID: XHRaO/LzTyilhV9ss+tiIg==
X-CSE-MsgGUID: 0ZZZRnbaSju6PuMAq136uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37911148"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="37911148"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 02:45:01 -0700
X-CSE-ConnectionGUID: bLNqx0rMR466jqFYeR3mRw==
X-CSE-MsgGUID: u5YJzkvoT9WLLgb1TqVeXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="77754484"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 02:44:59 -0700
Message-ID: <7b4ddfa0-193e-44a1-a039-1f2fdea0923d@linux.intel.com>
Date: Mon, 30 Sep 2024 11:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] ASoC: intel: remove dpcm_xxx flags
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
 <87ldz9lwgl.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ldz9lwgl.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/2024 4:14 AM, Kuninori Morimoto wrote:
> dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
> xxx_only if needed.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/intel/avs/boards/da7219.c        | 2 --
>   sound/soc/intel/avs/boards/dmic.c          | 4 ++--
>   sound/soc/intel/avs/boards/es8336.c        | 2 --
>   sound/soc/intel/avs/boards/hdaudio.c       | 4 ----
>   sound/soc/intel/avs/boards/i2s_test.c      | 2 --
>   sound/soc/intel/avs/boards/max98357a.c     | 2 +-
>   sound/soc/intel/avs/boards/max98373.c      | 2 --
>   sound/soc/intel/avs/boards/max98927.c      | 2 --
>   sound/soc/intel/avs/boards/nau8825.c       | 2 --
>   sound/soc/intel/avs/boards/rt274.c         | 2 --
>   sound/soc/intel/avs/boards/rt286.c         | 2 --
>   sound/soc/intel/avs/boards/rt298.c         | 2 --
>   sound/soc/intel/avs/boards/rt5514.c        | 2 +-
>   sound/soc/intel/avs/boards/rt5663.c        | 2 --
>   sound/soc/intel/avs/boards/rt5682.c        | 2 --
>   sound/soc/intel/avs/boards/ssm4567.c       | 2 --
>   sound/soc/intel/boards/sof_board_helpers.c | 2 --

That's a bit of weird split, sof_board_helpers.c should've probably been 
with the rest of SOF boards in patch 10? ;)

