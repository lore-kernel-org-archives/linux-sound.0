Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B839469836
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386674; cv=pass; b=d5BUHOyVFwxn2K0e/M+QtHGYK3MLAgkNN9dv+ZFdg8p1xQQqjeQAMt7/KSZrC8Jn8OctTHg83bf4MvXPJwqmso4WhHhxIjk8l5eO2pL7MHCH9wHUg314eQyWm2OaCE+9ZhMFA+CZnudg/BP8x6jR14/xjZ1Cj1qUwoO9R5QoQWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386674; c=relaxed/simple;
	bh=h8FtKtui8CKwD8XEnTOtrw1v9n7MuAEc6F0yX2rkbWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCOh1XcPtJ5Y/Vgi3+zuZpciMShVtQJ/KthadsfTxx7+gLvjwTa8rNUPKY0eIfirW56fxA7czUC5JNjJlvqB7MZDuQW/9YeNBqCJ+XIXbk3p+McPpmg12B/GdCX87a4hyrTzbZSzGLn8EhPasmPs3gigZoituhpKFtc9nspa+0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJI36+C2; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJI36+C2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1330206f8f.2
        for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 22:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792386665; cv=none;
        d=google.com; s=arc-20260327;
        b=l6waHqVNQ6CuqE7f+50i+5QeCA/oEil+U8TINeWp+oN0FWoCQO34uIAk96aN7eo8ha
         XcWUT+7u1E8JXxftc1W+0msEQeXMfaAdfEPvab6F4U8URqCLWXG5ZDJutx8RUhor6JkW
         WPHnLiHfNZ0+SADSHzg19S7oPwZrTAc2fUf91yRBWc2r0gB2V/JUlh7BVu0KEMTrWEwe
         rbmqm1+wUyaPc628mucurTyPLCvDceY2lEf6HYdTEpddxRMicTlfl6OOpCAEMawOUnR/
         RjmN2z23toJjgvfc5R05nZk0xWNxWMuu/47+mDKldiFBbLLINknC75jzZ2usAdAEcLqv
         smBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIw9oF4fgvJZ92mDrNvSqcj9UXddR/AwnA6Ds8/L3AM=;
        fh=6j2diE2JLYYWt8zcVEKEfvzg1WlM4T2ZqEJBRjl9ULI=;
        b=BCdmPPdecuqpjHIsV9wfkQCsbl6lkxpt2IvECK7bmWOC62h0NMPZ9ssTa2z9p4Xu8P
         g9a55xxs5HPEItwRjXmIsErSSrZdju32+gnB1d+wb6jYq7f5EsJjTMC0IWHeDzVZsRcI
         4V1ww/20Jpkwr1codPBdcbbmcnuGoLyzmbGRukAjIeiQSy0QNRaqgy6NbpAms61NpTrc
         bmiReLQicF46n24Z95G8f69qXQZc6dQ54lm4x6GWyCpaw9YhvrYm9iVEjhwW691uNGCN
         VdfFno27pBO1MN1QQFUvKWbjxHR+50dZ2r6eHOrzXFvCe+CaUY37XzXAE8EgKkmBjcGs
         g4NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792386665; x=1792991465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIw9oF4fgvJZ92mDrNvSqcj9UXddR/AwnA6Ds8/L3AM=;
        b=rJI36+C2aooqAenBvVMsOaX2bn6bomG9Xyo1+1a2a/9VM4+8pFiDii/Cq33vK1M2JC
         sn7q+/6j1MIm1KWx3WWcuQAH/GtIt0UEWe769RWOVlbJ0iogg+dsIYSCFo55wcAIDvlb
         4KhW3Yf6E7aDkzre8fY06FnZr53II3WYSeGmCSitzeD37MntljxtwlyqGYlCuFmBq++9
         D3JcnlV3TqS54w7qlEs3UI/BJP68jWUU2XsjvJ8GWLFPKQpYLQtpJSEZqLyAqKKxR55x
         VXqMdsJqutXHBgLz5Jpm9JJlJMpDmQNkL3n8JFigMy2WolqB4DSTBQfr8M3Qktq2b1Vt
         2Kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792386665; x=1792991465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIw9oF4fgvJZ92mDrNvSqcj9UXddR/AwnA6Ds8/L3AM=;
        b=QkHwALhAO/dMNTLVMoBVMjDXPGkESR10f4HrNKXj5y6v+ROhR8Rv4brs3KDCPbuhGl
         DywDNOjQThmSXJ32ir1usa2EPkpi7IHueAqJmKDHKXZ44h+gruPPRj9N5CelvPwQbePR
         1g9iJTSTBDweCOBKxlKdGJ4NnM5WpAlM4F4r8eAu5C7hg/cDxgAWSuZB3+NyoaNh4sDi
         JJBsQxyvo00KJ7WSWYc0Se15NwYLi2/TgWoJwo/bnoxt/yRCS1E//EnC7jQSeOZ74icv
         EhYimdPrqh4MwWurY/o1ORC6CpEBqru2IDl7GPEm7R2TTj+mVC8BB3ZBxwq2eYP2ucmY
         CC6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy3JntL9CLkb/pg/SgBCPiYFOhot2M5+BQpAdEmwxZPKfKDFi/JKAwAqM4v5Gu9KPNvfkIAnEEepcfWgQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5KGNGvynbVEBGa5PvDU9T9gpV0WpWCciQ5yAy3DAb5eNVqkh0
	T71XqbxCmW8MWSAJbJfNQvTsMHF6UvPpsGGPf9TAtEQAvd6d8akjU/Vt4qhanzvMrt3XCWeK5D2
	ZXXHt3Idm1RmqxkYPbzzsY3Ja73O1FsrCUCr+SGEjgQ==
X-Gm-Gg: AYBFou1wl6ukHb3q119VY8cntYIhFETSdpc8LpzlEytsnNa9E2MWMPm5+B8QNNoeC9/
	lOy2qDZEbyv5J/8s+ma4h20c5cVUnsZ8xeLW26v4duIvYmGaG7cim3yIpySpW18L7Xqec81BAlf
	5abVvRa23zX1I151lM6PN7f1jRyoloK/2hfTytqHqyNGVp2v+PwT6GQ+WvdvdhHWUW2AXLeQsb1
	F6Y71iRjj2c4MyU4Hzb0c2ssPqlqMAGDLkn/YVrmgNbs0me4aE+iLR98UoELxowGFom2/vw8Loz
	VbJL446qkRN6g7k5NZN0puY5aFtlFS6vEH4uk5ZEmxJzHd2FCYq91UeM7T70Ukyq1y5NEvzOO53
	rcY8zc7LiR7jsRk6ImCRiJXS1
X-Received: by 2002:a5d:46c2:0:b0:48d:df08:307c with SMTP id
 ffacd0b85a97d-48e07f9eea1mr8965138f8f.44.1792386665312; Sun, 18 Oct 2026
 22:11:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJciObGfAwYw84mVU0knzJcdLkatWsccsijRBT3E9b25CKyF_w@mail.gmail.com>
 <050201dd5f77$4d32e170$e798a450$@everest-semi.com>
In-Reply-To: <050201dd5f77$4d32e170$e798a450$@everest-semi.com>
From: HyeongJun An <sammiee5311@gmail.com>
Date: Mon, 19 Oct 2026 14:10:51 +0900
X-Gm-Features: AclHuK9DmQr3uGkBJ7jWtZFIoG0P9YucGoeb1ptFAsJfIeTqNDQ_na8lPEHvdD8
Message-ID: <CAJciObF6YoAv5vo7ZxxqFwt42XSqdALVm_LctTovLnPo0rh9Rw@mail.gmail.com>
Subject: Re: es8326, es8375: controls that write each other's bits
To: zhangyi@everest-semi.com
Cc: zhuning0077@gmail.com, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Zhang Yi,

Sure, please go ahead. Thanks for the quick answer.

Best regards,
HyeongJun

On Mon, Oct 19, 2026 at 12:09=E2=80=AFPM <zhangyi@everest-semi.com> wrote:
>
> Hi
>
>         Thank you very much for pointing that out.
>         es8326:The ALC Capture Recovery Level should indeed be applied to=
 bits [2:0] of reg0x32, not reg0x33.
>
>         es8375:The ES8375_DMIC_GAIN_MAX should be 0x03
>
>         Thank you again for your email. If possible, please let me fix th=
ese two issues this week.
>
> Thanks and Best Regards
> -------------------------------------------------------------------------=
-------------
> Everest Semiconductor Co., Ltd
> =E5=BC=A0=E9=80=B8   =E5=BA=94=E7=94=A8=E5=B7=A5=E7=A8=8B=E5=B8=88 / Mich=
ael   FAE
> 18179079039
> zhangyi@everest-semi.com
> ------------------------------------------------------------------
> =E4=B8=8A=E6=B5=B7=E5=B8=82=E5=BE=90=E5=AE=B6=E6=B1=87=E4=B8=AD=E5=B1=B1=
=E8=A5=BF=E8=B7=AF2368=E5=8F=B7=E5=8D=8E=E9=BC=8E=E5=A4=A7=E5=8E=A630=E6=A5=
=BCC
>
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: sammiee5311@gmail.com <sammiee5311@gmail.com=
>
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2026=E5=B9=B410=E6=9C=8819=E6=97=A5=
 10:45
> =E6=94=B6=E4=BB=B6=E4=BA=BA: zhangyi@everest-semi.com
> =E6=8A=84=E9=80=81: zhuning0077@gmail.com; Mark Brown <broonie@kernel.org=
>; linux-sound@vger.kernel.org
> =E4=B8=BB=E9=A2=98: es8326, es8375: controls that write each other's bits
>
> Hi Zhang Yi,
>
> I am adding a check to ASoC that warns when two controls write overlappin=
g bits of one register. It warns on two Everest drivers, and I cannot tell =
from the driver which field is right.
>
> es8326: ALC Capture Recovery Level and ALC Capture Target Level are both =
on ES8326_ALC_LEVEL (0x33), at bits 2:0 and 3:0. The DRC Recovery Level sit=
s on its own ES8326_DRC_RECOVERY register. Should the ALC one be on ES8326_=
ALC_RECOVERY (0x32) the same way?
>
> es8375: DMIC Volume has shift 2 and max 4, so it writes bits 4:2 of
> ES8375_ADC1 (0x17). DMIC Polarity is bit 4 of the same register. Is the D=
MIC gain field only bits 3:2?
>
> If you can confirm, I will send the fixes.
>
> Best Regards,
> HyeongJun
>
