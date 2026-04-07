Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62239B948;
	Tue,  7 Apr 2026 09:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552419; cv=none; b=Ynr5/NaD09s28hxCC7Zw1Hkn5J4ZYyz6Z4NLh9r22ZLUcDm3yIHuf51rn6v65aY1rFQGaMqUXBIhpeKRLsOGgjm+Q1EG4mW2TXW+emVC/UIccmpLZQb989xrVIHcOyeZZcE+6FVtPOiSjVYCF5MGfVYCG+a1OBk+cZqzKWTMshc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552419; c=relaxed/simple;
	bh=Ep2AZ6it7JS7L7GLOImMUBie8rQ65luLGH0TsENBcQ4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LcNR1z8X/SNFh83EWtMAu/TuozT5WY9Pnbs9oAjYNTYHgxgRchyf7M+lCzecEfmRgXSGYaMxNr48Nlvvpsmp/9aUNfrXNbIU66YjeJq9lqtGcZTHD8/YlMM/mzxRqKBACkDGPks6BH6nB8PVUjxuxiPBhSdL2AXwunttOQDpbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evsH8GRe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evsH8GRe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775552418; x=1807088418;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ep2AZ6it7JS7L7GLOImMUBie8rQ65luLGH0TsENBcQ4=;
  b=evsH8GRe3w3e931ndg+sDnAt0sksvVFsQqD5Y23/sVTdfEtDaOFY2qku
   VMxAOfP9/o7BKSyYTXb2BaU34ab1yHNAjUGs65+fc3CvkPcAIofkoG0/R
   n391BW3H6E2IK0wEoJntwnUelHwHrC2IlLGEixcAX7/JzPv5RwPlwlD62
   X0BYai1Y0X9Q2C9l3DwBlpBSTTeTGlEEYzm0H67FqZd/fzDAqaglhb1c3
   eigsMbDwSW0a16leYg2ldQLwj5QshTCvv9ehgQ6L4Uzzfey4wsgfJ/pYy
   bBnqhGONDPeAkwS9M3gjkBf3pdPFDyR+kxWqc9eXUGl7A8b1873taFvn4
   A==;
X-CSE-ConnectionGUID: fCmSdvPaTQeC9W0tvLj5rg==
X-CSE-MsgGUID: SLMnnN28QcqFbjtJOdkvJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75551667"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="75551667"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 02:00:17 -0700
X-CSE-ConnectionGUID: ziNa+73DTgOFWloASVpl+w==
X-CSE-MsgGUID: SwUeP6tZT9CMmY51lB+/2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223317275"
Received: from ettammin-mobl3.ger.corp.intel.com ([10.245.246.249])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 02:00:15 -0700
Date: Tue, 7 Apr 2026 11:59:23 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
cc: =?ISO-8859-15?Q?Antti_Jalom=E4ki?= <antti@nevaberry.com>, 
    linux-sound@vger.kernel.org, tiwai@suse.com, perex@perex.cz, 
    linux-kernel@vger.kernel.org, 
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
    Bard Liao <yung-chuan.liao@linux.intel.com>, 
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
    Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda: intel-dsp-config: Force legacy HDA on Lenovo
 ThinkPad X1 Yoga Gen 5
In-Reply-To: <87wlymhgee.wl-tiwai@suse.de>
Message-ID: <5a581c38-38c8-854a-15e5-2d9d3d4ee077@linux.intel.com>
References: <20260404144743.46466-1-antti@nevaberry.com> <87zf3ihhu0.wl-tiwai@suse.de> <CAK=qmGDEk46xMeA22SScAA0U86XHEWOTt7nq4W6bE1fX+nAU5Q@mail.gmail.com> <87wlymhgee.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-283341963-1775552417=:4463"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-283341963-1775552417=:4463
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Hello Takashi and Antti,

On Sat, 4 Apr 2026, Takashi Iwai wrote:

> On Sat, 04 Apr 2026 17:46:08 +0200, Antti Jalomäki wrote:
>> Thank you for the review. I re-tested without the workaround on kernel
>> 6.19.10 (Fedora 43) with the latest SOF firmware available
>> (alsa-sof-firmware 2025.12.2, firmware
>> version 2:2:0-57864, ABI 3:22:1).
>> The SOF driver detects 4 DMICs in NHLT tables and attempts to load,
>> but fails with a CSE IPC timeout. Full dmesg:
[...]
> > sof-audio-pci-intel-cnl 0000:00:1f.3: Boot iteration failed: 3/3
> > sof-audio-pci-intel-cnl 0000:00:1f.3: 0x06000021: module: ROM, state:
> > CSE_IPC_RESET_PHASE_1, waiting for: CSE_CSR, running
> > sof-audio-pci-intel-cnl 0000:00:1f.3: extended rom status:  0x6000021
> > 0x0 0x0 0x0 0x0 0x0 0x1811102 0x0
> 
> Let Intel folks check the error above at first (added a few to Cc).
> If it's really a device that shouldn't be dealt with SOF, we can add a
> quirk entry.

this is typically a BIOS issue (Intel Management Engine not enabled in 
BIOS, or specific BIOS version has an issue). Re-enabling the ME in 
BIOS has often solved the issue (and sometimes a FW update is 
needed).

The DMI-based blacklisting is a bit iffy as this device does have digital
mics attached to the PCH, and with this patch, those microphones are then 
disabled for all users.

Br, Kai
--8323329-283341963-1775552417=:4463--
