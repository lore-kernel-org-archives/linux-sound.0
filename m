Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCB80056
	for <linux-sound@vger.kernel.org>; Tue, 26 Mar 2024 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711435775; cv=none; b=cVwoyb/Cf0ZEq3n0SMXRQ8BRj6xZ7V6AftDlRlp41BjSlJcRQhN4zkudjWaS/oZzwpoHlg3d94isFjlaRTjWXOpeqJiYjU+6Vzhi/HYLtfbt3UsQSVwc8N7AHmF4JNCZOdWgCehxd0qJXWqw5VJseWg5DYlR3qi71j+ta0DqfS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711435775; c=relaxed/simple;
	bh=BryRaYY8gDCNMKjyWhkiqyRLyJyQD8c5mGX0+SIlf/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAtYXxaAYTSvp5bJ/MKnhYRy2OGWjS+Ow1/wZiFXClUCtVECH7qiMYX+v/g7Lgxww92gexTyCp31ZqHW449Ogo1v1o/FoTsrf40TxSIEsmCChm9PJCsCpc7OPIc1tum9xj6PzPZpgl0C4Z+PBU1jDYB83yzjlUTGKawyEp54EWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OUepssdI; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OUepssdI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711435773; x=1742971773;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BryRaYY8gDCNMKjyWhkiqyRLyJyQD8c5mGX0+SIlf/s=;
  b=OUepssdIEE+OCNvcnEKt0bVKT1/X1lGB1qxMD+pfIqh1IJgx008Tr+8e
   padBkXb6pqlJZbJDlRjE7Sw3KABb4iSiv1EEYFCyWfNrs+NJuCAYARzYS
   oaIUl0vDbUHe37wUIIP5N8BsDA0Q6/CUmJAT2UL+YEEVNkXQnunn/udVa
   GGdRawtZAqhr/KXBHCMielXl+bJ3N9nCkY76SKnRtxRmwnx4y2rGTGD74
   jyFik0vJBAKlm7n0+XeAqZ9B6n8RobU1+QF1D4XQtEGv45hbuGnzaoOgZ
   15wIKEB1MWUsC3FdFNS1J2Yv0tU3E631ty9OXmwdssVbDzo2LSlcrJdsp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6337198"
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="6337198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 23:49:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,155,1708416000"; 
   d="scan'208";a="47020258"
Received: from shartkam-mobl.ger.corp.intel.com (HELO [10.252.56.51]) ([10.252.56.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 23:49:30 -0700
Message-ID: <5dcff452-516a-4b4b-ade9-c7ed62e469f4@linux.intel.com>
Date: Tue, 26 Mar 2024 08:49:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ALSA/ASoC/SOF: SSP dev_type support
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 brent.lu@intel.com
References: <20231127120657.19764-1-peter.ujfalusi@linux.intel.com>
 <ca5cddbe-3ebb-4808-8fdc-767369cb1328@linux.intel.com>
 <87plvmwkzo.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87plvmwkzo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 22/03/2024 13:42, Takashi Iwai wrote:
> On Fri, 22 Mar 2024 12:30:44 +0100,
>> Can you take these patches via the ALSA tree, I have hoped that it would
>> land in 6.9.
> 
> It seems like to be overlooked.  I applied those now to for-linus
> branch.  But it missed the PR to 6.9-rc1, so at earliest for 6.9-rc2.

Thank you! 6.9-rc is perfect

-- 
Péter
