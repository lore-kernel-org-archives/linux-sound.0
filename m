Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582507;
	b=230+jN6tDaYL6Go3wiqmXT+6WeQdq70bV0cL0l6Wh7MW92eOSAGZBdY0YYa//PbhwJBt
	 1pHZKim9tGH5fLqUdYLmaOdMZjtjMB0XKmFdLfK0kqDAjnM1re72NPDSC3tAO22cqaKyJ
	 S7P+K/bweJ+k4+kSVGW6mgYYx6NFlse3crIZUEjSB/nzeKTaVyTtTghyT5U5ANIhxcFlB
	 JBa7+9KwaE4bRXd9/I6M1czfd7h756RVSlPqm1tQl1ipyBj6Jrg3IMcyV6N/wEe/EywNz
	 3Ys/MseSpkdIXkkbO8AiQV2KbzC0zoJxFiR6RCGhOzvFsOt5yY7EVP6gkybNhLdPp2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
	b=eI79OIn1KSTaGHisAG/W9R0Qe3pfXWogS5fhTgwAJCaA+pqZ1wMKAGCysxV3ypYYA26f
	 jIYAecnzIXbEeQV+JFeR65eYXRW6O0O4r+t0S8DJ3Zha2ppzNybWGW08pSEuY7m36rQ87
	 teQ8le2gUFNnf85m7gjfQHUIyobFIB+FheK2N3d1/ekomuGbk1Yv/dCPAMhMSMMLh/fmM
	 v+PDFBAGyM9LpZC9HSJGfi4nff7OcT+/h7BmZ3E1OAJu0QQfIrI7un5Eg8WVHAAN7W70J
	 OSLfIGBBZ1CU8zlh05H8H/PgtYjauCMEG7tzcOo0haGtCDx6MYW07DAxtDk7Ayohaqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m3kxISsQ;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A34606A32D
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 15:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5A34606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m3kxISsQ
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15757545e9.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582505; x=1795187305; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
        b=m3kxISsQgQk96b8Cz6OeQDvoEHKPE7mus3brdtZxd2FfvsZ8AUonE62hzidPdqQVAh
         MPrvpWxX63j1HY98GEiH4I9kD3qIKX/ZdaNtzU5ZFPJBmb3Ij66D71M+2KsaGZ8qdJds
         x6zj3Y59/+/frZF6+Mt9sgxOT05M6Ruysfpect75nqZGko92KCsJso8/WkSZF0x1rnLp
         QPmmzqTjyHnuJWyj/xxG54UCbJFIXqMIZ4+hOmtIGcfT8TNHgUayEiUaGSw0woiy5QIi
         JJzTKaOep1NqDJwb2dOFLZEyAjgiXwHAzvUsvPMSI35CO93Rk68g5gLQHt7xD3U4CfVl
         j0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582505; x=1795187305;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMS5aLY2Z+3tQAqLP7LykAdZ8VYJEKXYYcPg6ZE9ZvU=;
        b=S9IRqefT3RCy6S6q+GgSqtiYuksUXecLan/dFrvUUmJcewyz6y6e5spdiQW5AhUPtY
         Bdixg2dDCMr1HFItJwtB7c6GoELQUkeVxZpEgU7qIcJlg0WPNtdV8knCSf9cqXDgo2LP
         4jkjR1Bks9fOjKFkSO5lF6k+3w6Ma9Z+KvNI+F7vwIQAnJRrGlInwGNUQRHO2BJ7yYi3
         ovdSvdWiXtt/m0tJhajbnh50uo5p8pVYXdIFz3BpygTarmEWdvwjyMzCSJr/6qoClq8M
         szlAtAB0UYMlXhIfjuxTzzWBHo3LRSHZguGhkXe2COQ/9tZandCaABHQYSPFra2Kxv/x
         0Rtg==
X-Gm-Message-State: APuU4Z9MtFRLCGw73EFNg4rg096UcRJreLdunTbn/0P0DPaoDniMmNX9
	l3hux/ElWxctgpuIExKCCRf7fZRSGUcVyYe+NA4mgv89m4zWVGdcZ/fcCuRAaiCzpV0=
X-Gm-Gg: AYBFou21wBTLYp3ls92YePnlk9CMzAC7XGxuF8FnOHWbcHBVUAWbvaWLVcM0kopudAO
	ZDuXjvvsE/zTBDWWEQiJWox3EQtioe4ECZwEvH8PD3G1E7J+W+XEcmBnXsbaeRuKOxvCZMfrNhk
	E1Cuw7X2HTSLAmlqrI1cJ2HqazsW+K+Iuz/3Mth8tLmXL1j9Jhel0qT67rKiPVS20RgL9f5PrNt
	Jy/0s+ZZtQTco4QX2YJER8KwCmt2hvJTTKuE9quZujxpqmgYc0bTiRBNCwcdw/aljNaq8xs6HqK
	zOFOM4NJdAH+cMnCgistQQl5D5XQgn5X1sZsJv0TZCOxn0Q0sq2GnlnONFNG+GLTcrI6VZRrsfC
	un4Ut2M7ap9OPibfDU8Z2yZVV6+n7VctAshV2MiY1Fe2hfM3ZDfZ3F+8ggUuR1K8I6W6bMquuhf
	ftt+e75rdrp0miPA4M8swM+/oPPL6EdpF0bNtyLrBpS0Ea6v4l63hSfSXXPiKv43UjFGnt+KleW
	alUkr4BEun+YhLrzbXTvm/U0KVXcXuvnFzfMjNkRJm59YzsHS412yQ6dadYJgf8KZOiUBSeKp7W
	CshWZGlvsfbJAOJD+Va6iOBTehIHYa0Pfgs5cpdqbpM4PJwS
X-Received: by 2002:a05:600c:e558:10b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4bb55a96404mr41192715e9.23.1794582505212;
        Fri, 13 Nov 2026 07:08:25 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm20860945e9.12.2026.11.13.07.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:08:24 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Christian Hewitt
 <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when
 spinlock is held
In-Reply-To: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
References: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
Date: Fri, 13 Nov 2026 16:08:23 +0100
Message-ID: <1j33t422hk.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On ven. 13 nov. 2026 at 14:56, Valerio Setti <vsetti@baylibre.com> wrote:

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
> This is meant to resolve the following runtime bug found while starting I2S
> playback on an OdroidC2 device where the kernel was built enabling
> CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:
>
>   Playback device is hw:0,0
>   Stream parameters are 44100Hz, S16_LE, 2 channels
>   Sine wave rate is 1000.0000Hz
>   Rate set to 44100Hz (requested 44100Hz)
>   Buffer size range from 128 to 262144
>   Period size range from 64 [   21.012074] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
>   [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 267, name: speaker-test
>   [   21.026184] preempt_count: 1, expected: 0
>   [   21.030151] RCU nest depth: 0, expected: 0
>   [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
>   [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: snd_pcm_stream_lock_irq+0x40/0x60
>   [   21.048782] irq event stamp: 5274
>   [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _raw_spin_unlock_irq+0x38/0x80
>   [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _raw_spin_lock_irq+0x80/0x90
>   [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] handle_softirqs+0x584/0x5e0
>   [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] __do_softirq+0x1c/0x28
>   [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.3.0 #2 PREEMPT
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
> happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'.
>
> Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
> Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
