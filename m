Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038F35C68A
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 08:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509029; cv=none; b=mvhVjmXj4OPyKJkdJOieq/6jnMXi11tdfiJezwE+e5a7QMhSWgbSAlonJzGGpHRHzAgOIivHUhlNoYfOa6PXvYc6ch8PM0f2vOlv/Nbo8cukFrcTrT1k/+I5aCe1HfCKJTSlCYIzU3bzmO6c+U3FvX3ZNxdTJErghzyBngviEBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509029; c=relaxed/simple;
	bh=YBUefHObD2KyQmK72p66Qt2VxfC3YRxnsjHskDaYZbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7XkLCiKTA/jq8+p/zH4BscvZfLxKG2EOx7k4DUhEUo2OtXA3G70kRLPsN72qNBvJQlPnBYdApKepxUstkemJrAcpWaJarinyowlp7x4TYV4ksftZSDLgzuxCSjOvxGaSzKF0O4qcy3qyWCv9kzwjT8E+w20YqMSTOLEL89Opr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krpf4q0l; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krpf4q0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788509027; x=1820045027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YBUefHObD2KyQmK72p66Qt2VxfC3YRxnsjHskDaYZbk=;
  b=krpf4q0lZB81xqvIsAuEE97ZTxZaFztReM1il9jDmCp0cyBKm5vPr1kU
   aSTp3LS8UoGcuiq9o5+LS4SqtgplxG8m1QNZ+W0okhSCqppVEqfU72SIc
   cJyPkcSg9T9F1VceNWP8MiJdF7786eO8x8k8ArvDJXmZivf9jw5vQmQns
   qaiy427zPtAcYxRRjYzgqcmrx2gpdYeYGt55HNK7kikPyAbPn+84k3LiJ
   rplLuvu+TF7jIVlZ4bl0+DUWcM0yw7oWIuWE7e3zpyvoISQnTuOwu2A5B
   Rz92u0B+gnGKhJ/ApbGwZ2MGfQ0T7VlzrMbyhMne0gl+qwgXTp+y0HS6i
   A==;
X-CSE-ConnectionGUID: FSlXECf6SQiJrVtpV7+PXg==
X-CSE-MsgGUID: GxIDvbJqT4u8PxjL0wZRdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="99336304"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="99336304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:03:47 -0700
X-CSE-ConnectionGUID: 3EIx+UQRTEqFO3FwmeqSOg==
X-CSE-MsgGUID: sA4YtvPKQC6DSZ+43Xggpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270511298"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO [10.245.244.213]) ([10.245.244.213])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 01:03:43 -0700
Message-ID: <b3e44d88-6843-452d-9529-e6cdd49490f4@linux.intel.com>
Date: Fri, 4 Sep 2026 11:03:51 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] ALSA: compress: pin card module while stream is
 open
To: Takashi Iwai <tiwai@suse.de>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, srinivas.kandagatla@oss.qualcomm.com,
 linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 daniel.baluta@nxp.com, Vijendar.Mukunda@amd.com
References: <20260904073134.29648-1-peter.ujfalusi@linux.intel.com>
 <20260904073134.29648-2-peter.ujfalusi@linux.intel.com>
 <87a4px78vb.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <87a4px78vb.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 04/09/2026 10:50, Takashi Iwai wrote:
> On Fri, 04 Sep 2026 09:31:12 +0200,
> Peter Ujfalusi wrote:
>>
>> Take a module reference in snd_compr_open() and release it in
>> snd_compr_free(). This pins the card driver module for the
>> lifetime of an open compress stream and prevents card removal
>> while the stream file is still in use.
>>
>> Adjust the open() cleanup paths to drop the added module
>> reference only when it was acquired, and keep release ordering
>> safe by dropping the module reference before freeing stream
>> data.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
> 
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> 
> While we're at it: the compress-offload seems missing the call of
> snd_card_file_add() and snd_card_file_remove() at open/close, too.
> By adding those, the unexpected syscalls are guarded in the core side
> after disconnection by replacing file ops.

You are right, I'll prepare the followup patch and either send it later
or include it in v2 of the series.

-- 
Péter

