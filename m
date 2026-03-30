Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E135AC3E;
	Mon, 30 Mar 2026 07:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774854124; cv=none; b=ib/qPgpoLudKaJ35ll7YVmDwsFoiKddLT/ZzMSzLus9l+k9Dqe4iPJlAdP3SdCQDLijGGegjGKbwyf+fLOiXRgV4NNPnzTeOn3fdRHol8X0j+YxZ+EBrEYPOAdwTPVJ5osJ7r3LiyGuWv9jSezDgXzv1NbTSQHmb9R/mC0Nw38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774854124; c=relaxed/simple;
	bh=fOjWw5IiebbtAhr8YBZFDPhdcrs8I3esrc5VGtdJHpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=anxQM7jingf7EbGCEidwYbZJHr31QmLjHr/ZyUQNUE7Gwow8UqWYp6GZlYsz148qiUn9nZ0MyJEPmvGtf0BrQNrDEmSkr8L7guQiQxh9IjL0gldSHMEKeBn3mI+99boIgECxdDKr7t5vElx9/lSXKE8JB4T05JtzrTFYtV5Y2sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gA+06YeE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gA+06YeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774854122; x=1806390122;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fOjWw5IiebbtAhr8YBZFDPhdcrs8I3esrc5VGtdJHpI=;
  b=gA+06YeEhOd6CZ88OTL2RFdsp96LoWgXvK4QTnTwwTgaJA5U2m4CWqYN
   hmaIXyeMF0Ym8lYzBdClNdig64R1awVuMT1FKl8Vvtoxs8Y2KESrCQl2+
   DwwlTrmDPP8eEr6jWK4xwvrRCuNWiV8XgUJxz8XYcjF9fVjBcSD0TKzVF
   p0AJU924TK8BTAbR03U5/LIBL3gbF7+r/4pyIzmpDNSUBr41YqhGb7Dik
   VfrzTGHzP0TU7LS64bjHmg5uNOqcUQ9h37MbMsBMrsRb6yS91IR6EObBC
   mRULk0AjUwmRL+9qlptIbM5vONa9BZa2V48ob5V7VwBkXyKobBetWOWbG
   g==;
X-CSE-ConnectionGUID: 3krG33tESJGy25mAFilefw==
X-CSE-MsgGUID: LNylHaLKRmeTjblceE/T2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86457008"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86457008"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:02:01 -0700
X-CSE-ConnectionGUID: pnKNxONTRRipGQkOYEDfHw==
X-CSE-MsgGUID: ghGk0u/PSiC9PF4jCf+sCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="227582178"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.70]) ([10.245.245.70])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:01:57 -0700
Message-ID: <e3c69a0a-5ed1-45f7-9180-9268bd671df0@linux.intel.com>
Date: Mon, 30 Mar 2026 10:01:59 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Don't allow pointer operations on unconfigured
 streams
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Olaru <paul.olaru@oss.nxp.com>,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260326-asoc-compress-tstamp-params-v1-1-3dc735b3d599@kernel.org>
 <3cd96fe7-4575-40f9-a1f2-610fb1fac5c1@linux.intel.com>
 <aca1sW6ca1QJBN9V@sirena.co.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <aca1sW6ca1QJBN9V@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 27/03/2026 18:52, Mark Brown wrote:
> On Fri, Mar 27, 2026 at 11:49:41AM +0200, Péter Ujfalusi wrote:
>> On 26/03/2026 16:52, Mark Brown wrote:
> 
>>> +	if (!sstream->channels || !sstream->sample_container_bytes)
>>> +		return -EBUSY;
>>> +
> 
>> Is this a theoretical fix?
>> I don't think this can happen in real world as set_params would need to
>> fail and if that failed then applications would not ask for a pointer as
>> the compress stream cannot be even started.
> 
> Yes, it's not something that would happen in the real world with a non
> buggy (or hostile) userspace.  Still, we shouldn't leave this stuff
> open.

Yes, hostile user space is a valid concern, in theory it can ask for
TSTAMP or AVAIL before it would be meaningful (a configuration is set -
buffer config is known).

For avail the state sanity check is in wrong place in
snd_compr_ioctl_avail(), it should be before calling snd_compr_calc_avail().

tstamp does not even have a sanity validity check in
sound/cor/comrpess_offload.c, which it should as well  - snd_compr_tstamp()

Should this be fixed in core level to avoid repeating the same check in
every driver?

-- 
Péter

