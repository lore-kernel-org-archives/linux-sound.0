Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793261077;
	b=H4u2hkYMb3sas6eITraXz/2iMn1Bh5XkEsQqAxtHwGihRQQ7Tmqs6p4/S3LWlrnEEbxn
	 J/maWdnzEMh4f945K/2k3fkwIrtKk07e+764/d4kSuIdNqqYaQIEtirqnATA3sav7pjIq
	 kePC2NgGnE4o5/qPKWKRxpgWRVZD6r2KCobwa6FI/VLJibrbixW82zd1GXvOgoqaPrk5+
	 Y+HJxBxS3S65MOgdWEGNadZq+/aoE7Ovrio1lJ9Z44z12foWdwtjR4xS9j7lpT2gIeL3R
	 7I61Wyc4ybT5GoJQJmYdpsphkyK3DEIvZGUYhFc2NWuzfhT1Vc4Tm0pGSBsaCG2Q5jQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=lrU8vSSrfvijID7gY8x/p68bn9kW9ndEqU5SvJcWRQA=;
	b=LNc8MaKfOsZUwuIK3Tc/C9NRn4rOr1p5mm9y9Ovy/lYBzIdQrmcNHfnZEEdzsVBm+veD
	 iZSPgmvqbR13Lahp12tmnYCu4kv23TjQHUIHZJt8WgaWwZpieBuNjOPxAmEMcUjMvUH99
	 Xp9tsSdW4dvCLbRvwReeuwutc+1S/PPp0VUOQ3LnMP2xalfbSN/hzh0NEm+Eznq4+2VEb
	 ZUy5A1PZjxvuuQr1zcTtTgFbuL3LV+DVFhre/zqKUxgT6scIVmYfrYGfuTo+cKVSPClkJ
	 iU15RuFSrmaeVaL/qCgNSRtCIN5MNLk4VZuuxYiNKFLXyIgVtivgvwxi/LHIM27eKuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcxOTMFJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA864606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 08:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA864606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BcxOTMFJ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so281848366b.3
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 01:04:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793261075; cv=none;
        d=google.com; s=arc-20260327;
        b=j9WhQpnXtqGlYEgJbDd7vn8o1Gfx76srX/BxFyrAxF72OKnlFVBA4X3x64ZRsrsrpE
         JiOjqUJDseVN3MyN1WZL1VlV+h/Mx8HuMuQmTs6GLrWYQbA6EB6kQqw4cUdiPRk045XH
         hh2UZDtFdkV8SNiM53XEfKFueq3kbIyWLXGPw4eNj0LRfQjw9TkmjvLVfb8fdcZb15Al
         XxUauvs5I/HR+NVuiOnPDgPgWsc6dzIYdKnAu1rr3E8+LZM4kVZlB7n7AGML+slB4MS4
         J0YBNmErg9KqFu0TAM3ad0uhlAFV3AiJg5ontRr78/iX3bOepmm457SODuIMNqlhQf15
         jAyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lrU8vSSrfvijID7gY8x/p68bn9kW9ndEqU5SvJcWRQA=;
        fh=zniGmjnYF5YpGTwoKVwJCiLFosm7n/t0NqpOQYv6TBE=;
        b=M/zidj1pzTiz5aGYYJAE6Uyr4crGCIp1Os7UeOjyDZdm0SUwyo5jbM3Z9MVTh/hsYW
         T12QimIfHp1Prhl4gYrH3uF8VNZ4lSErzIDnzSBf2Vs8c8wmONqYo+VkyRvOTgWjAApC
         FBXklT0BIHCJcPz46vtUteVmHH76D0pfBBU9KX44nqQm9AhyQlI7J5B1nskKSoZbT7K6
         ltw2lwOLs+NsPbeXGZJ8twwXJ5KzsAU34gqSKoBQyFVNVRhQGVVIBMC578qsRyDPw5Aa
         3rmT3RhUsAGqj9xoqk77/0IgobmUI0EU6WVPY+0hiBWdQ1OCmpehIxTAVJX5xwDaNBks
         WpvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793261075; x=1793865875; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lrU8vSSrfvijID7gY8x/p68bn9kW9ndEqU5SvJcWRQA=;
        b=BcxOTMFJpvMVzVv4/3EpST1sVeaZZhMqXIKAp5cjwjo3ckGvHI3K9rOuocXY2+CbSJ
         1KPfiQ8xklR2MhIaglA0umL5ktNsOxMLbETyQM6re6P3qrDtB2MWVhH6jk1vHvygais3
         X0iRx5oDRv+d/hdsl38RwnAJmsCFfvL9WuHe6T6FDYzyob+fOwzzlIAJWMLE6f+SfRmK
         kP2vAQYM0zYSWEScC3gkkcq04iXCQcsssmj8UOPKVnd5ehhb2kDwr2eEElUUoOdmevkW
         9xY7iAujAZqtjdhggvbOrTpyPRvYsovwDewvSIUWn+w+B+u5y28/CYD6vpOrBYbCLq7w
         K5xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261075; x=1793865875;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lrU8vSSrfvijID7gY8x/p68bn9kW9ndEqU5SvJcWRQA=;
        b=j5jsakvEdYimg9BdlhO6xP9cGA18kxfATFAYNxtWzoqzz5eXeNh/3mD1QNBn3z1wsW
         fQ67l/uP9FS0HhjnpV1+TxJ2+GCJZeirgtGOxlcuCV498eLFgpuaHGppMlMMGfV9q1Hd
         b9KYA0BFMV5HGaR7knGCA60Gs8ve86fKC3L12ptsgyPsOVZyiloFhZPVfCMqcRpJnpPV
         eiubUE/OU+gmPQukfvx3PsAKqaJdZ0SoDPbikYWkYwE4YYBPkUyyB/MRCmeb0VUeRLm8
         50fm6DBBO6F5ciqGw9/epnAFWlyodG7xPJcABFBmUmDRVVigy3PobvmrY747L+F1ud3T
         3qlg==
X-Gm-Message-State: AFq9FYLPnfOXGO4fkF2kfV3Eg8k7sg5DW/aFE2+c666mT+rUp0+Lf4zs
	d+P8uMirWR5o6owOwksXiqn8NwlUHxqPojHAfFPrGGlNj14+RXJQqs2bznsga1WcEmgTkpds+tm
	o8UGVLh2O/+c9wtR8aChtPH91q1CQNWt/YYlhocw=
X-Gm-Gg: AYBFou0w75AQsH2GE2Fyi4lMWeDFOvTRRn7/cJpw8BBIK2jL34HcFkPiFIJt8oEMUPT
	4lAnPb25YEI9ppwcY3cBYDejyQnwWEId7kXE1fFFjSM5dBgVHMfF/6dN8jyaI3D8POh7uhOvaKr
	OMUFlF7zhjCcl26YPRPuUMsTfEMragYpLNkiIMz17l11FcaS4X1fBfVL65HhKlKUi+7kKV6ofDS
	3NMS1tlc3GYf8wj4D8+MzyZjZZA3RDydq2ZX2VPUwAss6wa9R5gE9/yq7LRcYB/mmQ2rhsbd944
	kAXeLi04vSbQmk1eLJfGx0rpkl1Hx6/+rLKTKr7iASGAPjY1jiQE7fHeeRToMaZIQBLUBnUZz01
	pkjzd5e49wb6ziUVj/Am/8cIgOcg7NIUb8zTIwwCQTz1NWV0WiFY90/0696tJk3zKxE9xf85Vdn
	RN1sJKVeaFEbpG6gh1qTR2FewY3QrQj4Vt7VQUDqhJT694N32l5spZ7QM=
X-Received: by 2002:a17:906:c14f:b0:c43:6d40:4f84 with SMTP id
 a640c23a62f3a-c49bddace89mr416695266b.4.1793261074909; Thu, 29 Oct 2026
 01:04:34 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Riccardo Belli <belli.notari@gmail.com>
Date: Thu, 29 Oct 2026 09:04:23 +0100
X-Gm-Features: AclHuK9cETA0mc1UL0rzU4tFEETPcuOiFtOiIuDACJvMJQivNcuymqn-PdQuc_I
Message-ID: <CAK_58X+DXZLLwJir1NZ7p7NTqqetfqYci479ez9pTG9PuoOo2g@mail.gmail.com>
Subject: [BUG] ALSA: usb-audio: list_add corruption in snd_usb_endpoint_start()
To: linux-sound@vger.kernel.org, "Cc: Takashi Iwai" <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"

Hi,

This morning I got a kernel BUG in snd-usb-audio. PipeWire crashed
inside snd_usb_endpoint_start() with a list_add corruption. After that
the USB hub of my monitor did not work anymore until I rebooted. It
happened only once so far and I can't reproduce it on purpose.

Setup:
- Kernel 7.2.8, Omarchy build (linux-omarchy 7.2.8-9). Its only extra
  patches are the BORE CPU scheduler and the ADIOS I/O scheduler.
  Not tainted.
- Lenovo 21RX001LGE, BIOS R2XET37W (1.17)
- Topping E2x2 USB audio interface (152a:8752), connected through the
  USB hub of a Samsung LS49A950U monitor (TI hub 0451:8242). The
  monitor has a KVM, so the hub and all devices on it are disconnected
  and connected again when I switch the input.

Timeline (local time):
- 19:35:52 the day before: hub disconnected (KVM switch)
- 08:01:30: hub connected again, E2x2 enumerated normally
- 08:14:59: the BUG below, while PipeWire calls SNDRV_PCM_IOCTL_PREPARE
  on the E2x2. PipeWire exits with irqs disabled and preempt_count 1.
- 08:15:27: KVM switched away. The kernel logs the disconnect of the
  hub, the E2x2 and two other devices, but not of the fourth device
  on the hub (Realtek 0bda:8153). After that a kworker on
  usb_hub_wq stays in D state, nothing on the hub enumerates anymore
  and pipewire stays a zombie.

Trace:

 slab kmalloc-part-14-8k start ffff8cb613a0a000 pointer offset 2120 size 8192
list_add corruption. prev->next should be next (ffff8cb613a0b590), but
was ffff8cb613a0a848. (prev=ffff8cb613a0a848).
------------[ cut here ]------------
kernel BUG at lib/list_debug.c:32!
Oops: invalid opcode: 0000 [#1] SMP NOPTI
CPU: 1 UID: 1000 PID: 1407 Comm: pipewire Not tainted 7.2.8-9-omarchy
#1 PREEMPT(full)  2a024ab81c03d9fcd6534aa9914b7956fa84b6ee
Hardware name: LENOVO 21RX001LGE/21RX001LGE, BIOS R2XET37W (1.17 ) 11/07/2025
RIP: 0010:__list_add_valid_or_report+0x7a/0xb0
Code: 8f e8 9a 28 f9 ff 0f 0b 48 3b 16 74 1f 48 89 f7 e8 ab f1 5a 00
48 8b 13 48 89 d9 48 89 ee 48 c7 c7 10 dd 09 8f e8 76 28 f9 ff <0f> 0b
48 39 f7 74 05 48 39 d7 75 17 48 89 fe 48 89 e9 48 89 da 48
RSP: 0018:ffffcf1948013cd0 EFLAGS: 00010046
RAX: 0000000000000075 RBX: ffff8cb613a0a848 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8cca6569d2c0
RBP: ffff8cb613a0b590 R08: 0000000000000001 R09: 000000000014a5e6
R10: 000000000014a5e6 R11: ffff8cca655494a0 R12: ffff8cb613a0a148
R13: ffff8cb613a0b65c R14: 0000000000000256 R15: 0000000000000002
FS:  00007fb6e53c9bc0(0000) GS:ffff8ccad4ddd000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffded3a85d8 CR3: 000000017ddf4000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
 <TASK>
 snd_usb_endpoint_start.cold+0x41/0x145 [snd_usb_audio]
 start_endpoints+0x5a/0xb0 [snd_usb_audio]
 snd_usb_pcm_prepare+0x143/0x200 [snd_usb_audio]
 snd_pcm_do_prepare+0x40/0x190 [snd_pcm]
 snd_pcm_prepare+0x508/0x690 [snd_pcm]
 snd_pcm_ioctl+0x28/0x40 [snd_pcm]
 __x64_sys_ioctl+0xb9/0xf0
 ? do_syscall_64+0xaa/0x630
 do_syscall_64+0xaa/0x630
 ? snd_pcm_ioctl+0x28/0x40 [snd_pcm]
 ? __x64_sys_ioctl+0xd5/0xf0
 ? do_syscall_64+0xaa/0x630
 ? do_syscall_64+0xaa/0x630
 ? do_syscall_64+0x5f/0x630
 ? exc_page_fault+0x90/0x1c0
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
 </TASK>
---[ end trace 0000000000000000 ]---
note: pipewire[1407] exited with irqs disabled
note: pipewire[1407] exited with preempt_count 1

I can send the full log or the module list if it helps.

Thanks,
Riccardo
