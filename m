Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D7819DF6A
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 06:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774936844; cv=none; b=snKMcQzPMTsIC9Mw/XtKI9plCLZG8gE6gZubzg/SB/fa7zlVayfRVCrngjlUZZv200+sXVSwE4AUjP5dnLE+o0K4lf6g4Xizg13sPhUKPoPd9RCsDc0ihl97zFwNNWgVVsjHCTolw92m7is9OwMiOXCRBX3iFE+SEtxuSZj1yzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774936844; c=relaxed/simple;
	bh=fkXxvhiVBFqKqKw3s3He36S3sohTgtdnqNJ9mwd5fL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVV4wgCWIxaMcF1VsGA9g3AppSWCVSHtIdxo+k3hMWD3VXe5jK0qFPBOGdnPtBW8JkfKSGmC7MbRjXEWCMevuvM2MGHfmCtuDu5ELkoEIGUGzTxwUbDtkpgcIl6JRKQ25Junv/bqnyvA9PFmBizCoX+8MTvC4d8QP8Dv4xk+7p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxD/hUyJ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxD/hUyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774936842; x=1806472842;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fkXxvhiVBFqKqKw3s3He36S3sohTgtdnqNJ9mwd5fL0=;
  b=JxD/hUyJmIC+yHjwCI/kylHyZn3DnSCXpLC4k9OM4tARP1XbRu85w0RL
   oub534/mTCKrICCFnO81Y3jbdmyyRE7ksEw1OfPDC8piL0rrlf/HnOs8W
   LaiFY/Wj1Py2blBp9/TLYGgRTGN3ZygDU4Y6t3L4EYfglthpdo7OoUQcF
   8VJvMhm0HUgeAzAtAzM74o3ZUBSwvJMIeBGf/m7cGsmhmtOF8dMqLMCDR
   YzpOWA+ZiT1j+vinDSkwL3U1TrEVKvrLUvcxe5bJtwwRRv6dcVL1VRk9W
   StRwEm9o/CW6dRoYjsIhmcPoPWYorKH5jizJmmyo48hPZ5n/CLfrJhZD0
   A==;
X-CSE-ConnectionGUID: PzjMDj9lRValLxgT7SkNYg==
X-CSE-MsgGUID: yww031o8QM6tk87SUQFKlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="79837284"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="79837284"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:00:42 -0700
X-CSE-ConnectionGUID: JRRtkffGTEyet5gCMMNYhg==
X-CSE-MsgGUID: eGN7wwo9Q1GCp+icGXYCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231198697"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.218]) ([10.245.245.218])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 23:00:40 -0700
Message-ID: <dadef18b-1c2e-4c0d-8ae8-2e4b8ad75d04@linux.intel.com>
Date: Tue, 31 Mar 2026 09:00:56 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (re)use and (re)definition of snd_pcm_hw_params->fifo_size for
 'jumpy DMA'
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arun@asymptotic.io,
 wim.taymans@gmail.com
References: <a03350b3-5828-4ffe-ade7-b94bb6ec7d64@linux.intel.com>
 <87se9htms4.wl-tiwai@suse.de>
 <67b9f48b-1cc7-4dac-8f6a-c0cba6a84b36@linux.intel.com>
 <87ikadtgpe.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87ikadtgpe.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/03/2026 19:39, Takashi Iwai wrote:
> OK, then I'd say that the existing fifo_size doesn't fit fully for
> this kind of stuff.  e.g.

We came to the same conclusion with Jaroslav, and the plan is to
introduce two new parameter in hw_params:
init_chunk and step_chunk, both in frames.
init_chunk - is the size of the hw_ptr jump right when the start happens
step_chunk - is the runtime jump size which happens every step_chunk time.

for example:
init_chunk = 100ms
step_chunk = 1ms
hw_ptr moves 100ms on start (pointing to 101ms), after 1ms of time the
hw_ptr will move 1ms ahead to 102ms, in another 1ms it again moves 1ms
to 103ms...

init_chunk = 100ms
step_chunk = 96ms
hw_ptr moves 100ms on start (pointing to 101ms), after 96ms of time the
hw_ptr will move 96ms ahead to 197ms, in another 96ms it again moves 1ms
to 293ms...

Note, the first is theoretical, with SOF 1ms step is used only with
'small' DSP side buffer:

init_chunk = 4ms
step_chunk = 1ms
hw_ptr moves 4ms on start (pointing to 5ms), after 1ms of time the
hw_ptr will move 1ms ahead to 6ms, in another 1ms it again moves 1ms to
7ms...

I'm not sure if we want these to be snd_pcm_uframes_t types in
snd_pcm_hw_params or should be u32 simplify the shrinking of reserved..

-       unsigned char reserved[48];
+       snd_pcm_uframes_t init_chunk;	/* in frames */
+       snd_pcm_uframes_t step_chunk;	/* in frames */
+       unsigned char reserved[48 - 2 * sizeof(snd_pcm_uframes_t)];

with u32 we can simply change the reserved size to 40, which is anyways
going to be the case for the snd_pcm_hw_params32{}

> if a device allows a different queue size, it should be configurable
> via hw_params.

I'm not sure if I follow this statement. the fifo_size is a driver to
user space information, driver fills it and user space ignores it ;) - I
cannot find any evidence of it's use.

The init_chunk, step_chunk would be similar, the driver sets it and user
space would use it.

In SOF this will be dynamic and it will depend on the period size:
https://github.com/thesofproject/linux/pull/5673/commits/18f3ba5e42212d77019d79ec09b7057a7703d361

-- 
Péter

