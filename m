Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD481E
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 13:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549403; cv=none; b=BwbeM4yFTjfLWHwvsIOez8s+ddBRFr/Tvg4zpXgQ/NkGUk66Mrmp2EKhicWqUR89vYrrYcP+pGgUnRnu2zPwfKqIO/BeCXKk9cYrvEMwrsFtPl9IEQ46QfXpekJxk1ehg7kBxWTKk5DtVPZ++EFVCPDbqY1fMd2lRiD7XgG0UV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549403; c=relaxed/simple;
	bh=E/k1ZNNuEWrkbv7VD617IBO5HQ67vjc0+joPQmUwDt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vk2mLDt3Lh5a0CN/MnxXahQv7WdiqYNF+AiJfSR2PbYh5fwp+d6HoKWmx+6TMuEUCHkzpCKsLhQCi1R7BCKeY3JS0kthxUMKmh9Cn+/d4Pb1Mj40zwmto1Gg+A2Q1O4hbwCJ6OmUIicOXrw61ES9XAtQS4XlECZt4l76BvCisSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMdH0IU3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMdH0IU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751549402; x=1783085402;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=E/k1ZNNuEWrkbv7VD617IBO5HQ67vjc0+joPQmUwDt8=;
  b=FMdH0IU3VmU8sVuSEXBrnzHYW1kwV0B8hyqQY+d2bZoHHX/vnnjTBqFF
   kL5R3hr7mZBuovXG0UcJSgCDW1FTL2VNHNbLLLOm+aBZMJQHcA3W6sd4B
   aiEM/MJLjflJFANCoWVv0WP4kmr8fmmCFulRbeOzH/OV6j3m+AbSoxklQ
   cM03QplPdEIM+e0a5t+iEUcwzguf3cHY/WKJuubxyGr9RlxTufqdSrntQ
   Vh53OzrYB6rWvf+ZwIMLQMMz8meoKDB8wS2wuuHQspEC1FA3TdtExEDDe
   gqhtQ8ZlnY1ylAvH/Q6a+N0NMEJtNPu0hlskxrXC7klenOL1MnV+XhmhK
   A==;
X-CSE-ConnectionGUID: Wd2jsXoGRjuWsZDNhECAOQ==
X-CSE-MsgGUID: YVNqyts5RG+avJg3xM7Biw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76422043"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="76422043"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:30:01 -0700
X-CSE-ConnectionGUID: lKWXR1e1TkaDJKaDEcEfCA==
X-CSE-MsgGUID: FeRkVrZBQtqPtlLi+zsv1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="160065754"
Received: from sbockowx-mobl2.ger.corp.intel.com (HELO [10.94.8.84]) ([10.94.8.84])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 06:29:59 -0700
Message-ID: <d7836c81-79d5-4920-8d8a-31ac6bd39fc1@linux.intel.com>
Date: Thu, 3 Jul 2025 15:29:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Reorganizing HD-audio driver code?
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Kailang <kailang@realtek.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <87ldpdgzle.wl-tiwai@suse.de>
 <e6451c29-2ade-4b73-bfd7-f48bafccfa98@opensource.cirrus.com>
 <87h5zygawe.wl-tiwai@suse.de> <87ikkave2o.wl-tiwai@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ikkave2o.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2025-07-02 16:53, Takashi Iwai wrote:
> On Sun, 29 Jun 2025 11:22:25 +0200,
> Takashi Iwai wrote:
>>
>> On Fri, 27 Jun 2025 15:22:20 +0200,
>> Richard Fitzgerald wrote:
>>>
>>> On 27/06/2025 1:04 pm, Takashi Iwai wrote:
>>>> Hi,
>>>>
>>>> HD-audio driver is known to be quite messy in both file structures and
>>>> its design, but until now I haven't touched its files paths so much
>>>> because I set a higher priority for the easiness of backport to stable
>>>> kernels.  But, you can't leave garbages forever, it's been already
>>>> high time for a large clean up.
>>>>
>>>> So I tried a quick code reorganization, and put the result in
>>>> test/hda-reorg branch of sound.git tree.
>>>>     https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
>>>>
>>>> The basic idea is to move the code from sound/pci/hda/* into different
>>>> subdirectories in sound/hda/ per functionality, as most of the stuff
>>>> are independent from PCI, but rather HD-audio bus specific.
>>>>
>>>
>>> This all seems reasonable to me. I always thought it strange that there
>>> is a sound/hda directory but most of the HDA support isn't in that
>>> directory.
>>
>> Thanks for your review!
>>
>> It's a long story: at the time of ASoC Intel HD-audio support, we
>> thought to implement more ASoC-friendly way of HD-audio controller and
>> codec drivers, e.g. adapting DAPM and others.  So we began with the
>> factoring out the HD-audio basic core stuff to the common directory
>> sound/hda/*, while keeping the rest legacy stuff almost as is.  But
>> ASoC implementation didn't fly in the end from various reasons, and
>> the legacy HD-audio stuff was good enough for the actual use cases;
>> it's too bit to fail, after all.
>>
>>>> The Realtek codec is split further to smaller pieces (which was really
>>>> huge).
>>>
>>> Yes, that file was very confusing having support and quirks for so many
>>> Realtek parts all in one file.
>>>
>>>> The Cirrus and TI sub-codec drivers are moved to codecs/side-codecs
>>>> subdirectory:
>>>
>>> That's ok
>>>
>>>> They can be put to each own directory and drop the file name prefix,
>>>> if we want, too.  Let me know if Cirrus and TI people would like to
>>>> split to more subdirectories.
>>>
>>> I don't mind either way.
>>> The hda_component* files are common to the amps and the realtek driver
>>> so I wonder whether they belong in helpers. They are only utility
>>> wrappers around the kernel component-binding APIs.
>>
>> Right.  So far, just because it's basically only binding with
>> side-codecs, I put into side-codecs subdirectory.
>>
>>>> *HOWEVER* the biggest question is: whether it's worth?
>>>>
>>>> Essentially, this makes almost impossible to make a patch for stable
>>>> trees from the original commit as is; one has to translate the file
>>>> paths and adjust manually in each patch.
>>>
>>> Depends which file you are patching and how much it has changed.
>>> Git can figure out file renames (and changing directory is a rename).
>>
>> I'm afraid that the Realtek codec changes might be hard to track
>> automatically.  Maybe the Cirrus side-codecs stuff would work.
>>
>>>> Also, of course, if anyone is working on HD-audio stuff right now, the
>>>> work had to be adjusted to the new file path.  It'd be one-off action,
>>>> though.
>>>
>>> Speaking only for Cirrus, I don't think this makes much extra effort
>>> for us. Our amp drivers have only changed location, so that should be
>>> trivial. The other file we change is patch_realtek.c but that typically
>>> is only 1-line quirk entries.
>>
>> OK, thanks for confirmation!
> 
> ... and now I worked further on this, resulting in larger set of
> changes.  It's not only the file location changes but also the
> HD-audio codec driver binding changes.  So I put more people to Cc for
> catch their cautions.
> 
> To recap:
> 
> - The all HD-audio driver code are moved under sound/hda.
> 
>    % ls sound/hda
>    codecs/  common/  controllers/  core/  Kconfig  Makefile
> 
>    * The former hda core code is found in sound/hda/core.
>    * The former snd-hda-codec code is found in sound/hda/common.
>    * The former snd-hda-intel, tegra and acpi are put in
>      sound/hda/controllers.
>    * The former patch_* and co are put to sound/hda/codecs.
>    * Realtek codec driver is split to several modules as
>      sound/hda/codecs/realtek/alc*.
>    * Cirrus codec driver is split to cs420x and cs421x, put under
>      sound/hda/codecs/cirrus together with cs8409.
>    * HDMI codec driver is split to several modules under
>      sound/hda/codecs/hdmi
>    * Cirrus and TI sub-codecs are put under
>      sound/hda/codecs/side-codecs
> 
> - The HD-audio codec driver binding is changed from the embedded
>    hda_codec.patch_ops to hda_codec_driver.ops.
>    (As of now, hda_codec_driver.ops is a pointer, but it can be
>     embedded later, too.)
> 
>    This change required some code to be modified without the dynamic
>    override of callbacks.
> 
> - In future, we may convert the runtime PM handling to use the
>    standard pm_ops, too.  This was raised some time ago during the
>    discussion with Realtek devs.
> 
> The current patches are found in test/hda-reorg branch of sound git
> tree:
>    https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=test/hda-reorg
> 
> It's based on master branch for taking all changes of for-linus and
> for-next, hence the branch may be still frequently rebased.
> 
> So, please let me know if you see any issues or suggestions for this
> conversion.  I have no concrete plan for merging, but if everything
> looks fine, it can be even on the next 6.17, too.
> 

I've built it and put it on one of our machines and hit KASAN during 
HDMI initialization, when I go back to master branch it works, so it is 
something on test/hda-reorg.

[   27.659732] 
==================================================================
[   27.663843] BUG: KASAN: null-ptr-deref in 
intel_haswell_enable_all_pins+0x3a/0xc0 [snd_hda_codec_intelhdmi]
[   27.668036] Read of size 2 at addr 00000000000005c8 by task 
systemd-udevd/482

[   27.676096] CPU: 6 UID: 0 PID: 482 Comm: systemd-udevd Tainted: G S 
                6.16.0-rc3+ #72 PREEMPT(voluntary)
[   27.676119] Tainted: [S]=CPU_OUT_OF_SPEC
[   27.676124] Hardware name: Intel Corporation Kabylake Client 
platform/AmberLake Y 42 LPDDR3 RVP3, BIOS 
KBLSE2R1.R00.X151.P00.1902180320 02/18/2019
[   27.676134] Call Trace:
[   27.676141]  <TASK>
[   27.676148]  dump_stack_lvl+0x6c/0x90
[   27.676169]  print_report+0x3e4/0x630
[   27.676187]  ? intel_haswell_enable_all_pins+0x3a/0xc0 
[snd_hda_codec_intelhdmi]
[   27.676209]  ? kasan_addr_to_slab+0xd/0xa0
[   27.676222]  ? intel_haswell_enable_all_pins+0x3a/0xc0 
[snd_hda_codec_intelhdmi]
[   27.676244]  kasan_report+0xdb/0x110
[   27.676259]  ? intel_haswell_enable_all_pins+0x3a/0xc0 
[snd_hda_codec_intelhdmi]
[   27.676284]  __asan_load2+0x79/0xa0
[   27.676298]  intel_haswell_enable_all_pins+0x3a/0xc0 
[snd_hda_codec_intelhdmi]
[   27.676324]  haswell_set_power_state+0x50/0x60 [snd_hda_codec_intelhdmi]
[   27.676347]  hda_set_power_state+0xb8/0x190 [snd_hda_codec]
[   27.676498]  snd_hda_codec_device_new+0x18b/0x330 [snd_hda_codec]
[   27.676643]  ? mutex_unlock+0x7f/0xd0
[   27.676659]  ? __pfx_snd_hda_codec_device_new+0x10/0x10 [snd_hda_codec]
[   27.676809]  ? snd_hdac_ext_bus_link_get+0x4f/0x160 [snd_hda_ext_core]
[   27.676849]  hda_codec_probe+0x14e/0x980 [snd_soc_hda_codec]
[   27.676875]  snd_soc_component_probe+0x3d/0x80 [snd_soc_core]
[   27.677139]  soc_probe_component+0x32b/0x540 [snd_soc_core]
[   27.677386]  snd_soc_bind_card+0x8ed/0x1660 [snd_soc_core]
[   27.677633]  ? devm_snd_soc_bind_card+0x38/0xa0 [snd_soc_core]
[   27.677880]  ? __devres_alloc_node+0x87/0xb0
[   27.677901]  devm_snd_soc_bind_card+0x48/0xa0 [snd_soc_core]
[   27.678163]  snd_soc_register_card+0x24e/0x2d0 [snd_soc_core]
[   27.678411]  devm_snd_soc_register_deferrable_card+0x2d/0x40 
[snd_soc_core]
[   27.678667]  avs_hdaudio_probe+0x2fb/0x370 [snd_soc_avs_hdaudio]
[   27.678694]  platform_probe+0x6b/0x100
[   27.678711]  really_probe+0x15f/0x500
[   27.678729]  __driver_probe_device+0xda/0x1f0
[   27.678746]  driver_probe_device+0x4f/0x120
[   27.678763]  __driver_attach+0x14a/0x2b0
[   27.678779]  ? __pfx___driver_attach+0x10/0x10
[   27.678795]  bus_for_each_dev+0xee/0x160
[   27.678809]  ? __pfx_bus_for_each_dev+0x10/0x10
[   27.678824]  ? preempt_count_sub+0x18/0xc0
[   27.678843]  driver_attach+0x2b/0x40
[   27.678858]  bus_add_driver+0x1a3/0x330
[   27.678876]  driver_register+0xa3/0x1d0
[   27.678893]  __platform_driver_register+0x39/0x50
[   27.678908]  ? __pfx_avs_hdaudio_driver_init+0x10/0x10 
[snd_soc_avs_hdaudio]
[   27.678928]  avs_hdaudio_driver_init+0x1c/0xff0 [snd_soc_avs_hdaudio]
[   27.678948]  do_one_initcall+0x98/0x370
[   27.678961]  ? kasan_save_track+0x14/0x40
[   27.678974]  ? __pfx_do_one_initcall+0x10/0x10
[   27.678988]  ? __kasan_kmalloc+0xb3/0xc0
[   27.679001]  ? kasan_poison+0x3a/0x50
[   27.679012]  ? kasan_unpoison+0x28/0x60
[   27.679024]  ? kasan_poison+0x3a/0x50
[   27.679035]  ? __asan_register_globals+0x5e/0x80
[   27.679055]  do_init_module+0x1a5/0x4c0
[   27.679072]  ? __pfx_do_init_module+0x10/0x10
[   27.679092]  load_module+0x39cc/0x3ca0
[   27.679162]  ? __pfx_load_module+0x10/0x10
[   27.679187]  ? __pfx_ima_post_read_file+0x10/0x10
[   27.679210]  ? security_file_permission+0x131/0x150
[   27.679228]  ? rw_verify_area+0x86/0x230
[   27.679249]  ? __kasan_check_write+0x14/0x20
[   27.679261]  ? kernel_read_file+0x384/0x5f0
[   27.679278]  ? __pfx_kernel_read_file+0x10/0x10
[   27.679292]  ? vm_mmap_pgoff+0x263/0x340
[   27.679309]  init_module_from_file+0x100/0x170
[   27.679322]  ? init_module_from_file+0x100/0x170
[   27.679335]  ? __pfx_init_module_from_file+0x10/0x10
[   27.679351]  ? preempt_count_sub+0x18/0xc0
[   27.679370]  ? __kasan_check_write+0x14/0x20
[   27.679381]  ? _raw_spin_lock+0x87/0xe0
[   27.679398]  ? __pfx__raw_spin_lock+0x10/0x10
[   27.679414]  ? __pfx_cred_has_capability.isra.0+0x10/0x10
[   27.679436]  idempotent_init_module+0x1d4/0x4a0
[   27.679452]  ? __pfx_idempotent_init_module+0x10/0x10
[   27.679469]  ? __kasan_check_read+0x11/0x20
[   27.679485]  ? fdget+0x9d/0x1b0
[   27.679500]  __x64_sys_finit_module+0x89/0xf0
[   27.679515]  x64_sys_call+0x1a99/0x1f90
[   27.679530]  do_syscall_64+0x6b/0x1d0
[   27.679544]  ? debug_smp_processor_id+0x17/0x20
[   27.679557]  ? fpregs_assert_state_consistent+0x7f/0x90
[   27.679574]  ? do_syscall_64+0xad/0x1d0
[   27.679587]  ? debug_smp_processor_id+0x17/0x20
[   27.679600]  ? fpregs_assert_state_consistent+0x7f/0x90
[   27.679616]  ? do_syscall_64+0xad/0x1d0
[   27.679628]  ? debug_smp_processor_id+0x17/0x20
[   27.679641]  ? fpregs_assert_state_consistent+0x7f/0x90
[   27.679656]  ? irqentry_exit_to_user_mode+0x2e/0x180
[   27.679670]  ? clear_bhb_loop+0x30/0x80
[   27.679683]  ? clear_bhb_loop+0x30/0x80
[   27.679695]  ? clear_bhb_loop+0x30/0x80
[   27.679707]  ? clear_bhb_loop+0x30/0x80
[   27.679720]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   27.679733] RIP: 0033:0x7f18d031ea3d
[   27.679746] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 a3 0f 00 f7 d8 64 89 01 48
[   27.679760] RSP: 002b:00007ffc1655be88 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   27.679774] RAX: ffffffffffffffda RBX: 000055c8c070bba0 RCX: 
00007f18d031ea3d
[   27.679785] RDX: 0000000000000000 RSI: 00007f18d052d441 RDI: 
0000000000000006
[   27.679793] RBP: 0000000000020000 R08: 0000000000000000 R09: 
0000000000000002
[   27.679801] R10: 0000000000000006 R11: 0000000000000246 R12: 
00007f18d052d441
[   27.679810] R13: 000055c8c070c4a0 R14: 000055c8c0819480 R15: 
000055c8c080c410
[   27.679828]  </TASK>
[   27.679834] 
==================================================================


I've checked few commits and overall I suspect that commit
16e74bb52bba0aa67d3447a731ee5eb3fbb2440a ("ALSA: hda/hdmi: Rewrite to 
new probe method") broke it somehow.
Seems like codec->spec is NULL while intel_haswell_enable_all_pins() is 
called, so later spec->vendor_nid ends up in NULL pointer dereference.


As a side note while trying to narrow it, while checking out 
0d20e421cf14ab73246f4476ad4d25aadbf2b740 ("ALSA: hda/ca0132: Rewrite to 
new probe method")
results in following during build:
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
patch_generic_hdmi from namespace SND_HDA_CODEC_HDMI, but does not 
import it.
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
snd_hda_hdmi_acomp_master_bind from namespace SND_HDA_CODEC_HDMI, but 
does not import it.
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
snd_hda_hdmi_acomp_master_unbind from namespace SND_HDA_CODEC_HDMI, but 
does not import it.
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
snd_hda_hdmi_acomp_pin_eld_notify from namespace SND_HDA_CODEC_HDMI, but 
does not import it.
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
snd_hda_hdmi_acomp_init from namespace SND_HDA_CODEC_HDMI, but does not 
import it.
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
snd_hda_hdmi_setup_stream from namespace SND_HDA_CODEC_HDMI, but does 
not import it.
ERROR: modpost: module snd-hda-codec-atihdmi uses symbol 
snd_hda_hdmi_generic_init from namespace SND_HDA_CODEC_HDMI, but does 
not import it.
