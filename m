Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9872137C10F
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302641; cv=none; b=dMQ9uKAbd+FB6A+46s+DdCan7KovQP3qwnDFqvpmfgtZkMlz/RzlZ9C7tS5SESr5x5OtIwoo1W1sHEWzTCDc3JmmBSXzRnGOcaMMfmOajUGwtYJcQiCMniR82ypi/5tFUqW1xFfvGvPNYTBbuSB9cUwPEhi8wRkE/HEGsfaLwvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302641; c=relaxed/simple;
	bh=rg2zu/ClY64TinDg/8t5sbm5OrYa9Npelya+412VZG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7HfpAqAGAgFeDQcnsGrScrIdbUAqpnFBF91EfWL1x4vkO5TYDIBChM4VS9jPcuwnTeETsptDF6JkHPzjnTA5auBq+eptxyj+VFXOfqPlrdTfz/MGEqzXYbPcFcm2QgsLhzRAxVDHk9TfehHd3deO2poxRI/wcQ//ahi8r6/TZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GhsglGQR; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GhsglGQR"
Message-ID: <c63050a3-4a1f-4d0f-868b-89847dd240d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774302637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRwSWyxz1LIWfxIxUspIJ//trjG9jyVrsynTRp56Zak=;
	b=GhsglGQRDpdP3xFyycaxwS6zHrCEdaLK71YwZR8uSbiEXSk6gbRVy2ptjta/Lnd7Edk4yi
	MFHHxvefpVEE6I7fyl0nFIKVU5PoQ4x6C2LME1dz/q1X6c5rslzehgpmiUBvxVJuF4iDcz
	uBd/Q+blcb2qOv1ARq+6dTu9gPhDMj0=
Date: Fri, 20 Mar 2026 16:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] ASoC: sdw_utils: Add ES9356 support functions
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260319053959.9151-1-zhangyi@everest-semi.com>
 <20260319053959.9151-2-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260319053959.9151-2-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/18/26 22:39, Zhang Yi wrote:
> Add the functions into the machine driver for the es9356
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  include/sound/soc_sdw_utils.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/include/sound/soc_sdw_utils.h b/include/sound/soc_sdw_utils.h
> index 98531e500..2109bf477 100644
> --- a/include/sound/soc_sdw_utils.h
> +++ b/include/sound/soc_sdw_utils.h
> @@ -220,6 +220,17 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
>  			      struct asoc_sdw_codec_info *info,
>  			      bool playback);
>  
> +/*es9356 codec support*/

nit-pick: best to keep spaces before/after /* and */
same for other files in this patchset.


