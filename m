Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EE72D839A
	for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752242312; cv=none; b=HOMTzwXx0eaPyfRFv5h8KOSsMzx/mEYnQaOvHoXwIRqdaNItdab/hoBwgM8azib9dB8Yvj3PZu7uIoozT0Hz4CwrN1a4FCbA5DDQQxzfwpFn304v3xVb/7rjb9zqfFcglvILEKFXPaVkVzkXfQAxotFWBp8TOjaYTsm6ByKmJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752242312; c=relaxed/simple;
	bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QHu3P5nYaHzlNELY+bJxe9hIkMltmfe02gIXpuDHeH46YhIx+X5K6adLz0y381vvIxCycA+xyl05C1OhYbko2aPnaGRBvcKEh38LqFok5p0eOoEoB/gjthOhTvqDL+7tZy8WfKmLQVK7pzIUVXMX+XrmDYvjoEbLdRpSSZuJEl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DOwjTDiV; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DOwjTDiV"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso1905563a12.2
        for <linux-sound@vger.kernel.org>; Fri, 11 Jul 2025 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752242310; x=1752847110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
        b=DOwjTDiV/nNBIE5obEmvtiPRS955V0t1VfTftQX9So+5sPYBiTaYcaSq+zj3bLy6bE
         sFYvscgXurxNNTkDDf332Mr2nk2KHg7XsMGgGKlw4MtHLYMyhJSc77b4ac0+2cuVQuB+
         RkPTB78ukfB1BtwxUtUK1ckCsZeMKm8FLGYX/PSO1aK+/PPnbMZJg0ClQ6qy5qr+8rej
         gvvhs/3dE2YdVRLb4aSssWk2ax6uHd12V4p0pp3PWJOjHvPbBzt78q0TTzazeBlfufyR
         pp2oPCBQWkBgwDDiVVcgimBWrhEM/Yx6LRDddFOZkt6Olj9MaPCcJSeREn499F4wV/KX
         cXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752242310; x=1752847110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pNqonM4UVtrsALbVQxE7BjqrmBap83H9yb8p9qwz7o4=;
        b=ZEjVPNoJXk0XAjKO8oVrqYyZdGTGSPrTEDXmKJHIHGYe8/c6DpvG8ukp7PgxpS/h8y
         q6m8K/N984EOa9MLkq2v8DVWn06UMFDYs0i4Ir4qB1KYBb8ouFoiPFwof1s6W0yUxy6p
         h12NU+Mj5LaOqevfsQ5ouD4ln7D3YkKBmryPANoaVttM4YVqR69wkGOjAkfRSLvyS490
         pPys9WJujXL9IWtU1iQvm59/gXvfSjklLJc2nMi8PEIg5x7eRRbZCsUtDA7DnoJq39L5
         zwNd28yo7KJoXHPFWqyTc4Z4gIZqdcnD4V/yvBfyjduBMzg3GLY1/k1PFQOkedUd9OGk
         QFSA==
X-Forwarded-Encrypted: i=1; AJvYcCWz7esemHwjSl13xSnv2sOALs+LLW4UFz49XVUmMmCpCuQyKW+UClUldqfMG1njQdBpoP3PnEcXwWctkg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8Ns8U3I+lpym6MIPGR0cZO1BBZ7qEHo6mvDdJHycBjG4UALL2
	kukOQJLI3XtrKi8/a89wAbCVkJ7hq776ODVQzGkF0ID640VlrtBzE2JestXlUPqzyC9OmEhm1Oj
	hQWLLJxShmtA91XxPrUF6JDAT7XSxg8UpdFU3CZnw
X-Gm-Gg: ASbGncvaUvA6L0h+XMNvW1JYUUZo8LjGzbgofX8Dy1Q8duS3iysXgYjP9r+8tQjYQhJ
	UUikkNdg+3SP+wY/4h8X0uH1wLVL0l6d/NtmDxl5mrqd2dIjXAECziaulolrxOWIUOkyQZoFLUU
	Fm9WOkdbvhd8Sbo40iz7wVDTx/HmNOdczVBR86nILE2u+HBOsS8d1uPmikhmlh/jhFoRUNUiSUG
	ql82fE0P3Kh9Ah8Vp8u7Wo2kEMb9JUCftRl1uah
X-Google-Smtp-Source: AGHT+IF9vpsS88cqwJvceZ3AVWYOHULHoLV6jnQ0fxFPUTnJrLpeVWrilV12HX6w7fKkYy/KsZQkRWej43wmqe/0mho=
X-Received: by 2002:a17:90b:33c2:b0:313:2754:5910 with SMTP id
 98e67ed59e1d1-31c4cb8aa2dmr5577396a91.15.1752242308018; Fri, 11 Jul 2025
 06:58:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711082441.4193295-1-verhaegen@google.com> <aHEEu1eSSGRhITmW@vaman>
In-Reply-To: <aHEEu1eSSGRhITmW@vaman>
From: George Verhaegen <verhaegen@google.com>
Date: Fri, 11 Jul 2025 14:58:01 +0100
X-Gm-Features: Ac12FXwkr5vfJuzXyUzX28ecPpQ4ARo3qP5rhcHUhMh4j4kcitfjBXfbRa88hKs
Message-ID: <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp API
To: Vinod Koul <vkoul@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Srinivas Kandagatla <srini@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Jul 2025 at 13:34, Vinod Koul <vkoul@kernel.org> wrote:
> In your testing when did you observe the overflow condition?

I observed an overflow after ~3.1 hours.
I used a stream with bitrate =3D 3072 kbps.
So the field copied_total in struct snd_compr_tstamp
overflows after 4294967295=C3=B7(3072000/8)=C3=B760=C3=B760=3D ~3.10689 hou=
rs.

> Please share patches for tinycompress support too, we need those to test
> this

I didn't make changes to tinycompress. The overflow happens in the
kernel file compress_offload.c. As a test, I let it run for more than
3.1 hours and observed that the overflow no longer occurs.
The overflow is in
stream->runtime->total_bytes_transferred =3D tstamp->copied_total
