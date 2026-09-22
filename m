Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594E55540BD
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 14:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087020; cv=pass; b=mOpjDHlbhU/jHYmXlKtZ1e8V0AS2+mv2oSBWResmovPYjtIHFth5ssc+HbU0czYpGQ13qSL/zibItMqJw2HEPHzJa3CdkR+x1DtiQLq+jJ01IGx5ZhaTbs752iCwss1Q5eijaeNruRvt37SYy7VRM1WQpUBhJBuna/D2/TQd8WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087020; c=relaxed/simple;
	bh=2KniYcsOXGWpjKcTOirIavkhO8UmBln9dgalQxkYh5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FMpeKWcxucbFZuqJxJn40Bjxthr9q8E6bLj5M7JC+p1UmuFkxLXKMKFUPHgRp+XS5FqtIg40Fj+zQBljncQlzbC/UYHH0Iakn3kIEKIjcQdxMDwRA3J2aQE8bqI0OWhYHjpYpMiwsPZ9+FAOdh+AXLcDKDqiCYXLCD+IfdR24P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plKSa6DK; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plKSa6DK"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a36de66c0dso40631491fa.0
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 07:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790087016; cv=none;
        d=google.com; s=arc-20260327;
        b=J7kVJgTHtD60Q14y2HKj4RwqPBBSEKOwbQoFKGj1OtDER38iwSvfF7Nz3oTrnfCxKa
         iyGkWfw5UV5/otQ3k6bFm79C2fxPmC7/SNvxY5J6P7uPy3dJisR2RncEjW4CywNEKesd
         oc1Ow2n8f4pR1+qVC+FNgUSzEr+91+doXMF6a4fual62TFjm8yS7ZN3mNCfwPnfgjGTz
         MtA4PHMGZvAQQmOGeEpEYJe7UrH1YCoSNuJFp2HpurFI/qRbLeVbdBwlD+wyjzmyyfhj
         VcyekJzAN8jRJmGF5iqqyr0+X6CDFwMsqv2xMn/P4mrsuW7YLgTmA9blayrLRvvsMVOm
         wQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ej0QdBkWQMtGcg3jd0ijdraN0xhhGfLb+Ji1cE+Sqt8=;
        fh=RvHo8XJzAA3Es1yBhijVLN4XoU4J1tmgnrbi0x/l4s4=;
        b=nn+DajgbPUG0xOTM1HoIeMppb6bO+ZvKX7+mSbzItNoDnaYTRjivGMRRP0m2Fp9xmX
         i4DsVJjNtx/jeOqDKAc16FbkzqqGfJpoo2vx0dwBj5lUzjjXQexEM+nY0Ev9LCVJpXeY
         4Yw5AE7hwgdbeheX8GuBUL84Nj6PNxcTFkscnDUjUR/Q1yHT9MrKjrpUtuc/X+SaKvKP
         nFJzdll8/Xs2EAQ4KANKd86eReAq802MV9TWvGccecaINp9wz2HVEuQVxpT4MZX31h2r
         U5/HYqMXwqY5ZM8Csd02kwxcMSGdA3aHtMXW5KbCtLebPUfJ16csM2R8AerPWXO3iJ+K
         I9zQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087016; x=1790691816; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ej0QdBkWQMtGcg3jd0ijdraN0xhhGfLb+Ji1cE+Sqt8=;
        b=plKSa6DK5W0wKcG9TII48qPOO4crNrmhE8WDijo6ixfnlGIRslbvFtP2+2MN5KJyii
         o6xWN+Jgxx8zthGDDIHHz/W3IJU6j+nU/4guTvjJ6dbTjfnLT3JCFH+jmuhOTC3/7NSf
         vI4INOq0zg3JSbHEJfUuPv8XZLCSm69R/BNgeM7IuD+6odXvbCoivCH8HJ2uUqvtMzGU
         WBWdGCQeZzj0/r/NLeWY4JZ+JB9kcUZSm8qcUAs3jlkHg6222onl22BrR3/teun+M3GA
         /RIXFp56DEPaG8ifRzfA9wYCjhnDNKe06ntX2Zw0HhUC89MdMDMt5FQK2mKLAM6xJItr
         kJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087016; x=1790691816;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ej0QdBkWQMtGcg3jd0ijdraN0xhhGfLb+Ji1cE+Sqt8=;
        b=Qod10ZyzhdaTDpcGEK88BgiVW3s9XnFyTsSe/CIWUAMLk3kN89Jk69lPQ10Qldjp7m
         bIACLBFpWbalLsqQZwlONksqDlpbvA0dHIw2BZvj8jgqa99RQFfkgMYoVkM6yoMcsJVr
         pQnav0W71q12JIpwXHG8Vcx/p72sMqVrRaNc9OWdAa78pY2tphCCdyP+bifSm2Y1rur/
         ZgnGJzYug2/huf1AEEOJBzIZd8lbefoJNgnvN85MkXfZQlt4i23Ajb1MlOAjvmpRSktQ
         BS1q/zWJAZCEBc/D4dsvs6lO+rLE8S1grnbVrgJe3T27zMJVVqsnWMo6h67YrNs2+LDP
         6yOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2fRn3k0dtLCcPvnvkUTz7Yd+pg5ze8i1Y2+3/Jw87i7oJ+VlSNQnbuYQ8jrayqt9CgAsGNaUE6TnLLQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nGF9jHXKR9w7sfgWE90rxk84su8EZ3JrROfhyhP5h344338rm9
	rzNiBI+lL/ODzKuXbtTrtQu76ynBpfi0GEzg03LD4JhcAGh3xes4x9QoCoevIzYKqOjcScHvUbJ
	OhAv4WRYisuCO9+PMDZJRefGQDraFm/h+/M8xn1ujvA==
X-Gm-Gg: AYBFou3uFm5o6rpDpxG+Rim0goYpc3apjIoqDz7WuGsHJ0PJE+qZ+nmuspQgSvtryCG
	VFkOyrYk7VvVxfezuH36v8RSrSgwrnhsjdly97gXlAZQDZaavxKHzQHn1y6NWQY5fgtxMPUyUtC
	6CO9Bn4S8OVm6I2C5SUtc0cfs7AqjTSen27vZs3nJdb9cniRi7a4WAZxa5pi8cFi00IE/sWI5to
	Mp8Y858MGXKY2Dg6a/N554qbj8CDwrbv/jRRRM9Pb1xtTCyLOKwyiOlclfi7FciSeeskEXgP5mn
	Ue9LoZuDAK2fq8KdsZ/boIcMRx+Ag+B8h6YnMeYk+pxINEEjiUkTuK9nUr/PyiiS1w==
X-Received: by 2002:a2e:bc12:0:b0:3a5:e541:4205 with SMTP id
 38308e7fff4ca-3a5fbbc2f6bmr33199591fa.0.1790087015543; Tue, 22 Sep 2026
 07:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911094539.237430-1-antoniodilorenzonap@gmail.com> <179007765990.322763.17356606026712759937.b4-review@b4>
In-Reply-To: <179007765990.322763.17356606026712759937.b4-review@b4>
From: Antonio Di lorenzo <antoniodilorenzonap@gmail.com>
Date: Tue, 22 Sep 2026 16:23:24 +0200
X-Gm-Features: AcwNN1XTROVjEsY0e6kmLsbAYBm_NEf96K-hN0LiDrcFirpkN7973nbHxILh21I
Message-ID: <CANcofmWSBt-R2xGwsnLZtYaabLu+30O5QFd_2uS4b2g7ouhsOw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: soc-acpi: add SoundWire config for ASUS P5405CAA
To: broonie@kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thanks for responding and pointing this out,

You are right: hda_sdw_machine_select() is already present in the
kernel revision I used for testing, and the default machine it creates
is indeed very similar to the static entry I added.

My initial patch was based on the fact that the P5405CAA became fully
functional with the explicit TAS2783/RT721 match entry, together with
the TAS2783 stereo fix and the required UCM changes. However, I have
not yet isolated a reproducible failure in hda_sdw_machine_select()
itself without my change.

I am retesting the same kernel base without the P5405CAA match entry
so that I can determine whether the static entry is actually required
or whether the issue was elsewhere in the stack.
If the default SoundWire machine selection works correctly, then this
patch is redundant and I will drop it. If it does not, I will report
the exact failure and logs.
Thanks,
Antonio


On Tue, Sep 22, 2026 at 1:47=E2=80=AFPM <broonie@kernel.org> wrote:
>
> > +     {
> > +             .link_mask =3D BIT(1) | BIT(3),
> > +             .links =3D ptl_tas2783_l1_rt721_l3,
> > +             .drv_name =3D "sof_sdw",
> > +             /* "dummy" tells SOF to require function topologies witho=
ut fallback. */
> > +             .sof_tplg_filename =3D "sof-ptl-dummy.tplg",
>
> This looks a lot like the default that hda_sdw_machine_select() has,
> 754b3dade5dd ("ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721 related
> match tables") removed a bunch of board specific stuff explicitly.
> What's the issue you see without your change?
>
> --
> Mark Brown <broonie@kernel.org>
