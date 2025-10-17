Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C71C749C
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 02:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760668604; cv=none; b=kOi3YW9yKC6qneKnY1lRX4TjIvXHsIG71wMINlaCfhIE0+QA1XQtFxZGPcCB6OXPkyFM8gsFF1Y1UAirMACtQ4ZdJgFMf9ta4Khs7wsuOeyRsdaGAUbPdIcbS6XXiKfP3/T+bz4LPddBJuGKm2ASde7kZfrTS6Nmz+kdJuvr3rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760668604; c=relaxed/simple;
	bh=sj9ImkQqNKBpgnx5Q+vV2TXPudAauNfDOAn3GBH3x4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dmIufm9rxVBrUdd2tvruTp35G7fTNcil7f8R8zqtl1CNHjpQNfRPSeBurzjWGgSW9VzSB2gPVuK83E0wMtsnuB6EVAYFZ+8qxUFo4AcP52W9QANz++dnb8FPf6DtZ09EuMRqtV3ynxLzLraOdPrXs74RKNYeWMhlWgx1KfoK8MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=M37O8plF; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="M37O8plF"
Received: (wp-smtpd smtp.wp.pl 26182 invoked from network); 17 Oct 2025 04:36:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1760668598; bh=KUHK9UzBFTHJZOCKmSXtNRJIkKWV53EfvU/NwRCXI2I=;
          h=Subject:To:Cc:From;
          b=M37O8plF+ndloohFYAYoOD4NJFyLi2alU2RKFrDR5JqwNHOJ3Es6gjUGol6B1z26V
           zl4JSOxZ3W0HAokxUyumU2Zlw/eQpnDuX2yLkSwnLdxByZ12Unu4uvMJ6czGLRlR1s
           fwNGoKRdq5OKdfPmFjaWcQCrIJOTZPWnooT8Vwg2qz8qYfUvgJ3hZEkRwIxlvxbrEY
           QUBOZMoQ4CJV8FgjimncNqE9+khGX6KiUoNdpK13fSwlAAwrnCXiyP4tpdAq35Xib2
           s6+nAH/mOjVTNPxo0NjBDGfoITAvJL0jm6DLonMaBelFxw/K0DYfedZV4kQ9LJDgfe
           J6egq2FRJFb2Q==
Received: from cpe-109-207-144-41.docsis.tczew.net.pl (HELO [192.168.5.100]) (xj@wp.pl@[109.207.144.41])
          (envelope-sender <xj@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <roy.vegard.ovesen@gmail.com>; 17 Oct 2025 04:36:38 +0200
Message-ID: <369af11a-0d15-4ad9-b9b9-070912fd60ab@wp.pl>
Date: Fri, 17 Oct 2025 04:36:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes mixer
 interface ("Quirk or no altset; falling back to MIDI 1.0")
To: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound <linux-sound@vger.kernel.org>
References: <874irz86en.wl-tiwai@suse.de> <87ecr27trj.wl-tiwai@suse.de>
 <2b24f320-3c6c-4adc-b5c4-ce6134d3b39e@wp.pl> <aPFTxD89mYhea2ZX@ark>
Content-Language: en-US
From: Xj <xj@wp.pl>
In-Reply-To: <aPFTxD89mYhea2ZX@ark>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-WP-MailID: dca17abc5a043b2f070023f0e2a2525d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [gXLx]                               


On 10/16/25 22:21, Roy Vegard Ovesen wrote:
> On Thu, Oct 16, 2025 at 07:53:23PM +0200, Xj wrote:
>> When I bought this card it has firmware 3.04, I upgraded it to 3.11.
> I also have firmware 3.11. Unfortunately I don't remember what firmware
> I had before 3.11, or if I noticed any difference.
>
>> It works, but only in 88.2kHz and 96kHz modes and there is no volume control
>> in alsamixer.
> With kernel 6.18-rc1 it should work with all samplerates from 44.1k to 192k.
> The (8out/14in @ 96kHz) output from the kernel is misleading (I will submit a
> patch for that). It's from a quirk that is applied to the S1810c where it did
> not handle having more than one altsetting for the playback and capture
> interfaces. I don't own a S1810c, so I don't know all the details.
>
> Anyways, my testing showed that the S1824c handled all 3 altsettings fine. And
> when using Reaper or Ardour I am able to set the sample rate to anything from
> 44.1 to 192, and the number of ADAT channels is set according to the
> appropriate altsetting.
>
> I don't think I have ever seen any volume controls in alsamixer. I think
> the only control I saw there before kernel version 6.15-rc1 was the clock
> source selector. After 6.15-rc1, when the driver for th S1810c was applied
> to the S1824c too, it added controls for the four buttons on the front
> panel (48V, Line, Mute, A/B switch). The S1824c does not have a A/B switch
> but a Mono button instead.
>
> The S1824c has a comrehensive mixer with 2 x 36 x 9 = 648 individual volume
> controls. To take full advantage of it you really need an application like
> PreSonus Universal Control, but since they don't provide a linux version
> I started creating baton (shameless plug):
> [Link] https://github.com/royvegard/baton
>
>> [    3.354758] ------------[ cut here ]------------
>> [    3.354761] usb 3-2: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
>> [    3.354769] WARNING: CPU: 12 PID: 1020 at drivers/usb/core/urb.c:412 usb_submit_urb+0x59f/0x650
>> [    3.354776] Modules linked in:
>> [    3.354779] CPU: 12 UID: 0 PID: 1020 Comm: alsactl Not tainted 6.18.0-rc1 #1 PREEMPT(full)  3ae07d8adb35c0aa13fd8a63520768d4d65cbe95
>> [    3.354782] Hardware name: ASRock B850M Pro-A/B850M Pro-A, BIOS 3.50 09/18/2025
>> [    3.354784] RIP: 0010:usb_submit_urb+0x59f/0x650
>> [    3.354786] Code: 89 44 24 0c 89 4c 24 08 e8 5e 1f ef ff 44 8b 44 24 0c 8b 4c 24 08 48 c7 c7 c0 a5 15 b8 48 8b 54 24 18 48 89 c6 e8 f1 e9 b8 fe <0f> 0b 4c 8b 54 24 10 e9 fe fc ff ff 80 3d e9 83 4a 02 00 74 50 b8
>> [    3.354788] RSP: 0018:ffffd1bdc23a3750 EFLAGS: 00010246
>> [    3.354789] RAX: 0000000000000000 RBX: ffff8bc7c1facfc0 RCX: 00000000000003f9
>> [    3.354790] RDX: 0000000000000000 RSI: ffffd1bdc23a35f0 RDI: 0000000000000003
>> [    3.354791] RBP: ffff8bc7c6a0d058 R08: 0000000000000000 R09: 00000000ffffdfff
>> [    3.354792] R10: ffffffffba11af80 R11: ffffd1bdc23a35e8 R12: 0000000000000000
>> [    3.354793] R13: 0000000000000000 R14: ffff8bc7c6a0d000 R15: 0000000000000001
>> [    3.354793] FS:  00007fab8f421b80(0000) GS:ffff8bcf24295000(0000) knlGS:0000000000000000
>> [    3.354795] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [    3.354795] CR2: 00007fab8f52c000 CR3: 0000000112652000 CR4: 0000000000f50ef0
>> [    3.354796] PKRU: 55555554
>> [    3.354797] Call Trace:
>> [    3.354799]  <TASK>
>> [    3.354801]  usb_start_wait_urb+0x89/0x190
>> [    3.354804]  usb_control_msg+0xe5/0x150
>> [    3.354806]  snd_usb_ctl_msg+0xa5/0x160
>> [    3.354810]  snd_sc1810c_get_status_field.constprop.0+0xc0/0x140
>> [    3.354815]  snd_s1810c_get_switch_state.constprop.0.isra.0+0x54/0xa0
>> [    3.354817]  snd_s1810c_switch_set+0x69/0x130
>> [    3.354820]  snd_ctl_elem_write+0x18b/0x260
>> [    3.354824]  snd_ctl_ioctl+0x3b8/0x7e0
>> [    3.354826]  __x64_sys_ioctl+0x97/0xe0
>> [    3.354829]  do_syscall_64+0x81/0x7f0
>> [    3.354833]  ? vfs_write+0x3c4/0x480
>> [    3.354836]  ? ksys_write+0xbf/0xf0
>> [    3.354837]  ? do_syscall_64+0x81/0x7f0
>> [    3.354838]  ? __x64_sys_close+0x3d/0x80
>> [    3.354840]  ? do_syscall_64+0x81/0x7f0
>> [    3.354841]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [    3.354843] RIP: 0033:0x7fab8f3112ff
>> [    3.354844] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>> [    3.354845] RSP: 002b:00007ffc8d758ca0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> [    3.354846] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fab8f3112ff
>> [    3.354846] RDX: 00007ffc8d758e30 RSI: 00000000c4c85513 RDI: 0000000000000004
>> [    3.354847] RBP: 00007ffc8d759480 R08: 00007ffc8d758e30 R09: 0000000000000000
>> [    3.354847] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>> [    3.354848] R13: 0000000000000003 R14: 0000000000000001 R15: 0000000000000001
>> [    3.354848]  </TASK>
>> [    3.354849] ---[ end trace 0000000000000000 ]---
> This looks a bit sus.
>

I tested it again on 6.18rc1 and I can select 48kHz there, so seems it 
works as expected, I mean lack of volume controls are expected for this 
card.

Thanks for pointing out baton app and thanks for your work on this driver.

