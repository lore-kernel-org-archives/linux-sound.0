Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412343F8D0
	for <linux-sound@vger.kernel.org>; Fri, 22 Mar 2024 11:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711107039; cv=none; b=PeEI8LDP6x/AkBC7JlwpvOI7XghST5Kvwv1Wsxj1MICv7B8zJ3+xKa/LHRhEDuMLpzFnQtHHDQm4L9kplcDepBfnw6cATZds9lI6u190atBtD1Qiy2vE0Wd/rfVl4OGsaUeZl8JJITMR2Yuagm6djPyUycJ4ELe2udMo7d3B3UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711107039; c=relaxed/simple;
	bh=+QPNseh8J77DItgsgk3EhdQKJhe92gJ3314dglV2RPI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nhdn0D90iJPU8RIlJ/Hvrbz/1T3KlRk3gQFLCvYbkMd4ZVtmqERmOlp1aPbJNvqwSd3WUO1mYwY3WSDi3LsDSHzvlS1r4TsQzsvJduzddC97FpDpIon+CS44UQy/7oyuKk+G4tFZ0n5gkEIjOIA3SxJ/VsEoJ0oNc1299rwbSjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+Sw5RqO; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+Sw5RqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711107038; x=1742643038;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=+QPNseh8J77DItgsgk3EhdQKJhe92gJ3314dglV2RPI=;
  b=J+Sw5RqOPpTyVCZNqX8adcnSbDq0ZwqEd9YWsM6NHmKC6y8Vjz3pxDws
   kEncvy4CMjvtbrY0mgDRG/JIOoSVUvZKGQ7RiSVr7FqIj1fLXVixiQOLV
   JtKh55RUAJVpQbfOmMfHEIEqwl9ttjfFJJJKgzOmyrg+ztDBs5z3zxL8F
   XEDNwedxtAxCK6dzjlyrpDJa7vUig+4Qsuem7MI/gX+p6Qw798DNoyycN
   bSAz+5k9FQcV/uQTDHvh1E45BWieH8MmR9DexyPPr+MaNOfDGEyAaVlPY
   eKWTOLunVZWgwk7ASTKEPYVpEhbAE9tjwb9KzPXw0xFEyOBKdcfM1muBB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="9102546"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="9102546"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; 
   d="scan'208";a="15288036"
Received: from kridax-mobl1.ger.corp.intel.com (HELO [10.249.32.117]) ([10.249.32.117])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 04:30:35 -0700
Message-ID: <ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
Date: Fri, 22 Mar 2024 13:30:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Takashi,

On 27/11/2023 14:06, Peter Ujfalusi wrote:
> Hi,
> 
> SOF always passed 0 as dev_type to intel_nhlt_get_endpoint_blob() when looking
> up the blob from the NHLT table. This causes issues since alsa-utils commit
> 3a47ef2487ed ("topology: nhlt: intel: support more device types and directions")
> 
> The dev_type is no longer always 0 in the topology embedded NHLT table resulting
> lookup failures for analog codecs since they will have dev_type=4.
> 
> With SOF the dev_type is not used, we always use the SSP port index for looking
> up the configuration blob.
> 
> The solution for the issue is to fetch the dev_type for the SSP port and feed it
> back to the intel_nhlt_get_endpoint_blob() to be able to find the configuration
> regardless of the assigned dev_type.

Can you take these patches via the ALSA tree, I have hoped that it would
land in 6.9.

Thank you,
Peter

> Regards,
> Peter
> ---
> Brent Lu (2):
>   ALSA: hda: intel-nhlt: add intel_nhlt_ssp_device_type() function
>   ASoC: SOF: ipc4-topology: support NHLT device type
> 
>  include/sound/intel-nhlt.h    | 10 ++++++++++
>  sound/hda/intel-nhlt.c        | 26 ++++++++++++++++++++++++++
>  sound/soc/sof/ipc4-topology.c | 19 ++++++++++++++++---
>  3 files changed, 52 insertions(+), 3 deletions(-)
> 

-- 
Péter
