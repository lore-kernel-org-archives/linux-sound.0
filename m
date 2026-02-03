Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900D39E6CA
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 13:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125777; cv=none; b=rjyO55bYw1+Cp2HgrejZA0wKeYAWSzztFY7AlV3zBIuJCzo4QGysRnCxnmJGZrj/ivGiz1Ir03ddgAagzFIE6pju/EKIdQ2X04XZ9Y3b8Pufo963IMhs8v5bBovcwIESzqtZyvNi4lNbK/JHSUqqv0bAtOmNcjTUJpBlw2WZx8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125777; c=relaxed/simple;
	bh=a3cLbi+qPJAbNZJT4s/LsImcfVcyEksaNzHfh8kpDC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgE1qI3eA35eVfcGA9xYqCt6Oq1K4k+ddNG+cXiNtvg6PbkHFbak0muvLVBQO6+2tocawMiZEeEaXgXODAOsGowSSEpuF3Ps0etuaNGghxi4VcUbA3eDevpCdZ+gGo9NprWPLcAD9mQcNOEtwcJwfvKy01IHP/rRPsyGyjg9BX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iOBe0eQz; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iOBe0eQz"
Message-ID: <c5ce3d0b-ea28-405d-b705-f9494f25dfcc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770125772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwHZe0x2S0VDh79MuECcL2GvvgxMeF5v1jKxQVDjSOI=;
	b=iOBe0eQzlx+6jMsXrH6c/RFPzhlWqAyjF5j0LSDCY0ekpT5eSx7FBRnwxWQ2uFykAO4jeP
	+alGXDBrj+Ps/O2eU+dTHXNqOvEY4fZ84nfnJeRoasU+AC03be6qtCr1s8cRvmQdwib74x
	rIJeelmjAikzjzUNbvKL0Rp6twYtxNQ=
Date: Tue, 3 Feb 2026 14:16:48 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3]ASoC: SOF: Intel: reserve link DMA for sdw bpt stream
To: Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com,
 peter.ujfalusi@linux.intel.com, ranjani.sridharan@linux.intel.com
References: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260203114027.3742558-1-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2/3/26 12:40, Bard Liao wrote:
> Currently, hda_sdw_bpt_dma_prepare() get a HDA stream and use the link
> DMA but doesn't reserve it. It works fine because we assume the
> SwoundWire BPT will not run with audio streams simultaneously. Create
> and use the new helpers to reserve the link DMA and allow running BPT
> and audio stream simultaneously.
> 
> Bard Liao (3):
>   ASoC: SOF: Intel: add hda_dsp_stream_pair_get/put helpers
>   ASoC: SOF: Intel: add hda_dma_prepare/cleanup helpers
>   ASoC: SOF: Intel: hda-sdw-bpt: support simultaneous audio and BPT
>     streams

For the record this solution has two issues not documented in any commit message.

a) this will not work in 'dspless' mode, where the link DMA is not enabled. That's probably fine given that no one used that mode in production, but that's a software restriction that you will not be able to undo.

b) this raise the question of how bandwidth will be managed. The premise of BPT is that it uses all the bus bandwidth to guarantee predictable firmware download times. If the available bandwidth is restricted by other audio streams, then mechanically the startup latency will be increased and vary - or you will have to run the bus at a higher frequency to provision enough bandwidth for BPT but that means higher power consumption. Or you will have to change the bus clock dynamically which is possible at the hardware level for SDCA parts but not legacy ones.

I am not going to lay on the tracks for this low-level set of changes, but you'll have to address the b) opens for future contributions.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

>  sound/soc/sof/intel/hda-loader.c  |  94 +-----------------
>  sound/soc/sof/intel/hda-sdw-bpt.c |   5 +-
>  sound/soc/sof/intel/hda-stream.c  | 157 +++++++++++++++++++++++++++++-
>  sound/soc/sof/intel/hda.h         |  11 +++
>  4 files changed, 171 insertions(+), 96 deletions(-)
> 

