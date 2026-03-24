Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674223F99CC
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358742; cv=none; b=ClpzwP4eyVZNcpzjnRe4z8SOOdYJT9+tPtbyl82jPzG/Ve1EkJCjv2AluOXrzEr0l/rV/lsal7XwIYM3/Dsnrpj5GTkVDyV6sb89hA+eKqW5vrc0aIq4qpidDKMkJxHlvn/jR8+FBoI1yYpd8paezpgwL/XlIit3mOudd2EGX/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358742; c=relaxed/simple;
	bh=Y9i2D2cIw/y2BtdExkwbdsEZNmugJ2kDBJHl7/zF1F0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YTExd4GzjWDlIl1jGyIgRI0ciNnAXkvbYaFFjMag9p2JGDYId8+Zh8OOwzp7fRPE409SkrM7wWeb+7lNZ0eRRUNYnl4kh87z3WMnr85tyiAXeD+wTZZUM96tfdf5zkn+DE4d5X8pFoXy2VI7FLZjZEM1JI7hcCbbplTSEGBFUTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0dUvk6R; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0dUvk6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774358741; x=1805894741;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=Y9i2D2cIw/y2BtdExkwbdsEZNmugJ2kDBJHl7/zF1F0=;
  b=c0dUvk6RtIwXd2riOVvbrydu6oskVzeepmC27Tq9MHPU0x4K7kEKXYfr
   0ylbrJrDaHHV0ruxszxaKIro/g76sn+N4y8wA0s5sFYC8jib0hc8lMYqV
   rEckYY9HuuV5W99EpLQFuIK+VzMgt44zsCpPDixf6npSAJtfFPZobN26T
   lwbs3dB2mrQh+IJKdvW5Gy5Iw8FcmGNUZsg6wi8UWpbDDYke2hTyq8z2e
   Yzuoht9s2Vd2flhZjR/8Fy5ySKgOOIAXSZH7KK+07e73Cgr+gvz1EindN
   me3fFFsStBNE5ybTYfby5h66nCi+IsCZQEkTEXOs/fsCXtmGxK18F3HC5
   w==;
X-CSE-ConnectionGUID: f06Y4qY7TjqBXGWnP0sobA==
X-CSE-MsgGUID: q/Ouhg7HRni7Bh3g1dWOlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78969063"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78969063"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:25:41 -0700
X-CSE-ConnectionGUID: Yq78sIntSxCzxP9bx/jjdQ==
X-CSE-MsgGUID: LKilQjOcTZqgh9UCtUx/Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="262285658"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.138]) ([10.245.244.138])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:25:39 -0700
Message-ID: <fa31bed8-7446-4b83-b234-81f3cbfe3450@linux.intel.com>
Date: Tue, 24 Mar 2026 15:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <c521e0d9-4d69-4fd4-9c29-bb9b62c93310@perex.cz>
 <8fe7f61b-dae4-4ae6-aa96-7e604a37e624@linux.intel.com>
 <813612ea-f942-432f-9bf1-7b1ccfe59046@perex.cz>
 <6b129498-f130-44a0-a679-6fa1c639046e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <6b129498-f130-44a0-a679-6fa1c639046e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/03/2026 12:51, Péter Ujfalusi wrote:
> The question is: is it enough to only have single value exposed or do we
> need/want add all small variations of this to be exposed?
> I would think that a single dma_fifo_size should be OK and apps should
> prepare for the crawling DMA case.
> 
>> But if we agree on other name like 'burst_size' or 'batch_size', I'll be
>> fine with it, too.
> 
> I think neither of these are right, unless we substitute them with a
> variable which tells the size of the FIFO in hardware that is going to
> be filled.
> max_hw_ptr_burst_size or max_dma_burst_size or max_burst_size - in frames?

something like this in kernel and then we need alsa-lib update and then we can introduce the use in pipewire?

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d3ce75ba938a..3a1872b3e701 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -421,7 +421,8 @@ struct snd_pcm_hw_params {
 	unsigned int rate_den;		/* R: rate denominator */
 	snd_pcm_uframes_t fifo_size;	/* R: chip FIFO size in frames */
 	unsigned char sync[16];		/* R: synchronization ID (perfect sync - one clock source) */
-	unsigned char reserved[48];	/* reserved for future */
+	snd_pcm_uframes_t max_dma_burst_size;	/* R: maximum DMA burst size in frames */
+	unsigned char reserved[48 - sizeof(snd_pcm_uframes_t)];	/* reserved for future */
 };
 
 enum {
diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index e71f393d3b01..462588f3527b 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -64,7 +64,9 @@ struct snd_pcm_hw_params32 {
 	u32 rate_num;
 	u32 rate_den;
 	u32 fifo_size;
-	unsigned char reserved[64];
+	unsigned char sync[16];
+	u32 max_dma_burst_size;
+	unsigned char reserved[44];
 };
 
 struct snd_pcm_sw_params32 {
@@ -247,9 +249,11 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 	if (!data)
 		return -ENOMEM;
 
-	/* only fifo_size (RO from userspace) is different, so just copy all */
+	/* copy common members and fix up 32-bit uframe fields explicitly */
 	if (copy_from_user(data, data32, sizeof(*data32)))
 		return -EFAULT;
+	data->fifo_size = data32->fifo_size;
+	data->max_dma_burst_size = data32->max_dma_burst_size;
 
 	if (refine) {
 		err = snd_pcm_hw_refine(substream, data);
@@ -262,7 +266,8 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
 	if (err < 0)
 		return err;
 	if (copy_to_user(data32, data, sizeof(*data32)) ||
-	    put_user(data->fifo_size, &data32->fifo_size))
+	    put_user(data->fifo_size, &data32->fifo_size) ||
+	    put_user(data->max_dma_burst_size, &data32->max_dma_burst_size))
 		return -EFAULT;
 
 	if (! refine) {


-- 
Péter

