Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54277218E95
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430334; cv=none; b=HoBSI92GxbepagmBGwu9h1glXyMo7DzYm7D1259C0pjMisHMeaF3yQp0bAEDazY3pVJCYT90nda5LJ485L3n6VXnIauu8kOVTCYh9145M0Re0ru5PFCj5QstMvA3nyxvIQg1ZazrgJwjhTRqAqedAYtwVSYY3EoYG1gOau3k1FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430334; c=relaxed/simple;
	bh=bCbe74Hdo8DhwkJN7XUsYIOCGwkTMk0baZv0XiP6VmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PZTi0GB6UZm8ARTkcBuXhlcPtLIPFWQ14rY+iRp0k1nCWdTJ7heWim2QE8nMSP0Bw71LVK6lhRIoO3c/i8Q28nxdiblXSHY458d+/z+TYX7oGGCjKMcdU0/3IeRtErwd3Xgt/Fqs+rB0sa1K4G94Fzl4C79g7IRwjp89YUdua+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ife4W0Xa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ife4W0Xa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736430334; x=1767966334;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=bCbe74Hdo8DhwkJN7XUsYIOCGwkTMk0baZv0XiP6VmU=;
  b=Ife4W0XaXWMt8gVEFnE+xWdA/2Z7v6L+Ose/cYzY3j7V/FR4nyavhV7X
   4dQizQ26DF68yjMFY7zDtA/pw8R8wm21nyNOjCo6hIh2l/JhqaT0typMM
   CMMc+FLtUngw1lrHb1hm07VATC7O5CI3Byh+7hqOG7PZyJCwzZLy+y5xk
   Frb+HpX9n2VnHbrinub/yb18S9ceTLppPQtlVM3uK9hOyiUIMhbGHY+67
   1f+3VJggTL1GRqfhhT5a11W5+B22ijTeLGC+qHnwbHkEFI9WCm76NhF5t
   M5kbRPYCWpOWH2rU5jHCsC5TomkArz3LrheTfYUrpakLHovMma9kbaeHd
   Q==;
X-CSE-ConnectionGUID: VVpKaK6HR4qWHf6rphPCPA==
X-CSE-MsgGUID: IqdihbSPRoqIPau/uFPNJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54108902"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="54108902"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 05:45:33 -0800
X-CSE-ConnectionGUID: cUgeWHxARDix9gcEyVpqVA==
X-CSE-MsgGUID: oliCGWbqRyOZiZX0IdVm7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108512107"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107]) ([10.94.8.107])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 05:45:29 -0800
Message-ID: <f7332c37-aad3-4cde-ae54-950d0136e46e@linux.intel.com>
Date: Thu, 9 Jan 2025 14:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: remove disable_route_checks
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
References: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wmf4269n.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/9/2025 1:13 AM, Kuninori Morimoto wrote:
> 
> Hi Mark, Intel test team
> 
> ASoC framwork has disable_route_checks flag. Intel is the last user of it,
> but it seems it exists in dead code. So we can remove it.
> 
> But I can't test it. This patch needs Intel team's Tested-by.
> 

Not sure what's there to test, when it removes unused code ;). Still I 
did quick test, current solution (avs driver) works fine with regards to 
core/topology changes.

Tested-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
