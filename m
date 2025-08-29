Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D632FFDD2
	for <linux-sound@vger.kernel.org>; Fri, 29 Aug 2025 22:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756508137; cv=none; b=OuIsfYb/1nTWMwqR108oW1tAyuIam5PKkqC1HsiF8Y01ioO424mVxnZ/OB8k37nCahKVmoVyAwzbwYvaSxUfFXeFjisbw43zQfDtA04z8QAJUIJE/ewnXOYTd5iHPTMW4RMSS8m0l1W+EKUkPMMwYICRqyQfFo02wbOA4uy8s/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756508137; c=relaxed/simple;
	bh=8EZbjFTjBH1Bi1HD1r0M8O/wGyexGxjrSbmj0BsDD4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT+oV8+ITjy3cLbiLorJVFVkG1h6/JCRflFAjh0GnL+ON8SE+hNzauqvpzqANOSgYd0vqk7uYb9EsN82YxZD1FoN9rThaF4GGWzOjKxTzSfR08U+ScAQ3DFeDFMzJoDYpGpnCpvWHVqafCxIW6zfrG3ZmXkI7BjsvKAlXlvNhyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gb7gPznI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gb7gPznI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DECFC4CEF6;
	Fri, 29 Aug 2025 22:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756508136;
	bh=8EZbjFTjBH1Bi1HD1r0M8O/wGyexGxjrSbmj0BsDD4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gb7gPznIgIOBDCd0cZPaD6H7VFYLrtYJbaifSFc9Xu6Q6QG7y6XhzQ6JWV441o8V1
	 vzFXMdWQWMpog2tijMX3/GkSvOy14hThoBhVadQGiH+ni5gjenm+LTOgcsNbPi5phO
	 tTZIgXnV4+ZEAtMk+u/eIQeo24YF9JVhoTlp0QnKhPedif/lBCsrW/Stezi8NODOsl
	 u6iBYYGdicDIzdx1sXQ65DOYgVvPCaM7KV6ieOv3hZYBvMAstaxa8FiZqLycHY9l4A
	 nBscC07g6cJSZxQa0aEAxdlO3fBPSG8cSUOv04WWC5GNlJkxbwO/49f5Ynp0jmbkWc
	 Z+YkJN9RuL/4A==
Date: Fri, 29 Aug 2025 15:55:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/5] ASoC: Intel: avs: Cleanup duplicate members
Message-ID: <20250829225532.GA400117@ax162>
References: <20250827142229.869139-1-cezary.rojewski@intel.com>
 <20250827142229.869139-3-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827142229.869139-3-cezary.rojewski@intel.com>

Hi Cezary,

On Wed, Aug 27, 2025 at 04:22:26PM +0200, Cezary Rojewski wrote:
> Switch to the new board registration functions and remove the
> then-unused code.
> 
> The SSP-number-check is still important and cannot be just dropped. Move
> it from avs_register_i2s_board(), which is being removed with this
> patch, to avs_register_i2s_boards() to maintain sanity when registering
> a board.
> 
> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

I just bisected a new NULL pointer dereference BUG on an old Chromebox
to this change as commit 6acfaee44cbe ("ASoC: Intel: avs: Cleanup
duplicate members") in next-20250829.

  # bad: [3cace99d63192a7250461b058279a42d91075d0c] Add linux-next specific files for 20250829
  # good: [07d9df80082b8d1f37e05658371b087cb6738770] Merge tag 'perf-tools-fixes-for-v6.17-2025-08-27' of git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools
  git bisect start '3cace99d63192a7250461b058279a42d91075d0c' '07d9df80082b8d1f37e05658371b087cb6738770'
  # good: [ed69ac5ab786c63567de97eabb2de68b1b825c70] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
  git bisect good ed69ac5ab786c63567de97eabb2de68b1b825c70
  # good: [74439bec38b976b8bebfd9d1633336be49e7776f] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git
  git bisect good 74439bec38b976b8bebfd9d1633336be49e7776f
  # bad: [afbaf44d1267d782ae2e199a46575cc42e8e412e] Merge branch 'next' of https://github.com/kvm-x86/linux.git
  git bisect bad afbaf44d1267d782ae2e199a46575cc42e8e412e
  # bad: [954addf857df7809d1d35a0cfccb8fc4d523bbcb] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git
  git bisect bad 954addf857df7809d1d35a0cfccb8fc4d523bbcb
  # bad: [ae6606637e6d913bc3f2414f6bda2069e700c447] Merge branch 'pcmcia-next' of https://git.kernel.org/pub/scm/linux/kernel/git/brodo/linux.git
  git bisect bad ae6606637e6d913bc3f2414f6bda2069e700c447
  # bad: [fd92484f927ce7b4932ba767c9419f6b3b8c1ee2] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
  git bisect bad fd92484f927ce7b4932ba767c9419f6b3b8c1ee2
  # good: [7ed3723d612c200839820cea8a9ee86cbaa858a8] ASoC: es8323: power and mixer controls cleanup and
  git bisect good 7ed3723d612c200839820cea8a9ee86cbaa858a8
  # good: [bc017f28b1c6c3d44c3631f8f6d152b7e703e990] ASoC: imx-hdmi: remove cpu_pdev related code
  git bisect good bc017f28b1c6c3d44c3631f8f6d152b7e703e990
  # good: [f43095de82b04a11f7239fdf9e724d907ea3dc3b] ASoC: renesas: msiof: Make small adjustments to avoid
  git bisect good f43095de82b04a11f7239fdf9e724d907ea3dc3b
  # bad: [a37280daa4d583c7212681c49b285de9464a5200] ASoC: Intel: avs: Allow i2s test and non-test boards to coexist
  git bisect bad a37280daa4d583c7212681c49b285de9464a5200
  # bad: [6acfaee44cbe9364a91dcc373fb4e6e395c5b20b] ASoC: Intel: avs: Cleanup duplicate members
  git bisect bad 6acfaee44cbe9364a91dcc373fb4e6e395c5b20b
  # good: [3351e814cb49dff7ef4808f5ebfb299162994118] ASoC: Intel: avs: New board registration routines
  git bisect good 3351e814cb49dff7ef4808f5ebfb299162994118
  # first bad commit: [6acfaee44cbe9364a91dcc373fb4e6e395c5b20b] ASoC: Intel: avs: Cleanup duplicate members

  [    0.000000] Linux version 6.17.0-rc2-debug-00065-g6acfaee44cbe (nathan@ax162) (x86_64-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.45) #1 SMP PREEMPT_DYNAMIC Fri Aug 29 15:20:49 MST 2025
  ...
  [    5.021907] BUG: kernel NULL pointer dereference, address: 0000000000000078
  [    5.022559] #PF: supervisor read access in kernel mode
  [    5.023201] #PF: error_code(0x0000) - not-present page
  [    5.023671] PGD 0 P4D 0
  [    5.024135] Oops: Oops: 0000 [#1] SMP PTI
  [    5.024600] CPU: 1 UID: 0 PID: 331 Comm: (udev-worker) Not tainted 6.17.0-rc2-debug-00065-g6acfaee44cbe #1 PREEMPT(full)  d53566f3620e7aa5231643b0a073759aa0a44325
  [    5.025086] Hardware name: Google Teemo/Teemo, BIOS MrChromebox-2503.0 04/27/2025
  [    5.025575] RIP: 0010:avs_probe_mb_probe+0x81/0x120 [snd_soc_avs_probe]
  [    5.026073] Code: 11 73 c1 4c 89 b0 98 00 00 00 48 c7 80 a8 00 00 00 80 f2 72 c1 48 c7 80 80 01 00 00 00 f1 72 c1 c7 80 88 01 00 00 01 00 00 00 <4c> 8b 6b 78 4d 85 ed 74 5c 45 31 e4 48 c7 c3 00 f1 72 c1 45 31 ff
  [    5.026605] RSP: 0018:ffffce34c0fb3958 EFLAGS: 00010202
  [    5.027146] RAX: ffff8a5a080a1828 RBX: 0000000000000000 RCX: ffff8a5a080a1800
  [    5.027691] RDX: ffff8a5a1176eec0 RSI: 0000000000000206 RDI: ffff8a5a1176eebc
  [    5.028238] RBP: ffff8a5a080a1828 R08: ffff8a5a080a1800 R09: 0000000000000000
  [    5.028783] R10: ffff8a5a1176ec10 R11: ffffffffb3fe0f1c R12: 0000000000000000
  [    5.029329] R13: ffffffffc172f048 R14: ffff8a5a1176ec10 R15: 0000000000000000
  [    5.029872] FS:  00007f77ba2ab880(0000) GS:ffff8a5bc0412000(0000) knlGS:0000000000000000
  [    5.030418] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [    5.030969] CR2: 0000000000000078 CR3: 0000000101596006 CR4: 00000000003726f0
  [    5.031523] Call Trace:
  [    5.032078]  <TASK>
  [    5.032631]  platform_probe+0x39/0x70
  [    5.033187]  really_probe+0xdb/0x340
  [    5.033744]  ? pm_runtime_barrier+0x55/0x90
  [    5.034299]  __driver_probe_device+0x78/0x140
  [    5.034851]  driver_probe_device+0x1f/0xa0
  [    5.035401]  ? __pfx___driver_attach+0x10/0x10
  [    5.035953]  __driver_attach+0xcb/0x1e0
  [    5.036496]  bus_for_each_dev+0x82/0xd0
  [    5.037035]  bus_add_driver+0x10b/0x1f0
  [    5.037569]  ? __pfx_avs_probe_mb_driver_init+0x10/0x10 [snd_soc_avs_probe 9609027b99174bdd389d56be49a8d1516e5fe3da]
  [    5.038121]  driver_register+0x75/0xe0
  [    5.038666]  do_one_initcall+0x58/0x300
  [    5.039209]  do_init_module+0x62/0x250
  [    5.039751]  ? init_module_from_file+0x8a/0xe0
  [    5.040292]  init_module_from_file+0x8a/0xe0
  [    5.040835]  idempotent_init_module+0x114/0x310
  [    5.041374]  __x64_sys_finit_module+0x6d/0xd0
  [    5.041911]  ? syscall_trace_enter+0x8d/0x1d0
  [    5.042449]  do_syscall_64+0x81/0x970
  [    5.042987]  ? switch_fpu_return+0x4e/0xd0
  [    5.043519]  ? do_syscall_64+0x214/0x970
  [    5.044056]  ? __pfx_page_put_link+0x10/0x10
  [    5.044597]  ? alloc_fd+0x12e/0x190
  [    5.045135]  ? do_sys_openat2+0xa2/0xe0
  [    5.045675]  ? __x64_sys_openat+0x61/0xa0
  [    5.046212]  ? do_syscall_64+0x81/0x970
  [    5.046744]  ? do_syscall_64+0x81/0x970
  [    5.047268]  ? do_syscall_64+0x81/0x970
  [    5.047790]  ? __irq_exit_rcu+0x4c/0xf0
  [    5.048316]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  [    5.048842] RIP: 0033:0x7f77ba11876d
  [    5.049380] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 73 05 0f 00 f7 d8 64 89 01 48
  [    5.049949] RSP: 002b:00007fff13465678 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
  [    5.050534] RAX: ffffffffffffffda RBX: 000055feef565280 RCX: 00007f77ba11876d
  [    5.051122] RDX: 0000000000000004 RSI: 00007f77ba8b82f2 RDI: 0000000000000013
  [    5.051708] RBP: 00007fff13465710 R08: 0000000000000000 R09: 000055feef4d44a0
  [    5.052298] R10: 0000000000000000 R11: 0000000000000246 R12: 00007f77ba8b82f2
  [    5.052884] R13: 0000000000020000 R14: 000055feef572360 R15: 000055feef565280
  [    5.053474]  </TASK>
  [    5.054056] Modules linked in: snd_soc_avs_probe(+) ...
  [    5.054135]  ...
  [    5.061168] CR2: 0000000000000078
  [    5.061921] ---[ end trace 0000000000000000 ]---
  [    5.062777] RIP: 0010:avs_probe_mb_probe+0x81/0x120 [snd_soc_avs_probe]
  [    5.063624] Code: 11 73 c1 4c 89 b0 98 00 00 00 48 c7 80 a8 00 00 00 80 f2 72 c1 48 c7 80 80 01 00 00 00 f1 72 c1 c7 80 88 01 00 00 01 00 00 00 <4c> 8b 6b 78 4d 85 ed 74 5c 45 31 e4 48 c7 c3 00 f1 72 c1 45 31 ff
  [    5.064495] RSP: 0018:ffffce34c0fb3958 EFLAGS: 00010202
  [    5.065379] RAX: ffff8a5a080a1828 RBX: 0000000000000000 RCX: ffff8a5a080a1800
  [    5.066242] RDX: ffff8a5a1176eec0 RSI: 0000000000000206 RDI: ffff8a5a1176eebc
  [    5.067066] RBP: ffff8a5a080a1828 R08: ffff8a5a080a1800 R09: 0000000000000000
  [    5.067889] R10: ffff8a5a1176ec10 R11: ffffffffb3fe0f1c R12: 0000000000000000
  [    5.068711] R13: ffffffffc172f048 R14: ffff8a5a1176ec10 R15: 0000000000000000
  [    5.069535] FS:  00007f77ba2ab880(0000) GS:ffff8a5bc0412000(0000) knlGS:0000000000000000
  [    5.070364] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [    5.071195] CR2: 0000000000000078 CR3: 0000000101596006 CR4: 00000000003726f0
  [    5.072033] note: (udev-worker)[331] exited with irqs disabled
  [    5.074541] avs_hdaudio avs_hdaudio.14.auto: ASoC: Neither Component name/of_node are set for probing-LINK
  [    5.075468] avs_hdaudio avs_hdaudio.14.auto: probe with driver avs_hdaudio failed with error -22
  ...
  [    5.864482] avs_rt5663 avs_rt5663.13.auto: ASoC: Neither Component name/of_node are set for SSP1-Codec
  [    5.865189] avs_rt5663 avs_rt5663.13.auto: probe with driver avs_rt5663 failed with error -22
  ...

At the parent change, these are the messages I see with "avs" in them:

  [    4.664431] snd_soc_avs 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [i915])
  [    5.046948] snd_soc_avs 0000:00:1f.3: Direct firmware load for intel/avs/hda-8086280b-tplg.bin failed with error -2
  [    5.046954] snd_soc_avs 0000:00:1f.3: request topology "intel/avs/hda-8086280b-tplg.bin" failed: -2
  [    5.047927] avs_hdaudio avs_hdaudio.2: trying to load fallback topology hda-8086-generic-tplg.bin
  [    5.048692] avs_hdaudio avs_hdaudio.2: ASoC: Parent card not yet available, widget card binding deferred
  [    5.050504] avs_hdaudio avs_hdaudio.2: avs_card_late_probe: mapping HDMI converter 1 to PCM 0 (000000005bf3f04e)
  [    5.050541] avs_hdaudio avs_hdaudio.2: avs_card_late_probe: mapping HDMI converter 2 to PCM 1 (00000000697f2eb5)
  [    5.050546] avs_hdaudio avs_hdaudio.2: avs_card_late_probe: mapping HDMI converter 3 to PCM 2 (0000000057bd76ab)
  [    5.056497] input: AVS HDMI HDMI/DP as /devices/platform/avs_hdaudio.2/sound/card0/input20
  [    5.056647] input: AVS HDMI HDMI/DP,pcm=1 as /devices/platform/avs_hdaudio.2/sound/card0/input21
  [    5.056706] input: AVS HDMI HDMI/DP,pcm=2 as /devices/platform/avs_hdaudio.2/sound/card0/input22
  [    5.849407] avs_rt5663 avs_rt5663.131072: ASoC: Parent card not yet available, widget card binding deferred
  [    5.850921] input: AVS I2S ALC5663 Headset Jack as /devices/platform/avs_rt5663.131072/sound/card2/input23

If there is any other additional information I can provide or patches I
can test, I am more than happy to do so.

Cheers,
Nathan
