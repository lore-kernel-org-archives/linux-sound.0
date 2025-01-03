Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347019DF99;
	Fri,  3 Jan 2025 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735927842; cv=none; b=kkJ9tUuyov0IGq5OkADvKRohi1aAhoyxEVby7ua5drmFjNEt0pRzqiUrH0zrAfHJtVTHbGztG+gIjDAW5bGGMgFdj8Y1SWGAkc/WpI6J4H2kCS9zob0OPlUcQednATAEzCzHxopwPO8PtCx0PnSkI4dvibrNxNCNoPpOPhLA3Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735927842; c=relaxed/simple;
	bh=mmrrW0UtdJavzimPcQtqWi6jHdIVJcF63/YTt2D9FdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JifUSQwSxNotlAOMsxZJf/aFpjvjwTQqIL55p6xQ+oYP5j1izJKmzAZyNG6yaKO2ikwXlof+u/Ld+I09VGFhJXRrf+EyNa5yYccaqf5c9c5OfVEpfvvZGZ9hWI/BSFWayvlYouaPr6xSuo3RokkFlxQchFHE07KKpKUsV8CF2SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dETi0LjZ; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dETi0LjZ"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so149895591fa.1;
        Fri, 03 Jan 2025 10:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735927838; x=1736532638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLFXk7CWm5CeFH4CJ2BryxK1xJTQRRhZZ2zbXcYmJ+U=;
        b=dETi0LjZmiglgmy3oJ34LXSG45mCPAZiF095bxXl6gsvm4kDxHFgDcyQ6iT0/3vj6h
         dAp9EXIcq81xF6LMVl9d3R+qT0jl5jOxB5RCnFd0NvBa8/traICjgdRzi8RdUwYTOzUp
         57vgzrTU8XjFgH5jjatcpXEoSrpu+eC2rf+dr7p4bRai4tFsIXonsU/wNnKYd1/5qjPT
         UZiBAvEC/jGrwbH9u6y/okBYRcPEHJz9qCHkAtJN8WP2LaxdDR4PZzBAlvuupogKt/Gt
         5kNBp4/EXYB7OVREUi9WC+eGyQ3Dq9TIgtRx3RWXQyLZkvIVJh4p3Es6fpFojPS2kbJ3
         NMGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735927838; x=1736532638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLFXk7CWm5CeFH4CJ2BryxK1xJTQRRhZZ2zbXcYmJ+U=;
        b=jdD+c7cg8VL5KtHc5bnEtwQxOpenHceh8ER41W9wEA6rBJ0j8e+WD287bOlIGfxGiM
         z87T6AafxDilOZFmGGRwnb11GT6aEFzU/txzZwGYoNMv2q3B8RSphf4cvOf8CAjftwuq
         BDZ088AwTlYg+OTGYvkI/EDe13Dxcv1pHvfVL555RO+ZS+uhXDNbQwiAVN2TWvkYez1O
         k4yCoI1ZpyWH86/rndo++36vQB7fmV3pPI8f6pqxPQ9mtCDjftlb3VtkKcv+EJ1Dcg0I
         2Qh+AaD3unhkhch4D0NCVTJva5qiPG3YGkSYFkn/JoNcMn7l43SFU7seVym71BBFk9KA
         M/Ow==
X-Forwarded-Encrypted: i=1; AJvYcCU5tyAmw8mATX1aGavbNqUMym2blh6mtO7RRQKeQkJAuAK9cOL1eXw2zuxTT2Bui5BMglLczx5GB54=@vger.kernel.org, AJvYcCUzm1JCzXy7iXacOrEpepWBXjG8CD/SgrzuCFYYz7bkwfuBrMVMrmUH8IuXQuOo7cz7v6viWei/6pmUBgc=@vger.kernel.org, AJvYcCVg9lrxonLEaFRCA12l8C4U6zB+ku6EJ4tECbWRODHqHMhOlKGB53tFDal3tZHW06g88Ea2sWANKBJh8CTk@vger.kernel.org
X-Gm-Message-State: AOJu0YyHcFeWQelOxIIFpCoL/tWTF31U09cMXDxPVwXXwfD3vdPHT97Z
	UZFKwcG9F0bOOU9bANl0ktzCwNuAHbTtz2HBZoLVGkPbsmksQ64Jj6E0sf5ENZuX7Hgfs3SsbbQ
	P8dWitzthwUzXorYX1q3tExMD2ly4P0Nunvg=
X-Gm-Gg: ASbGncspilF1lMHgFOgU/8T/nfy8GcIQ5lm0JQv15i6vAf0bfASss3nQ9MohOGjeU8u
	MU7HYjVHDHkEBk5I1V3HvtqF7dNXteW5W8PdRJrk=
X-Google-Smtp-Source: AGHT+IFWB0pf3RNhbDSkJ1fxYvPGGkjKobJWdHaRXiVCDt+UPZlvcGOCVBspY7jwA+/Y5UlMs0Jq6yA/1+HSppU8JaU=
X-Received: by 2002:a2e:a581:0:b0:300:de99:fcd9 with SMTP id
 38308e7fff4ca-304685f75f5mr173131361fa.29.1735927836597; Fri, 03 Jan 2025
 10:10:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241207193441.15767-1-yesanishhere@gmail.com>
 <Z1ggwXLAu+/Y817c@opensource.cirrus.com> <CABCoZhA1g4McaLtsQqZv=Y1UrEg4kmyMVjdJJTfDow0ho-WdCA@mail.gmail.com>
In-Reply-To: <CABCoZhA1g4McaLtsQqZv=Y1UrEg4kmyMVjdJJTfDow0ho-WdCA@mail.gmail.com>
From: anish kumar <yesanishhere@gmail.com>
Date: Fri, 3 Jan 2025 10:10:25 -0800
Message-ID: <CABCoZhAqhUxJSrELx1if1QYQK0wt_wrHMVcPwVbkRoqmHA2==A@mail.gmail.com>
Subject: Re: [PATCH V5] Docs/sound: Update codec-to-codec documentation
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	corbet@lwn.net, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 12, 2024 at 1:35=E2=80=AFPM anish kumar <yesanishhere@gmail.com=
> wrote:
>
> On Tue, Dec 10, 2024 at 3:06=E2=80=AFAM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> >
> > On Sat, Dec 07, 2024 at 11:34:41AM -0800, anish kumar wrote:
> > > +Boot-up logs will display message similar to:
> > > +
> > > +.. code-block:: text
> > > +
> > > +   ASoC: registered pcm #0 codec2codec(Playback Codec)
> > > +
> > > +To trigger this DAI link, a control interface is established by the
> > > +DAPM core during internal DAI creation. This interface links to
> > > +the ``snd_soc_dai_link_event`` function, which is invoked when a
> > > +path connects in the DAPM core. A mixer must be created to trigger
> > > +the connection, prompting the DAPM core to evaluate path
> > > +connections and call the ``snd_soc_dai_link_event`` callback with
> > > +SND_SOC_DAPM_*_PMU and SND_SOC_DAPM_*_PMD events.
> > > +
> >
> > I am still not really following this, what are we trying to
> > convey in this paragraph?
> >
> > What do we mean by a "control interface" here, is that referring
> > to the kcontrol that is created to select the rate in the case
> > of multiple rates? Or is it simply refering to the fact we call
> > snd_soc_dapm_new_control_unlocked? But really that function is
> > adding widgets, as I noted in my last email.
>
> I mean snd_soc_dapm_new_control_unlocked gets called to
> create the widget which gets triggered as part of DAPM path
> enablement.
>
> >
> > Also what do we mean by a "A mixer must be created", I am not
> > aware of any requirement for a mixer? The DAI link needs to be on
> > a valid DAPM path, but I don't see any requirements other than
> > that.
>
> In my case, I was implementing a mixer widget that users could
> trigger to enable the entire DAPM path. However, I believe it's
> sufficient to simply state that there should be a mechanism to
> trigger the codec-to-codec widget, enabling the full DAPM path.
> >
> > Thanks,
> > Charles
Could you please confirm if this explanation is clear? If so,
I will proceed with submitting another revision of the patch.
