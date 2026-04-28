Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31D83D6469
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369282; cv=pass; b=e+CyeGzd4n31tjGq7wHEswsHUCzQMEuraLeGJzVV00nmhui3RbmgyqjETnEMG5N0ECfaJ5+d2FnsohitWeUi4K0yFOxAiSyX/DxawQB2poUBcI5wvFo9z6naNqEhK2SEidTp42JD6AF274J7NUo/q7WwQh9B6OBmUJZeDBhQMzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369282; c=relaxed/simple;
	bh=z+RviMs9g44rVfq3IhufiHmgZV9hxNooZsGNxeL+nBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgeKOG3Wgzw3oqWS5EKfxKRTVYAYPqJb7UvD4e/wHMVyl7nlWnIK3s1f1qYOl1lrErVj5yxJQ4q6v2LOeGkj5xCAYc35bj4C8morz8Y8gl5cN+X9Svqq1qp/fedztMf1KBXqyPxUDhH61hdy8vk0AgAP3A6CsbMwjNA7pnP0uuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3miB2Dd; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3miB2Dd"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c76cce85bd9so4268700a12.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 02:41:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777369280; cv=none;
        d=google.com; s=arc-20240605;
        b=QuccO6ld4fffTkeRkIBe7ydHEZb56Zq3rtKYMribq3gFARZD0GP3eGob0hW3ON9Lfs
         TOnxQREubQbpj0tK7fl/9iKmHGPGput8MTr3p4Yr0/ljtFU5WuvwvUVnJ8zJRX679P+P
         w/I4RfpF4LZofQy2LDMRv+/yphFs/zzoJHqu9Or0dsXB4pwmBSlHr/oU81+snaLR0wKj
         ba7863xvtrmeMVH/CfjzqbX5seW6AfXZYYiwinrkT+EKvDz//HFbU8v2EimpL8bL0HcP
         8TdYPRe2WRLRtkN7nrKfiPufcM7TA1JMOLQCCNTnGOban8zBIf5IjW6H9VdDz/7GN3Dd
         DV/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AnSnIsMNDAma+IgkOcey9NBHXePZVAGOReDpxepiZEw=;
        fh=+ncp8XcaVftY508LzVH7B6M6Za0vu8AZgkxJvo7P3+c=;
        b=eJfheUsTmsBg8N6ecQUU5gmB5eRh0t4W+S9oQahAJx8rX8sDTFOeRJRG6IrbdFKhzB
         jNvBbBDmmsfUh8ysR4HZ/WUhC1WMc73jv/lG2YvnLlcM2lsYcLDJgKMlODjBiimmZgNJ
         1OiEB4pCqL+fuWDQ8A1Boy6qyG9yJoUgr87MmSq1Tbk+3g19A/cE3KnQu3KOwqnkQJmV
         RTEJ/HV4U/SKJNA3L8jdBjuUFeBYJV8ZHIihfaUnD3cH5D6/gzP9TLI1Teayt7NgZTZ3
         Z+ETinWTijaf0XAqmEpH8rcoUm5rP2xwiuUt5nn6itDR1DUUdf3a7J1zO5kqKBZmdfeW
         ysXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369280; x=1777974080; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AnSnIsMNDAma+IgkOcey9NBHXePZVAGOReDpxepiZEw=;
        b=Q3miB2DdYqHExGww80uDoGpcVI7nAUlpVM3uftty9z9oi2DiN/asfcMDjLN7a2mYTw
         zztSAfFLZ9PaeEwVOEPDn7Fj3fv+1jgnt59PRTKHqz0lS+DzYJU36By3WDqEN+tf1r5d
         On9WQuADu2KkKZlYAlXcciTsL5a7mfknJOInEmlfpyaZnnw75DG+7iztHSE6ulcL0Jaz
         wkWOa3WCj4UjYgrMlz/PLpOma9UfY6QbtR1BSh7pC6PlhqPDQjCG+/IpYTsmMmaXYC2F
         q5nFiJ2HVeBeOHZsIG7SU/MCQ8vJBxYstEhow5bs767dp2DNMWbmuDS/L6PzSZGQB11y
         sM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369280; x=1777974080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AnSnIsMNDAma+IgkOcey9NBHXePZVAGOReDpxepiZEw=;
        b=ZPgKYCw4Jtb+xv2Dg//67T4+jMNU3oMcB+tds4m4bl+o14HlPNhRdzMOjG6lUq/ebu
         1//y6zXOf0YpoUguQC1p0PgahY520EwxRcJPgWGXOjF2U8U+rMBH+W2lV8+WnXPMBnKr
         uObtB63LeWnvAsD4RilPnC0Hfur2aoQuy+rm694hXd/KA2VrUSOx2q4I9IVj/zQNyY6F
         YdVq6tCk306Xp/hTYh3fTcvnJU507/iimecBlJXvoLyDdImLqoifN9s0L9kYbtJFl7I+
         4k0I2azUrFD2bmVmBAYj2URR4YNgtE6AcJFKhA8zxfwIpITV11jmi7E95sh1MFJ17uBd
         HLIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9q3uuBWEPBfE7EO9Tbh41vBCoyqV5eNkKrCCY/mk++r6l50nEibeXmanRODJmNeWmXAjJJfpL+sY4yQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCEQZ8OuqMv/fjboinu6y+ZXzBMKmr3pWu69Ri9hkGwKwAhy2J
	/0oJB8kjRS1IcGTn8mIMmEwuAn0Aa7djp/nnr0lkhI6d1xjb4SFaovlGVKD5LbFNRbW706Mvo75
	aj9m7/Px4QCqmNbkpMDBn3YH+lbI+Bl8=
X-Gm-Gg: AeBDievQ1u5NGBcv+j7k/6mVpQztdHA6djDgew7lezYDXFsrJ30DapILxQN88Z3OOJH
	JLc9kClQLjEr2eiY/TfvN4h9KbniMWwpmrOQvdO5KFoF/T8sPWzXM9iNRSMEp2i2IjgQhFmnz4x
	eOnioFDoQZaCSCqKXyCiIPAANpB+0dFVO34ey1tnJfIg2p1cGT9wmql7ZHjazmtFU9nHMbFwWTS
	/6/NbkwbfmuKeFOPcdm7MC64Yc1qykzSA9L24wFy5nTlNxpxXOZGHmRK9DMbMBrOmmroURXcFo8
	2/4Sx/ieFxrJq1UiryM+mnifbWs47Ddev4cj7cerUIvY1PIF
X-Received: by 2002:a17:902:e746:b0:2b0:6e60:9582 with SMTP id
 d9443c01a7336-2b97c411386mr26853925ad.18.1777369280083; Tue, 28 Apr 2026
 02:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
In-Reply-To: <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 28 Apr 2026 16:41:08 +0700
X-Gm-Features: AVHnY4Jtd9qov1U9UDBxFBM7FR1sTGp_zRda_9g4fyTQWtjsSvrJmbyAPpkfjao
Message-ID: <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Even after reordering the sequence as follows:
    fsi_stream_stop(fsi, io);
    if (!ret)
        ret = fsi_hw_shutdown(fsi, dai->dev);
I had previously tested this change and did not observe any issues.
However, in more recent testing under different conditions, I noticed
a system hang.
It seems that the interrupt handler may still be invoked after
interrupts are disabled and the SPU clock is turned off.
The following log was observed:

root@localhost:~#
root@localhost:~# aplay /audio/file_example_WAV_2MG.wav
[   51.580000] >>>>>DEBUG: enter fsi_dai_startup
Playing WAVE '/audio/file_example_WAV_2MG.wav' : Signed 16 bit Little
Endian, Rat[   51.590000] wm8978 1-001a
: Imprecise sampling rate: 48000Hz, consider using PLL
e 44100 Hz, Stereo
[   51.640000] >>>>>DEBUG: enter fsi_hw_startup
[   51.640000] >>>>>DEBUG: enter fsi_pio_start_stop, enable : 1
[   62.610000] >>>>>DEBUG: enter fsi_pio_start_stop, enable : 0
[   62.610000] >>>>>DEBUG: enter fsi_hw_shutdown
[   62.610000] FSI BUG: READ after clock OFF
[   62.610000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.0.0-09892-g26b66fbaf162-dirty #5 VOLUNTARY
[   62.610000] Hardware name: Generic R8A7740 (Flattened Device Tree)
[   62.610000] Call trace:
[   62.610000]  unwind_backtrace from show_stack+0x10/0x14
[   62.610000]  show_stack from dump_stack_lvl+0x50/0x64
[   62.610000]  dump_stack_lvl from __fsi_reg_read+0x30/0x5c
[   62.610000]  __fsi_reg_read from fsi_count_fifo_err+0x14/0x88
[   62.610000]  fsi_count_fifo_err from fsi_interrupt+0xa0/0xc0
[   62.610000]  fsi_interrupt from __handle_irq_event_percpu+0x1a8/0x1ec
[   62.610000]  __handle_irq_event_percpu from handle_irq_event_percpu+0xc/0x38
[   62.610000]  handle_irq_event_percpu from handle_irq_event+0x44/0x68
[   62.610000]  handle_irq_event from handle_fasteoi_irq+0xa8/0x130
[   62.610000]  handle_fasteoi_irq from handle_irq_desc+0x64/0x7c
[   62.610000]  handle_irq_desc from gic_handle_irq+0x60/0x70
[   62.610000]  gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
[   62.610000]  generic_handle_arch_irq from __irq_svc+0x88/0xb0
[   62.610000] Exception stack(0xc0d01f48 to 0xc0d01f90)
[   62.610000] 1f40:                   00000003 00000001 000176c4
40000000 00000000 00000000
[   62.610000] 1f60: c0d03f98 c0d07880 c0d90b82 c0d03fd4 c0aea642
00000000 99cea980 c0d01f98
[   62.610000] 1f80: c08228f4 c0822c68 600f0013 ffffffff
[   62.610000]  __irq_svc from default_idle_call+0x24/0x30
[   62.610000]  default_idle_call from do_idle+0xcc/0x124
[   62.610000]  do_idle from cpu_startup_entry+0x28/0x2c
[   62.610000]  cpu_startup_entry from rest_init+0x94/0xb0
[   62.610000]  rest_init from start_kernel+0x608/0x6bc
[   62.610000] FSI BUG: READ after clock OFF
[   62.610000] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
7.0.0-09892-g26b66fbaf162-dirty #5 VOLUNTARY
[   62.610000] Hardware name: Generic R8A7740 (Flattened Device Tree)
[   62.610000] Call trace:
[   62.610000]  unwind_backtrace from show_stack+0x10/0x14
[   62.610000]  show_stack from dump_stack_lvl+0x50/0x64
[   62.610000]  dump_stack_lvl from __fsi_reg_read+0x30/0x5c
[   62.610000]  __fsi_reg_read from fsi_count_fifo_err+0x24/0x88
[   62.610000]  fsi_count_fifo_err from fsi_interrupt+0xa0/0xc0
[   62.610000]  fsi_interrupt from __handle_irq_event_percpu+0x1a8/0x1ec
[   62.610000]  __handle_irq_event_percpu from handle_irq_event_percpu+0xc/0x38
[   62.610000]  handle_irq_event_percpu from handle_irq_event+0x44/0x68
[   62.610000]  handle_irq_event from handle_fasteoi_irq+0xa8/0x130
[   62.610000]  handle_fasteoi_irq from handle_irq_desc+0x64/0x7c
[   62.610000]  handle_irq_desc from gic_handle_irq+0x60/0x70
[   62.610000]  gic_handle_irq from generic_handle_arch_irq+0x28/0x3c
[   62.610000]  generic_handle_arch_irq from __irq_svc+0x88/0xb0
[   62.610000] Exception stack(0xc0d01f48 to 0xc0d01f90)
[   62.610000] 1f40:                   00000003 00000001 000176c4
40000000 00000000 00000000
[   62.610000] 1f60: c0d03f98 c0d07880 c0d90b82 c0d03fd4 c0aea642
00000000 99cea980 c0d01f98
[   62.610000] 1f80: c08228f4 c0822c68 600f0013 ffffffff
[   62.610000]  __irq_svc from default_idle_call+0x24/0x30
[   62.610000]  default_idle_call from do_idle+0xcc/0x124
[   62.610000]  do_idle from cpu_startup_entry+0x28/0x2c
[   62.610000]  cpu_startup_entry from rest_init+0x94/0xb0
[   62.610000]  rest_init from start_kernel+0x608/0x6bc


.......

In fsi_pio_start_stop(), I also tried adding the following:

    if (enable)
        fsi_irq_enable(fsi, io);
    else {
        fsi_irq_disable(fsi, io);
+    disable_irq_nosync(master->irq);
+        fsi_irq_clear_status(fsi);
     }

However, this still does not resolve the issue where the interrupt
handler may still be invoked after the SPU clock has been turned off.

Do you have any suggestions on this issue?
If we still want to keep the SPU clock enable/disable inside
hw_start/hw_shutdown,
we need to properly handle this race condition where the interrupt
handler is still being triggered after hw_shutdown.

Otherwise, moving the SPU clock control into dai_start/dai_shutdown
seems to be a safer approach,
since at that point all interrupts have already been fully processed.

Best regards,
Phuc
