Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A32318139
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 06:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776062733; cv=pass; b=YyfDqppmFRSzoNG471G8H2NaQGbovWq6CCOWGG2a0FjOFaNrRtnfn68okft8/QHvT1Nn6EBdXyYi5TQ6h+iwcKjTXjwJ2tJVqU1KZjhtcts6g/3KlR2ZWuM2kLDR5VXHyTqLvifdnJQG4jxCX549fuWF7S2mIY4RL4/olq/MwK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776062733; c=relaxed/simple;
	bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9KarWo3dWWdmCtvQZ8C0yI+0k9I5ZIFKjQ6/geczn/l7QNx6MFHBXURj9/iaYuCkKuXgT78LeMvwzz6ggGrimCXJ7UUfTu1IiQ4dFJ0b86gZJnA4wIe/8wHl0PtW52zLQN1L9h3z3svz4IkI7eQtKNsMTt9r6Slbux4ut7KWhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BpZWYgsO; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpZWYgsO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b2503753efso34265905ad.0
        for <linux-sound@vger.kernel.org>; Sun, 12 Apr 2026 23:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776062731; cv=none;
        d=google.com; s=arc-20240605;
        b=BT2/brNlxJip+Bjb3N0kccaGH1FP5qdE7eG802nedtjBHdv3+QyoufwfV/XbAu5GZr
         9lV+3rEcr4ZpyzLakorcWAyNOXLseV/HmOLVix3yAUExvfdnRSDOoK3AW/c9W9Pco+nt
         19gvBFLAeFT1CsINW6TS4HO45mLqY3u8IktOzK4xhL17meIy/2wMHDuwWJsywNO76l8h
         URBJQzHuoMZArk/OPeWPsjdM3nsNeuYI3PxkuwGW7sndJuU5srWnxCLOVOf8+Sz2QXQv
         XuHK+ovoa91tAvspb4P2jIsY49e37bAVIl9YfWnQW/Pz3IjTwqXtJzk/mYSZox0kAI4W
         nHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        fh=6N+sRYXsIg+A1E7blGXm9dYRB4hKgnl6w/TSMyoLkOI=;
        b=IVzS2ijbDaNjk5l1aufqjEFot9IrhTCja1NR2NgLF9UxCRfgem/cRAuRZpVPuknUsh
         QSsrwfzFkMTjoBjtRLfp/PagkkAK8VYKRnLHV03ObSRKz/r6M0JNgPXDHbddfLdPd3+C
         Bd9awUMOt0mvAE8DiSvnaAuc4gzSn/XRZeixkUd+iX0FQ0V3aTRGlZt8asLYlqCoSLff
         PCMx+ulURXodsTiLLl8BOaxdRIcBxgUdGoJTt8X+y91RggpTodcyBC/qwzcTYrX2eshU
         wlDJiywrF/8r9kHsthZM+9WWsDWplexWVXoZnuw+GooOd+crgf79Xq3R0hVDaWSObj1G
         +4Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776062731; x=1776667531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        b=BpZWYgsO96LJNmndu4f0MVd0YBZJIqwiSH+2Pb9s1RAWLEITuNvQlb12P6dAvw4ZDW
         da/Pgu0zRn3YRdmc1Bh5MKqQv6+vHngKLFJauIkO9IiO3F4QXNORZnQe03qWs6c33Nh+
         IKW4++5g1rNOnkWEJXS1LThv+hl3EjPh9/5TZYgusNTenlS/Gqllv+Z1TA6AhKQRTbzv
         6pv5T3dnogCfqFheYYQvRYnPgl36N6zNZBcdydqzdMqTr5lPHqfZGGAj8jN48uiBBU17
         E2ogq27adDOjuQ5dvu3A1QzeDm9WS/vvQFBDi7P3vadh20fn7V88VSWU6qAY/qUAc3yz
         jBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062731; x=1776667531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UVrAExvrLmAfu7dTBwM664LDvUTubnQncoUSSl+XOCY=;
        b=T0G6BYZUWJCgO2Re1UepM2q0b7iRZUV3rkBWAlUJF7R0emJbIfXHuIE9eNmlYT7uFZ
         kEJNfpNkJjqrHui3XMR7tsj/ejJwXkL7/UCjcaosetgSEBelAq/qF/Qm4cfELTATCjW9
         6BL1Wh4qgiGUMX8sNvDCUHLSir/QNS1nJ4qv34fMnrwgO98XHRifM9sI3mNVo9sqVTWO
         BBE0EDUwM9YakcRaeu4lmq1XMxQTwScVyeWfZkGdoe0U7pRVRUIwTn79413g6eseiWh1
         tn7s9+UzI5KFXk1SA+fYcFcBtBvJX/fzCx0L4Lm2vUE0LUkXG575NgC8SXOK04KNoO2V
         cFyg==
X-Forwarded-Encrypted: i=1; AFNElJ9TvyJuY/N+4a/Y8JzMiavRbeXEZNAesbwHrnm02jtmN3ElmelSNb7LH/mbfPjeSCrRrCIGOtPKybT5gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxbPzUkxkTvzqsj28IkmCsvhHSZGkOm5X02/Tr5OZG/hNXGwkl
	mEZ9Yd6ZxtgdkT0GmG+z6Ha9yDixNVWFp19n+Qk9nmLHWQ75hbhrY45RD5Uyv2X4HzW+HQZ/mYj
	C6eVNZIZptKYXJyHUrhx0oWBe3cHx+Ys=
X-Gm-Gg: AeBDieu3sjefzON+mCzPghxmLV980cEQIRsLFWijEK/Q0lADKjps9h2NCuSd2kHQkhp
	TceAh0sTj4fqRGNCxDTBDYdRRBV3rRb7bfu6pd0wq+s51NroAA0FhU/dDVSY9XVIJLMrSo1CVoi
	kxem0Er1jyEgmVsHRiTCEaPHPzjhGZbkMqI+gLoB0jspwwjPlEnV/tnbCDlX10uatyTDCzVnUnb
	196uExmSjW5IWLQ0ZuVA5mSq5SY1OdGmfzBUpAKKiP0I1nKfyr4nM+9gsXF2qnwQxfGi06X58Ag
	urFYsHXY0Vgqg6uuwjMHcqQpYpKVHjtHXX47YQ==
X-Received: by 2002:a17:903:238e:b0:2b4:5b9e:2f51 with SMTP id
 d9443c01a7336-2b45b9e3d37mr38238145ad.34.1776062731336; Sun, 12 Apr 2026
 23:45:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403112655.167593-1-phucduc.bui@gmail.com>
 <20260403112655.167593-4-phucduc.bui@gmail.com> <87v7e5t16l.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nGUyTkDmB0SgKAuM1Pp75L=m1q4bLSfhobm98TswDnt8w@mail.gmail.com>
 <87a4vfu0mz.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nH-1eBPFxtzVR6QBE1=esDN8x=hZpAkRSCO-TLmn0tRKA@mail.gmail.com>
 <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fr56vu4f.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Apr 2026 13:45:19 +0700
X-Gm-Features: AQROBzAGIOgvxWW7TC0q36Dvf8NNepmzIwchUGKpVQO1DIYC6Qea_kbbm6ocZUA
Message-ID: <CAABR9nEqJRoHJuaJGqk=ZpCKi0P5p2V9qJKBPsz7ELkGx8e2Fw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: renesas: fsi: Fix hang by enabling SPU clock
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Morimoto-san, Geert,

Thanks for the feedback.

To keep things moving, I will send v2 shortly, focusing on the sequence
reordering and SPU Clock control to fix the system hang, which has been
confirmed to work.
Regarding the fsidiv clock provider, I will prepare it as a separate
patch after
confirmation from Geert, and will consider the appropriate approach for its
implementation.

Best regards,
Phuc

On Wed, Apr 8, 2026 at 1:33=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Bui, Geert
>
> > > Hmm... fsi_dai_trigger() seems strange.
> > > It seems (A) stops clock, and (B) sets register after that.
> > > Is this the reason why you get error ? I think (A) and (B) should be
> > > reversed. The balance between SNDRV_PCM_TRIGGER_START, and with
> > > __fsi_suspend() are also not good.
> > > If so, can you use hw_start/stop() ?
> >
> > Thank you for the guidance. After reordering the sequence and moving th=
e
> > SPU power control to fsi_hw_start/shutdown, the system hang is now reso=
lved.
>
> Nice !
>
> > By the way, I=E2=80=99d like to discuss the fsidiv clock handling.
> > In the legacy implementation, it was handled here:
> > https://elixir.bootlin.com/linux/v7.0-rc7/source/drivers/sh/clk/cpg.c.
> > Currently, this has not been ported to the Common Clock Framework (CCF)=
 for
> > R8A7740, and it resides in a different register range from the core CPG=
.
> > For v2, would you prefer that I implement a small clock provider for
> > fsidiv within
> > the FSI driver, or should it be added under drivers/clk/renesas/?
>
> I think it should be under drivers/clk/renesas, but Geert ?
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
