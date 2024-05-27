Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1DD13AD19
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804817; cv=none; b=lAuAiBK3kAdJTPCZdJvcnJHopGLAJ0OMQU7+uxBQ6C68U3vMiY4HYZljtjNFZoclSmypmnW56eTCafVmTkxxX6sXFtgaOjI1dQzDKQVKbT3YYsjGySVbTW3p3eU56dyF5VpxdU6Uk8Fapou+QDaZIDPddEhK5ZhREHbnrDApYag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804817; c=relaxed/simple;
	bh=cRZVUpgVdOsBrIKKNUx2On/ceo1ikeW3bHR5KaPIft4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vu/QFk6wIYb7dpm5zKLI4xkGrzphwuuLpDuL57DOoOePJlXSnR3IZqG1GHj+OWZgYsFH6DmO3ztxu5LvtVEAkCUgdUCy7CcNJoO1O0VqufWYP5ixJaUrzP9RvlrjpbiOUCOyAbvU4u6BZfYpmad0HQU+W2o9R+aJiu5qRnh3qe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh2LiysU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh2LiysU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716804815; x=1748340815;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cRZVUpgVdOsBrIKKNUx2On/ceo1ikeW3bHR5KaPIft4=;
  b=jh2LiysUfnCCkF9Rs+PvouwcCioMuL+9PugWSX5vGWdqhGxCRYC3E5vy
   JzDFBBcBm1sQ60ac19u/Ya+GLy8wVwIl34mWPynZsAy8HnIF3GmDNaCNb
   6mLgvrXIyALLudmji//27l+vedEzBXSE1IjbFQd25rc85KS+WQYsumbpw
   LvAT9xqIY4Zf/MxX/qMdSX6mGFP8Q7ISpKBGhAU3uAZKDkKSdKw/Zr9aj
   cdNHVaEHT0Y/S+wjlqVR8L4/wB3cuYq8TRdJe/1zMcTXSv1y/kOzrnW+k
   xz9kUMEnewjoylom+P7xmbtXK/XlpSTt7kDvBCetqaxMHFNHTc0a5gSIa
   A==;
X-CSE-ConnectionGUID: h1ab8sdYT1+7UQ9ElmvGKA==
X-CSE-MsgGUID: onhs6kWWRdaiKCNQ4FZnag==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13238272"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="13238272"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 03:13:35 -0700
X-CSE-ConnectionGUID: oO/GVTkdROWeZHV6CVM9pA==
X-CSE-MsgGUID: itm33IzPSNmnSJSWJhhz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34695995"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 03:13:33 -0700
Message-ID: <e5300791-e702-4868-a442-94162f2e1a97@linux.intel.com>
Date: Mon, 27 May 2024 12:13:30 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ALSA: compress_offload: introduce passthrough
 operation mode
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20240527071133.223066-1-perex@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240527071133.223066-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/27/2024 9:11 AM, Jaroslav Kysela wrote:
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
> Note: This code is RFC (not tested, just to clearify the API requirements).
> My goal is to add a test (loopback) driver and add a support to tinycompress
> library in the next step.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> ---

Seems mostly ok to me, some nitpicks below.

>   .../sound/designs/compress-passthrough.rst    | 125 +++++++
>   include/sound/compress_driver.h               |  32 ++
>   include/uapi/sound/compress_offload.h         |  44 ++-
>   sound/core/Kconfig                            |   4 +
>   sound/core/compress_offload.c                 | 314 +++++++++++++++++-
>   5 files changed, 511 insertions(+), 8 deletions(-)
>   create mode 100644 Documentation/sound/designs/compress-passthrough.rst
> 
> diff --git a/Documentation/sound/designs/compress-passthrough.rst b/Documentation/sound/designs/compress-passthrough.rst
> new file mode 100644
> index 000000000000..bb5a0ae5c496
> --- /dev/null
> +++ b/Documentation/sound/designs/compress-passthrough.rst
> @@ -0,0 +1,125 @@
> +=================================
> +ALSA Co-processor Passthrough API
> +=================================
> +
> +Jaroslav Kysela <perex@perex.cz>
> +
> +
> +Overview
> +========
> +
> +There is a requirement to expose the audio hardware that accelerates various
> +tasks for user space such as sample rate converters, compressed
> +stream decoders, etc.
> +
> +This is description for the API extension for the compress ALSA API which
> +is able to handle "tasks" that are not bound to real-time operations
> +and allows for the serialization of operations.
> +
> +Requirements
> +============
> +
> +The main requirements are:
> +
> +- serialization of multiple tasks for user space to allow multiple
> +  operations without user space intervention
> +
> +- separate buffers (input + output) for each operation
> +
> +- expose buffers using mmap to user space
> +
> +- signal user space when the task is finished (standard poll mechanism)
> +
> +Design
> +======
> +
> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
> +the passthrough API.
> +
> +The API extension shares device enumeration and parameters handling from
> +the main compressed API. All other realtime streaming ioctls are deactivated
> +and a new set of task related ioctls are introduced. The standard
> +read/write/mmap I/O operations are not supported in the passtrough device.

passthrough

> +
> +Device ("stream") state handling is reduced to OPEN/SETUP. All other
> +states are not available for the passthrough mode.
> +
> +Data I/O mechanism is using standard dma-buf interface with all advantages
> +like mmap, standard I/O, buffer sharing etc. One buffer is used for the
> +input data and second (separate) buffer is used for the ouput data. Each task

output

> +have separate I/O buffers.
> +
> +For the buffering parameters, the fragments means a limit of allocated tasks
> +for given device. The fragment_size limits the input buffer size for the given
> +device. The output buffer size is determined by the driver (may be different
> +from the input buffer size).
> +
> +State Machine
> +=============
> +
> +The passtrough audio stream state machine is described below :

passthrough

> +
> +                                       +----------+
> +                                       |          |
> +                                       |   OPEN   |
> +                                       |          |
> +                                       +----------+
> +                                             |
> +                                             |
> +                                             | compr_set_params()
> +                                             |
> +                                             v
> +         all passthrough task ops      +----------+
> +  +------------------------------------|          |
> +  |                                    |   SETUP  |
> +  |                                    |
> +  |                                    +----------+
> +  |                                          |
> +  +------------------------------------------+
> +
> +
> +Passthrough operations (ioctls)
> +===============================
> +
> +CREATE
> +------
> +Creates a set of input/output buffers. The input buffer size is
> +fragment_size. Allocates unique seqno.
> +
> +The hardware drivers allocate internal 'struct dma_buf' for both input and
> +output buffers (using 'dma_buf_export()' function). The anonymous
> +file descriptors for those buffers are passed to user space.
> +
> +FREE
> +----
> +Free a set of input/output buffers. If an task is active, the stop

_a_ task?


> +
> +static int snd_compr_task_start(struct snd_compr_stream *stream, struct snd_compr_task *utask)
> +{
> +	struct snd_compr_task_runtime *task;
> +	int retval;
> +
> +	if (utask->origin_seqno > 0) {
> +		task = snd_compr_find_task(stream, utask->seqno);
> +		retval = snd_compr_task_start_prepare(task, utask);
> +		if (retval < 0)
> +			return retval;
> +		task->seqno = utask->seqno = snd_compr_seqno_next(stream);
> +		utask->origin_seqno = 0;
> +		list_move_tail(&task->list, &stream->runtime->tasks);
> +	} else {
> +		task = snd_compr_find_task(stream, utask->seqno);
> +		if (task && task->finished)
> +			return -EBUSY;
> +		retval = snd_compr_task_start_prepare(task, utask);
> +		if (retval < 0)
> +			return retval;
> +	}
> +	retval = stream->ops->task_start(stream, task);

Should probably check somewhere that ops are set properly, or is it this 
way because they all considered mandatory?


> +
> +static int snd_compr_task_status(struct snd_compr_stream *stream,
> +					struct snd_compr_task_status *status)
> +{
> +	struct snd_compr_task_runtime *task;
> +
> +	task = snd_compr_find_task(stream, status->seqno);
> +	if (task == NULL)
> +		return -EINVAL;
> +	status->output_size = task->output_size;
> +	status->active = task->active ? 1 : 0;
> +	status->finished = task->finished ? 1 : 0;

Not sure, but access to ->active and ->finished, feels to me like 
something that may require locking.

