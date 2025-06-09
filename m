Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158A1DC9B1
	for <linux-sound@vger.kernel.org>; Mon,  9 Jun 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458472; cv=none; b=LS+S9sJ1aqvQWX/nhEJK69b8Bp8NXQhO/Bz1ofANHlXIS/db5Juo0VVp/0qQdRKNN+M6N37hSkbNkMZ6z23MMdTd1yaFHSU0VJrCLVCZ9IIlGag0czeq4fPjy8r6CWKllORQL6Yf7P3zDI8kVhsRerWSBrp1mcESAO7rBuvn/QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458472; c=relaxed/simple;
	bh=rJg2OXVb/4HrWiZRIClqIydQqdy0QvavCFlPXhRuldw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=X0MAU4v45wO1UHnB582R8ZmfiejJqZrhuM/JARN3Y6iUDzZBO1qO62mX+07cfFL+r8PiEpBRk+t5M7ifd3rJJhaBY0uLX64gbS0r6teAjdrjrI5w5CxYhyEVYJ1xYoCVjQWaYQTfYPFkzhSGUDuiOqaB7eIY6lPD7VEukCKrrj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URk0FS2h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URk0FS2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749458470; x=1780994470;
  h=message-id:date:mime-version:subject:to:references:cc:
   from:in-reply-to:content-transfer-encoding;
  bh=rJg2OXVb/4HrWiZRIClqIydQqdy0QvavCFlPXhRuldw=;
  b=URk0FS2hPTPrhe9e8ImYFifgl3bA1W/kM+kQKLYRiQOezU9QmgUFxkkb
   3r0qJQTTtMqO/US/Y7LcIdt0+iv1JnOHfoJvU3pUe3EQR3BDqlI8knBN4
   xG16c1MmIE2KGfITmVp3mD2h3E/MSdeYb9241m6e4CXy0g//iH8POdCyl
   VAxTMQlSE9CTw+fveWYyacxrVubSPnryXroLk5Uxf5Jlb52i+mMeEaXap
   MShH+YbnqYo/9/rXUKB1566EPP6EzwKjJkCDmo/2Jn9xAllbamFo4JS9y
   q5dh42eDDouNgWwSEnIHSLVsNLpRNyvFW6r762Bz9+vH8rK4wIhY37wHd
   g==;
X-CSE-ConnectionGUID: 8UKT4tepQVC2IDXbb7u/sw==
X-CSE-MsgGUID: DXwaoLTOS8ugEGKyy2T2KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62143197"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62143197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 01:41:10 -0700
X-CSE-ConnectionGUID: RoaT08u+QO+CzLlq1b9T7g==
X-CSE-MsgGUID: KD0H6umuQmeOUVnlEniNXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146797738"
Received: from pcalusx-mobl1.ger.corp.intel.com (HELO [10.94.0.51]) ([10.94.0.51])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 01:41:09 -0700
Message-ID: <08af40c9-25dc-4b11-9406-4a697e294fe9@linux.intel.com>
Date: Mon, 9 Jun 2025 10:40:29 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: C10 C-State possible when playing music on a laptop?
To: Paul Menzel <pmenzel@molgen.mpg.de>, linux-sound@vger.kernel.org
References: <51fbfbce-cbc9-4e7f-9ce0-0653379ef9f1@molgen.mpg.de>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <51fbfbce-cbc9-4e7f-9ce0-0653379ef9f1@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

First thing to check would be which driver is used on your machine?
  lspci -k -d 8086:9d71
Most likely it is snd_hda_intel.

However looking at your device ID, your HW most likely has DSP support, 
which should allow some power savings. If your BIOS has not blocked it, 
you should be able to change to DSP driver:
# cat /etc/modprobe.d/avs.conf
options snd_intel_dspcfg dsp_driver=4

You also need FW and topology files, usually should be provided by your 
distribution by default. (If not I can give locations)

It should result in some power savings, as it is DSP which handles audio 
signal then.

Best regards,
Amadeusz

On 2025-06-08 14:57, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On an Intel Kaby Lake Dell XPS 13 9360 with
> 
>      $ lspci -nn -s 00:1f.3
>      00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD 
> Audio [8086:9d71] (rev 21)
> 
> and
> 
>      Codec: Realtek ALC3246
>      Address: 0
>      AFG Function Id: 0x1 (unsol 1)
>      Vendor Id: 0x10ec0256
>      Subsystem Id: 0x1028075b
>      Revision Id: 0x100002
> 
> Playing music, for example a song, the system does not enter the lowest 
> C-State C10 (pc10)¹ according to PowerTOP. No having heard something 
> about off-loading support, I wanted to ask, if on x86 laptops, the 
> hardware would support C10 C-State when (just) audio is used. If yes, 
> what would be needed on the software side?
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> ¹ In general it can only be entered after running the command below on 
> that device.
> 
>      $ echo 8 | sudo tee /sys/kernel/debug/pmc_core/ltr_ignore && sudo 
> powertop --auto-tune
> 

