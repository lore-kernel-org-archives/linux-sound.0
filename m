Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793908112;
	b=ArTEZY2mYcgpj8B2+OvSRgbCJvk8Tr8/Vrwz5GX976eLs++FS6HnRi63GfRyAeo0mWP1
	 rXxS6rX4itQlQ8BW6jfbZRbf4CtuXCjl+HxWY9ERTSrbYQv316Np4QFRHTkdzkOtaoMbD
	 xC/PtIS9ErrV2AvytmUhl9FO8ibl/7Otf6sOKbdUmWBjnpLJqUzQT/gMbIK+DEK43GSF8
	 BfYEIpgisn3bTcVpsh81tH/outj/NjO9JXiyqo6atFpZsUh9bzYHJIrNVZHzSE8Sosmo3
	 YRLyYg3h3Zq+urfPRGu/jZpv1q0leuJ6pmkJM3XJPjbswb8a0odpalJ+y3B8YcuilqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OQoB0OyuP6rcMmx5P0Bm/IuwNP6HG0SGa2V0btSj1Jc=;
	b=VtKOP0Be/OwRe53gGilDL4ZR+zRUarDnIc/Brxa0tGWMh2vt5/b9rzBKlbiJON4wST8z
	 dxu9nMRg57LBw01TGqwPfCGXwNtDZF4WDZxBHm4iPibcagmS0h0KZe6U9uP+IRtJCpGFZ
	 DWR5D1OagIUxJ2YfHMEd0NMXT6VyhgwNmh7x/ZdKQE08BMxbi18/Lcq1THcPnGAGrG53X
	 ayXlEaVRnL0R2WPVV94Hbz1MqbI1WUpmpJUq+YuIIY4Xfb1RxatEnM49GX7DVOb+kDUD3
	 pzlOuGQ6awrmyw0SRW9i3eN2m1/nue3jGXAORsgVKNdM/M2sK2I640A8X7590/5YXMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd+edbLP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2B6606A329
	for <linux-sound@vger.kernel.org>; Thu,  5 Nov 2026 19:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E2B6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sd+edbLP
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2147987e87.3
        for <linux-sound@vger.kernel.org>; Thu, 05 Nov 2026 11:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793908110; cv=none;
        d=google.com; s=arc-20260327;
        b=Mxqi+auKiF0sPlS8fg+02i/42yfro78dCAiwA0tyaOOw2T2SfJTsj3wHSIgRV4MziH
         wUfW7xW8S6HBiAsJ/dxSZCnuYjwMuZaz1DnbV5mLrtjdy0ACX0q8XrIy9QpGY3MK9YVF
         Ypqw92FkjcXRLB5YUVlAxQNvg19wlhR4n7UdEQvi/O/B91/kc3iQh4Nstkn+8psFUMLs
         yiERc6mKFhKn7xhjre6grLN1ht57VTEpNdMbNp+Fa3oMo3FvjqFbwq2GHJ8QYc6c7shs
         X0jU1rYskP3ItLp/NQKGp6ZADTTYdE1g7xTapw9DuoPlY48IvSdKrd+iRTLi6c+3sdPs
         UUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQoB0OyuP6rcMmx5P0Bm/IuwNP6HG0SGa2V0btSj1Jc=;
        fh=HH+CvPSvMbG1j3/E6iZqCjGlaxEKjuLroGqLyWe9lN4=;
        b=Yo43gGfPImt/h1XTMHlurjP/j0NAkMtfBL4940bnyjOgLU3KQHedQfOl2jWqnq4Xoa
         Sw+c9BsajBCfErCnIaDvRr4CNza/NW+auMVM9xESExQESxWkP7io8rDVOkY+p6iASgLx
         GCPR8JGRZWWDt+pKa4JSx5gtlDWkhkfw0WdGuod0hKYtUYmp1lT2+tj54zciGVbayAfU
         gMNti5Zr7+/GgHKAATOBaVOLnBtNPlmI29q20Hsh5oHrJoG0O7ntjrkXcwMJGkwmAYfC
         BB4+8hdm5ziEz+yp+s/tquXIagJUKcTGe9UtekoAsy7kn+rq3UDqIt89rmn/lpbggdCL
         WGFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908110; x=1794512910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQoB0OyuP6rcMmx5P0Bm/IuwNP6HG0SGa2V0btSj1Jc=;
        b=sd+edbLPfKhvmhrWfjQYzOE1o1+gi+kZWfHAH4c4bI7QtpqrUtnHMIvjWyhEoWk8Tc
         S5IvQpS/+YzL6oP8IkEpi6Vsi194PYvOnpwxx5SRIt84M4RsE51qU68K97kYwzmqiVDA
         SgqwZXC2dbZ89mLxJJyKt+LblelLq8M/L7+nW8jfAVX391ytgkoR42Zi+vfRf+O2aptz
         yp4kkodgXdmSamVQFzJG85QO4QJPqokKAM9JGGKVBhi5E7sk+mScgEK1xAqd+lbwAt8T
         vB90/KPvv6V3VIYbJDN1A59alLaTNgE56aGdyxYTka6RfN/lqb0F3kBmbkz95xYUJmid
         TmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908110; x=1794512910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQoB0OyuP6rcMmx5P0Bm/IuwNP6HG0SGa2V0btSj1Jc=;
        b=ECg8VuPQdh+RZ0L4DiePie5zkBx8iTdUbIkk8CzcAs78+xLGUK+nRf0c1trrrBBOMB
         O7jG7B2NIzj6LQdZRfHC/JBgsbSZ8ruR+wpbRAnymD+L5msltMSEpo21n8IUWCijyuFm
         hLFKYgVARbBNtzXlP93DvhebGyjrIBf5cLkJ6WO85GPnzjQD/IeGXu6xQ6SYLe6rRN12
         e/xvdXS0csedM8QLiB9F7PIDLsO958LpgvN9A2y+U28hIu67xhIlo+TNKVeBQRlp92RU
         YGpegSzrK+yLHPGp4azwG/LKMs1H9X8bdUCqTRUCWQ51M7t6zd4YUdsHpNNlPUVlXAUQ
         5Lgg==
X-Forwarded-Encrypted: i=1; AKwUvBzTzVsFL13p0p80aueQftudCL7YUxVZzpZhjlMESzZSs3JbxSsmcq5BNY8ZDvef4GiHUf904a/W26xrhQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/2Zwhyr6gwzQ4rfQtrreAdhTiSUYILbXhYIuRsCsXCoh7/K05C
	4dICwaLcw3+PDrHQx5NflunAnianPR8/SKHgm/1mdKkkoznO9GMkMTHrUr5dDw6UGYmwKoYgOmP
	lmN4KWd4nVSKTnmVzQlQ6+wlidHuItAU/Ug==
X-Gm-Gg: AYBFou0X8T6OljlSIjZOpNuWEoBxRNGypzOnnCbNdfX7iPoopgHEgr79fkMKN1ygFO/
	umwnobGbbN5fqE38qlfBcmwZUdYjDk0oy/WSnUDDPRGG/tQ8cK57q1mRwKsUlT4Zc+0QKkHGrFH
	k8CEjyKAQ4cho9Pa3ARpCITUdMZGbg0KWWOk3q3DF2Kgr2K8yYLV+1aMnjBOoahYodPvbe+fubi
	b2fwzJOrz++ewXjfPspUMMh7UWstbZ7Fy6ppTqRHpF/U0QNiC5SS56I6rAOPDX5f2F2IZB4DKlC
	SPGIBn43Foc9RlfIqNswxJboruYnac5JvQMRMsdrIUP/N2bg28XT12IPinsACvzSQ7kYi7kUZ3D
	2v/iW/9J+LWLxwiCtiODDEYJ3+MUfKAAQLINKZZRGek2CgDiREUNgcb4Sqj2skjpgq1eWqWchpm
	pbDLLVZyl3Ii3LlKISeajeLvjP
X-Received: by 2002:a05:6512:138f:b0:5be:50f5:f789 with SMTP id
 2adb3069b0e04-5c003ae8f35mr32146e87.45.1793908110088; Thu, 05 Nov 2026
 11:48:30 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019222827.131120-1-festevam@gmail.com> <179304399954.199157.12764659560169687388.b4-review@b4>
In-Reply-To: <179304399954.199157.12764659560169687388.b4-review@b4>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 5 Nov 2026 16:48:19 -0300
X-Gm-Features: AclHuK88GEl2j3sJlJ9HDbgp5sJVLx544WtOUUheKfsn3vwqvXVSiM43oIZy_yY
Message-ID: <CAOMZO5CfhiM_ydnVuyoBFnBcrhk2Ra=S15S7MkzoUZ=DbUhA0Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: Defer TERE until stream setup
To: Mark Brown <broonie@kernel.org>
Cc: shengjiu.wang@gmail.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Mon, Oct 26, 2026 at 4:46=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:

> Has this been tested on wm896x boards like those referenced in the above
> commit?  If the card tries to configure the PLL to use this MCLK in it's
> hw_params() that'll fail now.

I'll try to get access to an i.MX board with a WM8962, address your
comments and send a v2.

Thanks
