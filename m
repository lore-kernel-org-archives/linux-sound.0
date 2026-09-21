Received: from mail-yx2-f1.google.com (mail-yx2-f1.google.com [74.125.224.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914AF456DF4
	for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 09:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984013; cv=pass; b=IquunRM89nzYCOAN4SyvYpTzEAFewvJOcSUa6wW7IW6AxdXTi2RZNyBb6AapsuIuUb9x/zi4iYCUfaNDHT0DZSawhuwD6ykxmaG6hSHT+j/iGuUcMAWW183P+AeSO5olkppvAYssGIPlrFRZev2zYgJnd1yLlBAkC4DTxACAeVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984013; c=relaxed/simple;
	bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIRtT44mO9vRoRIDeMdyf/QrC6HvFj9+62PcvgBBi4tSrlavueLGojwmXZvxftMzecQrx9ycD0XY4SVVvKoysYkDZvVZSBVl2/ll3VebqUINMkCVYjLrqusiYbFmk1Kp+HYUjjsWh4NXi2l0G6I9LC5qm+UhFc8R7aeDY/+8MvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ha3tZRKo; arc=pass smtp.client-ip=74.125.224.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ha3tZRKo"
Received: by mail-yx2-f1.google.com with SMTP id 00721157ae682-85868e38a49so5438757b3.1
        for <linux-sound@vger.kernel.org>; Mon, 21 Sep 2026 02:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789984010; cv=none;
        d=google.com; s=arc-20260327;
        b=p1sRLkff4eFSw7ifQ8eyfEyNhi9g7xCXIol6BeftFrGJxcOIgVpxaT53Z24H94DcW/
         6DG72gcaglHVg4bFOSeW1o6f01twOlsP0FRUDM9dEtrJHEEvNMI/8CPKK2TjOs1QVvla
         dcKi4ltPF1QAH4kDrGYgXY0LcVONtVZqt1zV55EAI7Qc1gUyzJJqN1e2qrLtmUrY0jQh
         qVzTC7fZLv2nx1jMCmEKtViEsuwz1byJbgvM10f4cCVMmlYYlidr/7XBsSIcuCOA9qqf
         e6gBAYAObVa5UjWTT3LGSfcWv8NXfNNQ803lumofJ4hSPRzvIHNCALqlgKN9Iut7kNuJ
         spwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
        fh=cIixq0CHJl/BJPVNFQ55WFC9sWanb9XHvAAc2LdJKHM=;
        b=e3ZWosfPfk9c1Eg8nM/1mQpW8hPFCewYhMutIurk6aqjOu1oHfM28EYMbjXinLgNg1
         SwSKaQOk3nv9oo1n5pvjVCaiCE6GFOhb/d67FUMCF2GcZ/8w9k+o1vIrylSmllB7woQ1
         W4k2EJxEuPM5EHm3H/FxGztcS7EyaKcOcMHues7zp9bOEgBi5mekRLCHK7RKmPQywCEd
         JKMRCBPWmnQXPMeLiXlZllFSoVgXpD2gRHz5fmjMFQcSotIX7rXYKeWlh54k5g2OuzE5
         j7kXFv3c3CMsa6iVTaOeCqF42mUQH79yF05WkvgVejZGV/PWRGIdnJPFXAqCPLveXhMO
         jvzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984010; x=1790588810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
        b=ha3tZRKoxsQuUPyIefLtSnxddM8Vn7ccv48KC3UVcVaUXtRBxa+mGXgiCTQipp8nEi
         Bki0CdZr0O+ygsgPk9H64zjptvGPNo8CZhXOVqKCkt7eujN9lvzE9Imr6jkNJCbikvU7
         450UTJYFFbHrt0T+VluNzKdbu0JU4YRpvuOUHseK3zPqSROvZ/Hqhpk5BwnIVwWFaCE3
         UnGuPZNHAzQjmosepqeRvHkPnOHmGerAZmtcqK8I8aN4DGwsPuLHhdnpHmLx74YA4UAp
         MAlY+uesT6AveQMyebdVpWgDpnPOzVmgI3d8tXXTdzKo3CTHDqw6UlfdigrlC01AEpqL
         QN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984010; x=1790588810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+/Cm9YPfNPvvyTL/kLTG5mweG3JOW7IGzYX0bdp7V8=;
        b=bkbvPpESMeHyAOwFCvxcvcycI5Q0p9LT1xtBvFV2JQzi1EjSuBiQ6cQGFj+V7p2AfL
         pen/u/HXsnTMyYahQexvlEH+t5buNepdQEdhlslC4jlh2WCceUai24Q1RRiEHzsBZO9K
         I/kf43LSCotdqenkjV08432SUIrmejA4oFTN7Rw2MWJrz+0PaIplffJfe7tjPhH3giLu
         9JNFUdqUeNvhY9CBgj/5m8sbFoXZ73omLJpUNFJj8D4WseKIm8DDg28JWPs6nBImWi1L
         aCU/dfBzFP2zutV0Cy0M5CJKaIa6TvuaUEdnouJ3p/D4PB6/60sf/NyEzXoFBucSKVkT
         sTxQ==
X-Forwarded-Encrypted: i=1; AKwUvBws517HQCkY4O77xydvQSHMF0Cy4dDlS/aOmmsJ5l/e1c7aWTYezcVTzzHUDpBIv/YMDmzJjSx/KgZ/ug==@vger.kernel.org
X-Gm-Message-State: AFuF++mAMyulLKClMxGnb8ExBeNVU04qaTlEbzSYvuYPBcxG4A0a1eWu
	2oIey0+NplaLJaxLXeX/f4L+V9Lwxk6WezCvdBg1Fl6aQK4idfKwXutdJz6XeGM2RlQ7T8bRZxj
	V1COtCZicLa/hycTiSxfGXZ+loFL/iBc=
X-Gm-Gg: AYBFou1ESK8x5vinS86Gkpa44Ba8UZrIQAq/oYBS8hL3Nu9lJXJaUG+pYlv5URhzT6T
	z7hNVrued/jfO05mOSBVO8Co5CsodjGeoXPjTsaOwyUXdGuwlENkTHDHuYNFV6TwQXDX1/Uwlwb
	je0xyrHNA1JhuNlfTMCoA0ryyHS34/UJI6iE/PxjuzmtqTZXMEKO9bFFrQ+btfHhS6A+75QsW9y
	8+iSHE3exP3IIssqoFadymOiNtxTdYqnbZe6VZXfqx849qqYx7XRmYxoP6QNry3uHRIZrAA2rce
	hcI5LJHr31HenRoQbm4yko1hhtJyq8obENdoH4DgCbDBa6tn9W13ywmA
X-Received: by 2002:a05:690c:e649:10b0:89a:63da:fab4 with SMTP id
 00721157ae682-89a63db0408mr12439377b3.111.1789984010444; Mon, 21 Sep 2026
 02:46:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920145848.44521-1-me@lizi.moe> <20260920193830.53706-1-me@lizi.moe>
 <arDqcJ5AbDjGHd-b@sirena.co.uk>
In-Reply-To: <arDqcJ5AbDjGHd-b@sirena.co.uk>
From: Li Tadokoro <kokonata233@gmail.com>
Date: Mon, 21 Sep 2026 17:46:39 +0800
X-Gm-Features: AcwNN1Ud_FIYDoPOA9vd1A9iNgMPZfhlScfzx8a-KRd0K4u1ZBcEhynMGifCZ8w
Message-ID: <CAGFxjK+1YVvFiZS7Geaxe=TMO_bvuYsYtsOjgpQ2MV876KNvwQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-cpu: use DAI table index for
 playback constraints
To: Mark Brown <broonie@kernel.org>
Cc: srini@kernel.org, lgirdwood@gmail.com, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about that. I'll send future revisions as new threads.

Li

Mark Brown <broonie@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8821=E6=97=A5=
=E5=91=A8=E4=B8=80 16:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Sep 21, 2026 at 03:38:30AM +0800, Zimeng Li wrote:
> > The DAI ID is a hardware port ID and is not necessarily the index of
> > the corresponding entry in variant->dai_driver.
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
