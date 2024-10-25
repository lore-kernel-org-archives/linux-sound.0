Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF31D4351
	for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729847776; cv=none; b=oBbuX3mRWiev9Xh0JvSYjbUgU1k1XMHyZ9b/cw1Ai8hhSBi3OYiadO+wge1evMuD1RgRvS5paDnIgDAU3kmFZm5i2YQDW+Y5XDanOXiiGrDl6sE+fb/2fSp1CcD8aQ4zYmk4A2yV2TeO09bfGSMJzjb2Z+so3mVA4rOIdjx7TwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729847776; c=relaxed/simple;
	bh=DPZs3igSgz6yhSw0VZANnMPX7QaLis5BdM9OhTAS0YM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRrJXUWdrotWMxO8PWsvBjZtXbr7gbtPvzfNgMpUSHCcsTFGpWiG2M7igUTDCYEkHQ209+277rEduKKy1uhf0ReWJ9DTN2I5epyIeVO0TczNiTAlo3OeHZngjJS6RlPwovhH8Xh5KimVsYQMjwE13Dm4bZt78/F4bf9ZaLzH2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbg8wmzN; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbg8wmzN"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-83abe7fc77eso70008839f.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Oct 2024 02:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729847774; x=1730452574; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8flAxra3+P7K6+RZ0ebcfvMkq5QaSRY2GhAhPUWZx8Y=;
        b=Nbg8wmzNveNIENF2Ex80VSWiTS0tfSpYBK/nnlGDcEo5ZMbL21OhN2HJgydKt9HYfX
         6R/eZPfvzqtTnaMtH1cOMnQwzeXWhHT4i7WG8TNgt+7ijUjnx0N4lq9nX9PI1nbINcab
         +Z6+cg6AZ/jiouubnHcJ/Kze28gKf8WzbhuV12+K95DglrrcFf4dfkrAvs91iWz0w7jU
         ebwq5SFMHLv8sx7e9jqL92SY10gn54gsaJBp7K7d5yMMoDk4tGwRQvml7o1U5Ny/r4Df
         Hv2DKeS5hl/35Yw9GXylhTvf8WjtG29k7u3L4EdkKDc9RTxodcheKzjW21ZOPfplwXIP
         jp1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729847774; x=1730452574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8flAxra3+P7K6+RZ0ebcfvMkq5QaSRY2GhAhPUWZx8Y=;
        b=mvimR8L2ptfj4m031kDWL6uYkdLNI+0+xitcfrq2fkwnR+S8rFhDLLKjUalGJMHLDZ
         gvCPLasGokJc1zJ9LBc3O6FcUHE6EWXXGEm0Fifa9w+yjUBmLp00LYhFKXhcRYG2U8nQ
         iSwEF0VvXwJh6uiMcrziAa/i73F2n466O2Wy3R5EuhSNGKVvyC6CuRcklrc6/uvOCKx+
         I4e6P6vMBk/HQhl1MBeHZBdhkstNsCzci+LcMLlF2rYHm2RLdg94gC9ts3HcHK7a1e54
         kdDNT/8ajUJ2EQC/4Dzo80Cqc7+2hGLfTESBUGT6yeL15eEv3zjxr20We8dMjqRpU3Xg
         QZFg==
X-Forwarded-Encrypted: i=1; AJvYcCX/DiAhCVWH5RC4q7KTrlB5pZ6PZomePKQ5h2QYTfPpCsKqhr+0WELj4/HqZwO2QxZ3GNZEB4HGqqM8eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyotSTsBB2wVjZKM/d+nn5bynL75L6VZI6MlyXdZWhuhkFtD8gy
	vz3RqcYHoFZksdHmYWaOdgFlC+Qv/5Lyk1YhEIiL7yKDbhpCCkhWVK1RbMvkRof6rxSqCQoB7o6
	jrkgkBUAwTq3MJisuFjmvhf/igA0=
X-Google-Smtp-Source: AGHT+IHBxKxgxZk5xiUkPcD3VH9py8TFOAjCNoPJ3MNHu8oVqzQNbwe6vLL4tDj1Jnq9leAuBDvhft/qJuAkXpVmpeI=
X-Received: by 2002:a05:6e02:1c8f:b0:3a0:8d60:8ba4 with SMTP id
 e9e14a558f8ab-3a4de80d060mr54678015ab.16.1729847773864; Fri, 25 Oct 2024
 02:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241002093904.1809799-1-perex@perex.cz> <87seso2pgm.wl-tiwai@suse.de>
 <875xpgtv9o.wl-tiwai@suse.de>
In-Reply-To: <875xpgtv9o.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 25 Oct 2024 17:15:58 +0800
Message-ID: <CAA+D8AN+x72+898v+VuLqwxT5Vh3KVBabkuArH6Cs49w-ZDs8g@mail.gmail.com>
Subject: Re: [PATCH v6] ALSA: compress_offload: introduce accel operation mode
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Linux Sound ML <linux-sound@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 4:56=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 22 Oct 2024 16:15:53 +0200,
> Takashi Iwai wrote:
> >
> > On Wed, 02 Oct 2024 11:39:04 +0200,
> > Jaroslav Kysela wrote:
> > >
> > > There is a requirement to expose the audio hardware that accelerates =
various
> > > tasks for user space such as sample rate converters, compressed
> > > stream decoders, etc.
> > >
> > > This is description for the API extension for the compress ALSA API w=
hich
> > > is able to handle "tasks" that are not bound to real-time operations
> > > and allows for the serialization of operations.
> > >
> > > For details, refer to "compress-accel.rst" document.
> > >
> > > Cc: Mark Brown <broonie@kernel.org>
> > > Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> > > Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> > > Cc: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com=
>
> > > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
> > > Cc: Vinod Koul <vkoul@kernel.org>
> > > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> >
> > Are there any objections to this extension?
> > Otherwise I'd like to pick up for 6.13.
>
> Now the patch got merged to for-next branch for 6.13.
>
> I opened a topic branch "topic/compress-accel" that is cleanly based
> on 6.12-rc4.  The further development can be based on this one.
>

Should I send v5 to drop this commit from my v4 series?
[PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC

Best regards
Shengjiu Wang
>
> thanks,
>
> Takashi
