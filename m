Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A403033FB
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 06:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787773; cv=pass; b=q2G+XYNadEAmkX1NAj/gun9dK0Qk/r0JbGpBZ3+FG2EhbB9m3t4aBlAdXje2bLLuEsu/cpfKAa4tYLCN0E+LNBhXweH+/10JQSfK71bPz5EI/H8v3oYBxNGWmyErG5OVQssn+duHyjq1J1W92lR7mAE9ccC5hgUsK/l/qB00GFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787773; c=relaxed/simple;
	bh=TfIyohKk0XTeZ5qcNnxmX+B3sZQEP4z3RtyF50kq1r8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aa3r5gaTxbZC8jGQR8weKoKzOYNSmlTc+CbU6Mc/n0JpBqrwS941C2BRXZxzopJWb8Cc+JVE+j8ZGn0LMxphZBfYW/eN+Dc3xvfZ0JOOu9MVwRn+UErkeGJMRy/D2dk4pJd9ULPlNQ/2MUdRvMIqHp/KUn4HHmUY1J7NF6WxHug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP8yGhNu; arc=pass smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP8yGhNu"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8917c712f32so623275b3a.2
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 23:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791787772; cv=none;
        d=google.com; s=arc-20260327;
        b=Jk30hY0npr0PpMUr31e4Bcx5rJwBHlcLL+DFCBlwRFQXop2wSNHEmKwZ6UHiUPrBw5
         I1uRnRBY4fdIFD3KB2vwuGF2zR/KN34uVSweMNwA++eXehqGjoeMKp8wVUd7biAPkeb6
         OCKBOLEbZPlE0jVumrSrH+fzh0krEE4TpHLbChgDhP6NhZZXtL9nncArxbt1IzWqDydk
         fKs2tyLopTUJ+t2R5ZclRRUmiTBi1oM3oHhpohRFg2lQI4xkpJr2nba2xq8ZGdPlgZVP
         pAy9TVRlG/p051Naf61p4BsepiUBMCJK7H5eYf8+3wokAM0+cG2/CSBVNbrgp0RF25qd
         SuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pKGaBssfbVs591S2Q3WkY0U64OVMmVV2L/7skJ0jnBg=;
        fh=Nfl8B8Jmkkd0mpvjcyIZni5vtr6TWXhiImJIcVNToGU=;
        b=bb8lt70PCI0G1LX6xOWZ1eIB0kgg3SBeaxIYmtjj72DhQF/tHQs43RAfDD6noQw6cZ
         PHl68FRYjIl6CfFjR+AbP2x1gqt4z7EQQ0wT7l22o/nAuHrRc0+Ko9MvrysnCQAw8jzQ
         /zChSNYonTltJ6vo9RobQ3v5AfNf4tFTNTsjPkP8N25RWHBlZ6b7wvcMKzlhcIj3D33N
         VgIB4pgchVTHGkU3uA0bT9iKpLCVovoPgMXGahcpgxN+CTC9mxIu3h+pAKY2c3CyOV69
         Eg+qxY8TS7xEBIPWLazdhaBFXT2gs1cFrTVr0v55kp5CuauX96DiPi/HiSyY+h7h/c7r
         1VaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791787772; x=1792392572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKGaBssfbVs591S2Q3WkY0U64OVMmVV2L/7skJ0jnBg=;
        b=ZP8yGhNuKZgCgauojKN/FqY1DZ2H2/Hyy4JHI2cD9dh409WltYUZqq7J+hvCLer2/e
         7aifVbOx6xC4MXWW9q3XlIQLG2Gi8lqsA4M2vxwNQB10nVTF+APRZHs6SkervA1IFMOb
         KG1bzU7Er+I4w7ds5TLWQcyLeVDOMa1BpGagzBHHnPWtdrP0cr32k3j8UyFN3sEUI/ww
         UsyF1t+huPxlwe99q4kW0RXAXh+AF6MGmizFQbo8gFE1b20evuJ5dXpedPFs8LNm7K6k
         Ly46ZCQTNdbnH8/8grQEsl+mkaCx1iUb+4ATqzTx6K4u+6PhvXlyB6W2Tm4BQlSyCoNP
         lU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787772; x=1792392572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKGaBssfbVs591S2Q3WkY0U64OVMmVV2L/7skJ0jnBg=;
        b=K3p8cOfswsWgXYHWA8cgemyqIhuKSbZ86S5T2TzjqwLyEdAiaAvWOjqDjW/Oc2Tj7x
         1QjzOKcAQER8AtzdgFjQ4MwzTz3bZqlpbd2YBMdfNUCGt0Gm2h6a3F6rcT76AzFSeyeh
         INQpJDZilGNmP3C/8LrBlg1Bv7oz5szXZ8QtZN+i11uB7tp8IpYn7B+/QD3LhXOHhG/J
         EHW5GiCnGtk5oTjyvZObPxApAMBEas/OXFvT53fNlWP4l1V2BiTWj2B0mAdBtOYRHmaD
         ineqsnfHwI8C/d63V5rjIqvMCYLdrPKig4yYHUJOzpVGYDG+BuDj2yBHaIq/IZZdxDZz
         Fd8A==
X-Forwarded-Encrypted: i=1; AKwUvBzB50ZXcj6pvz/RMWMP7aUcLC7SqqOvPdIWvTvGjr7iAh7Zz8luniei+fBxd7RtRsEo3WY0bei4gNxCCw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJiQPidCmZw6zQ0I4UAI/obipiRaNVQN+8LhDrJFaxlY44kYU1t
	X3ATVhd3ajEbgd2C/mQl8LrKQ0pxoYEQjbCYNip21BPIxzUVwAJNINRcLsmlhYgmQ7WmQzCcPlV
	cNMAM+evbS8jyACeMibYvRE7ZjCQ8UWE=
X-Gm-Gg: AYBFou3lhPnWz2XFKHBmZ9xh+5s2slKWSvzTRlvA46BokNlHU5qBGl68KM2HizZTV8Y
	psVbycDqzlBkWq3ilHINXIDS6Ig28upzMoVynCg6+kvd47qp7wWqPP4rS4SQCizw7zakWIbY4zO
	louQRfpq8R+FlHn5ROZycyJliapxz2TxpC0dGW6Tckg2gZzFla9v6pzhybSeFRqhKAjhwMIpRMj
	5CO7I9bnFyGyQnQC3Vl9oPF+FUd070UiZAlrKwK23DlFgE1xzcBZpwArBOI+L+jYZfe2J/OPGJt
	8Fw+e8C12GYAmizQR3LRPBn4iHr+iVnzaC8bDAHymP+hpyhzWsM5nNM=
X-Received: by 2002:a05:6a20:a105:b0:3e0:b937:8849 with SMTP id
 adf61e73a8af0-3e16bed4c88mr7053863637.29.1791787771794; Sun, 11 Oct 2026
 23:49:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010084058.2365291-1-shengjiu.wang@oss.nxp.com> <asqIvOi1iQrIkB3w@analog.com>
In-Reply-To: <asqIvOi1iQrIkB3w@analog.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 12 Oct 2026 14:49:03 +0800
X-Gm-Features: AclHuK9V3VZ2fy03Q21gRqiwbgRzcbFZbOC6EE29a2VUKpjHaSklyWXtD_neAC8
Message-ID: <CAA+D8APebaDpME+025EUnyAtLrAC=h9WSMwpWtFX-TdooLTdiw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4458: Check reset status after deassert
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alvin, Philipp Zabel

On Sun, Oct 11, 2026 at 3:05=E2=80=AFAM Alvin =C5=A0ipraga <alvin.sipraga@a=
nalog.com> wrote:
>
> On Sat, Oct 10, 2026 at 04:40:58PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The reset line of the ak4458 can be shared, for example when two ak4458
> > devices use the same reset GPIO. In that case the two codecs may call
> > reset_control_deassert() concurrently from their runtime resume paths.
> >
> > Only the first caller performs the actual hardware deassert, which may
> > sleep (for example a GPIO-expander based reset controller). A second
> > caller merely increments the shared deassert count and returns
> > immediately, so it can continue while the first caller's .deassert() ha=
s
> > not finished releasing the line yet, leaving the device still in reset.
>
> This seems like something that should be fixed in the reset controller
> framework. In fact the issue you describe seems to contradict the
> documentation of reset_control_deassert():
>
> /**
>  * reset_control_deassert - deasserts the reset line
>  * @rstc: reset controller
>  *
>  * After calling this function, the reset is guaranteed to be deasserted.
>
> ^ (1) seems not to be the case as you have found

Agreed. Looking at the documentation again, the guarantee

* After calling this function, the reset is guaranteed to be deasserted.

does not hold for a shared reset control today, so the issue is really in
the reset core. For a shared reset only the first caller runs the
hardware operation; later callers just bump the refcount and return
immediately, e.g. in reset_control_deassert():

if (atomic_inc_return(&rstc->deassert_count) !=3D 1)
return 0;

So when two consumers of the same shared reset (here two ak4458 sharing
one reset GPIO) call concurrently, the second caller can return before
the first caller's .deassert() - which may sleep, e.g. a GPIO-expander
based controller - has actually released the line. assert() and reset()
have the same pattern.

Rather than work around it in the codec, I'd like to propose a reset-core
fix for your review. The idea is to take the existing per-control
rstc->lock across the shared refcount update and the hardware
.assert()/.deassert()/.reset(), so a second concurrent caller waits for
the first caller's hardware operation to complete. The lock is taken
before the SRCU section, matching reset_control_acquire(), and these
paths do not take rcdev->lock, so no new lock ordering is introduced:

if (reset_control_is_array(rstc))
return reset_control_array_deassert(rstc_to_array(rstc));

guard(mutex)(&rstc->lock);
guard(srcu)(&rstc->srcu);
...

Does this approach look reasonable to you? If so I will send it as a
proper patch and drop the ASoC: ak4458 change.

>
>  * Consumers must not use reset_control_reset on shared reset lines when
>  * reset_control_(de)assert has been used.
>
> ^ (2) isn't this rule also being broken in the suspend/resume path of
>       this driver?

I don't think so: the ak4458 suspend/resume path only uses
reset_control_assert()/reset_control_deassert(); it never calls
reset_control_reset(), so this rule isn't violated here. Please let me
know if you had a different concern in mind.

Best regards
Shengjiu Wang
>
>  *
>  * If rstc is NULL it is an optional reset and the function will just
>  * return 0.
>  */
> int reset_control_deassert(struct reset_control *rstc)
> ...
>
>
> (1) being fixed in the framework would solve your problem.
>
> But (2) seems a bit more intractable. Shared reset GPIOs have always
> been a pain... I wonder if there is a better approach?
>
> Kind regards,
> Alvin
>
