Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B468352018
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779794467; cv=none; b=qm5JOMazFq5Zpni5OgesBjjFdzJrHIxJq+5zT1MVvZPa+Nj+oIpcSDvjULJL8fVI/OpwTYGXaXu0zHt25lLTl4jr8RZtGzupQ7Iw671Z9xE2e4zfA6F7pQYD9DrHnq5krUV/SXGH0ZQqn3j9LYX/hH42uLgwsPoPb1huZW26ha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779794467; c=relaxed/simple;
	bh=2KAW1W7hRl7mNmr71FD7fzPUI06Z5BTc1slhV0PAmZg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dAUpbZQsCpZtlGxGMuWcgPA+BQIhD8jfnydKGV8kS3glvKO+cgQBb6ysdi7bQaWzRu/tInieM/2yt2sl2nTQ2K+nTjAxUXGRZut4FGnAoX/637szsNNMioOvi5ZM6iMR0PVEx0KjyYC+lLLlSmjqQN8EFitCGlcxY3cd1BT9UBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Du+lEWLI; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Du+lEWLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779794466; x=1811330466;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=2KAW1W7hRl7mNmr71FD7fzPUI06Z5BTc1slhV0PAmZg=;
  b=Du+lEWLICJbAtKdcQKEg916g3tf7g4TBz9uMHrvpYNouQrFGDUKhGimD
   Vwf8OfwaOlT+GR/AGf5l8pdz4FO58vqY0o56u+tHTxChxdYxCXHNFXzbb
   F1B0vG0LAbg+YAVHcOYAZ6X4ojHqJsLEvtgP7GGpPPmDgDBscsXdOMNG3
   ByLbOJVUCMwNPqXgG+6BaoP8lEadOa/Ckgphppk7EvtuAxnXAb9nrlUKA
   VKeDrLd6T7wtOcHLknYrbdbJoDbTw7uQKl6w2OiadH5uaepnQFl+uJT1g
   Bc3RcwzwCLb8foCmD8K0Ux5QWve0L/vKXR/+bYlsT0Svejvr0+wq2qjcm
   A==;
X-CSE-ConnectionGUID: YXHB8muAQNCnAeJIhVIRIg==
X-CSE-MsgGUID: YtOgwUfgS+mtcI64z2SY/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="90904774"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="90904774"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:20:58 -0700
X-CSE-ConnectionGUID: SIEnFpSORku0dZFeIuYyJg==
X-CSE-MsgGUID: CYW9IFtwS8OVGESUP88PQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="243722181"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.49]) ([10.245.244.49])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 04:20:54 -0700
Message-ID: <e6c5e5e0-69f1-4fdc-b7be-f6372e507b37@linux.intel.com>
Date: Tue, 26 May 2026 14:21:05 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 perex@perex.cz, amade@asmblr.net, kuninori.morimoto.gx@renesas.com,
 linux-sound@vger.kernel.org, "Liao, Bard" <bard.liao@intel.com>,
 "Vehmanen, Kai" <kai.vehmanen@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
 <01d1d642-bf24-4ef4-a30d-56884300407f@linux.intel.com>
 <5d8cbbfb-3884-4c6b-aea8-0c9a76964b3b@intel.com>
 <85045e51-e09b-44c2-9266-3e7ee72c4eb0@sirena.org.uk>
 <b5e82c43-9da1-4a12-af0e-90d4b9feef49@linux.intel.com>
 <d82fa24d-18f9-461d-8535-3266cc92fbb9@sirena.org.uk>
 <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
Content-Language: en-US
In-Reply-To: <1daaad8d-8aee-4911-a24b-26db8b694cfd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/05/2026 08:45, Péter Ujfalusi wrote:
> I also think that detaching from driver defer and use internal card
> defer is a much better approach, but when majority of new PTL designs
> will be broken with no patch in sight to prepare the SDCA class stack is
> a regression.
> 
> Charles, Bard, Richard, Simon, any thoughts on this?

I can force the sof_sdw driver to go back to driver defer queue if any of
the expected (counted for) components yet to be registered, but I'm sure
this has side-effects...

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 9d0768f21ba4..e80c3904bc37 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -2022,6 +2022,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 					soc_aux->dlc.name = component->name;
 				} else {
 					soc_aux->dlc.name = codec_info->auxs[j].codec_name;
+					return -EPROBE_DEFER;
 				}
 				soc_aux++;
 			}

 

-- 
Péter

