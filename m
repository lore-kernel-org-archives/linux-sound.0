Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEE15A868
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716819550; cv=none; b=Js4tRM0NL3Nt/M9L7Mkj5LLYNPG/BhnaA93Yd8DjTmbvxBfUQwOArUd9UDXtArPyNdZkIWa5/P3GUPxZW1CZQ82wpRSFlqY7FZtVWBgAagj7jHBMcXTdYkHYQNyf813b+9lp2tdaW0XQUdloRc04MyeVuuowQp7pTOirL76fft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716819550; c=relaxed/simple;
	bh=fxkfZNX2wld96NXgRDVbj+xOoo3Did+R/Sn3fmuGUIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAurUgf2f8jCPDG2H36hGipC0zb0bEMBBSyDKCprxZFKXb8q/Bdyuc3UZrdGXLc2et32gpUL0TFrsnAQ3AEZW0bMLS4DSgtCXgSUsPr9hQNLWRhjG0+topTriICuS2+6mJnonIU67sKvZDv6eoRajTkaO0mlJ4rlhHSHH6foRnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGzpsMIq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGzpsMIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716819548; x=1748355548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fxkfZNX2wld96NXgRDVbj+xOoo3Did+R/Sn3fmuGUIc=;
  b=RGzpsMIqdb+mqehAWYvmMIX7nsX8LuXua8nZPBjsJVayqcxfvd2cgFFG
   jv7qVNhFdh7Wf/ichAsnxxiIkHCGT4Dyj9x3zn73/GhGXH5EYOQjVPn5Z
   Jz7oXjCLgBzb9IrqYQHzfX61dzhSM1LOgsaHUAWYa4t6C7J/QWPvLBVl4
   vah5JZf+fMnBVIOJnRMmMZtz3e23LKnjIwJeM3XWPQQL9gEMe6UpCf51r
   35fR/pDcNTIIncmghQjlcQ2JErh8HPCZYRpII6PJiMDie6TlMWMPDsSt9
   OeUJZus7CUw7b8mX6UNKQL24x3piSouqR/cYbICShjqiY74D4IYNIOsn6
   Q==;
X-CSE-ConnectionGUID: diiIvsS5TbOXC3Or5FzKdg==
X-CSE-MsgGUID: HgCoW321TbqrkOWmcFQpqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="23807704"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="23807704"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:19:07 -0700
X-CSE-ConnectionGUID: T0HesbyUQueJ2MwlLh8huA==
X-CSE-MsgGUID: O+pJ5m75SDew/A8BAL5qQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="39321206"
Received: from kinlongk-mobl1.amr.corp.intel.com (HELO [10.125.110.211]) ([10.125.110.211])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 07:19:07 -0700
Message-ID: <a0db818d-8661-4ed1-b8dc-b221bb4ef9b8@linux.intel.com>
Date: Mon, 27 May 2024 09:17:52 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240527071133.223066-1-perex@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240527071133.223066-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Jaroslav, this is very interesting indeed.
I added a set of comments to clarify the design.

> +There is a requirement to expose the audio hardware that accelerates various
> +tasks for user space such as sample rate converters, compressed
> +stream decoders, etc.

"passthrough" usually means 'no change to data, filter coefficients not
applied' in the audio world.
> +This is description for the API extension for the compress ALSA API which
> +is able to handle "tasks" that are not bound to real-time operations
> +and allows for the serialization of operations.

not sure what "not bound to real-time operations" means. sample-rate
conversion is probably the most dependent on accurate timing :-)

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

If every buffer is mmap'ed to userspace, what prevents userspace from
interfering?

I think userspace would only be involved at the source and sink of the
processing chain, no?

> +- signal user space when the task is finished (standard poll mechanism)
> +
> +Design
> +======
> +
> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
> +the passthrough API.

not sure what you meant by 'direction', is this a new concept in
addition to PLAYBACK and CAPTURE?

edit: this is indeed what the code does, probably the documentation can
be clarified to explain why this is needed.

> +The API extension shares device enumeration and parameters handling from
> +the main compressed API. All other realtime streaming ioctls are deactivated
> +and a new set of task related ioctls are introduced. The standard
> +read/write/mmap I/O operations are not supported in the passtrough device.

The compress API was geared to encoders/decoders. I am not sure how we
would e.g. expose parameters for transcoders (decode-reencode) or even SRCs?

> +Device ("stream") state handling is reduced to OPEN/SETUP. All other
> +states are not available for the passthrough mode.
> +
> +Data I/O mechanism is using standard dma-buf interface with all advantages
> +like mmap, standard I/O, buffer sharing etc. One buffer is used for the
> +input data and second (separate) buffer is used for the ouput data. Each task
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

for each input and output buffers?

> +output buffers (using 'dma_buf_export()' function). The anonymous
> +file descriptors for those buffers are passed to user space.
> +
> +FREE
> +----
> +Free a set of input/output buffers. If an task is active, the stop
> +operation is executed before. If seqno is zero, operation is executed for all
> +tasks.
> +
> +START
> +-----
> +Starts (queues) a task. There are two cases of the task start - right after
> +the task is created. In this case, origin_seqno must be zero.
> +The second case is for reusing of already finished task. The origin_seqno
> +must identify the task to be reused. In both cases, a new seqno value
> +is allocated and returned to user space.
> +
> +The prerequisite is that application filled input dma buffer with
> +new source data and set input_size to pass the real data size to the driver.
> +
> +The order of data processing is preserved (first started job must be
> +finished at first).
> +
> +STOP
> +----
> +Stop (dequeues) a task. If seqno is zero, operation is executed for all
> +tasks.

Don't you need a DRAIN?

for a co-processor API, you would want all the input data to be consumed
and the stop happens when all the resulting data is provided in output
buffers.

And presumably when the input task is stopped, the state changes are
propagated to the next task by the framework? Or is userspace supposed
to track each and every task and change their state?

I also wonder if the state for a task should reflect that it's waiting
on data on its input, or conversely is blocked because the output
buffers were not consumed? Dealing with SRC, encoders or decoders mean
that the buffers are going to be used at vastly different rates on input
and outputs.

> +STATUS
> +------
> +Obtain the task status (active, finished). Also, the driver will set
> +the real output data size (valid area in the output buffer).

Is this assuming that the entire input buffer has valid data?
There could be cases where the buffers are made of variable-length
'frames', it would be interesting to send such partial buffers to
hardware. That's always been a problem with the existing compressed API,
we couldn't deal with buffers that were partially filled.


