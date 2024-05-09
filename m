Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D763916F84A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715270410; cv=none; b=ZknCCl9S2gmXhxeVx7NzrromohApQvHabTgtbKxSDY/elUpd+nyc5Zi9864miHIVled8V1gRIt7MGkGGBhjMQMuzSwWkDKysLXcHK8JOOZwKidHDlMKWhT8ZndJl9xTFtOVbOipPjEPNJAW3Kkpga9lfsqN6vpyqTHJDiyr2qbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715270410; c=relaxed/simple;
	bh=YVoMDkd4Kyucg+FhSD9dLimMf7BJOn7zW4Zw9u62Cw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETbXcgX1RcNyYs0uKWG71Tbdhb01GYq+c/4uxDECDxQ0ksI7E64V+g9RuhswRwb2jaywiXysD4SjYufEAl/YmXqb7KVFDaTSHCXWKSEoL8c//mdfM+/DEtwQbW52GMoreRxVnrBJmi2M0Lbej1nrWucNfvebuK2H29gsNntCwdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbnF0IZ8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbnF0IZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715270409; x=1746806409;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YVoMDkd4Kyucg+FhSD9dLimMf7BJOn7zW4Zw9u62Cw4=;
  b=mbnF0IZ8HdGU6Viv05JLr92Ze2Rt5RENVbZ9sw/3CCLQug5DKTnffyeS
   oDptNhqCrzLigHULMyaz75OP/8FSnYEyiSY+M/QEwUYhu49Atda+bir1d
   IvfNU4jDV+nMosh0P1ER1rIDouaYVC65q8IZjkbpc5JIq9FY3lSqvUq5o
   xjiyT8asq6lrVaySOeTFbNE16AUPRIMWwVxCU3+k9aqMz+CEblGQNgdT4
   ehDx/kmGnBtUC9xmzN8KKPMpQsJmeswIa6dQ/1vH44Jocv40KWGfl+whw
   +EiUjjYdeSBupWeaq+F9lK4nQSJbuvBp7k4aQlBiLbolJ0muUVgAj37y/
   g==;
X-CSE-ConnectionGUID: iugfitRwTc2r4WwaWDPInA==
X-CSE-MsgGUID: ZPgcwowWQgCeqMKJbeTGLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11036826"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="11036826"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:00:08 -0700
X-CSE-ConnectionGUID: IyhFeXbdRo2wrZ+1do91DQ==
X-CSE-MsgGUID: 06muV9D8Qee/MMuWvpt0Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="29390582"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO [10.213.181.85]) ([10.213.181.85])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:00:08 -0700
Message-ID: <5630c56e-6639-47f6-81a9-6b52f8b540de@linux.intel.com>
Date: Thu, 9 May 2024 11:00:06 -0500
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ALSA/ASoC: Intel: clarify Copyright information
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, broonie@kernel.org
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/3/24 09:03, Pierre-Louis Bossart wrote:
> This patchset does not change any functionality. It only clarifies the
> Copyright information in ASoC/HDAudio contributions, where an "All
> rights reserved" notice was mistakenly added in a number of files over
> the years, likely due to copy/paste. The Intel template never included
> this statement.
> 
> I chose to group all these patches together, they could be merged with
> either of the ALSA or the ASoC tree.
> 
> Pierre-Louis Bossart (9):
>   ASoC: SOF: Intel: clarify Copyright information
>   ASoC: Intel: boards: clarify Copyright information
>   ASoC: Intel: common: clarify Copyright information
>   ASoC: codecs: Intel: clarify Copyright information
>   ASoC: Intel: catpt: clarify Copyright information
>   ASoC: Intel: avs: clarify Copyright information
>   ASoC: soc-topology-test: clarify Copyright information

The first 7 patches were merged by Mark

>   ALSA: hda: clarify Copyright information
>   ALSA/ASoC: include: clarify Copyright information

But these last two weren't. Should I resend them? Or can Takashi pick
them? It's just a minor clarification, this can also wait for the next
cycle.
