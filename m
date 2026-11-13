Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794606573;
	b=SwWVZfM0QgMJBfxDhC11jzG9l9ySq84PUJjsyNy/eRZMiHbfpBT4m2ZN+a248duAFHy9
	 GdP/drJjjcu/vOZB70LrqkV3CzLhgiOkugMpf3ZiB4Uzgyp7qZRX+8Gz0wFGe/HrCxMQU
	 sNPhQVhwZ+cU5JYwwfOXDtBgAaJ+NsKDSXa3VACM3Ar8hJd4ACpCVAjhestch+rSw2ufO
	 PspEBbB12JqsbF5Hh8hD5jH4llZ+v4yxN/pYOJsjT8s4/C3e3Ux9ODLcBJ29GMvsPX844
	 SZpcFmhRI2aQZkKiPA28cM1+F/f+rkPtaJigwsRFHApwYgZWyht+JAyWOJX3WGRHZcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
	b=D3wTPdsuvEiPNflqwlsYU/vYmIAJ6uMwDT+PY1j5a84wEvlDGhOx5GS6K+monwM9xlZ6
	 0CYdUFzysUmfI0ATdXJzHxnZftnDItNtcFdjjrDe0+zS52elyqVtC0ZtHgBC2WTXCtOBk
	 MtOonATrwqkRP0m5HhO/HYXRXHf2n7xBqTsk92HYNH2PyNovbulWrMVl5A2ozADGxxXuq
	 w79EMbmGx7tnyW+OmB30mEo8jJoy754wZGZZ6SlbDN6hgV5oz6Pkwn0BrFXBZ/ucj54Vl
	 c6x+KSFjYuWRctN678te1uq2531QULMm9aCVnH4j79WpD7ZfhUR7+ITOPx1UMky8AkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=QF5Crfkl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E22560A2626
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E22560A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=QF5Crfkl
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-67c05273c38so1872766d50.1
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:49:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794606572; cv=none;
        d=google.com; s=arc-20260327;
        b=QUNyJXKFb8Zx97CoIiKX4HAnKcQU9B9sHGYaR65Yq47vm2KscCFd2xGXWZMS/vofMH
         6lnUqnv0+GS37UbjrELOZ0G0i6yF7rIYn3WJP3dWMAzzQ0GzaY9+twk37Eq1cu3p6OKu
         bTGfrCf4VIu/uJtbzBSPT9vs7VSROvvZMytg9ooFnoHhFiZzK6O4apSwfnoUgAleQqWE
         /agCcv9jHJUKQJXHWBDurmoWMMbEkQBpeGSOyBxp3f9vEIMo90inBaxVkMuLCA4/GDIH
         HeiF2g/4+gL6GXQX7T/424kf9YG+Z8bPwv8wLig6UDe+pCcWhZV5bZzDhiutVWHAn7vr
         WDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        fh=vSc3uR2BsIgAwQtXlFTV3OhnRhXCewRnDelvn6ptHcU=;
        b=BRziJyw9T0ku7ye56s1JgdIhNrUc/rpYWfIedHDwYgnIASXIQ/nu5O2vM2CDcEpQuf
         PrmsJlwG8TseOqWGtG7LUVPVFXZVMyWPKLT7dFY6FvSTQfaIFZWQEMOGHaw9bie4GOOE
         NkcS0wwIXyZlzqYTgG58+wOrfzyYqxfmcVTZS4EVDuGnZ1/74ML39/MCqXu7RuxnheLE
         bI99HxzygfMTBOa5IKTdp5iCDyZTz42SDap9rAz1XDVisJfRW8BngDVreWu6QQuugj69
         NRidAcgsEV3iMndrYimKccVqWXmsVPrBf+p8s12d2TKP+V9h/HeGMv6T+Rj4Gomxf0HV
         eA3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794606572; x=1795211372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=QF5CrfklGfcB6TuS6O8V3Pk6+/AI+tTWM9b+EdIQ9fmlZbPGfEQ+MTTFYjwB2MDRCg
         AaMete78OnDmHgdkVg4vm7XCx+JoK9SvIyHtWWxKv0CCXflZ+DnWy3SNj99KotihUKKt
         KQz/CEs0QbqutrQxpGy+jH/DbEFqDPes1dRP923SdVEPyFX8l0DnJ2D5M2heVtm/3AVs
         Qi/D7mqB8IxvrRLqZAHDB77VkAwfoc69LIMNxhDlFfuEdfLYZ8Ez+Nwky1fmVI4JeL8S
         8U7Q3/yzdHBZt35IKlZOgaXtWC+4JiHB0cELyxEdzLr4Fk/0MuRYjdfvWcO07QNKuAbv
         qkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606572; x=1795211372;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3L5/R0TNdPI9wKc9dod6srzOhs1ZLS+127xQ0nrb1+8=;
        b=q6QA+ZjNJUZReHhfkjj+GxHNCMeSiPeTXpWrVp8rMl7hlBzNLDGCYOACqZKWAPetSk
         ADEvByujS6hrxfyu6niXg2AwdGnLTk0X50T4R6dnQDaVl9FS6zvG9yRnYEFUrAVv8OD/
         iV7+/HZbnt/CuwQBRGn2k1dK/3cX/OC8fg9mIuzZnq8E2b8o9Mf/Exe3WMNZV4akEy8m
         qUboVQulE5QpG2vcYAJQlwR2nAnk3CvV5+mTiuqMnJXo6Wqc7DNM9lFpUU50MbOqYo9T
         cHtnrYOc/tHb2Oyvtm1BOwWW1qKmfdBwSif5Jm4fVjxWf7oYaybhiTZWo01f2UtnkhPA
         jYNg==
X-Forwarded-Encrypted: i=1; AL+hErFmyzSj1K2Q3a7pQhq7nxBU0o5Sz9zRbsaFg96e2u3/dWQ6d/4M3bdpj2nrbS09crwThDimUo9kFJl8Yg==@vger.kernel.org
X-Gm-Message-State: APuU4Z93GUMojQJcG2uxnQu4TX4WplUbXsWzn2k5MexfhTf9QHxim1Ws
	Oa5pikgDIT4lp4jc1QuQr6QqDmHbgYCG9SlzosJwpHA3sGF+Np+Hars+kb0B+59rRKfBFK4/+8j
	SP/Tj1b9NmP3HiB1l4oOtr02GgtDAPxY=
X-Gm-Gg: AYBFou2UwshXb+nafV7J7RlVZrvaVswcWe3Gb0BWcGqHtKexw0tSlpjL32o50gPvE2l
	ckO7aRcuzlviIi41X/15Qr6iFADV3mRC2BCxjazwIs4sIujj8mydpB/N/W9zzZ47qwuAbF61K2l
	3JmV9hBBL/x25ltpy3OjZIwH4j+cM2Lm7zotxT22ONgZZpYTFtsOPYQ8EHghXhsYfDejWj294mw
	vhiYUM5Zu4BAEMX+QxTbPEtBZlt5t3cQrRpeh456pdc5KVrk6vqk7FTwyZmobsj7n4BQ5RF3AxW
	5YvIGcyxSG1VqRBZ8fPS6yahrfM/vIihrsMcgT5NUO2uktavFiWQ73zmDf+vLwhupM6f7b0u8Ad
	W4jvnRph7EEB4S+eb26brVyRXLQn29mdo/tcg+qfGv2LKJKSMq2olaei9XRL9Behpf364Pw==
X-Received: by 2002:a05:690e:4514:20b0:67b:f3f1:1657 with SMTP id
 956f58d0204a3-67d895d1d1emr1805444d50.34.1794606572014; Fri, 13 Nov 2026
 13:49:32 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 13 Nov 2026 22:49:21 +0100
X-Gm-Features: AclHuK86y13cJB3U7lK1W7UeMH0dHKC_-NtrK8Vfy5rgx6ydsQHgJZMUNQRuLoU
Message-ID: <CAFBinCCKLhk1RZX725o84kMYTsiVZF8SE3rc52t5NuknwHgMGg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:56=E2=80=AFPM Valerio Setti <vsetti@baylibre.com>=
 wrote:
>
> dai_links in the gx-card are atomic which means that the DAI trigger
> callback is called with the spinlock held. This means that usage of
> potentially sleeping functions (e.g. mutexes) is not allowed here.
>
> 'snd_soc_component_write'/'snd_soc_component_read' take the component's
> io_mutex on entry.
>
> Replace usage of these functions in:
> - 'aiu_fifo_i2s_trigger'
> - 'fifo_spdif_trigger'
> - 'aiu_fifo_pointer'
>
> This is meant to resolve the following runtime bug found while starting I=
2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>
>   Playback device is hw:0,0
>   Stream parameters are 44100Hz, S16_LE, 2 channels
>   Sine wave rate is 1000.0000Hz
>   Rate set to 44100Hz (requested 44100Hz)
>   Buffer size range from 128 to 262144
>   Period size range from 64 [   21.012074] BUG: sleeping function called =
from invalid context at kernel/locking/mutex.c:623
>   [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 2=
67, name: speaker-test
>   [   21.026184] preempt_count: 1, expected: 0
>   [   21.030151] RCU nest depth: 0, expected: 0
>   [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
>   [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: =
snd_pcm_stream_lock_irq+0x40/0x60
>   [   21.048782] irq event stamp: 5274
>   [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _=
raw_spin_unlock_irq+0x38/0x80
>   [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _=
raw_spin_lock_irq+0x80/0x90
>   [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] h=
andle_softirqs+0x584/0x5e0
>   [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] _=
_do_softirq+0x1c/0x28
>   [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.=
3.0 #2 PREEMPT
>   [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
>   [   21.086145] Call trace:
>   [   21.086149]  show_stack+0x20/0x40 (C)
>   [   21.086160]  dump_stack_lvl+0x6c/0x98
>   [   21.086171]  dump_stack+0x18/0x24
>   [   21.086179]  __might_resched+0x160/0x230
>   [   21.086189]  __might_sleep+0x50/0x90
>   [   21.086197]  __mutex_lock+0x64/0x8a0
>   [   21.086206]  mutex_lock_nested+0x2c/0x40
>   [   21.086215]  snd_soc_component_write+0x38/0x80
>   [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
>   [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
>   [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
>   [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
>   [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
>   [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
>   [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
>   [   21.086296]  snd_pcm_do_start+0x4c/0x80
>   [   21.086307]  snd_pcm_action_single+0x50/0xc0
>   [   21.086316]  snd_pcm_action+0x88/0xb0
>   [   21.086325]  snd_pcm_start+0x2c/0x40
>   [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
>   [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
>   [   21.086356]  snd_pcm_ioctl+0x3c/0x60
>   [   21.086366]  __arm64_sys_ioctl+0xac/0x110
>   [   21.086376]  invoke_syscall+0x5c/0x120
>   [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
>   [   21.086395]  do_el0_svc+0x24/0x40
>   [   21.086404]  el0_svc+0x54/0x3b0
>   [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
>   [   21.086424]  el0t_64_sync+0x198/0x1a0
>
> Note: the return value of 'regmap_read' in 'aiu_fifo_pointer' is
> intentionally ignored. Regmap is MMIO here and read failures shouldn't
> happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'=
.
>
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF=
 datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
