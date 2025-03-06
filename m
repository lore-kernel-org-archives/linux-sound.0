Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0224C6E
	for <linux-sound@vger.kernel.org>; Thu,  6 Mar 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275403; cv=none; b=hiEDs7btYm/TPbRi5Y84qNrJQTMfPdR+294ylfb90yYiOpegqjK5jXKQbeH6/xvqBpKdI0GELH6LZoMoZ7KJ3fnRxuoveSsU+cIDX84lYtLplyk4QQq7c0N5vLRvP3FqCKDildmieMa5+6sW7YDJQ18l68t2ZcP86RZKtnPXLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275403; c=relaxed/simple;
	bh=zTp5ljnFS/0p1w24q0Jp66vKgxh0EpPHXOAApPe/t9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiBbFJ9DWYtdFNPWS2F+W2u8yWmS7+Eln8hT8/lF7r88dHJ/pNrgYBMqgwy1XF5F1i7Vub2vrlW1khZcqjuAjS0+kNG2GexvfkpxrjyCcZXKZLrLAFVrGt61EI93sNSqLazt64bqNSFLJDujGQknmXs6AX9wpij46ryHFZ3igeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQ6T3zfH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQ6T3zfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741275402; x=1772811402;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zTp5ljnFS/0p1w24q0Jp66vKgxh0EpPHXOAApPe/t9I=;
  b=OQ6T3zfHdUeikAeZaYLHMc8FjHealaw0xzbLIzYgcc2mUpQhzKLmLc/u
   AvJIAn+jlCtCsYwkxSHAzHdnzb4ph3cceHkXh+gL4tOoqv4oZRs/Dvd0d
   Ckt59kld6hC/y1kewLCp+K0P27ohZ7YPCY2fEMfprvNtcI9jt0a84P0k7
   59XUs2V+ADIR87yKnkLhmFRz0S7BPNM4nHvD/dMjnE+7J3kN42dNpOFaY
   zHJl0tfd51aWlpKnE6PDVOgFi+/OLddy9/ijCFuPY3VrZ7XNIVpNxvzSb
   uddUajjcts7TxHaBAguUmfnsVsXc/fOYpSf9WD8aMcO8K+gjXbYHjBg11
   A==;
X-CSE-ConnectionGUID: +jfhDlvCSceiNjuJnUdyPg==
X-CSE-MsgGUID: h7DvVQuiRSyu2UUfrrmbMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53278337"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="53278337"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 07:36:39 -0800
X-CSE-ConnectionGUID: aOziWUOsTWyVBAaSERDkbA==
X-CSE-MsgGUID: pQbj1YTRSZe+LdnKCR2a2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119565642"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.249.86]) ([10.245.249.86])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 07:36:37 -0800
Message-ID: <97847fb3-3659-489c-a6a5-3a76cb048523@linux.intel.com>
Date: Thu, 6 Mar 2025 17:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] ASoC: SOF: ipc4: Add support for Intel HW managed mic
 privacy messaging
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 liam.r.girdwood@intel.com
References: <20250306133527.16722-1-peter.ujfalusi@linux.intel.com>
 <20250306133527.16722-6-peter.ujfalusi@linux.intel.com>
 <07d7106e-97fe-4895-a471-db09f7a169e9@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <07d7106e-97fe-4895-a471-db09f7a169e9@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06/03/2025 15:42, Mark Brown wrote:
> On Thu, Mar 06, 2025 at 03:35:24PM +0200, Peter Ujfalusi wrote:
> 
>> Platform code can call sof_ipc4_mic_privacy_state_change() to send the IPC
>> message to the firmware on state change.
> 
> What's the plan for that plaform code - is it expected to be the machine
> driver, or something else?

By platform code I mean here sound/soc/sof/intel.

This feature is only available for Intel hardware, but I wanted to keep
the APIs as open as possible for other vendors.

The reason for the implementation is that the interrupt about the change
in mic privacy is delivered via IP interrupt (piggy-backing on them).
The interrupt is delivered to the owner of the IP:
DMIC is owned by DSP, so firmware can handle it
SNDW is owned by host, so Linux is handling it.
The firmware needs to be notified of a change to do a nice fade out/in,
the software cannot block or do anything else, the incoming stream mute
is done by the hardware.

No plan to integrate it to machine drivers, this is outside of the scope
of SW. The feedback is also handled by hardware internally.

-- 
Péter

