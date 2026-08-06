Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27960471CFD
	for <linux-sound@vger.kernel.org>; Thu,  6 Aug 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017359; cv=none; b=h3yrw6J+yqvcy5oTrmMvl1jXp31JwY+BVWi7dZQpt6OXZQUBCurSzNlBbPZyFm0Ci5925oZn7OQjHbLYn+9lCm8WEHoXR7lA9SkGwNoxhcfK1D72+I0iuFzLPAE9b3o4A46uRWLLQMqgq1Zbdl5Z6qErZSPJwBtIZj6WjmRlNEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017359; c=relaxed/simple;
	bh=Oa7TQq21jbbPCnWPnKEWVVlXDmh2Qk9aOA2PKfO4Rsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qEOYQEwNTMwRhb10v42EANNDnT6L5jj2bCwQ3FO2vNJEFvJ3I5vE1c2P9rtxPbbhPIoAnfBWo+pQVMi7T5DGPQSQClgA8YMObext23XHq7gRfYeH0B3mck8We4g2dXe3pBaIgKSgX/PeulU9ahk2b+jh/KPkiRbaYJ0OYRRiv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+J7mjNv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+J7mjNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786017356; x=1817553356;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oa7TQq21jbbPCnWPnKEWVVlXDmh2Qk9aOA2PKfO4Rsc=;
  b=Z+J7mjNvXw+ivhHxXzVC/DgNQOv1R7rYYSdMv6X/Grcl4te6jCn2EP1U
   V/Rw9QtN3bIiRBtwyu+Ro11iSq3u1HRx/xk1VrfvNKRYfwL+OxnbHsSq4
   64IJjySj1dBMXNKSbo+F47KmLsgG+VmWRRs254lzkB/PJXVgxDIeihJ6h
   q9xp9NHd1uWT6ls51MmlPl/0dHRYofSnAmjsb1zmU3JOCKcycH2tEcCSL
   EDdVIKctiCjeXGoRGLgi7sgBfHusg9U/hbXsUiUd/wk9G6gB1Qx0aR9e2
   sZPU7tZBjsiBk8h7Q123ZD4Iu6FufzrrzkKT5q0rwp9ECi1rKC+CnHLrK
   Q==;
X-CSE-ConnectionGUID: /eX0aIGzTqS2lpbgTmm6gQ==
X-CSE-MsgGUID: dkb6u9lUR5yJ9W/qipoLNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="85731713"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="85731713"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:55:55 -0700
X-CSE-ConnectionGUID: Wm8yNgJhRNSEohtHGordQw==
X-CSE-MsgGUID: 5YfJGV1oQnmMrfPlq1caQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="258211247"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.7]) ([10.245.246.7])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 04:55:52 -0700
Message-ID: <a06c0cde-e321-4fa6-9743-23bf9826edf6@linux.intel.com>
Date: Thu, 6 Aug 2026 14:56:30 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 31/31] ASoC: SOF: Use auto-cleanup for firmware loading
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20260805135247.670693-1-tiwai@suse.de>
 <20260805135247.670693-32-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260805135247.670693-32-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 05/08/2026 16:52, Takashi Iwai wrote:
> Simplify the code to manage the firmware loading with __free(firmware)
> and __free(kfree) auto-cleanups for the firmware data and the temporary
> string or array.
> 
> Only the code refactoring, no functional changes.
> 
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/sof/fw-file-profile.c | 19 +++++++------------
>  sound/soc/sof/topology.c        | 20 ++++++--------------
>  2 files changed, 13 insertions(+), 26 deletions(-)
> 
> diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
> index 76bde2e0be1d..fcd57f04ca36 100644
> --- a/sound/soc/sof/fw-file-profile.c
> +++ b/sound/soc/sof/fw-file-profile.c
> @@ -16,20 +16,19 @@ static int sof_test_firmware_file(struct device *dev,
>  				  enum sof_ipc_type *ipc_type_to_adjust)
>  {
>  	enum sof_ipc_type fw_ipc_type;
> -	const struct firmware *fw;
> -	const char *fw_filename;
>  	const u32 *magic;
>  	int ret;
>  
> -	fw_filename = kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
> -				profile->fw_name);
> +	const char *fw_filename __free(kfree) =
> +		kasprintf(GFP_KERNEL, "%s/%s", profile->fw_path,
> +			  profile->fw_name);
>  	if (!fw_filename)
>  		return -ENOMEM;
>  
> +	const struct firmware *fw __free(firmware) = NULL;

can we keep this at the head of the function?

>  	ret = firmware_request_nowarn(&fw, fw_filename, dev);
>  	if (ret < 0) {
>  		dev_dbg(dev, "Failed to open firmware file: %s\n", fw_filename);
> -		kfree(fw_filename);
>  		return ret;
>  	}
>  
> @@ -44,8 +43,7 @@ static int sof_test_firmware_file(struct device *dev,
>  		break;
>  	default:
>  		dev_err(dev, "Invalid firmware magic: %#x\n", *magic);
> -		ret = -EINVAL;
> -		goto out;
> +		return -EINVAL;
>  	}
>  
>  	if (ipc_type_to_adjust) {
> @@ -54,13 +52,10 @@ static int sof_test_firmware_file(struct device *dev,
>  		dev_err(dev,
>  			"ipc type mismatch between %s and expected: %d vs %d\n",
>  			fw_filename, fw_ipc_type, profile->ipc_type);
> -		ret = -EINVAL;
> +		return -EINVAL;
>  	}
> -out:
> -	release_firmware(fw);
> -	kfree(fw_filename);
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static int sof_test_topology_file(struct device *dev,
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 6fd69ba11c41..820513bb2577 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -2506,13 +2506,12 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
>  	struct snd_sof_pdata *sof_pdata = sdev->pdata;
>  	const char *tplg_filename_prefix = sof_pdata->tplg_filename_prefix;
> -	const struct firmware *fw;
> -	const char **tplg_files;
>  	int tplg_cnt = 0;
>  	int ret;
>  	int i;
>  
> -	tplg_files = kcalloc(scomp->card->num_links, sizeof(char *), GFP_KERNEL);
> +	const char **tplg_files __free(kfree) =
> +		kcalloc(scomp->card->num_links, sizeof(char *), GFP_KERNEL);
>  	if (!tplg_files)
>  		return -ENOMEM;
>  
> @@ -2538,10 +2537,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  								       tplg_filename_prefix,
>  								       &tplg_files,
>  								       no_fallback);
> -		if (tplg_cnt < 0) {
> -			kfree(tplg_files);
> +		if (tplg_cnt < 0)
>  			return tplg_cnt;
> -		}
>  	}
>  
>  	/*
> @@ -2552,8 +2549,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  		if (strstr(file, "dummy")) {
>  			dev_err(scomp->dev,
>  				"Function topology is required, please upgrade sof-firmware\n");
> -
> -			kfree(tplg_files);
>  			return -EINVAL;
>  		}
>  		tplg_files[0] = file;
> @@ -2568,6 +2563,7 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  		if (tplg_files[0] != file)
>  			dev_info(scomp->dev, "loading topology %d: %s\n", i, tplg_files[i]);
>  
> +		const struct firmware *fw __free(firmware) = NULL;

can we move this at the start of the for {} loop?
for (i = 0; i < tplg_cnt; i++) {
	const struct firmware *fw __free(firmware) = NULL;
...


>  		ret = request_firmware(&fw, tplg_files[i], scomp->dev);
>  		if (ret < 0) {
>  			/*
> @@ -2586,8 +2582,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  		else
>  			ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
>  
> -		release_firmware(fw);
> -
>  		if (ret < 0) {
>  			dev_err(scomp->dev, "tplg %s component load failed %d\n",
>  				tplg_files[i], ret);
> @@ -2606,6 +2600,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  			goto out;
>  		}
>  		dev_info(scomp->dev, "loading feature topology %d: %s\n", i, feature_topology);
> +
> +		const struct firmware *fw __free(firmware) = NULL;

can we move this at the start of the for {} loop?
	for (i = 0; i < feature_tplg_cnt; i++) {
	const struct firmware *fw __free(firmware) = NULL;
...

But I'm not sure if we buy clarity with the tplg loading.

>  		ret = request_firmware(&fw, feature_topology, scomp->dev);
>  		if (ret < 0) {
>  			/*
> @@ -2630,8 +2626,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  		else
>  			ret = snd_soc_tplg_component_load(scomp, &sof_tplg_ops, fw);
>  
> -		release_firmware(fw);
> -
>  		if (ret < 0) {
>  			dev_err(scomp->dev, "feature tplg %s component load failed %d\n",
>  				feature_topologies[i], ret);
> @@ -2650,8 +2644,6 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  	if (ret >= 0 && sdev->led_present)
>  		ret = snd_ctl_led_request();
>  
> -	kfree(tplg_files);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL(snd_sof_load_topology);

with that,
Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Tested-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

-- 
Péter

