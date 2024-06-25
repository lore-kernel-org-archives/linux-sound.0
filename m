Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E31B806
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 06:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719295582; cv=none; b=k4M0zwjT1T+3Z2tCyzzgO/q2C/nQJXgwGzpO0m87mvHehRnWs/xBgIWUf1kkDmYzt+5WFHNqnOmzP1pJMKjHjVO2Zp35ZbjWzQZ5PfNDUKdxkTyxhmG0ay57rlqh3pfWq4jGQJawa4jCDnTf2Zwwaxxz9a07WZ+9YwCYAv4Yzyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719295582; c=relaxed/simple;
	bh=bDkHW0ZcVfYzobZA5NukkaxHd1j5UhRFVuyUpRfmE3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gx7ATGJVHvJMQIRYdB0wmxkw+8QaFaNxBrtdmSDQ7ZOyotTKEXsmV5vu5PgioKxN7kpX/1aszmEAsIsZcHx1EwtwjoQDJW6G8xc5LA72Al5NpiI1IUijXrAZuhUaAtPdnqEYdlBp909NCr9cFUPlFvQBgCZ4oCX9HZlU8SXLkHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgT6j6oW; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgT6j6oW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719295580; x=1750831580;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bDkHW0ZcVfYzobZA5NukkaxHd1j5UhRFVuyUpRfmE3U=;
  b=EgT6j6oWp2SRahas8lLOX9TgAyA69l/FqaQCwg2YIGik8LC2fmWETxrG
   TIucBo61cyXBIOTijmwinCBovVB41M6rPYs1fyIkuaK3/EjDQ4wBWwUo6
   WpDSNxLB8M+kYOXCkS9as9bW0bwuup4l/UCgLT5+sPMJkOdCI8hCqy18X
   YmEYA0j3tt2blH+784mU7KCcIsZ6YKzAzbQlPO8tXNVLHVEGkHgu1tNY7
   mT7pl9qIBbfGSRE68+AAyxF4p3CaAsodFX5Q16seyCQPVsmtLLGY14Kzz
   /rp2yNM3vxKmr9ul85WBSwEudb4HjnxApr9KAqJHlsQcj9UfFvaOT6l5Z
   Q==;
X-CSE-ConnectionGUID: hQclSkBsQU+75wQa5XWZxg==
X-CSE-MsgGUID: b2XJOqxSR52hCLXVA2O25g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16170137"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="16170137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 23:06:14 -0700
X-CSE-ConnectionGUID: Nh93P5i/QiOEj5wMRR+cbg==
X-CSE-MsgGUID: IU6/W4xMQAuD9vXodr9SRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="43522707"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.246.252]) ([10.245.246.252])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 23:06:12 -0700
Message-ID: <7fb00353-08f2-4fad-b05e-cdf4b6451cbe@linux.intel.com>
Date: Tue, 25 Jun 2024 08:06:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240621164915.410946-1-perex@perex.cz>
 <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
 <51462bc7-d9da-4e2d-9244-a59184c4d8ed@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <51462bc7-d9da-4e2d-9244-a59184c4d8ed@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit




>> I honestly find the state machine confusing, it looks like in the SETUP
>> stage tasks can be added/removed dynamically, but I am not sure if it's
>> a real use case? Most pipeline management add a bunch of processing,
>> then go in the 'run' mode. Adding/removing stuff on a running pipeline
>> is really painful and not super useful, is it?
> 
> This I/O mechanism tries to be "universal". As opposite to the standard
> streaming APIs, those tasks may be individual (without any state
> handling among multiple tasks). In this case, the "stop" in the middle
> makes sense. Also, it may make sense for real-time operation (remove
> altered/old data and feed new).

I must be missing something on the data flow then. I was assuming that
the data generated in the output buffer of one task was used as the
input buffer of the next task. If that were true, stopping a task in the
middle will essentially starve the tasks downstream, no?

If the tasks are handled as completely independent entities, what usages
would this design allow for?

Also I don't fully get the initial/final stages of processing. It seems
that the host needs to feed data to the first task in the chain, then
start it. That's fine for playback, but how would this be used if we
wanted to e.g. enable an ASRC on captured data coming from an audio
interface?

It's similar for the final stages on the playback, the memory model is
fine, but at some point the audio data will have to be fed to a regular
audio interface, and that point seems to have been overlooked, or I
missed it entirely.

In the existing "compress" framework, that connection to audio
interfaces is typically left as an exercise for the DSP engineers, and
typically requires the presence of sample-rate conversion and mixer. But
for a memory-to-memory model what is the direction to tie the input or
output buffers to the rest of the audio subsystem?

I forget btw that some processing consumes audio data but does not
generate anything in the output buffer, for example when analyzing
captured data to signal specific patterns or triggers (vad, hot wording,
presence detection, etc).
