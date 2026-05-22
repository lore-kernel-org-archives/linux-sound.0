Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681503A1D07
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 13:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455907; cv=none; b=nqkjiIqaQpI0vKegaZfozALKmkMqR1Iwv4wn18GqHms0Wt81Iutkwk1LkqPeIjDbmlbsL+alC+J1PJ5ZzaqZvj9LGNeyVvdaNNCmSZBsKFLe/yCd59DCg508nKD7HyS8EFfVz7ZDvVhDcrRQU5qK5OEGq1kSN7df2/9YkotDCUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455907; c=relaxed/simple;
	bh=1fXVXa6aq+0uXYCXkolKcjqVyr4OWPnkMBrE4ARQsrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tv6F17vCK8+gD47Gr+SSoaUy+XgrD0hHWifN95mGzVQEXrm1w4txdzpqh5K1uIehiw7c7uPAqRYvkCTAUP4q+IjNyn+UYncrwvOkXBAMVCsRa1ZW2DzG9yWhX9OJ6XIP3DeXDa9X1uvqs4N9ttIi22zI0hkvLhVh4UOEJSjEj8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2peVyfp; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2peVyfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779455905; x=1810991905;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1fXVXa6aq+0uXYCXkolKcjqVyr4OWPnkMBrE4ARQsrQ=;
  b=F2peVyfpzWOq9HuG22CJXfvcSwqwpNOpkSGAa0Ebg+YqMwTsvZoCKFHe
   D4dnQjOHLhQGkZW0ulTHXVvsoZ2DWCH1XkpcgV3E9RWHZu+/+HQ9bx27J
   ztOw3LI59kGMvUlUDYb7gAfhm2elHoAMgvy3+BNFPC7P29oznK8SQFtpF
   wKeFAgHWGvArzjbN9fKJRArumTVKu56T/MwzIpKFvJ6jAD5mAbyEiJOU4
   Gxbz04hM9pwspUnvPeivZpWKhkXMeEspmIx3tuuR15KFu9nq72FI+8aHH
   JkSU3/KJ+NLs/ODFoWlR/yErQLrExvIiMy9mgrd5l1GAAwYRpVfQA1JPe
   g==;
X-CSE-ConnectionGUID: Tt/UNFYUSTKvWpH0K5FRZg==
X-CSE-MsgGUID: 5Lz4Wu+sSY+85pf27H3Asw==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80354164"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80354164"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:18:24 -0700
X-CSE-ConnectionGUID: wGE6JFnhTey17OPQWGBXIQ==
X-CSE-MsgGUID: 0KZtH3bBRDihswIK3Rs7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="234559170"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.244.207]) ([10.245.244.207])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:18:23 -0700
Message-ID: <13e71656-90ca-48e2-b4db-790d4ef1e3f2@linux.intel.com>
Date: Fri, 22 May 2026 16:18:31 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9315: *sof-audio-pci-intel-tgl* still not loaded
 automatically
To: Paul Menzel <pmenzel@molgen.mpg.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org
References: <d67d624a-35b0-4865-a288-8aeed04f60ee@molgen.mpg.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <d67d624a-35b0-4865-a288-8aeed04f60ee@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/05/2026 15:31, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> By default there is no sound on the Dell XPS 13 9315, and the module
> *sof-audio-pci-intel-tgl* still has to be loaded manually with Linux
> 7.1-rc4. It reminds me of issue 4540 [1], but that is supposedly fixed.
> 
> Please find the Linux messages attached. At 184.662140 the command below
> is executed:
> 
>     sudo modprobe sof-audio-pci-intel-tgl

if manually loading the driver works and then audio also works then can
it be that the driver is on denylist?

Can you open a new issue for sof linux, attach the alsa-info.sh, follow
the instruction in this comment:
https://github.com/thesofproject/linux/issues/5750#issuecomment-4349021007

and also attach the _full_ kernel log of the boot (when the module is
not loaded) then the log when you manually probe it.

Also, the output of
lspci -v -s 00:1f.3

Thanks
Péter

