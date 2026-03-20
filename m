Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FF73346A0;
	Fri, 20 Mar 2026 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000209; cv=none; b=PxVJt2FOwtDBmOSHQe+WqWNZ1Kfyi0p2Nwq4xRYr9xbtNgAQvn3wYjYLx0s1pDQbeQv1bn8K0Jelu9nx+sZms/Hsam9S4M8wFnoeygzncqF0GV1QOaQ6g+64wM9zcIPyX/yQyPphsrvcbK4wbED4SUbeaEO+lluLiM8n2JrG33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000209; c=relaxed/simple;
	bh=aoI6cKhvfmx2fArAaTgUOpbABR2Ie+s7ZbxZ5dHHF6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnUHKvHV5Axcm9SIlZEq9cFot/uj5QRoltYBHP6xVZtsGd+p8qF7v395CFUQOOEv+elPctf916u7xkYWM+dA0knx2Y3zo3HcM5OnB31ua/VDR2ar1IwCdt98DF4xmDyms6jhchd9GFz1nwFBxVkua1trFbi/UZt9vm/0qT8ICHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ML1A85jd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ML1A85jd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774000208; x=1805536208;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aoI6cKhvfmx2fArAaTgUOpbABR2Ie+s7ZbxZ5dHHF6c=;
  b=ML1A85jdEmKVX3kLAZnyHIwCIa307373jvZBPF+MAGgeig1E1sei/4gR
   laxiyUHjd355ZBtLcY5Gayqm+30NPUtpNFI6nZU1Ymtz9nPzTiXuJTobd
   Ts4CUCAKfFUXrq0G2XVAa5/sfo8oY0IMoPU5x+cdxesejMx66FTjXzpL5
   3H3w3YIqciFn6tW+HcDsss92aupvHR88+G9TTypf1YSKM4CBQvdWc2XW8
   bWbB4PuL2yXbzGNAsDUmnyQj41MBgE4J2OyellNLzoaO+0sXJm4urREg7
   Q2w7cCNKi/CnEWsaheKYy7ARpUMEf3siDlvlM0zksIlgj9KqtPfmBh9mB
   g==;
X-CSE-ConnectionGUID: YrkeOkA4T/6bSo+ieJVS+A==
X-CSE-MsgGUID: fw4A880VRL6CASQTW2H1YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="62644021"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="62644021"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:50:07 -0700
X-CSE-ConnectionGUID: 83i5ZwRdRk2hvLTBMiL2iQ==
X-CSE-MsgGUID: QuNbN+zLTA+B6I/6ORRJmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="222463478"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.37]) ([10.245.245.37])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 02:49:59 -0700
Message-ID: <c180f791-ce02-4d20-bfc3-3b45649818fa@linux.intel.com>
Date: Fri, 20 Mar 2026 11:50:15 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: topology: reject invalid vendor array size in
 token parser
To: =?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260319-sof-topology-array-size-fix-v1-1-f9191b16b1b7@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20260319-sof-topology-array-size-fix-v1-1-f9191b16b1b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/03/2026 02:45, Cássio Gabriel wrote:
> sof_parse_token_sets() accepts array->size values that can be invalid
> for a vendor tuple array header. In particular, a zero size does not
> advance the parser state and can lead to non-progress parsing on
> malformed topology data.
> 
> Validate array->size against the minimum header size and reject values
> smaller than sizeof(*array) before parsing. This preserves behavior for
> valid topologies and hardens malformed-input handling.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/soc/sof/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 18e2401152c8..35200d801fb7 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -736,7 +736,7 @@ static int sof_parse_token_sets(struct snd_soc_component *scomp,
>  		asize = le32_to_cpu(array->size);
>  
>  		/* validate asize */
> -		if (asize < 0) { /* FIXME: A zero-size array makes no sense */
> +		if (asize < sizeof(*array)) {
>  			dev_err(scomp->dev, "error: invalid array size 0x%x\n",
>  				asize);
>  			return -EINVAL;
> 
> ---
> base-commit: b3c48fa1fb397b490101785ddd87caf2e5513a66
> change-id: 20260319-sof-topology-array-size-fix-e900a6b357bc
> 
> Best regards,

-- 
Péter

