Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2D4221D87
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751972205; cv=none; b=ACAzJp89BmqocpodqXewpkk58BA+eVMaB/rI+ssbjU35YZXITCtxW0PNoMK1SOnf7PPDet/2cRjbbXf4X/amY1bqivrhL2FyERcShI2nJ/H55cVK3uHP8G6bMjuJG7Who/Ga7yyH5rsqgs28PjizZ59MEWvG8kPvpJtgeVl4EOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751972205; c=relaxed/simple;
	bh=1xaNbB+a7gSJJd+QXNvSzFlv7dN8P7V5CrN4FPCL79k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q23ncN3lJ+buqwaQWjlv+YLYcpPU3NRSZeCAJZVedoYE5hpLWU7+AB1mNBMp/b35c3WssojKjNrS+mjvdiiM4mmztLAPgTuw8RuzECGorSVKkeYtyNF9wWXY+S5SZNu46uASUFteiPNf+NzxpzVBDXuqqy/U2T/h51dnV4TYNS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IirTAvsk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IirTAvsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751972204; x=1783508204;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1xaNbB+a7gSJJd+QXNvSzFlv7dN8P7V5CrN4FPCL79k=;
  b=IirTAvskfLmHpI0dVTZ/NysWdv5rYwoqzok4TCyqRtxZnbR9t5faDoFW
   9KXkLQ/xWHhi7oZix+5d7pPv7Rv2bdXVjmaCVYa5E3b76PZaNTrATkeV/
   MHPFaDjfweNs/EJDm0dgnIHZHsAm9vyW50dYH8jSb2Q00vElPLZ49Pyox
   g/dYcFIFtE68ts66t9r8JXbj/tq4O8iTorinbWMLt10+3tpQ3GS8JPAHz
   DnzzPNeB8lwsWibq/MSRa6++2NMxiPwc8Yl0yj7saWaeD7+vTJ4WwLA/o
   5lzimLt9Z6Ibk87kZYNWniUcaarYrjt5PTmRThNLLeECT/L8VqULkygHX
   Q==;
X-CSE-ConnectionGUID: TDmvxpMlRlSnbolJ+CrbHA==
X-CSE-MsgGUID: 7h3rAN2FQvqoaLAEu79HmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58007104"
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="58007104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 03:56:43 -0700
X-CSE-ConnectionGUID: CQc84ZLWQ/KutEH7ZvzUvg==
X-CSE-MsgGUID: m9aYwK5YSfCAUf3O/saZxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,297,1744095600"; 
   d="scan'208";a="186489693"
Received: from pcalusx-mobl1.ger.corp.intel.com (HELO [10.94.0.51]) ([10.94.0.51])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 03:56:41 -0700
Message-ID: <b53a0713-bb76-46a4-abfb-62db8186231b@linux.intel.com>
Date: Tue, 8 Jul 2025 12:56:37 +0200
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
 <3b69bdd6-9531-4101-985e-b03629e00967@linux.intel.com>
 <8734bdqr8s.wl-tiwai@suse.de> <87y0t5pc77.wl-tiwai@suse.de>
 <5da4cf47-2d2a-4911-bb55-d1e5a91618e0@linux.intel.com>
 <87sejdpauv.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87sejdpauv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025-07-03 17:12, Takashi Iwai wrote:
> On Thu, 03 Jul 2025 16:52:10 +0200,
> Amadeusz Sławiński wrote:
>>
>>
>>
>> On 2025-07-03 16:43, Takashi Iwai wrote:
>>> On Thu, 03 Jul 2025 16:32:51 +0200,
>>> Takashi Iwai wrote:
>>>>
>>>> On Thu, 03 Jul 2025 15:57:48 +0200,
>>>> Amadeusz Sławiński wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 2025-07-03 15:38, Takashi Iwai wrote:
>>>>>> On Thu, 03 Jul 2025 15:29:56 +0200,
>>>>>> Amadeusz Sławiński wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 2025-07-02 16:53, Takashi Iwai wrote:
>>>>>>>> On Sun, 29 Jun 2025 11:22:25 +0200,
>>>>>>>> Takashi Iwai wrote:
>>>>>>>>>
>>>>>>>>> On Fri, 27 Jun 2025 15:22:20 +0200,
>>>>>>>>> Richard Fitzgerald wrote:
>>>>>>>>>>
>>>>>>>>>> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> HD-audio driver is known to be quite messy in both file structures and
>>>>>>>>>>> its design, but until now I haven't touched its files paths so much
>>>>>>>>>>> because I set a higher priority for the easiness of backport to stable
>>>>>>>>>>> kernels.  But, you can't leave garbages forever, it's been already
>>>>>>>>>>> high time for a large clean up.
>>>>>>>>>>>
>>>>>>>>>>> So I tried a quick code reorganization, and put the result in
>>>>>>>>>>> test/hda-reorg branch of sound.git tree.
>>>>>>>>>>>        https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
>>>>>>>>>>>
>>>>>>>>>>> The basic idea is to move the code from sound/pci/hda/* into different
>>>>>>>>>>> subdirectories in sound/hda/ per functionality, as most of the stuff
>>>>>>>>>>> are independent from PCI, but rather HD-audio bus specific.
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> This all seems reasonable to me. I always thought it strange that there
>>>>>>>>>> is a sound/hda directory but most of the HDA support isn't in that
>>>>>>>>>> directory.
>>>>>>>>>
>>>>>>>>> Thanks for your review!
>>>>>>>>>
>>>>>>>>> It's a long story: at the time of ASoC Intel HD-audio support, we
>>>>>>>>> thought to implement more ASoC-friendly way of HD-audio controller and
>>>>>>>>> codec drivers, e.g. adapting DAPM and others.  So we began with the
>>>>>>>>> factoring out the HD-audio basic core stuff to the common directory
>>>>>>>>> sound/hda/*, while keeping the rest legacy stuff almost as is.  But
>>>>>>>>> ASoC implementation didn't fly in the end from various reasons, and
>>>>>>>>> the legacy HD-audio stuff was good enough for the actual use cases;
>>>>>>>>> it's too bit to fail, after all.
>>>>>>>>>
>>>>>>>>>>> The Realtek codec is split further to smaller pieces (which was really
>>>>>>>>>>> huge).
>>>>>>>>>>
>>>>>>>>>> Yes, that file was very confusing having support and quirks for so many
>>>>>>>>>> Realtek parts all in one file.
>>>>>>>>>>
>>>>>>>>>>> The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
>>>>>>>>>>> subdirectory:
>>>>>>>>>>
>>>>>>>>>> That's ok
>>>>>>>>>>
>>>>>>>>>>> They can be put to each own directory and drop the file name prefix,
>>>>>>>>>>> if we want, too.  Let me know if Cirrus and TI people would like to
>>>>>>>>>>> split to more subdirectories.
>>>>>>>>>>
>>>>>>>>>> I don't mind either way.
>>>>>>>>>> The hda_component* files are common to the amps and the realtek driver
>>>>>>>>>> so I wonder whether they belong in helpers. They are only utility
>>>>>>>>>> wrappers around the kernel component-binding APIs.
>>>>>>>>>
>>>>>>>>> Right.  So far, just because it's basically only binding with
>>>>>>>>> side-codecs, I put into side-codecs subdirectory.
>>>>>>>>>
>>>>>>>>>>> *HOWEVER* the biggest question is: whether it's worth?
>>>>>>>>>>>
>>>>>>>>>>> Essentially, this makes almost impossible to make a patch for stable
>>>>>>>>>>> trees from the original commit as is; one has to translate the file
>>>>>>>>>>> paths and adjust manually in each patch.
>>>>>>>>>>
>>>>>>>>>> Depends which file you are patching and how much it has changed.
>>>>>>>>>> Git can figure out file renames (and changing directory is a rename).
>>>>>>>>>
>>>>>>>>> I'm afraid that the Realtek codec changes might be hard to track
>>>>>>>>> automatically.  Maybe the Cirrus side-codecs stuff would work.
>>>>>>>>>
>>>>>>>>>>> Also, of course, if anyone is working on HD-audio stuff right now, the
>>>>>>>>>>> work had to be adjusted to the new file path.  It'd be one-off action,
>>>>>>>>>>> though.
>>>>>>>>>>
>>>>>>>>>> Speaking only for Cirrus, I don't think this makes much extra effort
>>>>>>>>>> for us. Our amp drivers have only changed location, so that should be
>>>>>>>>>> trivial. The other file we change is patch_realtek.c but that typically
>>>>>>>>>> is only 1-line quirk entries.
>>>>>>>>>
>>>>>>>>> OK, thanks for confirmation!
>>>>>>>>
>>>>>>>> ... and now I worked further on this, resulting in larger set of
>>>>>>>> changes.  It's not only the file location changes but also the
>>>>>>>> HD-audio codec driver binding changes.  So I put more people to Cc for
>>>>>>>> catch their cautions.
>>>>>>>>
>>>>>>>> To recap:
>>>>>>>>
>>>>>>>> - The all HD-audio driver code are moved under sound/hda.
>>>>>>>>
>>>>>>>>       % ls sound/hda
>>>>>>>>       codecs/  common/  controllers/  core/  Kconfig  Makefile
>>>>>>>>
>>>>>>>>       * The former hda core code is found in sound/hda/core.
>>>>>>>>       * The former snd-hda-codec code is found in sound/hda/common.
>>>>>>>>       * The former snd-hda-intel, tegra and acpi are put in
>>>>>>>>         sound/hda/controllers.
>>>>>>>>       * The former patch_* and co are put to sound/hda/codecs.
>>>>>>>>       * Realtek codec driver is split to several modules as
>>>>>>>>         sound/hda/codecs/realtek/alc*.
>>>>>>>>       * Cirrus codec driver is split to cs420x and cs421x, put under
>>>>>>>>         sound/hda/codecs/cirrus together with cs8409.
>>>>>>>>       * HDMI codec driver is split to several modules under
>>>>>>>>         sound/hda/codecs/hdmi
>>>>>>>>       * Cirrus and TI sub-codecs are put under
>>>>>>>>         sound/hda/codecs/side-codecs
>>>>>>>>
>>>>>>>> - The HD-audio codec driver binding is changed from the embedded
>>>>>>>>       hda_codec.patch_ops to hda_codec_driver.ops.
>>>>>>>>       (As of now, hda_codec_driver.ops is a pointer, but it can be
>>>>>>>>        embedded later, too.)
>>>>>>>>
>>>>>>>>       This change required some code to be modified without the dynamic
>>>>>>>>       override of callbacks.
>>>>>>>>
>>>>>>>> - In future, we may convert the runtime PM handling to use the
>>>>>>>>       standard pm_ops, too.  This was raised some time ago during the
>>>>>>>>       discussion with Realtek devs.
>>>>>>>>
>>>>>>>> The current patches are found in test/hda-reorg branch of sound git
>>>>>>>> tree:
>>>>>>>>       https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
>>>>>>>>
>>>>>>>> It's based on master branch for taking all changes of for-linus and
>>>>>>>> for-next, hence the branch may be still frequently rebased.
>>>>>>>>
>>>>>>>> So, please let me know if you see any issues or suggestions for this
>>>>>>>> conversion.  I have no concrete plan for merging, but if everything
>>>>>>>> looks fine, it can be even on the next 6.17, too.
>>>>>>>>
>>>>>>>
>>>>>>> I've built it and put it on one of our machines and hit KASAN during
>>>>>>> HDMI initialization, when I go back to master branch it works, so it
>>>>>>> is something on test/hda-reorg.
>>>>>>
>>>>>> Yes, there was bug in my branch that I fixed in this morning.
>>>>>> Could you try the latest test/hda-reorg branch, commit
>>>>>> 6491d5b2e256a678b3a138500bf601c916d3913e
>>>>>> ?
>>>>>>
>>>>>
>>>>> Still broken :(
>>>>
>>>> OK, thanks for confirmation.
>>>>
>>>> I guess it's a power up code path that happens just before the codec
>>>> driver initialization.
>>>>
>>>> Could you check whether the patch below covers it?
>> This one works.
>>
>>> A possible alternative is like below.  This one might be safer.
>>> Let me know if either of them can work for you.
>>
>> This one doesn't.
> 
> Interesting.  So the device_is_bound() returns true if it's called
> during the binding operation.
> 
>> I will run more tests on the working one tomorrow, unless you want to
>> try something else.
> 
> Thanks!

Apart from unrelated issue in snd_soc_avs driver for which I just sent a 
fix [1]. Everything looks good to me.

[1] 
https://lore.kernel.org/linux-sound/20250708105009.1883627-1-amadeuszx.slawinski@linux.intel.com/T/#u

