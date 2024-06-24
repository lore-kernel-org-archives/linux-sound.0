Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76691DFD1
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719241281; cv=none; b=L9U/cUUH3ebITw1MYOroeE1rwMWd2cY61xhH3Cp0vh2NftefWtDLlLODQMIdkVMTE07zaSxJlOkVteaFPzgmkXKiZXvfMXSBbdFuVQ+cJRLd3Kre/E4Amoq3tjggXa3Q+Rirz+CkA9iw4D6P6gAkNEOCQrmoZNMbwAfqd+KVxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719241281; c=relaxed/simple;
	bh=44flqBQXc4FwBW1U+KNiKtwBls8FOfI4V0FEDarx9GQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jq5Vy53PKlIw29Nb620Ydy/Ai0sEXTfAp+P1fpPkW4/e0L52x0fRR79fEo/v7gC2O3Ebx5nGh4CK2diUEew81FrpXgcMtaZ4bbDNDPNWfyYGQyYrt1jPImBQrWOMinnzSc/JTIQWa0jM7/mF19c3NbRd/2JkpoKxnZgKrW3Fa+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL+NN4Ot; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL+NN4Ot"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719241280; x=1750777280;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=44flqBQXc4FwBW1U+KNiKtwBls8FOfI4V0FEDarx9GQ=;
  b=IL+NN4OtG6UYZfGVkQ+sFoEW7tvjtQMSw1KAIZw/94IxarhYoTCGFZAQ
   2HqgCntBxLfOCCDA3DTqe+h1Uy3IQn0gjuF/JIFBBHTIvUoniJDb37c/L
   uvQrgbybjvnPB/Lcc8MtQYxXeCqeNAu3IcER57zedGO8+pyp3bC3PL1xE
   DqWEtMXXXf1IhfCix20Yr42Qix/KE+XKqZPgPhEj60qD8pCtwBvTaJCuE
   jXP450B5KhnXe2pRrtST/9jFUBADMyDbWZoLd4lnEx5d5QXycF+ZZyPJe
   L/39kHqqgJQMX/AD7tMGYJrNLjtylzMu/PEfoRZwCrd7l5SvONupojsRY
   Q==;
X-CSE-ConnectionGUID: 9NH3xS3jSQ+vzNdhgaH1YQ==
X-CSE-MsgGUID: vVy/QXVnQiS9z5ODqudd2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19990345"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="19990345"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:01:20 -0700
X-CSE-ConnectionGUID: MfOJx9ZZR/KZLOa8A5ngqg==
X-CSE-MsgGUID: nELzpFpxRs2yeoJtQPDuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="47847720"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:01:16 -0700
Message-ID: <efaa3e1e-3087-4c0f-a19b-bc736ec75d3d@linux.intel.com>
Date: Mon, 24 Jun 2024 17:01:13 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ALSA: compress_offload: introduce passthrough
 operation mode
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20240624135820.516893-1-perex@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240624135820.516893-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/2024 3:58 PM, Jaroslav Kysela wrote:
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
> 
> For details, refer to "compress-passthrough.rst" document.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> ---

> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index d185957f3fe0..5fed1979522b 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +	/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */

Accidental indentation change?


