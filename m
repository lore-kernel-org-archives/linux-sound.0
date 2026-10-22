Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792660739;
	b=HSsjvRN407UOcary2X2zfDAT98uQ/uY+4So7gEYJmAtbcKagMDjk2FZYF6yr+692bLhl
	 cZjhAASsMphAMx6w6/61m0IhH9BDXLs9sowgJKNgJaGyIMKqvOxfSfGIVhpteY6f6xRy+
	 KCDcmxGQL0TXu0M/5zmUd/wlwJ6hg8BsOdnSBV83SlKiMpq1Sx/auL8hDpXkOEwgfO6XI
	 URvPOGYziJG90su3AfUal03wACGf4d8jXuBB8U4UAtzN7FpWHxzGKG+mDL9mo1y29o4qJ
	 zj+QoAyFvBa6fRBkRPYlWgnLieLjMbW8+hxigJgZlRAit4G4YvrtETGWlhnQ87DnY4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
	b=FnF46WIRNFf5EToAXZVNA6OBsYsIeJmDL7Rkv/76KTWgod7BAgg7gvfrAS3W8g4CHkTb
	 JwiqZwaH4s3fweo9+muXIUPHmYw7EVNw3aGMlgNiFAVYfRMJ1ozzeSYAhdQckhb3dNNc4
	 7qXyBBosX3fn341+kQdx+SL6RlvUMtV7fNeehvwHAAcS77wZLQqzjZQvDflazvSMkkEsQ
	 IVNA9enwJKNPBrdBAufdgo7Xl5Yi7iMQxgjGDzcBEcrSAlDr1SbX7DwosJw6+Mjpm1FCT
	 +fKHZqPrf1+y0irxNf4lr4xAcKrXVhUaxPKt6VCeUoYV/WQJTfDJhj6sdepI6DIQ8CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IxwotdNC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2212B606A31B
	for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 09:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2212B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IxwotdNC
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b056d58f2aso15012397b3.2
        for <linux-sound@vger.kernel.org>; Thu, 22 Oct 2026 02:18:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792660738; cv=none;
        d=google.com; s=arc-20260327;
        b=gQI+HF3dgnB/MS8PbVdkvqgAZ3NrwDIzhBiBCGeGRWqZM6SSHsHun/Efp1iFL+ab6w
         BsQ/w8L4tFcX+XPBwA8Iv/w4ZoNjI40Ym76+KLhx7KIxDOXz93W0YClkiQ6Pg8Bryi8D
         JbBv+71qN2B1H3eR2XOM5BlsHng3sQDWw4yepJa9MqpTK6tRYgrZjhl5IdRCIzw8JdyY
         /24M6aziPLX82PwHRw/KyVwAmMoFD/9WfB4KQXTsott7RtWiyCcoBTjb/cZX3px5N1yu
         3qOtNJStyxFKBF9+qx5z9xqHEoo4xrJXsGXPklbNubz+Cj/m4S0UJifcV4/55i12Pbqg
         z91w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
        fh=qr+yBG8FosiIFGK43asskKFEpZuH0+yJlLAZrbBOsxk=;
        b=AM7LDmr0qdpxiEn/4DGU+10lxfAOHO5zsWR9tNNAqUwamaEZpxvmB77+C3VjI1/HfT
         f/U/P5/p0fJS6vSmXy4OCMgWML4pPrdhl59eyoxs1k2ubqmLxGQksKPwsp4hs5bGEZrh
         7W3Q7SAyIllnFtyUz8zig4Q4uDJWQAHo3ykOdUsu5TQL5KkxFTLzXqhQkm8P0LJ5ucOj
         XrkbO38e2sUH9SNV6lZXg2D7ZAxTL/+DNcQPra3sn36DeBOEdhTCNo9uGQlNHiv/7dX5
         u9lFA7xw8VaCAOGeHkG426MDhlBZdaWQpFp7wvOBS3uRdRH69abhez7H+x99eathIHLP
         Hacg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660738; x=1793265538; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
        b=IxwotdNCHuKfjhRbfIKE0Omlv20UdPKRKi+FOPhj9x8dNnWaI6GEjyqUGoNY2lNwG+
         jui//yue9iv5dp1ZaHGgORXCS+bB0i85xKD4cZ1L6g/U2XtUnCrUf90CaH41BGNXapX6
         m5N2UlElDhcd/8lVNgiJysLWsyX/ZW0eLgFw6mqP8WDqw3i/QsvOeWCRwyLnpLgr/eMA
         1AFFzGSoA4K59sx5tWUpugRjvibzMaDOpoIpryUX7U3QQrv0vtXQfdrpqoacWjOpr9Yd
         9FP+elsePreJn5Ka5mwRb22gyI3eYdROnSQwqQFrT+lVG2oH+jdmd/Mrb/vfO/9rgxVB
         l2zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660738; x=1793265538;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpzYIyETtrp+kpnPDh/4yQ1NnnZqaA+hgyq5gKXO1cw=;
        b=N3tguG0wymrMX1/fl4ijPVgRZNb7RgsMfpdga9BAG5kXsUEF6NcN0l9jZ0CWr63zlP
         39TKvIy84/bIGSXPUgT27Q1QX6JguFuM5zXLSzqoi9rXMuOiDgVKaB2LJwUnt/lG5rBr
         fMIb4C2wAVw0YkQ1ND0fJfAPCRMPB3kirhvcb3rPfiusgdLs41wb9sDLtSniEUVWsyzV
         J2Iv3IiX/hQwESotgRJu85XKffTPPlSFFll7SzYSd0HQ4ho7gtpYNv+4dNSpo7kzx2ow
         T1FDwjCvw324DeHCpkCihFCBKzHAjO3XzgPhFBwBoLOAbEw383xJ/QVE/C6Up7xlXCWA
         pN0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7WLwxeOsB/G4u5nv3cPL4ZTu4ZX2XUWx6tKhxh/iQrdRf/LUgQI0jsgQE3w1x2+aBlMLLgVrqzErEMg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIcFvYLOYj94LhJ2V1HgqCn79iwzYUmPLy1RX6pP96BYOF6Srr0
	EpCn+NvLD2dlTGGo8FocgfmyL1gnetkk0P5cKIiRHeX16eLmbqrLP1ZJ3uDhMrxVYJHDeLpgF6u
	V+r4SNGoIAlhsKYDLj8x2koOFTz1HTiRU24hZDL4nTjkq
X-Gm-Gg: AYBFou3XQDFfv9sj+gY7iV4du0AqcXxKdqoJRSU7HcBDV9VzoIRDTUhKlRgGmLwBdVb
	40y6tBseyQS61tHVTkfvvvOBWNaD5dEEXNEuNE9x9qVqVMjHa/Hy99lrJ73FB133tXFlwmexnuu
	Yi/2qtQ9tMXK7ubia2OatDTJylMqj+qPXMJV9J0FyUjkUsmsxVOH2EmYa6lZAPKcZcN5fZC2y2h
	5pbGsXOokdiFmL0eU8xOcQsl0+GiioYg7XAe+xqNjBjFR6znLN1kBPRDO2JgHeiPi9lceDeQw26
	CKa4uhwcvtDr+yKeUSUrWKEkyV8MbtmsGilPxM8LjXJB8OlYaFxwyfpth0gkUEoFywia60G9F05
	rLM10PeI1cvxDFj1GMoF9ENXN7Dou/g6A1i7+efE=
X-Received: by 2002:a05:690c:e920:b0:8b0:9f48:7527 with SMTP id
 00721157ae682-8b1340d9917mr17873067b3.98.1792660738182; Thu, 22 Oct 2026
 02:18:58 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com> <874iegiru8.wl-tiwai@suse.de>
In-Reply-To: <874iegiru8.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 22 Oct 2026 17:18:47 +0800
X-Gm-Features: AclHuK9A7Bf99Ub6U9C075k5xOErMS_EvaFBGDDf-HrdtO4x3RNaLVCvCzQXATw
Message-ID: <CAFRLqsW1Th+HRHgzwB49fQ7C3Ea79WHvgiG=EMGpb6kFRStmmg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: opl3: Stop delayed note-offs before freeing the
 channel set
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Takashi Iwai <tiwai@suse.de> =E4=BA=8E2026=E5=B9=B410=E6=9C=8820=E6=97=A5=
=E5=91=A8=E4=BA=8C 18:33=E5=86=99=E9=81=93=EF=BC=9A
>
> Some issues have been reported by Sashiko.  Could you check them?
>   https://sashiko.dev/#/patchset/pm-pmb-4552c4e605507d8d9b16-v4-213af356c=
0046331c8ff%40gmail.com
>
>
> thanks,
>
> Takashi

Thanks. I'll check the Sashiko findings.

Best regards,
Cen Zhang
