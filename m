Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906822;
	b=Uwb2pHGLOtCqf+UJOzEF43P39/ZMWturaT9o78DFDeMcq22MVvAFYU1EwnRjfkcLwSdx
	 FR+22YOch04DVcbKD7ffMJ1AIcCMSIVTmGBiTLrUixhBabxLDPVU6TFUqtmaDWQE+q6rW
	 wYcQ0x0Oqg6Tsa7A8MeAfA9I7AZMFVjqn20kpumUlVjFZlszwqCYVupAtPPqFWVGGiMXW
	 YIx1yr8ZgH+kbrZPOgAo+9mNr97BxXVIkVLbbqjC3SZKZUgNAWtSz+1khmMRFbgEccwWf
	 0NoymUeVqLhCFqDVU2m6Nrv+gPBd6SbTwhmUgtTfXpQcJyT9eDjRli9FsPNqklSkO/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906822;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:From:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=JJ1KEtqq2LTKTLJaCt3xYadn56PcHXX0nyIh9rQrgRA=;
	b=bHJzm+HVozKGqfc9ILycUX/GnJ4PzI0siedYB6NbDu/0tg8btmGpKmlXOLOSc1b16TNh
	 z9uxWiFoqVGTN47OMZ6gFMMHBHJBMNFaJIj0KJJXy9qARk0dHF9dfgFiq+GPZdWixjIJD
	 yazGY4ajBhCvGm4pMcDq/WN9ueaP1/dVPTjpI9Sk6I0eyiLhp9WI+ftB/TRhDi6en+z9V
	 5sVdArE4G/VyUpNOoi6ih15MxFvRLr5EwRDed2TWLDmyv7lvSAJNLOhCRMZfYjBreb+4h
	 /inHDxJ4otapLC1XBtHk4qICFiaMFrzNKHpoS7r7FhvH3EkUNoXr8/8/OmqiMX9pp1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fDIlNqfY;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0DB606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 09:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B0DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fDIlNqfY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794906821; x=1826442821;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=rQwEtUJYU+G9QWLRRXgPW46QD52FtxuWKZ2ZHesRFSI=;
  b=fDIlNqfYlcsPn2vPmlGgZ/iow/zu3JbNOdptcmXW6K0Ars6SORBHoTsP
   PrU5n4g3DQmCaTKXskLLgWXjMaTC2WwW3WDjZJ0Eh2Ne75j+a0db0QOuW
   X1a2zrvMS4bJIGT334pA2sWPaiH59AHhm/OQZSWofX4odsVC6nPpxmWUp
   Uk3jDF+iG/pIiOa3tURfyxpvjqNXQvs2E9INTL315rOgua/KMwu5t+ztb
   u1g89vHuJmRhGoH3qeCXr+7jqlgCkZ60w1PGupqy5f+iCWq9Jp4TMQdBm
   UKds1PHnwboele/XdumCOjxcIS1jmcxCt9NYXlhQYyzy2mCyDGF005QwC
   A==;
X-CSE-ConnectionGUID: Y9KApJzFSsi+yglCEHrLOQ==
X-CSE-MsgGUID: 7A2WZuV1ThqVqaE33343dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3544932"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3544932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:13:41 -0800
X-CSE-ConnectionGUID: pSEX/dmGQBuoGdFkGJ3w8g==
X-CSE-MsgGUID: UosaWWN2R8O+9+23z1dXmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9794787"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.245.246]) ([10.245.245.246])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:13:41 -0800
Message-ID: <bc5a6796-952f-4949-bdd8-e0d1deb0ab4b@linux.intel.com>
Date: Tue, 17 Nov 2026 11:14:20 +0200
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Audio driver fails on 7.4.0rc2-3 Manjaro, Thinkpad T14
To: Yaron Shahrabani <sh.yaron@gmail.com>, linux-sound@vger.kernel.org
References: <CACVjhxVo=0FJMA1q35bP3-1re6Fo55vbSyEr+uGRsR9cAjSBjA@mail.gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <CACVjhxVo=0FJMA1q35bP3-1re6Fo55vbSyEr+uGRsR9cAjSBjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

the fix is in 7.4-rc3
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d00ba321499c0050872d70c41d86069f1d52c248

On 17/11/2026 11:04, Yaron Shahrabani wrote:
> I upgraded from 7.2 to 7.4rc2 and found out that the sound no longer works.
> 
> I filed this bug report accordingly:
> https://bugzilla.kernel.org/show_bug.cgi?id=222284
> 
> Thank you!
> Yaron Shahrabani

-- 
Péter

