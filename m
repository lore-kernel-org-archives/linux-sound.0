Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA5732470E
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 07:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184372; cv=pass; b=cboZe4qREOUwt+8b1mxpPrJ++MX655nHpdDICsBGt7StOmJDe5+kmFdszM9lRQSvEn69U7yXJJZ4xkvpkebpfWUeXSZULdpB5obcMAgxh5XOgCALI3y1E1H4CHJYA7jCGS049Kucz7vA9dvMmhMlYp0XdvjHaF/9yitPA1TCYC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184372; c=relaxed/simple;
	bh=0gAlBEipPZBKRrUqwm974maAwlf7zgpPnUeo7CeAfKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIbRfeFnT0nNUWKlhduTVEPcKXQ3J8K7n5FuFCR3v2ZDBRPFLz96izSzvs/3WYkrmLAD8iL2JJZwSyRMxf9MZm235QQnyq/eeRhA0dPOdSo+YWpJbtgA7NtvIm2TzLSo82N/2SET47bvscz1QVnnahj329sm6wHqhWCy2e0u9d4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRgVPPQU; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRgVPPQU"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc73a80ede5so428103a12.1
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 00:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791184371; cv=none;
        d=google.com; s=arc-20260327;
        b=jQ6hBXwaB527Sx50biCoDkeKTFASaJMZFRninb8EH501J4Eb8iPIcFg3sTXeuT7pfC
         n2Qi6lARtSTd+Ht3oUNtgd338WPMofiHCzcrDDAQoRpjL8qPX/xmQo/qmPEHp3uuWQVr
         TAdXI2WRW4aTgWEQzl+sX8I3nuiiUx4oMvOxbttLTkjEKuV7VG0zGduk28KBFLkU5SHB
         lEYB7qT8hGuhIIUxFfmS0bYwTVPw5ybrX78GKSPPpOOA1/3OxYtok/rNcn2FuGf5AWbT
         PUtCtf7Pu+8qlFBs9hoFomYsIJElyiSxOcc01UaPrRuJmeeGl5Y2eGMVRrA3LZIsb+1E
         /ZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        fh=Gm7VAe0xCiF71NSK35UzIOETPN9tZmZARE8nuV+raXw=;
        b=U27CzyJ94vDZuLdvt3gkhfxHAVWFK/VPPWjRF0iVXExc3w+0gCYTNhuorNRZ7o0xlq
         03LV71wsyGyvfaOECVr2EV2HXytoRiO2kkRjJJnTLhf4hJrtTIwbEbsr1byeZ4Jqjp0O
         QjF67UYiC3ZGLo8OSPWExOufn3mwqeN/BKQjfoqRlfzdYjbIr4H+NiBE4rDGw2ZngUXH
         JtxYQLxOYiM1TdA2kWIrm1u+HVkVIIV/M1oDJsDkVGP5T1NrSLwaTZ/5gid9g0qenCAz
         e0Caxs69PyC7J6wKhnDsDKbwOhK/RxCNyxfRqAG5S2UIdfueiPw9XVJ0l9Qo/oyl6TgU
         EQDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791184371; x=1791789171; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=MRgVPPQUa/00pwkNZJyU+AC/pFVmcKWX68kYKkS/iN0/LnuNqwy+LC4ke5pxjknVzr
         mhkqSnKzfkMytUJ/jyr5bKFmjrX+7qN4RJwVeOrZiXA8Aoh/B2IHHOsjdwrMRJVfUNOj
         Nx8hJy3cOJSY4jNS0uMSHLH78OUNThJZt8sL9zwvytJW5WIbzURG542OwuAbshWT3qEw
         Xu8witYY2zBkl+zlIDsiRtr0ExXzXPwDkLDOGQpwt6nnurw3TFpAwicY7n/4pvsHreEc
         R5pgCExqcEHUTe9f0mo/O6p0U/dLDWqR12dGxk9Q4N/WRM+cMLNTp51M3V3RN4T3omDi
         MMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184371; x=1791789171;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OpaxwB2ZrsJszCEJA0sJve13Y/99r5lc2MZ3LWkGqeM=;
        b=m7fhVrdcpjkpb2L1UY22CT3kZw8m5dzU0w0bG54HGMGeEo62D4CmE2D8GZD6xFX5zX
         iMKjQ0k7u7xsXxXT+mATZ7BtoWC50HSRJu6FwgHhO2nNiJGKz6UImmqchfeVmjYmrFQA
         s0/aC7nlkN62o71J8d+SwZyzWVb2Fn2aiFIdJVSUYYOTHt/i//msJT5b7xw/vmHI3mCy
         vRpB0g1SnIIb7mchTn5wNUGmzQ7K76X8/MbuXsiAF8DNtK6fD1r8TP5p8+h9rIelbaRa
         1IoFdOTmFvfZebCEz/HjVh7QYKIo8qVOqgO7jaruFsGOJzc1/x9SzRX+MYUwizdULS2a
         hYFg==
X-Forwarded-Encrypted: i=1; AKwUvBx6/rdQMj3eWB+BSCzYzz2lc+NOP96doAH7Ml9nkGRvOkIew6+L+GMEIxMHLrLUSmfqtHwi5Qf/HnJ0cw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKy3zLe9x2ZyJLR/mL/4eGo+v2FV+E5uljeb2rm/VoIVL2lB3S7
	05bPn5Mix7SkbQ8C1LZDH7orBxPm687XaJCSaCuphwI62YgZALnN797drrOM2RR1IvliAf4izdu
	ckYYMksaUn2+lwEuxapyUoh06dCjEiPM=
X-Gm-Gg: AYBFou3qNuGrnnd99Bi5Vp+10eYKwcsp7BZY297j817ue8Cy8ZmBNWQyK23j2UAdWes
	098KoR07CGVuCQkFMAdeItuMXZ5IJPqcg13/LQxIKQuOSQ4l/Dmi7clgI0bGQtdF+8akZgdAADp
	Wu2xZ7DElKzQwDXHXrOGfOyl6r+kRtHiyHTjYdMgJRPHzvxw36Jm7xP3FrnIV3IEAgOc1EDEs1h
	2+VIoYZ9tVoMwZ16S2qRf0Pq2myj0+9SIXVQAt99gHLSp7gHkYfpEwLEsyQL4ErRBPnKphKBpSp
	Y2b9KhJ2jZl4rwRXe8rxze3ENtLlPqgbP4g12gWAPc/MX9at3pApe77deJ7EeoVAH2NLI8KAv97
	/+0bjS47qzEGlkNXny7kmRlAfZo/VVrvnUrdelX3ugawMYYQRSLtykO9FBiQyJFnskwC+Q6xnCa
	EDAw==
X-Received: by 2002:a17:90b:514e:b0:3a8:10e2:ad05 with SMTP id
 98e67ed59e1d1-3a810e2d610mr1367843a91.50.1791184370925; Mon, 05 Oct 2026
 00:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
In-Reply-To: <asKt42FgsbhSbQUP@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 14:12:38 +0700
X-Gm-Features: AclHuK-Et_fC8GWEQTaTqwFWDt-VY_3yjba5DhCZkN25S8jgTJ6mltQqi4wer9o
Message-ID: <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Thank you for your review.

> > +     ret = snd_pcm_hw_constraint_step(runtime, 0,
> > +                                      SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
> > +                                      MT8195_MEMIF_BUFFER_BYTES_ALIGN);
> > +     if (ret)
> > +             goto err_fe_shutdow;
>
> This will return 1 if a new constraint is installed which is not a
> failure.

Do you mean snd_pcm_hw_constraint_integer() rather than
snd_pcm_hw_constraint_step()?

snd_pcm_hw_constraint_step() returns zero on success or a negative
error code on failure,
so it does not return 1 when a new constraint is installed.

snd_pcm_hw_constraint_integer() is also called from
mtk_afe_fe_startup(), and it can
return a positive value when the interval is changed, zero when it is
unchanged,
or a negative error code on failure.

I will change the caller to check for a negative return value:

-------------------------------------------------------
ret = mtk_afe_fe_startup(substream, dai);
if (ret < 0)
        goto err_clk_unprepare;
-------------------------------------------------------

Best regards,
Phuc
