Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282AC25D204
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527367; cv=none; b=ZpIYs0dETkynlJj+xfBBgUxNaWlktFbXFbikF8CS5/YP7j1039fEyu/WYynzFypz+byTct/dZM20FoYZHlW9TBA0/FI4PzgYkmDDWTgrnpwBJCnkTtLx0s35E8CJugntB21ba3QZU1xAeMAtW4pD79iXHAYGC3X31CbO6vqkLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527367; c=relaxed/simple;
	bh=eVYDHfh+HOt9+SSOWYJR6L/L+ud08SQ+1nCfxj247B0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZE/UUxda6diCSsqbrNtUc0bn3Xdycbp1RKdZ1yibjO+Cl6kbFpMz51aqfV/o0Aqyby/VX9u+503LywHSPECBmvvkNbNGmPCuriBqI/g8rsWldU8UKWsLgjkpGnPp7uAV2kT7M1Ui73wv4mW51v/MgUkmCY2Ua23XeqYY7MmEz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86a55400913so146213539f.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 20:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749527362; x=1750132162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eVYDHfh+HOt9+SSOWYJR6L/L+ud08SQ+1nCfxj247B0=;
        b=SAvIdzrzqjcI/kJSRRJOAEnFCVdyAGRmFHSOt4xAkYplTgtaFLit2QBYaX9RPTWGeU
         7as13qo+y2Rn0EfYULV8wupSKUKOYexOszSNxqcR0bUR64y4la5wGavXHATFN/Ss+zyd
         1TR9b/I0Y2/6+3na9XQvJwWSRUJ8GvvyjaQ/e6Kbjj1eiS/8tCP2Cb8u5iqiQ/E1HMC6
         DdAiTJqoP0uHVHm8/baWCBl1wwwTievqFgFcEI2FLzjJVE0NhjrjbB2KFUM8O2qSUAZa
         aYfAYb4wJyxy30/x4uqwiSLR4f1p3Mr1sf8GT/5jMnrXV+j7zrqX+1H5pPsCXPvMoSSN
         BLZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaPhvGAVwLypaiCkxuU5RzjbVv6h0FYoiKX6vDnJ58p5eUJCRsa0FW7GVi5BBVP20McWxOU3dUXJ7xzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhwJlGBbnUk3P1Md3xk6U4hdP6h5Yg1TRcDy2qfRRZI5POS+Mv
	KQKtzlAEhUK1NlSRGDzlbrVg7rvotZYh/g9GE9vp5bIjgvN/9rH1GlKJXX+YzWT5Ua4=
X-Gm-Gg: ASbGncurKH6lbGCaLFLaXQsI4/eSFPPFzKneVzkvIR3x+mKi+y2IJW8d43GbQa3fhu0
	c1fSEgLB4sLCfE6GDEuryRoqWJ8LYBjrGeLBOqYzeoBFdPpAFDusVMbNfr6BYLRj5IeiaZClm2+
	hANoJ8t3Ipi8SSKSyRMUP9AG+r5wERurYhbrjhS6SH6PAl83TDMMh5gJHLgrWxfGDzIjSDkuu5w
	NBt2iuRom+lZShNNO8oL7N+FwAHmufQ+NnDGtOANzhkAz5J8pBz6S2r/umOkSQNs1Oh9QEGc588
	JRQcAeAidpo/NqrJ+mWzC9Gk9cZXznjuU4vQrtXRQ9q7HRS0oRXQvA4iw0ydIuog3e6gAjmJ7Qv
	gCIAb5yd6WTqoTYE=
X-Google-Smtp-Source: AGHT+IEBZ5RP+hNU18oMY+6Xrle4KCkE0iOZzWq9IniezHb8KTtfdg9yaxQrFrXsYYB9280UgJiYxw==
X-Received: by 2002:a5d:81d6:0:b0:874:e108:8e3a with SMTP id ca18e2360f4ac-874e1088f3dmr147327139f.12.1749527362220;
        Mon, 09 Jun 2025 20:49:22 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-500df5afe8csm2118762173.96.2025.06.09.20.49.21
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 20:49:21 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86d1131551eso145268339f.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 20:49:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjOA7bFnuYnyzE8OErGb6XsnlGTDbYizd1Mjehh84fHygSab/u3/lnPIykAHlq3VgffzXv/r7IWTZOzA==@vger.kernel.org
X-Received: by 2002:a05:6e02:12e1:b0:3dd:d98c:cca9 with SMTP id
 e9e14a558f8ab-3ddd98cd296mr106363805ab.3.1749527361391; Mon, 09 Jun 2025
 20:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
 <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com> <aEeqsul4gzxde4Mx@geday>
In-Reply-To: <aEeqsul4gzxde4Mx@geday>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Jun 2025 11:49:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
X-Gm-Features: AX0GCFue8ke5AjIXvPJG4czw8sd4xw0d3xvvRvBLbTDyFFpwHr4oKiYJBUwo_dw
Message-ID: <CAGb2v66MU_Sz6bVPrvMacL-wX_XU+JPWxMWjsfN=vPkzRsRoAw@mail.gmail.com>
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
To: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 11:47=E2=80=AFAM Geraldo Nascimento
<geraldogabriel@gmail.com> wrote:
>
> On Tue, Jun 10, 2025 at 11:16:22AM +0800, Chen-Yu Tsai wrote:
> >
> > It seems only this cover letter made it to the mailing lists. None
> > of the actual patches are there.
> >
> >
> > ChenYu
> >
>
> Chen-Yu, did Morimoto-san forgot to Cc: list or message was dropped
> silently (like by spam filter)?

Looking at the Cc list I believe it's the former.

ChenYu

> If it's the latter I suggest to contact postmaster@kernel.org and
> report the incident.
>
> Thank you,
> Geraldo Nascimento
