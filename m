Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A636A53978B
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 18:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917829; cv=pass; b=g9ScIQk8wr4zQScjRDzK58QUoSDvoe1FY4dL8wkIHOcm0QFy02j13gGP0MPC+adaLEpUffePaMBDurBknSWQPHrYVJlNIMRv2k8mkYFFeYfCkg3MfO2V5fu65yqE2AHQN2fFBbeDW0jGfcxBZYVnFKIXeH3D8l3mpo8rv+mdIhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917829; c=relaxed/simple;
	bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GRoOyso64pARIjSEStdsSCd2pIgnXtI4z4sVWkIMq78U8x1qKhGs0tJxHTa/koZneimRmnpIyy9kJrLejmYDaQJtd14WvBbYLqEa6wb362m1WuXvoSbao4h2csg4mFVXugqPxwtqulS4AUs6UTrRkUGqICreLmcgY4pG5t42n6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBL5Szn7; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBL5Szn7"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35834f72d94so5958399eec.0
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 11:57:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917826; cv=none;
        d=google.com; s=arc-20260327;
        b=iykwnvoFAnFMVRrjDDA6D0XL0hGiZYZBrp/gt6kz9OVoBjPC51L6JnvuWvEa8WkH1j
         d9TIjh75SgDNZwbFIur2ocBltdd2RRqhdJIGk7ygL8msPS3AEpu99FtfZpvRJfFJFeOw
         eclTGtbadP1/SRcLq9FbV3FXuKDzXffmToZtqE4xfBvIgCBj9vasHwQl8bTJH8wsz/3g
         8XSUm4GKSvrG4uAg4QeFHbaIegXtQxFEW5WBVBn85F/IEbQ8YXWQ6DCcaXuDq3/0SSlo
         Kl2PKLlgjVj7s+Ui9aWXDOBh77IpG3c6ok+BAJPH+FKQBbOYDL9YML0yyJrE+/ooL55+
         ak2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        fh=DQgHDj4h4pRqK3VtzOyBYQCsWItN7fWyu8vTMOLCNLE=;
        b=QiqRSlrKgNUxAYs8K5AiXkcFMyH2C5K41keZsbD9JPClvpUVniO/zeyp2Kixr0gmnn
         fv7HKhVKfvvUh7j0Dk1wP6f+i+xsINSn72wKgP0KoHZMs1qbo9tXo+z97lEWis4qGIKB
         rPKa2EWoYqIkr049jdrGy4ZdxTaEJRUG/AWcKFp7Jf6Q/8GDOQ/WLYraeuRP6tvIsklz
         LsPZoVi0qnGwqV5qL1dySoveMu3C57F3Cl36Ups6gTUmoiPwvYX/Dq/i80gxf/sFiD4W
         Cu7NSKhMfKHH12/GjP8ZgKqomoWOD38uzVTxJENlY7ah37MCTghCA9Jf4rm9SPgADply
         jt+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917826; x=1792522626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        b=bBL5Szn7TWVoKFg1ZYDGMX2S/a0MgumDzIFdDyQpxAs25psBPG0ZpCZWBgkBvBQr4Y
         CXHmK0Mh5onjNJcbIcWiHOX3XmMne77LVtqpWVRgPxN9447+o3CQWnfAYoeD3mV6zxSA
         R3l55ZMKDANO+UxoNZhuGox4tim/UAH/crJU1lyRm4nZYq7LnJC2UA4PZ77zM4nde2m1
         Vbg9ur2OeUs+WdPVOeBdnKq0UNq0U3suZqDgKtJy0l7COIwgAVjMxcLU/2Vd0VbJ7EEF
         FeKXBEgpTNGbVGJXW81G5XI1sZt51FVZNhw/A+cRXKX7w8W2fbY4w+jt9axpnYxumRLC
         hRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917826; x=1792522626;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UdFnEN23ZFL6cWSBzWu9juvqVYubuE8e4CCZuSkb0f4=;
        b=2RjpBu/HDHHgD9dpwFz7eSagDhi5h4N21MZeR3vcq/B1bmRIckqEGlC5iuTGpklfDC
         dlzdd1rrp9qlJ+NLHEI4q29lOQMaHw7WiRAeu3+gVfUomlfYkh0nwjN73Mb4zL7ASWsz
         1W6xF7bSmeHS5oWga2eYRYMmw3S1JbjuOkBDDnVMxQ9A5MXI2Ry8kkf8WLqfbiq/GdVs
         U7ufN4b8d9QlQKQKQBDQwQnqEE6Kfk5tl4/nFiZyzMENEuPzexVhGjpfTEFfC0MNLG+J
         SZCDP+q/yUDLvFqbeKb7Xd1D0gvXlD6A0a4RSqYa0hxWRlh6a+Ws6cbrTMIUX1JPKmqp
         6Qlg==
X-Forwarded-Encrypted: i=1; AKwUvBzUvEWcq6FP0qnTZx+BIwrhAcBr57wvSnAkKfRRtIT/lpruwpU5Hj5mDqHdzBv2dzh51uIPdEv5KPnhWQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZkCbMaLy6y0rHn1TOFBFoq7WUjhg/a1z8O+1Mx4SM7ZBUOUtA
	wRT0EstqARN+/bkoaSMSZ1dTgRpGk29Mvuo4opK6CjBkeWHy/9ECXKYKd0iz24wBuSaq2lZbsNd
	DCEBWAs/M8LIeFaCgk7zOTUljIJ+jFUg=
X-Gm-Gg: AYBFou1VrjhdV4Sdv6tHTpNrNi0vdIBp7qufBxbCGrZT/I8nkLoKO2i9n3Q1zVOIdmN
	Ej6rEV9s/2kPxsolL+Kd4IRJ84Imq9NHc02KiAtEbDUF5h9modGIkXHaRTX59QQs5vBtiIlF7jY
	Rvm5ZE6AgxuDqK6iX2xCzV+uZUzhu5iEpXH4SM2c9I3t3l/05FaPBxJFcEO/53SoaK0m8N3Qghp
	uwjpdtKibCjVKJHf9F3oiyGmx85AZBBr1NlpCzQYUAI55+PZeNqIwL/fF/uGr9HeFFSdMzJHRhl
	3nObST6Slq0OYzcaMQncy79ogpMyEyehiRfomv6DgwR0q7PEuXoYlvacM3tFxyomM7JRzOks+hJ
	AZngPLVEX5axL
X-Received: by 2002:a05:7300:de49:b0:35b:b3fa:40f7 with SMTP id
 5a478bee46e88-35bb3fa4218mr5269925eec.38.1791917826305; Tue, 13 Oct 2026
 11:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
 <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com> <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
In-Reply-To: <964527c4-0105-4bee-8fd2-a9020981b02f@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:56:54 +0300
X-Gm-Features: AclHuK_S0QaqCFW5w4Kb_wTSLK_O9WStPmy1OozO53A1PmbZln0ct4QN1H7jeQg
Message-ID: <CAPVz0n1YdOHG70_ynqL0V1Q3=38USHCbCQc9EBzHAmrNb4eQnQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:5=
5 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:51:56PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
21:49 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
>
> > > > The Fortemedia FM34NE is digital sound processing chip used for
> > > > active noise suppression mainly on ASUS Transformers.
>
> > > > Resending since previous attempt seems to be malformed.
>
> > > Please send a new version if you have rebased, tooling gets very
> > > confused about which v1 it's talking about.
>
> > I have not rebased, it seems that format-patch malformed first
> > iteration. Both patchsets are made from the same commits with same
> > hash.
>
> That sounds like a rebase to me, and in any case the same issue is going
> to apply - if you are not sending *identical* patches the tooling will
> get confused about what version it's looking at.

Noted, thanks.
