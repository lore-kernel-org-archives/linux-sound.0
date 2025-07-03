Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805022E7BD7
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551075; cv=none; b=UVZbjVYpWjCBBACXq0XRSajtmBjF7v7Iewemg8KIGwdRIkj+umcOfJ4EwjTuqEBd9d40dWFjf3BSvBO37zNwiiY49fPlEcRhXzipBBHHFwa4WXoTlNTeIuAOZpx4kqRYEXLdJKfTxW4DtsU6ZvevlA84UKd4sMDSdLZ2Wjy7+ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551075; c=relaxed/simple;
	bh=C8+fpWzEFSctXfZCz50PalRHJbBI7whAe4D0jB0B0/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnnYCMJyB6p8gN4fWaC8KCfe1GcYqHmmKRrNPFJ2Pxv+mY8pXLTK882LevgbPOnaHJZFkpdslYvbcbjEI6jrd3fM43f0lLO+e7Uqw7vfPvpJTjnqnj3uOZhgwxz/QReDF9Tht5PyyG2NsEOm5A1X9Eh5P7dslxqWy/of/Zys+q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgLqo/Cp; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgLqo/Cp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751551073; x=1783087073;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=C8+fpWzEFSctXfZCz50PalRHJbBI7whAe4D0jB0B0/4=;
  b=QgLqo/CpzKHAFkB+37DJqxLrVq8oS1R8GchIqrWEYiLp6OvN0wS/cNNs
   sWBSobrxBrGZG0vWiZML035sHlf3RcBIWzSFViGv31s0mWPtbYwoPFfpF
   RD8DzKWriBNr2G/6c6Zd3UU/81Iq1OFPaa9X8eob7Hyr/5m+m94dd9LS6
   f/PTjKq8893ff+qLIU7sLdKq3cRmHQyZqUbzZiHq1nlzI5AfQdZts5wJL
   5P/E3nGoSKiQYAseQFgFtTOOUb+Um+rT9y5fP292SRWBGMivB9HNXNowS
   pooy/1cE4AEVw3D4iR0Z4gggzC/UZaR6QgxoahzV0LF/AHZ36pFMRe8t6
   w==;
X-CSE-ConnectionGUID: V+ILCCm/QQiSn5Qx7sRSbw==
X-CSE-MsgGUID: K2xsecnQTx+3yfIPr+PTCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53974109"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="53974109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:57:53 -0700
X-CSE-ConnectionGUID: TDiV6STaSm2d7lOVEoBayA==
X-CSE-MsgGUID: 2k2mQKD8RPacw+93nrC0HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="191558522"
Received: from sbockowx-mobl2.ger.corp.intel.com (HELO [10.94.8.84]) ([10.94.8.84])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:57:51 -0700
Message-ID: <3b69bdd6-9531-4101-985e-b03629e00967@linux.intel.com>
Date: Thu, 3 Jul 2025 15:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Reorganizing HD-audio driver code?
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Kailang <kailang@realtek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <87ldpdgzle.wl-tiwai@suse.de>
 <e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
 <87h5zygawe.wl-tiwai@suse.de> <87ikkave2o.wl-tiwai@suse.de>
 <d7836c81-79d5-4920-8d8a-31ac6bd39fc1@linux.intel.com>
 <875xg9qtqn.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <875xg9qtqn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025-07-03 15:38, Takashi Iwai wrote:
> On Thu, 03 Jul 2025 15:29:56 +0200,
> Amadeusz Sławiński wrote:
>>
>>
>>
>> On 2025-07-02 16:53, Takashi Iwai wrote:
>>> On Sun, 29 Jun 2025 11:22:25 +0200,
>>> Takashi Iwai wrote:
>>>>
>>>> On Fri, 27 Jun 2025 15:22:20 +0200,
>>>> Richard Fitzgerald wrote:
>>>>>
>>>>> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
>>>>>> Hi,
>>>>>>
>>>>>> HD-audio driver is known to be quite messy in both file structures and
>>>>>> its design, but until now I haven't touched its files paths so much
>>>>>> because I set a higher priority for the easiness of backport to stable
>>>>>> kernels.  But, you can't leave garbages forever, it's been already
>>>>>> high time for a large clean up.
>>>>>>
>>>>>> So I tried a quick code reorganization, and put the result in
>>>>>> test/hda-reorg branch of sound.git tree.
>>>>>>      https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
>>>>>>
>>>>>> The basic idea is to move the code from sound/pci/hda/* into different
>>>>>> subdirectories in sound/hda/ per functionality, as most of the stuff
>>>>>> are independent from PCI, but rather HD-audio bus specific.
>>>>>>
>>>>>
>>>>> This all seems reasonable to me. I always thought it strange that there
>>>>> is a sound/hda directory but most of the HDA support isn't in that
>>>>> directory.
>>>>
>>>> Thanks for your review!
>>>>
>>>> It's a long story: at the time of ASoC Intel HD-audio support, we
>>>> thought to implement more ASoC-friendly way of HD-audio controller and
>>>> codec drivers, e.g. adapting DAPM and others.  So we began with the
>>>> factoring out the HD-audio basic core stuff to the common directory
>>>> sound/hda/*, while keeping the rest legacy stuff almost as is.  But
>>>> ASoC implementation didn't fly in the end from various reasons, and
>>>> the legacy HD-audio stuff was good enough for the actual use cases;
>>>> it's too bit to fail, after all.
>>>>
>>>>>> The Realtek codec is split further to smaller pieces (which was really
>>>>>> huge).
>>>>>
>>>>> Yes, that file was very confusing having support and quirks for so many
>>>>> Realtek parts all in one file.
>>>>>
>>>>>> The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
>>>>>> subdirectory:
>>>>>
>>>>> That's ok
>>>>>
>>>>>> They can be put to each own directory and drop the file name prefix,
>>>>>> if we want, too.  Let me know if Cirrus and TI people would like to
>>>>>> split to more subdirectories.
>>>>>
>>>>> I don't mind either way.
>>>>> The hda_component* files are common to the amps and the realtek driver
>>>>> so I wonder whether they belong in helpers. They are only utility
>>>>> wrappers around the kernel component-binding APIs.
>>>>
>>>> Right.  So far, just because it's basically only binding with
>>>> side-codecs, I put into side-codecs subdirectory.
>>>>
>>>>>> *HOWEVER* the biggest question is: whether it's worth?
>>>>>>
>>>>>> Essentially, this makes almost impossible to make a patch for stable
>>>>>> trees from the original commit as is; one has to translate the file
>>>>>> paths and adjust manually in each patch.
>>>>>
>>>>> Depends which file you are patching and how much it has changed.
>>>>> Git can figure out file renames (and changing directory is a rename).
>>>>
>>>> I'm afraid that the Realtek codec changes might be hard to track
>>>> automatically.  Maybe the Cirrus side-codecs stuff would work.
>>>>
>>>>>> Also, of course, if anyone is working on HD-audio stuff right now, the
>>>>>> work had to be adjusted to the new file path.  It'd be one-off action,
>>>>>> though.
>>>>>
>>>>> Speaking only for Cirrus, I don't think this makes much extra effort
>>>>> for us. Our amp drivers have only changed location, so that should be
>>>>> trivial. The other file we change is patch_realtek.c but that typically
>>>>> is only 1-line quirk entries.
>>>>
>>>> OK, thanks for confirmation!
>>>
>>> ... and now I worked further on this, resulting in larger set of
>>> changes.  It's not only the file location changes but also the
>>> HD-audio codec driver binding changes.  So I put more people to Cc for
>>> catch their cautions.
>>>
>>> To recap:
>>>
>>> - The all HD-audio driver code are moved under sound/hda.
>>>
>>>     % ls sound/hda
>>>     codecs/  common/  controllers/  core/  Kconfig  Makefile
>>>
>>>     * The former hda core code is found in sound/hda/core.
>>>     * The former snd-hda-codec code is found in sound/hda/common.
>>>     * The former snd-hda-intel, tegra and acpi are put in
>>>       sound/hda/controllers.
>>>     * The former patch_* and co are put to sound/hda/codecs.
>>>     * Realtek codec driver is split to several modules as
>>>       sound/hda/codecs/realtek/alc*.
>>>     * Cirrus codec driver is split to cs420x and cs421x, put under
>>>       sound/hda/codecs/cirrus together with cs8409.
>>>     * HDMI codec driver is split to several modules under
>>>       sound/hda/codecs/hdmi
>>>     * Cirrus and TI sub-codecs are put under
>>>       sound/hda/codecs/side-codecs
>>>
>>> - The HD-audio codec driver binding is changed from the embedded
>>>     hda_codec.patch_ops to hda_codec_driver.ops.
>>>     (As of now, hda_codec_driver.ops is a pointer, but it can be
>>>      embedded later, too.)
>>>
>>>     This change required some code to be modified without the dynamic
>>>     override of callbacks.
>>>
>>> - In future, we may convert the runtime PM handling to use the
>>>     standard pm_ops, too.  This was raised some time ago during the
>>>     discussion with Realtek devs.
>>>
>>> The current patches are found in test/hda-reorg branch of sound git
>>> tree:
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
>>>
>>> It's based on master branch for taking all changes of for-linus and
>>> for-next, hence the branch may be still frequently rebased.
>>>
>>> So, please let me know if you see any issues or suggestions for this
>>> conversion.  I have no concrete plan for merging, but if everything
>>> looks fine, it can be even on the next 6.17, too.
>>>
>>
>> I've built it and put it on one of our machines and hit KASAN during
>> HDMI initialization, when I go back to master branch it works, so it
>> is something on test/hda-reorg.
> 
> Yes, there was bug in my branch that I fixed in this morning.
> Could you try the latest test/hda-reorg branch, commit
> 6491d5b2e256a678b3a138500bf601c916d3913e
> ?
> 

Still broken :(

>> I've checked few commits and overall I suspect that commit
>> 16e74bb52bba0aa67d3447a731ee5eb3fbb2440a ("ALSA: hda/hdmi: Rewrite to
>> new probe method") broke it somehow.
>> Seems like codec->spec is NULL while intel_haswell_enable_all_pins()
>> is called, so later spec->vendor_nid ends up in NULL pointer
>> dereference.
> 
> Right, there was a place that needed the NULL check of the bound
> driver.
> 
>> As a side note while trying to narrow it, while checking out
>> 0d20e421cf14ab73246f4476ad4d25aadbf2b740 ("ALSA: hda/ca0132: Rewrite
>> to new probe method")
>> results in following during build:
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> patch_generic_hdmi from namespace SND_HDA_CODEC_HDMI, but does not
>> import it.
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> snd_hda_hdmi_acomp_master_bind from namespace SND_HDA_CODEC_HDMI, but
>> does not import it.
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> snd_hda_hdmi_acomp_master_unbind from namespace SND_HDA_CODEC_HDMI,
>> but does not import it.
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> snd_hda_hdmi_acomp_pin_eld_notify from namespace SND_HDA_CODEC_HDMI,
>> but does not import it.
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> snd_hda_hdmi_acomp_init from namespace SND_HDA_CODEC_HDMI, but does
>> not import it.
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> snd_hda_hdmi_setup_stream from namespace SND_HDA_CODEC_HDMI, but does
>> not import it.
>> ERROR: modpost: module snd-hda-codec-atihdmi uses symbol
>> snd_hda_hdmi_generic_init from namespace SND_HDA_CODEC_HDMI, but does
>> not import it.
> 
> Right, this one was also fixed in my latest branch.

That one is fixed.
