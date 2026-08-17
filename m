Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECAC41D205
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970427; cv=pass; b=QGn44k7v9VppxWqLw8ff6CH98hTDFo1kQLN0+nv1VwaDGsS8c+SFjWsrzs5Q0MqhHmpHUzLsfRbPFPb87fDDggn+nDZQHcL1oCL8rSLkawukq5ZSyH1//tJAUz1wd8QEd7XHMXzmj3yUhxQdkN1hri5w9EFcKvV2McUealEwuKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970427; c=relaxed/simple;
	bh=ga5KGyGu15o7XHyaaccHPzu88D3oZ51NGeguwUoAA1k=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFEx67Y+kd2RCzQ51NS8Tk9EM1L5He+Q+NHMQIebhM9jQEZA1Mx/akyqL/jTEpr6PwwNV5iBGkndjKbk88IhWMrimh207OVAMNT0+HrBtEANiMyDLHH5NAiprrNytFRz5h8HVI+soMB/ECjZO1Ya3gFacgOxmuO8SkpGIMn4R7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdAb6i68; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdAb6i68"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66c711b7f2aso4878956d50.3
        for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 05:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786970425; cv=none;
        d=google.com; s=arc-20260327;
        b=T0pYyj4/IsGFF1mLIoJXzXdo8Rcto6vqBS53azSHv1IpLEQxjz2TN2Fotj8pi8EYTC
         r9zA2nlAIQfmDSqDTrLg1+TqmI8+V72aNFBKjWA4iaNmEWP/+ZDDBkadcQCjd0KrFQ9h
         H+EUYoShSTgFy7WQSElT7eu+KKyGlmkq8lJHYOoY35Wvyb4A5oz0wko/uamQHwmGCrHj
         EC8qSk4H0gab0UZSDO5rb9upcKup+syhlk5zASuyhwgHQofpkdXFQ7mqQrbt65kGzQEt
         2eltx8GpRsn9moumzkFxmm07JuKZbQBi6b4yiCG2stOjKC3+xnhCa8wGrsypR/Fo2WAF
         Am7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=ga5KGyGu15o7XHyaaccHPzu88D3oZ51NGeguwUoAA1k=;
        fh=qBjqsN0qWI+9ijudcPog1Wf0caLvVzGYZKzcqhtpDSs=;
        b=WgDRpBGfckbs4gIIraHTPD1s/yi8t+pOxYvoeuTadKAvWrgUrBt4NqCBvuqqjXdhyq
         9WsuGEfbsHp0t0DJ0rpbrIb9g/U4CzG0E+cxFRPu2LCDE4+rU8p7E5lWZOmoAdQ0WyXY
         IeWV0FpLhq+1BFSV00G1IheQe0TwznGM28pX+TMLuy642vepaeA66WLfR0uL5V6Ltsi/
         Nc1clto18wxYnlfNwmrDyT6z8F154FTWVbvpCYz/hBbADM9Nr7u+aGG6Zm8ovcaYoZTP
         Z+D1SIl9YfUt1mmDOkjsOlDYp/sj7QAAIbI3BOi/pOn+Crj+i2vfctd9+RFVyZbNnmby
         e4xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786970425; x=1787575225; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ga5KGyGu15o7XHyaaccHPzu88D3oZ51NGeguwUoAA1k=;
        b=GdAb6i68VSYFc0w4z7RkNMAlYV5HVmonQ5tmjI2iwXBQP97G/Uv5M3sK6JNlkku4eu
         5q2f//5+O1D6aInrn46MbLX65u928b/hUapZ8nvk+88m38jjpVYG03imsGQxPvLdZQMI
         in1nxeNvH2QaFm3zhhiHxQwC/O042ljYVKzsHIr2TurZA0dbRD6i5ZJzZW3+n5K9Sb9E
         xda3ayvtEyjSk3gsqxZ44SpvcXaulsF7rcvjDB9y1nSr4ERg1r2538hqUEZggwJZNjbE
         uc0cm15CUK3oAL4xKyGDurXQRZbqLF790gQWvoItl1ZvQ+qkdN4luMi85ljT6skUzjo2
         pobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786970425; x=1787575225;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ga5KGyGu15o7XHyaaccHPzu88D3oZ51NGeguwUoAA1k=;
        b=gAkE2H8/f230l+TL742uEhWrKNooR7b/+Z7E3LN5UqbOty+SEwtu8HpYqpWsvUzuhy
         R/xsSgX4ba49ld08Lbh1nAqJUJ80YmUd+hEV2iIIgzkDYgeltlsD8JhCh/0HTIE3yBp5
         XGW8lU4hgnKyBmQriBAv3Fz5/szTBwO9kpPFnnarGB45oz7czB1iJCPCQA87pvxT4D+d
         uh9Dv+oNloC1E6RewM3dHIRJK410eYknRyaBB8ZSTESt+Dfn0Z2Vuye1gpLGOxsYvcmM
         XjMm6dgTJ1wBHCzPE/xLQw2s3U/O0FGDf1fiFsHmt6FdEP6LRszN4W8y4IiOtnhu96D9
         ei5w==
X-Forwarded-Encrypted: i=1; AHgh+RrgwENp0H2gZrLyJeO0bxuEl+thbFYb9paFxikpyilpogdJWZB/RtmYjzFQo3PSw+ceO0VtRuga6I+V9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0bRTJZ1qKhv292lYbesAirGn30aqGkCfXsGnLhEve9eF5PGOF
	2wkJMVCO6nu0YIfAIEDUuZG4Q1MyRxOykIpFAH4LxwEjIrQSBzWnNPlpuW2PNfArnJAZw//rA9H
	mxkq3WGEE8n2ZsqjN/zQObvlFCmUlprc=
X-Gm-Gg: AR+sD10HbljUx7O63rezWRsExEEuKiGzb0p4FyothDqHY18gIy0LAKtWRHSA9oTxckj
	gVAKh/fQzELuCYFvRWaxzJWli73RSTGs0F+Ac0L4xFpWw3CiFIZMBUngHH+MaG42GS8h1lxM29U
	HnnRwVU0aE6QODy/0aN4ynHEsRfGQqbziooS4MCpN6hY7YZ+ROnozMWHpq7T13VB9Bf6nQcGKDW
	Iw4hJ04NhkHUEX5bd+3c0XbHIOPmLEgPp8nREHslCGyLIpfRHxoIDACMu8neRetLeH5ymEkhgQ3
	ZHcvjPn0KVx+nKjvEbx/5qZ7Boi26sn8rBMNqaHJ8qsQuecIJRva5Qb53LQurZIxGa0tC2W21Th
	kwEbzgJZgcP2skrsngfWHasyAOdRDDT+pOWrgw/DgEnbH
X-Received: by 2002:a05:690e:406:b0:667:ba5f:e326 with SMTP id
 956f58d0204a3-66cb9ea72e6mr53659d50.38.1786970425296; Mon, 17 Aug 2026
 05:40:25 -0700 (PDT)
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 07:40:24 -0500
Received: from 595171893313 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Aug 2026 07:40:24 -0500
From: Gemayel Lira <gemayellira@gmail.com>
In-Reply-To: <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
References: <CAD96ZT+SnRnGr4Xd+NJkkVNpj8XrzL3Ete=pRgz05mqxAzbU2w@mail.gmail.com>
 <178683053096.110591.14424183767747622650@gmail.com> <000301dd2e36$f0cc5ea0$d2651be0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Aug 2026 07:40:24 -0500
X-Gm-Features: AcwNN1VMjJIKO_UGNk4KhjJd_ZRYdUgtnYv9wV6a2Ak7CubS90k4IUJq2E9cHbQ
Message-ID: <CAD96ZTJFVXau-4o7gs=LbKzF3UKduzenqhV1Pv6Tnjf3KwCvZA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: cs35l41: Enable VSPK on UX3405CA when ACPI
 leaves GPIO1 unused
To: Stefan Binding <sbinding@opensource.cirrus.com>, linux-sound@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026, Stefan Binding wrote:
> Please create a bugzilla ticket at the below address and CC Cirrus
> Patches (patches@opensource.cirrus.com) to it
> Please attach an acpi dump and dmesg of the issue to the ticket.

https://bugzilla.kernel.org/show_bug.cgi?id=221896

Thanks,
Gemayel Lira
