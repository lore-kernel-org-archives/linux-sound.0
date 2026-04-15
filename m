Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DFA3346AF
	for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 09:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776244870; cv=pass; b=BJmMxwJWtHhLtmWRBuddi+0J14UxRySIkbTM5L1D/X56de2DjO282ntZlVndomlVKsHiLDtmo5TdZy4oPZPx+pBKkPEUvO5GoralLw1yniAUpfRIXuCIh7y6VYs0zH5FJBpFjUEEgdoGeD+nRj/Vb08QsMDqpytxedyW46lJdPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776244870; c=relaxed/simple;
	bh=qXu//z6Xo5LnFnJscSgw4DtwEHHHbw3ufbT2XnJFOVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTX+Rj9JDtpCn28sjvEGbA+0xP4XhzyL7/LHKKC6/yG3mHKLDz1a8qEj4QkeCbDxyls88o/y7vhWsZ9euYdybEcP1e5UmSVM1PFMfVj5qcPzVU8WQNPIs9KHiqSOlO/GuRogi4oog5mhwUXg8QGFIFCZOEf4kTcu/VCe2L6ZGJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtzMfdf2; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtzMfdf2"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ad4d639db3so34053415ad.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Apr 2026 02:21:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776244869; cv=none;
        d=google.com; s=arc-20240605;
        b=a52bU7dL1OZs4nWejjDrwa89Ic62+WkPCHr6vaSt2lwQk63B5FXRs0VBdR+xwntxWo
         NvHR66jl2pFcTIYFkwD4IgF705rV8sQHvGZ8lzTDXeLLjxGxK54GUfpgG+rJmYlJ2hcQ
         bZ7e5YNcPfR4cyORQY0Ph2x3J6THVyhjr2oEUf6/JGRBfJtO/AZFMjDJLpIXWDM+NM9m
         n76LFefI1IRh1v2L5hd6vLecSnLMrZPv5rm8eAai5VSpyjmpY/qDwpD3d2+bKaRr1sjQ
         I/8P8NMlUh485kpEUnYwCd0c//OYo68vmmxsvA4UJyw/CyKYY8FPSjeb6ht2fkaUMC/2
         qjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        fh=Zz7/St+D0P+nPjF47D+L8oigOghLDSsW+NQc9KnnIYY=;
        b=HexKe8LxQWfxrRk0ssRCk6dkT5tSJcYk7Uit8G1tsiBaiaukJEMh3Y7HObS66lYRhR
         PFBvdkyvx9HjYRyYj8zirlWAB5RiGiHxYiGvx8UISlVHmKYPMg4xYET5AZJWqVboRR30
         hyi2RdpofDdOEldCB1HhbY7FZ2AMIzskKzKYtrCokNG+KZITvRp9XdjAxG/fr9QlUV+s
         XuL43WujooiZyGujr6neF0BkAO/i6zhkgUW1I2BFPnXJLnwjJOeWfR3HNcBz+qwU+MJQ
         JIdjwyAm8D95BsI2B8CwhT+17Fu9grUL91hhrNFAOqAxAgZKl1GLLv/7+mdjVtW0vGlz
         PCwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776244869; x=1776849669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        b=MtzMfdf2VAvfDeqNyD5OLJUjMw35uvScAhno0ouNZ7l4zup6rBXOneFGvrckCDgE9M
         Qy0Q5dxCF+Ver4cOPei83bBple1qS6yDiX/Ya9s0N0Uf4xscpTwOkazFgfmqQdlYq8n8
         TVNZZ+2YGSABFm/E2hAjGn9SGBHA5agwWuBaQsg+0p7nMHi7nVoGLK+ixiC3T7s481R7
         htKGMEBqxDdbdHx//YxnmXIuPgNw89eq3fuKcLLDCNjGlZLyRfggIuHRpD0OYWXVgurp
         cgsOOK+cogrVJhMesZA/m2I5KKrUeYCry1aFm9+RCobcHNUaAduu/IBHGNXtj61nFxo4
         6b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776244869; x=1776849669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQY0av5WRVLImZfpNXr1TJM3eiP7oWFORfN6hvmChm4=;
        b=jNKNIIVbNwkkDkwvNtjKkltUFbWihSbWSbyt4cIu9q4PIFlT2D3fVWZ8mw8ZiJ/Z+G
         QZrqBBrVqQgb0x7n3kW8XaSY7TZvkC/IQJWFFlDPMHCDzKjLgN5oR6AKL8XxCO68BXgf
         YsHpH+Cejhjm/urjVW9cAuShQaQ32o1XTLki1qqdGSoOvOhTeiVJKpS5VTYOQPSYxRX6
         DtHLIyLcbIacjl0Y3pGnpxJai+uhjeczG/fgrI3mmNNvNoXQ5BM+sCNqiFkDTMB9BP23
         cBLnxtT71a5lTr7U9hMku+fzatAqr/cTMZDLV6JCTtnPIQx6QpvZyXZOamzzXYhfzDtA
         WMiw==
X-Forwarded-Encrypted: i=1; AFNElJ+fHDe7+byrpeEQPxqGhTmhY6xtH4CS5+IMVPL5t0jR4Z9bycxlReg6S8aPR3QRZ6HygSXpr7z7JahxpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpPXh+A89jGiKhdXpAkMPzzdj6PPbsW83dbat8icUa/wDpb+Gz
	lfw/LsyRqQF6967bF2OKfXywyzsccvfmnbJ1wBrDzmFZ3pCFNSbsYdmdIpXt/M6/dK0KQ9oj7cE
	ecw5brPs0eSnYXxUycSWdgqMa8FtVYAs=
X-Gm-Gg: AeBDietD4qjyswSTD+Ijo1s7DknE+JLQ69neKKTNL6rFDtSTmCSyT/kqB3gy7PVjcs5
	yql9CxU6C2RuhgMFMKTmBzHtsKSzFg1cEVm8LexGBkp1jIXjwDyy1sKGjWnGVb1fmKt5GI7QAyr
	SUaVARPGr8BGvhh6Z4mDvJYqPhhnRAjD9w3thMnI7yjKF58R1FBTmyJJtqhhJynTLa9mos20dpm
	4JCqxayr+imAkAC/o9D2fVh9BdvSzhSJTLcwqIs2pqbq5w0WMInOEVpyAnDdPwY4XIBBzQrerJS
	WpUf3LBMeTPGBl9FsXog1XKXwrIne3jdmnV9URZoZMPP2QMx
X-Received: by 2002:a17:903:144e:b0:2b2:58c7:2ce1 with SMTP id
 d9443c01a7336-2b2d5a7773emr209666405ad.36.1776244868799; Wed, 15 Apr 2026
 02:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 15 Apr 2026 16:20:56 +0700
X-Gm-Features: AQROBzAXSd3qJJschZNpIapnadex0hZxdzsnez-28xKExmnIGX3RLVbWSqVsXBg
Message-ID: <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san,

> This patch should appearing much earlier.
Thanks for your guidance.
I will reorder the patch series to place this fix earlier in the sequence.

Best regards,
Phuc

On Tue, Apr 14, 2026 at 7:28=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi
>
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Reorder calls to execute fsi_stream_stop() before fsi_hw_shutdown().
> > This ensures that all register accesses are completed before the clock =
is
> > disabled, preventing the system hang observed on r8a7740.
> >
> > Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> > ---
>
> This patch should appearing much earlier.
>
> >  sound/soc/renesas/fsi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
> > index 109e06b5f32d..9df3e91ac79c 100644
> > --- a/sound/soc/renesas/fsi.c
> > +++ b/sound/soc/renesas/fsi.c
> > @@ -1606,9 +1606,9 @@ static int fsi_dai_trigger(struct snd_pcm_substre=
am *substream, int cmd,
> >                       ret =3D fsi_stream_transfer(io);
> >               break;
> >       case SNDRV_PCM_TRIGGER_STOP:
> > +             fsi_stream_stop(fsi, io);
> >               if (!ret)
> >                       ret =3D fsi_hw_shutdown(fsi, dai->dev);
> > -             fsi_stream_stop(fsi, io);
> >               fsi_stream_quit(fsi, io);
> >               break;
> >       }
> > --
> > 2.43.0
> >
