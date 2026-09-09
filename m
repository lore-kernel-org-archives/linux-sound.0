Received: from mta1.migadu.com (out-57.mta1.migadu.com [95.215.58.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BB5803B0
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963796; cv=none; b=KS/XxoqqsOGpf/3QKcmVRCcQCh+jE92cX6rcVFcRNwy8PMrwca9zgIQzaP8/gq13SIrJUOI5idc2Igf0NFXaYP/0YOVmnl9Dwp37dD741cc6YCKFeZZdLh/VqSZAs1sBzLS7yk8Uk+DkJs+tvTtuBpL9Bn147DVHKfiuLDyfZ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963796; c=relaxed/simple;
	bh=38ZFmzRNr+o9zib69QOX+R0oAjGBFA3QUzupxVf+HMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A409yb4w9nf10DUiUXG2WfAvP6Zs2LqLdhnJGEbKA4oIudK+tfwpuxMMMwGxnSQ4yVtpogb0aKmJc38UTVi3IuJ8xFYE7xu+IKXhNXvqOPWWXolu0u110qbuvnVzlY4bRBf+7ety82nqmqJiQo/xP+Y/Milcycw2NQjOii+ESHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BsYYYbv0; arc=none smtp.client-ip=95.215.58.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BsYYYbv0"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=38ZFmzRNr+o9zib69QOX+R0oAjGBFA3QUzupxVf+HMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963792; v=1; x=1789568592;
 b=BsYYYbv0VnSgkkwykK7NFNac5c5V/NFqE9p3chyy7tClNY1cVJAm3ErRa0rxilNVMIutOLTN
 c/cUoOHywB1u3ql46Tz22qGMCqauK3C9Kkh+fvZ6pYMV+Oks77B8M4ajp/0HLqRxyId1XrgS/pY
 lF2T3BksSfveKRdL2n2ohmUs=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 06f39dacb55aacc2;
	Wed, 09 Sep 2026 14:23:12 +0000
X-Mizu-Trace-ID: 06f39dacb55aacc2
X-Migadu-Flow: FLOW_OUT
Message-ID: <1ae6d504-5ed8-487f-b13f-35d651798c38@linux.dev>
Date: Wed, 9 Sep 2026 15:29:36 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/24] ASoC: SOF: Intel: Kconfig: Remove redundant IPC
 version selects
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-23-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-23-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> There is no need to select IPC3 and IPC4 along with INTEL_CNL as INTEL_CNL
> selects both.
> 
> Similarly, INTEL_MTL selects IPC4, so there is no need to do that for LNL,
> PTL and NVL.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> ---
>  sound/soc/sof/intel/Kconfig | 7 -------
>  1 file changed, 7 deletions(-)

that's a cleanup patch that can be submitted separately, before all this
compressed stuff.

> diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
> index 915abbef398d..840d5a36b958 100644
> --- a/sound/soc/sof/intel/Kconfig
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -186,8 +186,6 @@ config SND_SOC_SOF_INTEL_ICL
>  	tristate
>  	select SND_SOC_SOF_HDA_GENERIC
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
> -	select SND_SOC_SOF_IPC3
> -	select SND_SOC_SOF_IPC4
>  	select SND_SOC_SOF_INTEL_CNL
>  
>  config SND_SOC_SOF_ICELAKE
> @@ -214,8 +212,6 @@ config SND_SOC_SOF_INTEL_TGL
>  	tristate
>  	select SND_SOC_SOF_HDA_GENERIC
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
> -	select SND_SOC_SOF_IPC3
> -	select SND_SOC_SOF_IPC4
>  	select SND_SOC_SOF_INTEL_CNL
>  
>  config SND_SOC_SOF_TIGERLAKE
> @@ -268,7 +264,6 @@ config SND_SOC_SOF_INTEL_LNL
>  	tristate
>  	select SND_SOC_SOF_HDA_GENERIC
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
> -	select SND_SOC_SOF_IPC4
>  	select SND_SOC_SOF_INTEL_MTL
>  
>  config SND_SOC_SOF_LUNARLAKE
> @@ -285,7 +280,6 @@ config SND_SOC_SOF_INTEL_PTL
>  	tristate
>  	select SND_SOC_SOF_HDA_COMMON
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
> -	select SND_SOC_SOF_IPC4
>  	select SND_SOC_SOF_INTEL_LNL
>  
>  config SND_SOC_SOF_PANTHERLAKE
> @@ -302,7 +296,6 @@ config SND_SOC_SOF_INTEL_NVL
>  	tristate
>  	select SND_SOC_SOF_HDA_COMMON
>  	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
> -	select SND_SOC_SOF_IPC4
>  	select SND_SOC_SOF_INTEL_PTL
>  
>  config SND_SOC_SOF_NOVALAKE

