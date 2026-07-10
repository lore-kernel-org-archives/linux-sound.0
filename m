Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2176A26C385
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691320; cv=pass; b=L/2TPF4k1naA2270otkL+GpoHMbQxG5XfatNcdpdCTYys1CDvziPAyMMjnBtOVYzNc1IL+A/WYaHtS9HUHKKPrNbdV3GsI9r7LqptSgP+z9Gl/nvoSCcLgcpX78FfmuKL91Imc0Pl/ml0iTYyAhIkqAfDgh0+J3Oa6YNWdiaD3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691320; c=relaxed/simple;
	bh=saiKR+cFTgG1O49JEFX6Oece+qr4H5EJOU71VDOAFXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYxsV1cs2UFFRKPA1JOLLWENFn3KS6cq+rQpigAMjk77nfKWAqTUhNxNx4EtsOmnDHY4IEluKdYU68sTujrdnTGUhsRebsIi13BOmdjccMLGNbxcBgXx1qq63byVZXQPDeIrY3PidRk/Dkbk+dHiKw8I5s3qLzEZPDfS+tArA3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLfZ8R+5; arc=pass smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLfZ8R+5"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6a3897109bfso340960eaf.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 06:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783691316; cv=none;
        d=google.com; s=arc-20260327;
        b=H8/pJqhbyq4oAXI47XZzmYZhvAUcpp4rUOvchl359ZjQkNx9YH7U9B/ASAwdBNPxfD
         R2RYkyIBEn3dxQ1j7iH0ikGIC+t7eeNJS5gsx+xxpPk4YxS0s2ktp2ydQDJTcRWn3+Yu
         fVPc94dNTeiIi1pxQaHpE7bol3eiIVBFMZ8VIL5dO31k8MupJiBdcXkZjlG95TnAnDj7
         hgxM8O+rdplKXFwWFB3J48BuCB2pGtnXDyFXYSKb3ZOPpFnuQEtCFkfpwHWR52LXohfC
         k982R8q9twzc7SEw1FddcGfj4+e0orH1Lr15aRb1XG+Yr/ijTzK66KVIB++n9jZgDjtA
         GWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YW+L/tpLoDLTAUOWC8JcO3kSyscZfeQamdsSDgDLNRs=;
        fh=jH869Y1vfQPhU4A6fthsSyWXOMxqEtpWvFVn/mF/qNU=;
        b=BdaXyk62cvUfUUnqxMBbGg9SFQlfrMTMf7gdxfLBoyeUPJTUall+eVE0JVwLEvKyeW
         dnDWzVtYIeQWC1PjXpbjIlWdfCJIOLnFIu47D/1IR3eN1RxVAbyBPKglgOYNl8ZTJ3qb
         fAYz7dbYomOT5JnLMnRcDRUXcD04/PVmOhgp0tVn1P4UGHFjwWEliTXABDvHYpZJSYm+
         TtYXGkwIAS2hjb4wTFooKmB4DWVUbVy1rOYddYuq2DPv4FkNlVpqOJmq/l6PBllaM6FD
         TnYOzl3uVFl4AMVLLOcq8St76xdvdbGcEC/bn6OluZkiyxef8Phctxr0LT7yXI21YgIE
         hZdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783691316; x=1784296116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YW+L/tpLoDLTAUOWC8JcO3kSyscZfeQamdsSDgDLNRs=;
        b=FLfZ8R+5VB9juuq2QzY79QbXc/WtxRd3kDwznaBf05yarL4d7Htx2Z2UEADaLeYJ+6
         0/d0oJW3tm3oalsAthmY/Jl7XMgAj/mPu+OjWXevfcrGuzTyo1Zo73lOtxRJn4cy9nkR
         nMS9AiJJE7pbnAblPOrvZs/cDmXTLWq7E1WjF7QMmVjomu4sOHqjua6U6WBxP2gDdihK
         H4VqMohSO1Xz/BigLM5C8PL1qpypGtiMe/YTE6fhFJQjl4sRPlteywz4P82zgW9jmgcK
         mjUKyGjbgSXDhYBDYzlcn/UbAl815pmJ7JQ2n9QPY3j89cbvuaYugv16gGwz6PTwdUYY
         b6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691316; x=1784296116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YW+L/tpLoDLTAUOWC8JcO3kSyscZfeQamdsSDgDLNRs=;
        b=RU8hbjiCSVlsWmiK3HCP0+KbXJ/TRX0+T13N5cSs6EfI6VIIUB61amlv8i1jh1J7p5
         Gb3kP4K9T4O3rcRaK712JiL/ew5Mf9FI76eZp2419TQXg5aeJM+IbB9QWZ6HuHm9Ruk4
         zYe8JrTuOOeCTttzIb4AyTAx9oaFDb888687co1rL9t4tzjM2l5iyoirnc74mHKcOAha
         06og3wakV2jGT5syqgXGdmtIXmViUOVq11VxNS5bfRZTrRc4VnMNdnsw1Y+ztmexR0D6
         zYJDb+nPfBUcQbxqOxsZhxdjE/cz7Nengox4J4UkNigalK79iTJznYQU6M0gKN1Jk/14
         iAlg==
X-Gm-Message-State: AOJu0YwSNUeMouIuXd6r36nmdcYD+l/IjzbdLLI7fpERAyuAaZW59PIb
	y7gNM8bLZ5S+Qk+ZEpTryUsgTdtX2YnNhMmkyvu4OUt7gO7mS2fg0qtvfMbewfkjnEytf79G3Nh
	GiRFpY9jVfN5jM07xrJudjECC5UsBd1OfNYFRuVMI6A==
X-Gm-Gg: AfdE7cm22/9SrO05D6oCqGv+Fi4KwWUfKNe6VKqOIWS2otCLcZaJhW1ZmpMept6b/cQ
	QVaghAozLe1LCH5ZY2dQenCxnOBuaJyFUTFAkdWv/WaLNAvJ+ct5xAboPpqHuUpnWVxuMZF5Fid
	37J11Wd5tmXLifATTHUB4ZTcyQqaBDdl1crlCcD1aO7ND61y83wTghG9X4AeBmUkNLPB3lqC91h
	n3O4NLKda8nTislewpjWuoQmn0MYzt9whWd28xya+IxVY+pRISVbdtqKLBBpB4Wl0dO5K8=
X-Received: by 2002:a05:6820:169f:b0:6a1:96d2:c477 with SMTP id
 006d021491bc7-6a36da3c0e6mr6618789eaf.52.1783691316055; Fri, 10 Jul 2026
 06:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709095614.1418838-1-tiwai@suse.de>
In-Reply-To: <20260709095614.1418838-1-tiwai@suse.de>
From: Salvador Blaya <tiniebla6@gmail.com>
Date: Fri, 10 Jul 2026 15:48:24 +0200
X-Gm-Features: AVVi8CdPAjsrd9HD6g-lg3ZQMHu5AM_3yu_qHtSJhPgJIlNibTUFuNvLSJtavRI
Message-ID: <CAOdyq+pRaGZKZY85Z8px5BQfzojRXruVLaXjvfzuSOr_XGxLMg@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: Skip DSD quirk for Musical Fidelity M6s DAC
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jussi Laako <jussi@sonarnerd.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Tested on my M6s DAC with 7.0.13 plus this patch:

- Native DSD (DSD_U32_BE) is no longer offered for the device. With
  MPD (dop "no", no format restrictions), playback falls back to
  DSD-to-PCM conversion (S32_LE @ 352800), and both DSD64 and DSD128
  test tracks now play at correct speed and pitch - same behaviour as
  6.12.y. stream0 confirms altset 3 is now reported as SPECIAL (DSD
raw: DOP=3D0) instead of DSD_U32_BE.
- PCM playback is unaffected.

For the record: DoP (explicitly enabled in MPD with dop "yes") still
plays ~8.8% fast, but that is the device firmware defect itself,
present on all kernel versions and outside the driver's control, and
it requires explicit user configuration to trigger. The default
behaviour is now correct again.

Tested-by: Salvador Blaya <tiniebla6@gmail.com>

Thanks to you both for the quick resolution!

Salvador


El jue, 9 jul 2026 a las 11:56, Takashi Iwai (<tiwai@suse.de>) escribi=C3=
=B3:
>
> Salvador reported that the recent fix for applying the DSD quirk to
> Musical Fidelity devices broke for his M6s DAC model (2772:0502).
>
> Although this is basically a firmware bug, the model in question is
> fairly old, and no further firmware update can be expected, so it'd be
> better to address in the driver side.
>
> As an ad hoc workaround, skip the DSD quirk for this device by adding
> an empty quirk entry of 2772:0502; this essentially skips the later
> DSD quirk entry by the match with the vendor 2772.
>
> Fixes: da3a7efff64e ("ALSA: usb-audio: Update for native DSD support quir=
ks")
> Reported-by: Salvador Blaya <tiniebla6@gmail.com>
> Closes: https://lore.kernel.org/CAOdyq+qFaqCh=3DtK_wNnA64hv5pQuA1Y09ANxQ=
=3DxK8yR-t4mf9Q@mail.gmail.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 2949a0d2d961..d98825f9697c 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2463,6 +2463,8 @@ static const struct usb_audio_quirk_flags_table qui=
rk_flags_table[] =3D {
>                    QUIRK_FLAG_DSD_RAW),
>         DEVICE_FLG(0x2708, 0x0002, /* Audient iD14 */
>                    QUIRK_FLAG_IGNORE_CTL_ERROR),
> +       DEVICE_FLG(0x2772, 0x0502, /* Musical Fidelity M6s DAC */
> +                  0), /* for avoiding QUIRK_FLAG_DSD_RAW with vendor mat=
ch */
>         DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
>                    QUIRK_FLAG_GET_SAMPLE_RATE),
>         DEVICE_FLG(0x2a70, 0x1881, /* OnePlus Technology (Shenzhen) Co., =
Ltd. BE02T */
> --
> 2.54.0
>
