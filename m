Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6884220A5CA
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744099630; cv=none; b=hwdftWHfSNxt/G1td2SzIP69JwRIl7COj/Lf9RjQH36jNNQQVAcC0qUP2SN4YfxnfRG/aYqQYdB0tr+SrtpayE8XyVHhPTYX0CWTljsp847Zil62CI7ElJvlbYfDSh2yPIcHd9Tr6+mXSJA6f3rWg/Uj2LZQjiE3BUNdfLto6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744099630; c=relaxed/simple;
	bh=81DIvzHm272W+Uvegob1uaM/nwjpUzZ4zHxrneVBgXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VUP/k1U4JiSbjBdONxm26u1CNWGD1ufWxA5OiCG+pE9F4KHNwqygAN5usR4ROgbAOZUg80GYJrykOpiOmo7YzqDWFEGJzpLg/MrA3U2ysXtCFwua9VevpS7R4UXGOna+Pu4O+v8C516NweEl9c92FzTREmcGmTue7v+o4VqPJps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-527a2b89a11so27837e0c.2
        for <linux-sound@vger.kernel.org>; Tue, 08 Apr 2025 01:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744099626; x=1744704426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VhWGqh6Ms5UGTXz5eQwEut0Hx1Hvu86Ut80B8NWsco=;
        b=OgD900l6mCcNTjdEP9BSUNUxPTLfCkcFqMqHKYKQ0YH3RWVfcEkV7080r6JU/BRiXg
         +Z6jLeWU+ItVchGpGXHZFCW5O539Yf09MNNDt5sM39ERC5z/FMkxEIjzzas9b6Gm3wvx
         MZKL9txpsvxvWOeqC8I+nLub7bVrprf8szwRrtrKEHqikn+l/cVsNadXqzxhyQSxg5Q9
         VjIdOv+buOhlzJUtkayLuBtzhOway4hIMLrI4hsP47xmNgLkyJKjxF6z2bA9f/dW3eSS
         b01cbS7ewM48MfE/mRDXGNTSodI4grU+6kFl9ZEjIwAo0oPNLJ7cDIFZTAh9gqqmWPMs
         bYfA==
X-Forwarded-Encrypted: i=1; AJvYcCU1cbazNRtSjTtwne20foYXFaPcWVXXAox1vqhkBaa99izjLjaihPU9VBXdWO0Hxx2BWxyW2VFud4o+pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAkgCnbx8g4XvTLDYd8XUh4BcugKj2JggOD0T+j5ziAcxxskqN
	mXTPCjnUXHIPTnCrcohqhcM039x8KVZj6OUacGsfwiVJfvFvNsXyTbmFoBTc
X-Gm-Gg: ASbGncsCHxShLoevcwLlRlzLqC0Imr2Xi5w3LmP8NPD8fWfxvgyay1iJz6WY6t8OQBk
	pqe5USNi6+6sbzcqpRfwf5+87ZhMtBSoDiHJo5kBp3YdbSSAREWkkKGSqgtU0kdYIMptdj8XZj1
	V2Un8XDwwDTUkR5rJ2p0XboUhUCt0ju4+KO9e/ayp0w9W2qXYVCGul4GYdxtp4iSbYJBplLLzl9
	F7PEGJmfSmFwav4Nrpt4yZ5JDi/S7CSQugG3THRV4FlPwQpWkJhEJ4rJNirjzpiWnmasfjmLtlC
	glrGf+jwVWb19WGGTdFn2mX08du9tAl3WlUnnqC8zc2O4itfsVH8z8T3MBIv6TR3g0NDZ/Q/5ul
	rAk0A5tieu/U=
X-Google-Smtp-Source: AGHT+IFxa6MuCqQtheFp7W4x68Eiwns3HVnk1CDG9qCayaqEd/E6RlQUo+Pve7AVJa+yMQUMX1r3DQ==
X-Received: by 2002:a05:6122:8d2:b0:523:e175:4af1 with SMTP id 71dfb90a1353d-5277308100emr7610372e0c.6.1744099626594;
        Tue, 08 Apr 2025 01:07:06 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-873caac68f5sm229982241.32.2025.04.08.01.07.06
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:07:06 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5259327a937so2203694e0c.0
        for <linux-sound@vger.kernel.org>; Tue, 08 Apr 2025 01:07:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVLbD7J9uwWMnKe2C1mMzwxLiprsB/IOl/IVwrqFU/9RCenHaTcep/W72CT1mom9vH7QStIyELKXunu+A==@vger.kernel.org
X-Received: by 2002:a05:6122:1819:b0:520:42d3:91b7 with SMTP id
 71dfb90a1353d-52772ee52demr6722525e0c.1.1744099626123; Tue, 08 Apr 2025
 01:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87a58roatw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a58roatw.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Apr 2025 10:06:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUstYeHPP10BC0fORWfWSH+qzCqQNzaoumj2w91tCyB4Q@mail.gmail.com>
X-Gm-Features: ATxdqUHAJy-ddHQj52GRYtr_h9TUKt3xyjh4v-xxMUAC6sYvkm-b4U3duGRzF0A
Message-ID: <CAMuHMdUstYeHPP10BC0fORWfWSH+qzCqQNzaoumj2w91tCyB4Q@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: hdmi-codec: use RTD ID instead of DAI ID for ELD entry
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

On Tue, 8 Apr 2025 at 00:39, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> commit 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs") adds
> "eld#%d" entry for sound proc. It is using DAI ID. But it is possible to
> have duplicate DAI ID on same Sound Card. In such case, we will get below
> error. To avoid duplicate entry name, use RTD ID instead of DAI ID.
>
>         proc_dir_entry 'card0/eld#0' already registered
>         WARNING: CPU: 3 PID: 74 at fs/proc/generic.c:377 proc_register+0x11c/0x1a4
>         Modules linked in:
>         CPU: 3 UID: 0 PID: 74 Comm: kworker/u33:5 Not tainted 6.14.0-rc1-next-20250206-arm64-renesas #174
>         Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
>         Workqueue: events_unbound deferred_probe_work_func
>         pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>         pc : proc_register+0x11c/0x1a4
>         ata1: SATA link down (SStatus 0 SControl 300)
>         lr : proc_register+0x11c/0x1a4
>         sp : ffff8000847db880
>         x29: ffff8000847db880 x28: 0000000000000000 x27: ffff0004c3403c98
>         x26: 0000000000000005 x25: ffff0004c14b03e4 x24: 0000000000000005
>         x23: ffff0004c361adb8 x22: ffff800082f24860 x21: ffff0004c361ad00
>         x20: ffff0004c14b0300 x19: ffff0004c14b02c0 x18: 00000000ffffffff
>         x17: 0000000000000000 x16: 00400034b5503510 x15: ffff8001047db447
>         x14: 0000000000000000 x13: 6465726574736967 x12: ffff800082e66d30
>         x11: 000000000000028e x10: ffff800082e66d30 x9 : 00000000ffffefff
>         x8 : ffff800082ebed30 x7 : 0000000000017fe8 x6 : 0000000000000000
>         x5 : 80000000fffff000 x4 : 0000000000000000 x3 : 0000000000000000
>         x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0004c15b3600
>         Call trace:
>          proc_register+0x11c/0x1a4 (P)
>          proc_create_data+0x3c/0x60
>          snd_info_register+0xd0/0x130
>          snd_info_register+0x30/0x130
>          snd_info_card_register+0x1c/0xbc
>          snd_card_register+0x194/0x1ec
>          snd_soc_bind_card+0x7f8/0xad0
>          snd_soc_register_card+0xe8/0xfc
>          devm_snd_soc_register_card+0x48/0x98
>          audio_graph_parse_of+0x1c4/0x1f8
>          graph_probe+0x6c/0x80
>         ...
>
> Fixes: 0ecd24a6d8b2 ("ASoC: hdmi-codec: dump ELD through procfs")
> Reported-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Tested-by: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>
> Acked-by: Mark Brown <broonie@kernel.org>

Thanks, this fixes the issue!
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
