Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388E2777F7
	for <linux-sound@vger.kernel.org>; Tue, 22 Apr 2025 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322894; cv=none; b=kF/tKJncWBiP2Ksp75idIHjKZ1fMnrG64ulSz9o8vQjQzkr+pBPiOkEFm89AMzFZniEDMlcKtOhLLoPmcBm8m7z9d3XPKnBpN/zPsvQpoNUDu6c1jgjMqSoO0S7qgd8azoPPskfMXy+9sseVqNo+9Exd0PWd9XlnzU3cbUK76Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322894; c=relaxed/simple;
	bh=OGWPYYpm06/Vuuw2dz5HhiOYfy9LMdq+m0xpWdPvevs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sye6d8GgJkyobSsZVaec3p2SM4+eJbPhzHo/dL7Q9gWzoHYK4zo8YXXc4WKXVk/hl+qRx9OYNH8iHDB/HLrEzPK9LnTD3C1ZzbCddY5FaQ92VDKWO1dfLzT2KPMStjpoodYYs6etz3fJizO3osNxngWAPvJ6bCAqnNggI8Kzn2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LbXxO/e+; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LbXxO/e+"
Message-ID: <a05a3419-8acc-47e4-bf06-8d87aca444cf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745322890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OGWPYYpm06/Vuuw2dz5HhiOYfy9LMdq+m0xpWdPvevs=;
	b=LbXxO/e+Ep7PYf8RyBFjY/FGTQ5z/S6BrkyOVdJS99H2bSpST1gsdwR8+9boQrU01lUvvP
	159okSYI19pjsS8ai58lTvJC4DZx7B2UEVVZ97dG3IOklIuaxVngALSPwxQHH/qJ76HaNq
	aYmBbcttqQ5uLDWvSmpURBkYLuSNzW8=
Date: Tue, 22 Apr 2025 13:28:06 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
To: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.de>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
 amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
 gregkh@linuxfoundation.org, quic_wcheng@quicinc.com,
 mathias.nyman@linux.intel.com
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
 <87v7rcwbyn.wl-tiwai@suse.de>
 <8e3fd738-c2c3-4ea0-963e-477c2fb253b6@intel.com>
 <87sem9xuxs.wl-tiwai@suse.de>
 <5f3c62e3-6993-4595-80fc-eb77c0c11f1d@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <5f3c62e3-6993-4595-80fc-eb77c0c11f1d@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> In regard to the HDAudio point, I see clear benefits by having HDAudio and USB aligned in the approach on ASoC side. It's a path that's known, works and is well tested.

The current direction for HDaudio is to have the DSP handle ALL streams with DSP-enabled drivers (or none with snd-hda-intel).

But for USB we absolutely need the ability to bypass the DSP when the resources are exceeded (too many endpoints, too many channels, etc), or when low-latency is required (lowering CPU utilization comes at the expense of latency).

In other words, the USB solution MUST expose two PCM paths, a legacy one and a DSP-one, and a sideband communication between DSP and legacy drivers to manage resources.

HDAudio has none of those concepts, which makes it hard to see what the suggested alignment is?
