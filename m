Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD794EC666
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789824; cv=none; b=V5bc9rzTwj/RJZdc1K3yk6g8eOz7P1H0W3fy5pOTPBUTCHbYVsaGnG8G2gJ+lEavZJJaYY3kaNttEF4qU7gtpWBZ/UX7Cubofl3fdKCBdtKvFGL7+v7JfPpYmhp7SbSvvg3K66Mj4oO3Qucj415Mb4N1HOcBagjMpDG4wKBqu5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789824; c=relaxed/simple;
	bh=eVWpXYJLX99j2DJKvrvyu/39+nvxnsPpmWKBoXfwhTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSGCe7hZHcUtmuKBggW8IEtRcmKyOuBSr5i3JMCC7yGFVyQPEdSDu10oNu9ka+qqyZGeXGoPWSIhoix2Ac1mZvg7lkFyiQuXnyYv0CyGY9hGKiws5wJPhVhtog5PRsREFkU/JcBQUXzMsSzHxakauxTIEadb3h1IlVtpIsK7a2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyAgBkFS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyAgBkFS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788789822; x=1820325822;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eVWpXYJLX99j2DJKvrvyu/39+nvxnsPpmWKBoXfwhTk=;
  b=LyAgBkFSndcBtRE6lvQqyY/jhZKdsDGkuw0vOxK5FQR1z18eDtwHus99
   wPTPRvzDSsP1aad7IIKd/6Ygv/nfBLYex/4UpQzrw/TmPnPoUyfnMiWfI
   XH5cUpGFdrCXzJ2CbHU33ld8v+yMx4lpj8lAVKBtC3k+IxfTyhC05JBT+
   48aYocCF7D4Oc3AfyvOrQTgSO18CNqEiIU0LmtI3K+O7gUHAmbdM7ZDCt
   UrdWbJbSthATYh77fP0y80ZhGF5LqqVJrENOw1xg73xCzvjdS7/pZUZ1H
   UeuNAv2Xmol6zbRFQP9j0msxz+VZSe+ELr9ZMWB91crrobx3EzbiriZOn
   A==;
X-CSE-ConnectionGUID: IdrlLCAlQSOA6szjY1+LyA==
X-CSE-MsgGUID: iUwxO8XwSQaVFTLxIBFwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="88342243"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88342243"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:03:41 -0700
X-CSE-ConnectionGUID: 7/TdQJmASQ2+mjrz8z2dZw==
X-CSE-MsgGUID: o/8qiba9ThW3FIOmtuUpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="267037265"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.187]) ([10.245.245.187])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 07:03:38 -0700
Message-ID: <5b9a199e-abac-4193-94c0-d395329207ed@linux.intel.com>
Date: Mon, 7 Sep 2026 17:03:48 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 daniel.baluta@nxp.com, Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-5-peter.ujfalusi@linux.intel.com>
 <apsf1kjaFG71NpPd@sirena.co.uk>
 <b64906b9-032f-4435-a179-b663f0202796@linux.intel.com>
 <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <361eb4b4-d880-4560-8b71-eeda6f28b43c@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/09/2026 14:26, Pierre-Louis Bossart wrote:
>>> ...otherwise it'll end up with -EINVAL instead of getting passed
>>> through.  Also a switch statement would be a bit more idiomatic.
>>
>> OK, I will add the NEXT_TRACK and convert the if to switch.
> 
> ICYMI for testing, NEXT_TRACK and PARTIAL_DRAIN are only enabled in the
> 'fcplay' application with the '-p 1' argument for gapless playback, not
> in the initial cplay application.

With SOF/Intel/IPC4 we can only support DRAIN, NEXT_TRACK and
PARTIAL_DRAIN are not supported, but there were mismatch between fcplay
and the kernel.
IPC3 does not support DRAIN afaik.

fcplay fix for gaplass and support for restart mode of continuous playback:
https://github.com/alsa-project/tinycompress/pull/33

-- 
Péter

