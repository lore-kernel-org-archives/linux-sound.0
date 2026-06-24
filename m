Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B039BFED
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782294783; cv=pass; b=c5iDs71DNcDvt7Tjtg2MK+YTGFXbsLVdcwf1Xm3C0/1E0LBBym6hnilOZX/5ZcPJCkx35g0OsH3Ut04MefY7NYcmwdU4Sf0U/+r7jq6m+nryPCuP0Wva345e8as4PwdZfX7SR+tZPKZ6+OT6VGMRDBVBY1QeRrA2Dr0a+HpKTsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782294783; c=relaxed/simple;
	bh=FGiY2YP+pTMCI+YPV8/TUGpmfGeQ5QVMiAHNcXDotvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUB62ka+IQp9CRUSe0PoraGs5yRdckWv46InUn9kXm+VTPNJxHlYHPLX1eRYxtVFyoM8pEYQLb7ceVHA9RVRPfnfwfxWEgQpuRnbxff0hi4cMoL8cvzHS2yDUu7euEYTHFWBgZZpjz6pr2dPAjSVS/pbaUlRHZuUzTdQLm2COzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjBj5bux; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjBj5bux"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so43977a91.1
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 02:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782294782; cv=none;
        d=google.com; s=arc-20240605;
        b=jtlWYngmkxTPYEGaagQ9ytU2voqu1xJgOHZPPcp4NNeCwR0DwZ7wCjf1z17klNFRA2
         i2ooEo9cHXwSlzfSJpM1Mw9n0IK+jdIY2lL8k27CoyeEoqcEab32IJqFfUpvyfkQ+KlA
         A1isrShb+fSxwyhuxI4A1IhpO3XN/a1J3zyhGDY7BTwymIwRN0kQXoV5UHrvrM/iw0FN
         euAbvyCugMG6gTGz7jU1B78welR59PZSMnzdAbTSmguzGTybLcXFRbtwQ/Y6KC2Zua2u
         iHMucWIcSu9dbxy/mTwaX3gzt4ZmIJzLzhJLfVR7PYDJG1zKFf/j7WPBhNtB03K8E2ka
         rT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yx9Fhe5nF4IjcU+FxVGQuKvvQXPx0bxlet9sSQsd6Pw=;
        fh=BCeiwomblQ4xAF0cikEEcpxflEUfdZLj//OY5FsrPbE=;
        b=X8Up/0prRPm4i8mtOSbKSIGVH1oOf8SbIhL2DbFWKyUfZcwnVDe5pkT9jpXhD/v7un
         NoO74kCXs5ipba1IvoyPFz8mpgG1BCIfDfE5HiIMLx/+L5wwv7ssBJtPa0aRDpucMRjv
         7d4mPf7yT9JdxBdCsokhmdMO5mltlv9wq+sf6ySyuQBme209qDzTlM3jMKJ0SK15mQtN
         O4zsAFxblcTp+GuJLN/lfO4ed9glFFQWuvlNkdo9M0BN+YM6haTJR2XjEPJMvUTzmmtk
         iP/CDSnoG++tDYBTcQsImWO8eOW+weuWRe8xhzEoXg+VqDi6hlYqQBKzrHGdKCJQIRsH
         9Bug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782294782; x=1782899582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yx9Fhe5nF4IjcU+FxVGQuKvvQXPx0bxlet9sSQsd6Pw=;
        b=gjBj5buxcSNB3wBRrKbnW3Z3tqdqYof9KdssVLAxPVyScaZ20qoiVg54Cs47kFChvb
         h8Uw0pser0nTNhPkoYlK+fracPaime3CRGZQXWe94tY/F77r3MW9x8RGp5rtjftdRj8m
         oeIVB/YAhQmWDclhpTW3drmHr6UlBG3STgb3h3VFYWug0xAdQtjl0XzZ5yTsDILCIEH5
         jWSXHGmxyB5xJXPQoVEQ5qTdtqtrV3boZZuAQhKKNkmScUByEKqos3T6NeATms5daee4
         bfmFF5uxFBwbQqWBHQVLogXuZ5/Wtk1UfL8EQVUrs9G/N2J+L+KRv1xGBk/KptHcNKSP
         P/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782294782; x=1782899582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yx9Fhe5nF4IjcU+FxVGQuKvvQXPx0bxlet9sSQsd6Pw=;
        b=Q/ZFiGd49Zi6pi1EvGbdOA73XGX+s01nkOLZ5nsTpFH7HAlRgCkhxWtdxW2hUA1cyZ
         ut4ljYrrWJdKsLWrnjthtH+V4sK4G/2YFpLYXJRGF+bB0H/MUdSD7rvLPV49AiitrPXW
         RW7Z6i/jwSZkMHfKeLEPl14kzL8P873JTh7MeSu2T55/Ct/VPBvoCm+NZOJigvJl0TXQ
         JTIPmdvvFYu5d2xaKiGZHXLr4czrqskRaxD6Dc9CtMDLGMVF5a8ZUQdsaNtUy6Dn4syA
         +qOFOz78ErHNxfxs8cgFyiMm7Cx4TC4OOE5IwpLl1VO2IOOfRL8wlVeZSehEv7E+Tkr1
         jz3Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpv9i6c6B9YVDa6IB4TTddUhiFPTUierTKsjqrOYP8hGg8oSrIziYm288JoWXPwO7Z7eWZPXfGtr9XaUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu2u4n7q65l/z/rcs9fAswDRc3W3begWVJBXdC2swsi88A2gXM
	V29z1kmANWg3V4ebK1O3LG5BZd7lrsLbTbxfniZxuhfYO0CpRrvAATYXbPB/lio1c7SuOWVJuZ7
	AJ3aJ1XXd4+rXm5NhA+HJFjpMSXs5CFI=
X-Gm-Gg: AfdE7cmgxjfpO1V9AYpTmf2wCkzXGj2n4sGlCtF6aQ67Vxtb6ojM8PG16k/EgDhkjvL
	SzQ2uTNmVphFpaSsqXQzue0VExPh39KffbF72D0Yg3sdZDEaNd6C3mZcYtKxWMFL5W6jrX2hz6k
	A68krR95HR60RZVwXImDsTDqyMyDCXQW5R+0QIwULVCXd9K6jc06fHbW8WA6XMHPBz1amRZG6jY
	ctAClLekAgEXPO0P2g2BRu+iuVJDRztU/KCkCSlrgi0h0QwS/ciUQpUr9vr7IhQiAbuVb6K4rqd
	hqmfAwBsRN6F2LLZ2C07YFQVfmQ=
X-Received: by 2002:a17:90b:268e:b0:373:302d:3ce6 with SMTP id
 98e67ed59e1d1-37dcd74d8bbmr6499569a91.8.1782294781846; Wed, 24 Jun 2026
 02:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623105721.25865-1-phucduc.bui@gmail.com> <20260623105721.25865-3-phucduc.bui@gmail.com>
 <6461a163-e223-40c2-ac50-f238ecbd56c0@intel.com>
In-Reply-To: <6461a163-e223-40c2-ac50-f238ecbd56c0@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 24 Jun 2026 16:52:50 +0700
X-Gm-Features: AVVi8Cf7ovAjtlilZdM1SM9y01XH7S4KGqh79jIcKtZSxQqz78NM1Dk9gR-r_Ro
Message-ID: <CAABR9nE0nRJLNeAMdOLYnBVXNo6tsYBbVjmcodpTRm35Kqh1=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] ASoC: Intel: avs: Use guard() for locking
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 2:47=E2=80=AFAM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
>
> On 6/23/2026 12:57 PM, phucduc.bui@gmail.com wrote:
> > From: bui duc phuc <phucduc.bui@gmail.com>
> >
> > Clean up the code using guard() for spin & mutex locks.
> > Merely code refactoring, and no behavior change.
>
> Apart from one point below, looks good overall.  What bothers me is lack
> of includes - all these files are missing linux/cleanup.h header despite
> clearly using its members.
>
> >   sound/soc/intel/avs/apl.c     |  7 ++-----
> >   sound/soc/intel/avs/control.c |  7 ++-----
> >   sound/soc/intel/avs/core.c    |  3 +--
> >   sound/soc/intel/avs/debug.h   |  9 ++------
> >   sound/soc/intel/avs/ipc.c     | 10 +++------
> >   sound/soc/intel/avs/path.c    | 29 +++++++-------------------
> >   sound/soc/intel/avs/utils.c   | 39 ++++++++++++----------------------=
-
> >   7 files changed, 31 insertions(+), 73 deletions(-)
>
> ...
>
> >   int avs_module_id_alloc(struct avs_dev *adev, u16 module_id)
> >   {
> >       int ret, idx, max_id;
> >
> > -     mutex_lock(&adev->modres_mutex);
> > +     guard(mutex)(&adev->modres_mutex);
> >
> >       idx =3D avs_module_id_entry_index(adev, module_id);
> >       if (idx =3D=3D -ENOENT) {
> >               dev_err(adev->dev, "invalid module id: %d", module_id);
> > -             ret =3D -EINVAL;
> > -             goto exit;
> > +             return -EINVAL;
> >       }
> >       max_id =3D adev->mods_info->entries[idx].instance_max_count - 1;
> >       ret =3D ida_alloc_max(adev->mod_idas[idx], max_id, GFP_KERNEL);
> > -exit:
> > -     mutex_unlock(&adev->modres_mutex);
> > +
>
> Drop 'ret' entirely and just 'return ida_alloc_max()'.
>
> >       return ret;
> >   }

Thanks for the review.
I'll make that change in the next revision.
