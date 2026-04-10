Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCF538C423
	for <linux-sound@vger.kernel.org>; Fri, 10 Apr 2026 07:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804781; cv=none; b=pOSQ+eGVgfLblxE/nGJ6w0BmGlnreIviiMixvjgmrGWNk5kIKyzrV9mJadDRFrAKRSjeRpOunHL8jQlPuI193NCf9bkz2vQ/WTLCHeRWHRvjgnC30Uv1y4oyy5OUC4MeCau/25vS3rprKkIVGf5YFIOoWIyJZYXajq1IFbCSHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804781; c=relaxed/simple;
	bh=c/J2gD4VHP8fMmJ14GsCJF2XnMbZSvXrF7pvLoU2iXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wxh5a5JdOTWRTm3rqEh6cVHtp834rg2y+j8W7B5otabCsKimbcTEBEnNQSVNKlTxogXUGxD8s1RbSpKqdB8DAbMj/reg4S9gwk0f3JDSaYqYXHGBJVeyTbRCPpAG5E3zJrI5FBl2j7jFB42Dr6xlEBWJuNIvXRHdkvKYZnphOpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gs1HOQ9y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gs1HOQ9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775804777; x=1807340777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c/J2gD4VHP8fMmJ14GsCJF2XnMbZSvXrF7pvLoU2iXM=;
  b=gs1HOQ9ynrOk5VN9ZCha3ZJ0oo3tVvajQN1Zd8oW09MTzqiqa1zBMZNp
   uIaX+SQR6u9rSR9ySXfHe4kGlqXail+NnfkaHyMB15wxFKr2JAZpR9jyY
   iG8aeiGbCwSSoFehVi0KonxJVr5Yk2St5qoQ4eNzUWRVBFUICN5TPzqeQ
   xKw92Vu79yl9zDLfPPCcbOmTTkqoKI4MYGywFrhzkIyYlktxXjr7eHKut
   UA+shd24SkFndMiv8yYq8O06FmvLzLkbm05Y/T5geOlnAs2LfXfM7Eq3O
   8kI5PVs5osh8dcwdvKzgwZPs07gnCXHDmT2kN8xLhFLI531Z2klXxTP4V
   A==;
X-CSE-ConnectionGUID: hJTzbDeIRK2MZiCYJRMyZQ==
X-CSE-MsgGUID: 007D25PfQpi7gKHrZDxByQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="64356013"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="64356013"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 00:06:16 -0700
X-CSE-ConnectionGUID: pXRcPs9WSJyBC/XJ9LGSVQ==
X-CSE-MsgGUID: JPAInYppQGOPqvALBb/NSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228934804"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO [10.245.244.64]) ([10.245.244.64])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 00:06:16 -0700
Message-ID: <481bf4d8-6d5e-47e1-80ca-4f982a5ee712@linux.intel.com>
Date: Fri, 10 Apr 2026 10:06:38 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 0/3] ASoC: remove card->pop_time
To: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
References: <87h5pkda1r.wl-kuninori.morimoto.gx@renesas.com>
 <82c256e5-0af8-4ea3-ba5a-913a576b25cd@linux.intel.com>
 <adf50GLs7me92fvV@sirena.co.uk>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <adf50GLs7me92fvV@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/04/2026 22:11, Mark Brown wrote:
> On Thu, Apr 09, 2026 at 11:14:08AM +0300, Péter Ujfalusi wrote:
>> On 09/04/2026 07:36, Kuninori Morimoto wrote:
> 
>>> I'm now trying to cleanup snd_soc_card, and noticed that card->pop_time is used
>>> only from OMAP1 board-ams-delta.
> 
>> The pop_time is an amazingly good tool to debug pop noise and is mostly
>> used via the debugfs.
>> You set the pop_time to non 0 and DAPM will 'slow down' and you can
>> identify the step which produces the pop.
> 
>> Please, don't remove it!
> 
> For Morimoto-san's purposes I think it's sufficient to just make it not
> card specific so we could just have a global control in debugfs that
> applies to all cards instead.  That's likely sufficient for debugging
> use?

and I think at least the amx-delta is using the pop_time incorrectly, it
is using it as a handshake flag between the codec driver and the machine
driver and if I look back it started to to it with

fac3f5e20dce ("ASoC: don't use codec hw_write on cx20442/omap-ams-delta")
which changed it from codec->hw_write to the pop_time

f0fba2ad1b6b ("ASoC: multi-component - ASoC Multi-Component Support")
changed the original codec->control_data to codec->hw_write.

Yes, the global pop_time (card level?) is fine for debugging and the
cx20442/amx-delta needs proper handshake implementation.

-- 
Péter

