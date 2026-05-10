Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1BC33F59F
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 22:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778450943; cv=pass; b=CgbUkR+wyrReWs7PluOrqkKM73G6P8GWW4uIxHrtjp2drL6S1Imo0ziZ0V1nMQsLjsxjE9RldvNoEe+SPjE9/t5xBhe63PgTqTi3DajFvqmrXHF66DzUQUe5op2gaVQfnXXOOialt6bokoXV/S3KWkFFDQjNFk9r+M3atfVyfXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778450943; c=relaxed/simple;
	bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DvPcGxQ/b6t2WmE1LqGGsRE/dLbHng43YSEO3Nr16jC4hwlGBalUKUKeQGoKN+3G+okXpBR1+F43yoWQ78oukuGUSUm6D/hJAea0dNNwM0d4KpV7FIwplOanBmTKoJcr1UF+NqAC0cD+cofmBHdDqTnJ4GZGm3dB9M5J99aDgIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAHcg0bS; arc=pass smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAHcg0bS"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8b8e98fd885so32462796d6.0
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 15:09:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778450941; cv=none;
        d=google.com; s=arc-20240605;
        b=Eo87GQJ9XJrxWil0BZdt+ix9wQ/LZ1H8uilcqOq93Da+uYlFIpC88kjWnhflMADXAQ
         jIaUfGlx79Qtbv1DFJPdHn1BZtDL4v8jI4IOgCWO6EGxg7vyfmnBdr5Q45h7jz5qlrZf
         HB+hhw6xcYKfjWqS5ye/8WlaLjSPmsTe3yzKSGX6GFxrolNZE5nwT7XkJEzIKvcQmWTe
         rd8wBp3HI0h/pVPjLWGfaQ3nprElHKA5X2g2ZGUB+cqdohFHKfBBtlI39EbhT3v5fzmR
         dWuHpX9UyVflNQHr1GdJGGJp5dr+YFWYQkA3pjK9ZeoEQiMVsGxs5BBLdHmKrP+UnMLw
         Ae+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
        fh=DSggZU4IA8q6CDZoKCe9tGR4+OU9/FiWqtofAAxio8I=;
        b=AOLqO9brMfArwWD0E/ZBMv863bzj25vsxkyhmwjQR7rPSdc7ZbBpLLgR6VOmQtX6cj
         2egzBA2xMPtYC/zHb3OXA4fNX6UoElodC/Tk81oYKhfoElKiiOMpeP/w5e8dZN+nxH67
         0ljtWcfTi7khzGAeAUVUliekbmMVr8y1We6e7yxpkjn16ltay1REIxQeqaytVdSZjX4w
         vpTKzxV+FbDXemgCS9sdWu2/Fec3uMm83GJ7mvUYF5CaonKLr/9FCJVhAlur9+Mud0ce
         4q90Zi0LU98rd4myt5YDH5gZTCEHrmsQq8skumMeQsiyt5bUxuKf6FXfBr+keZx0ZYjo
         XK7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778450941; x=1779055741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
        b=mAHcg0bSK3Xo3YVbNrpp/euGAlbj6AwkK+ESjipXvF9QtGWiUpIRDseG1Vx0PQhE52
         yWPtOG+a2sbtbaK98wgCi/mxjCe4rYNFliJne8X7cn5/R3CeyRQ8y1Jw2tMbzqw1L1d/
         BGppQ1HIIT68DZHDJRsvdJ0SBpakofiYVS6A8VvVMafg3QR9e3awh4INsNpiQPUkklKC
         kUqVfrHsp1MPln8gJJvSneSHAg/PGeVQ8gwpDzf8HSiWqLvALdbd553+0C2d4xJqs+GM
         Es7d/gj+asckO1AiQlrxhQeNccCvwkMmrS8oII9tkaOTpnaXJsyZVeu8Y3FdfyYi8Xw9
         uoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778450941; x=1779055741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1yrTTVXylGFrsJYsMh8CkWGl03wOBlEHIHNMw+NBNFo=;
        b=HkpaHJRj4yKTtWydsxN/fO7cYT6IeZ8HYhRc1ZyhdDdnTU6Yo9HWH6/KrFdZnG/Kyb
         0YFyWEJ0AifuArqLT3kKxE0raYMYJxHjVi18KnCg3r2z4gSaEMzqh7Am9LGfRo+ucjfv
         N6tPd/hEggc17dBsHp5FnOF33LQ4c51pJvg9bR6kkBtpstI7pEq+a25eMlpfUWExQm4h
         3m1ITpWJSRs6/TMwNgb5svl7GZrLLq/HTU/sAUGwNCDZ/P/dP+1ZjiZ/IarW8AQJ9phn
         davq47jkyVI9TWTR4jQNFaER+KBgQy6f/husJgS8fBOr0jVApTI3n1FTyQ7D27zT3T2j
         ESjQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SqMJZoqHBvSFi+Tzt8lHBylBrAzGSJcEXT2DhPK0cphceAHEfmW2NNSPN17biMTeas5bBtd6T6gVmNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVFrj9T/gl/HQEzKlCnerXRmBlslGU0gy2qJCqbagReCFCAIm
	rjFI6/KR6Vfh5SsXWKIicurxDLFpYufuVgI6oEz45x7n8rgQz8XUZP1f6WOPK9P44Beal8EQLXZ
	KC5Z/EDvBPWV5RpLG334AzFq43AGSyss=
X-Gm-Gg: Acq92OE7zvIB9KAf6XoV0cFNUbbnHSQRLeWgFeC+NBgtzDTraC/FUWsUaYp0kFW+GmH
	kIuNH1Ubx3rnUaasbyfrXifiqy0TMx46L209qBiuA9bfsFPpIfjcuIKW40bTAoAbMWiUDkaJI5c
	zrtkHWOfxpYhULARYUV7rVUie9W9QTBoGTaa+Aje+JvqpS5alk3FsWR78OScZrfLbhMUgBJzSSu
	567LSsqih4TkLWXAJqkInRK2DWQrMv1/XOPwCLrxQKU3Sl8+eioF96eyNdxkaurJpo2k27E2NI7
	tqQUBvLpkhHxirVC7X0r5JzAJvcGit/uskCWinwzkZh+swqVya4SzVCWR4H9Lj+Un0UUP8ElQLM
	JSKQ=
X-Received: by 2002:a05:6214:3490:b0:8ac:ab13:8f0a with SMTP id
 6a1803df08f44-8bc42f53191mr314809106d6.11.1778450941019; Sun, 10 May 2026
 15:09:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509214622.38319-1-enelsonmoore@gmail.com> <agCApXl_RwG3r2iu@sirena.co.uk>
In-Reply-To: <agCApXl_RwG3r2iu@sirena.co.uk>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sun, 10 May 2026 15:08:50 -0700
X-Gm-Features: AVHnY4JDFuVI4-B-XahTUiCLtqmXV0RUBZ4Lk39M_7mYtLJwiBRvGg4tyN_TPIM
Message-ID: <CADkSEUh99OCLYp3T4NUomQeTAQRe3ZzKTewD0SpNzD7a1LttEw@mail.gmail.com>
Subject: Re: [PATCH] sound: soc: fsl: eukrea-tlv320: update board checks to
 use the DT
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mark,

On Sun, May 10, 2026 at 5:57=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
> This renders the inclusion of asm/mach-types.h redundant.

Good point. I removed it in other drivers but missed it here, I'll
resend the patch with this fixed.

Ethan
