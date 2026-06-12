Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195C30566C
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256473; cv=none; b=RRubWa5yPSTg8mmp9A8SsAqUHb5h6ALckMb4mmGnAskXbuNXFMS9rWuLrCD/JX44ZW7S4z2jOKOmSkS8tPdTasKKZXwvF5V6HzHHvPGedWYlc8p+aaTZBrYSJXLU/VN2k0CAWdW/DvWXpYn6GXBOaq1Au6dca2rID8dnn2KhBIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256473; c=relaxed/simple;
	bh=rw8Tvs+tqVHlE1yz/4QqXObm6oY6UdP3I1/O30mTwAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7ykcSJfD3han/82mvJzfeRcjqHfGdUG6whiJ6gWjno0r/hd19TxbTKAcjo4FB0g9LbuGujLkg95sGcedOVuKBnOxvuw3SuMio6jg+a5TjByWQKVJOMQnVQDh/GCcrS+VphntiFhQYkn7IKuCf6WrGogDvn5UxX/jCPapsS34U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59e8ededf4dso374371e0c.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 02:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256471; x=1781861271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSZwYOeTmzPIFgGHYKIxzTEqMNY8O4D81LGf3X98Xhg=;
        b=k7M1IOWpdFdfD9B+rXX3CROq3De03jLS7NxovVmOowod3XtklOQVnxx5YR07/RYQuM
         enbQ3TXHBo96oRKKYG8PAeh7GJYE4vDl+FdAWwZ5nDJ88UJS6UBes3LXtVHWQXiOXSOb
         ISNjN2DCByEHJKcVVP048WE6Deh7MWPJidEXwZPj6OUyZOMyndTvsGcBmWV7lV0Kmrll
         Cvm6YbpbcmkE7idZLkeFkMEY7/zKHVhs0shZHlVFQyrYfrtnPXnGviv9OHM4Fo3Z9OLr
         1/Fw6PGV2qc4OQ0G+Mv4MYMteMPD5rUtV/rk0i09ZTJmHprx3UFifilaajVTH6MATLCW
         QeMg==
X-Forwarded-Encrypted: i=1; AFNElJ+CvCUEoJGWzfxH/B/XZRjQPa3OebCpYB7cEa/qXS6QDDQ6chz9sVxtczjonrzwFC87pJVIt6ydvhbz0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+2qn5fvjjn5cWszwqpshgz6hyxEiorAknU6P1jdmy32JtFLZ
	BjtjKv9KdntOcQieAA+PPA9aBqePlhpJ2cMTEIPzfjb8PyOhVSHIFOmzraGYm06n
X-Gm-Gg: Acq92OEqafGNeLrU2mlWqJEs+5zDOJERUmooTOS6Yk/O4DNbYThixRKBH+Z2F6pp45k
	KI+vvMZ898cuQr32D1Zt8DT+uzeRjYtRcf2V3DlcxVd/E+osli8d5z0ul7HbESg3z7dsqexx1Vd
	MPQku6PRsXsD4KbLrOvw+XmCYGOzaJxQXdtmHnd1MbHMt+Mol855tMAR8IuTZ4z3Gh8UGhksfY7
	wMTZQ32tZuK0W6efpgX/Vkn517m14tPNxDK7BU60vL4/+NOebh3UaAie1C9MjICGJ4vLPQU3tGh
	CWGLi2bz2IvvUn1xMLLCMOQ42RGjqsplhTpUClxgPCyAqL4hmehT3fCJZ5hndehHveqLrUpDS91
	8+TTrExS3K+frEYnUFoY4P1MybPxRYWdeamZeCUf/BiXKE/PCtssSpmDjW5xMyLMTpjTXWOTFOO
	2NsfxrgW/UWV02fg91L4KJatpfd0seLFf+dEKSR0QUx3Hi8ugxUeCmZ3rYpv4/
X-Received: by 2002:a05:6122:a1c:b0:572:353f:be2d with SMTP id 71dfb90a1353d-5bb6c15b161mr778213e0c.13.1781256471473;
        Fri, 12 Jun 2026 02:27:51 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb69225d75sm1836530e0c.14.2026.06.12.02.27.50
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 02:27:50 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9639d7daff3so444943241.1
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 02:27:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8dPOq7PhL/NmtGtWTWlMHXfQuHUq0W2lqDr5SA4QQz7nuNW/sz3bnFlaGVoEr3qW9uihfGSPeFrIepXg==@vger.kernel.org
X-Received: by 2002:a05:6102:1626:b0:610:1c78:9531 with SMTP id
 ada2fe7eead31-71e88dcdcc8mr852032137.24.1781256470532; Fri, 12 Jun 2026
 02:27:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
In-Reply-To: <20260609113836.45079-3-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 11:27:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
X-Gm-Features: AVVi8CfaZvz-9jhnktf26BGxmAFl5Vd7m2Fjtdz0B71l3uBx6X_lEfTe-t2LChA
Message-ID: <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: phucduc.bui@gmail.com
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Phuc,

On Tue, 9 Jun 2026 at 13:39, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Add the SPU bus clock, icka/b functional clocks, and xcka/b external
> clock inputs to the FSI device node.
> This prepares for subsequent driver changes that explicitly manage the
> SPU clock required for FSI register access on the r8a7740.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

I have one more general question.
arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
audio for FSI (fsia_pins), but does not fill in a clock-frequency
in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
the schematics call it FSIACK.
Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
which function is used depends on pin control.  However, the DTS does
not perform any pin configuration for this pin?

Note that I have never tried audio on Armadillo myself.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
