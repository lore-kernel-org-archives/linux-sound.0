Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D831A9F93
	for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 20:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760646091; cv=none; b=jYXHnIrSoKKOOI/6onP0zEtJNyMEunlP8ZtS2fTuKVRFKNeHXyywA6CnbtP7ET2IKanwus3j83SL2OsW7FrqPOF6d3RNBzBAPLcrXyqJW+XgwbJ5vJLh/PPMOMblq9wCAKzGspd+FsYEWW6LtxISH3EgAJ0OgBcYk/aTuMNgzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760646091; c=relaxed/simple;
	bh=HqDVtDU2uz7JlCCtcMy+TbQ6rPpWQFd0J7E1jyQ5SRk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cH7v4D6JRJUdqlPFvb5A3ddLzvvGHwaMZ2AmRU1H6fnU0m+xjZ3V9aVLJYRWgFdnQXJJOsxZFhpY2jdMWTEhhjbN8RpSot1feHPCAnkFMSoiFYnxLacKdRvFjs6N6TSWvlyd5Z7UIpLB98i4RVZOmCH6HxyqYFxYdVE+4Z1WK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwFD6g8S; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwFD6g8S"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so1480443e87.0
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 13:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760646088; x=1761250888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmnUfssSuOC6lKgQZds2+ffNFlhgqJTJ6ox4gGw6qmE=;
        b=KwFD6g8SGUUXDfxLXOAz22h8E8XiHwdEkWG92t+xZOj5qCQLc/eV9mydT07SEDt4Si
         3FuLYOxkRfu19DwilfnCfA/s6NeP5Yi7Xwb1i4yrMOR5vstN4eI0+OcEWAYXEDBvQWAO
         P3/iuy6gvDS+u89X8UtKP+T+55Q78vRGxLUIyB4xTWxjpZCrCNgAhgk9YTcNCp/dqbLh
         nhcnLSY6YW0Uby1BSA4Q2SCz2uQredxjGbygBaS4ml82VPT/nxxO8rpCm4/RgXtMTG+R
         HK05b2QMa9vDXvoELYJl0qpwKnT5onPLmNG8z05deUlZXfRQI9sMTI3IhuwZep5C7uRQ
         rEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760646088; x=1761250888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmnUfssSuOC6lKgQZds2+ffNFlhgqJTJ6ox4gGw6qmE=;
        b=YJZnIQebQaMTKP700/rnJvGaXK9mSe7DyZyrNO6GamseCiSVqcye2qcHlFVG6IVuVu
         mulA7mutUNTyNi0vhbAGQ2VYiwq7ekqhwZesIFGk7vYhENu8Fv9hOpFNw7rjBFz7KCr7
         pe7uWv/T6pTmCkYk89/xq18DkCxmcXIqj8F9q2IxXnT1RH4g0dFTnAuEEsIxSzpqzjFe
         Y09MiVrgUFbSvbGqku4KABOMbNDrRGHTQT4zAvqFLGkj7s7TUaQRmqCWxRP2Fxx7STmD
         qdzYlvWLsgw9WZYkL3LvgAoCng6fFSuE6Qv0x9y0cug+H3dnH0Xmap8Rc/Z5hAFmgVpU
         J2+w==
X-Forwarded-Encrypted: i=1; AJvYcCVX0MBXayHsRrnIrtFOvKyVqKDVIzIcxLrvx756swmBxrxiicb2/fKjzzu11nICRpqT9Aes2cqTcRWsaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLUi/cLFvziHTNairZWrxa+q5GFqrRmAxSUwKYg5aKUa53CwSH
	MQtYzSPeQu6zhsinl9zz/GgscmZdQ5RKEH7TvmVCY9GAMN8aAeXGMZTS
X-Gm-Gg: ASbGncvQDPBrzd3KL4FgEvwkRSta6n7PcVG3M8BEz5BxcgO/O3NON2YrIQKkd3vuQv9
	5mmKDp5mNZpy140N/vDLJQTdzaSrCPP1ebZvQICkhoDOfyCP9Bd8rvV8pz3rni8O7ksFHsXUHPO
	kPBy5UQvg1bhKV0GDG/q84D5m6jvK5WtU3T59Wh/YGwDciYkd/M0sLoWnUR+lpKBsHuLtYhV/9R
	M3uogjYZmK16s5aDZ+m+WNXp7U459WJLFEJBqFcXNg/S0B+QkTkiiHOweNJrJ4lbLUBTTnQ0VML
	JtiwtCn57vFP02sbp+0ScckC8qB6QRluN5hvEEqvGIuySYtNuTkE6Qn6HnWYXsjoc7kH/ZtCksH
	M6I0b3n9fPRgut/2Bb5ZeTzjyKm2UQdsV2fZEXY+S/cGKrttshrBJwrAiLaHRgTc=
X-Google-Smtp-Source: AGHT+IGV7UBQv4sziAq8tL79Z2NmSkIi2G/HmeFz6BUk8v+/qQgyaa9uVURFWq+dLVhFvhTT5VysmQ==
X-Received: by 2002:a05:6512:61a:b0:591:d903:437b with SMTP id 2adb3069b0e04-591d903469bmr156990e87.30.1760646087153;
        Thu, 16 Oct 2025 13:21:27 -0700 (PDT)
Received: from ark ([2a01:799:8db:a400::1002])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088563812sm7315720e87.61.2025.10.16.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:21:26 -0700 (PDT)
From: Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
X-Google-Original-From: Roy Vegard Ovesen <royvegard@ark>
Date: Thu, 16 Oct 2025 22:21:24 +0200
To: Xj <xj@wp.pl>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound <linux-sound@vger.kernel.org>,
	Roy Vegard Ovesen <roy.vegard.ovesen@gmail.com>
Subject: Re: [BUG] Presonus Studio 1824c firmware 3.11 no longer exposes
 mixer interface ("Quirk or no altset; falling back to MIDI 1.0")
Message-ID: <aPFTxD89mYhea2ZX@ark>
References: <874irz86en.wl-tiwai@suse.de>
 <87ecr27trj.wl-tiwai@suse.de>
 <2b24f320-3c6c-4adc-b5c4-ce6134d3b39e@wp.pl>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b24f320-3c6c-4adc-b5c4-ce6134d3b39e@wp.pl>

On Thu, Oct 16, 2025 at 07:53:23PM +0200, Xj wrote:
> 
> When I bought this card it has firmware 3.04, I upgraded it to 3.11.

I also have firmware 3.11. Unfortunately I don't remember what firmware
I had before 3.11, or if I noticed any difference.

> It works, but only in 88.2kHz and 96kHz modes and there is no volume control
> in alsamixer.

With kernel 6.18-rc1 it should work with all samplerates from 44.1k to 192k.
The (8out/14in @ 96kHz) output from the kernel is misleading (I will submit a
patch for that). It's from a quirk that is applied to the S1810c where it did
not handle having more than one altsetting for the playback and capture
interfaces. I don't own a S1810c, so I don't know all the details.

Anyways, my testing showed that the S1824c handled all 3 altsettings fine. And
when using Reaper or Ardour I am able to set the sample rate to anything from
44.1 to 192, and the number of ADAT channels is set according to the
appropriate altsetting.

I don't think I have ever seen any volume controls in alsamixer. I think
the only control I saw there before kernel version 6.15-rc1 was the clock
source selector. After 6.15-rc1, when the driver for th S1810c was applied
to the S1824c too, it added controls for the four buttons on the front
panel (48V, Line, Mute, A/B switch). The S1824c does not have a A/B switch
but a Mono button instead.

The S1824c has a comrehensive mixer with 2 x 36 x 9 = 648 individual volume
controls. To take full advantage of it you really need an application like
PreSonus Universal Control, but since they don't provide a linux version
I started creating baton (shameless plug):
[Link] https://github.com/royvegard/baton

> [    3.354758] ------------[ cut here ]------------
> [    3.354761] usb 3-2: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
> [    3.354769] WARNING: CPU: 12 PID: 1020 at drivers/usb/core/urb.c:412 usb_submit_urb+0x59f/0x650
> [    3.354776] Modules linked in:
> [    3.354779] CPU: 12 UID: 0 PID: 1020 Comm: alsactl Not tainted 6.18.0-rc1 #1 PREEMPT(full)  3ae07d8adb35c0aa13fd8a63520768d4d65cbe95
> [    3.354782] Hardware name: ASRock B850M Pro-A/B850M Pro-A, BIOS 3.50 09/18/2025
> [    3.354784] RIP: 0010:usb_submit_urb+0x59f/0x650
> [    3.354786] Code: 89 44 24 0c 89 4c 24 08 e8 5e 1f ef ff 44 8b 44 24 0c 8b 4c 24 08 48 c7 c7 c0 a5 15 b8 48 8b 54 24 18 48 89 c6 e8 f1 e9 b8 fe <0f> 0b 4c 8b 54 24 10 e9 fe fc ff ff 80 3d e9 83 4a 02 00 74 50 b8
> [    3.354788] RSP: 0018:ffffd1bdc23a3750 EFLAGS: 00010246
> [    3.354789] RAX: 0000000000000000 RBX: ffff8bc7c1facfc0 RCX: 00000000000003f9
> [    3.354790] RDX: 0000000000000000 RSI: ffffd1bdc23a35f0 RDI: 0000000000000003
> [    3.354791] RBP: ffff8bc7c6a0d058 R08: 0000000000000000 R09: 00000000ffffdfff
> [    3.354792] R10: ffffffffba11af80 R11: ffffd1bdc23a35e8 R12: 0000000000000000
> [    3.354793] R13: 0000000000000000 R14: ffff8bc7c6a0d000 R15: 0000000000000001
> [    3.354793] FS:  00007fab8f421b80(0000) GS:ffff8bcf24295000(0000) knlGS:0000000000000000
> [    3.354795] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.354795] CR2: 00007fab8f52c000 CR3: 0000000112652000 CR4: 0000000000f50ef0
> [    3.354796] PKRU: 55555554
> [    3.354797] Call Trace:
> [    3.354799]  <TASK>
> [    3.354801]  usb_start_wait_urb+0x89/0x190
> [    3.354804]  usb_control_msg+0xe5/0x150
> [    3.354806]  snd_usb_ctl_msg+0xa5/0x160
> [    3.354810]  snd_sc1810c_get_status_field.constprop.0+0xc0/0x140
> [    3.354815]  snd_s1810c_get_switch_state.constprop.0.isra.0+0x54/0xa0
> [    3.354817]  snd_s1810c_switch_set+0x69/0x130
> [    3.354820]  snd_ctl_elem_write+0x18b/0x260
> [    3.354824]  snd_ctl_ioctl+0x3b8/0x7e0
> [    3.354826]  __x64_sys_ioctl+0x97/0xe0
> [    3.354829]  do_syscall_64+0x81/0x7f0
> [    3.354833]  ? vfs_write+0x3c4/0x480
> [    3.354836]  ? ksys_write+0xbf/0xf0
> [    3.354837]  ? do_syscall_64+0x81/0x7f0
> [    3.354838]  ? __x64_sys_close+0x3d/0x80
> [    3.354840]  ? do_syscall_64+0x81/0x7f0
> [    3.354841]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [    3.354843] RIP: 0033:0x7fab8f3112ff
> [    3.354844] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
> [    3.354845] RSP: 002b:00007ffc8d758ca0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [    3.354846] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fab8f3112ff
> [    3.354846] RDX: 00007ffc8d758e30 RSI: 00000000c4c85513 RDI: 0000000000000004
> [    3.354847] RBP: 00007ffc8d759480 R08: 00007ffc8d758e30 R09: 0000000000000000
> [    3.354847] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [    3.354848] R13: 0000000000000003 R14: 0000000000000001 R15: 0000000000000001
> [    3.354848]  </TASK>
> [    3.354849] ---[ end trace 0000000000000000 ]---

This looks a bit sus.

-- 
Roy
