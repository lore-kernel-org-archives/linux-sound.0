Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02B53AE184
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890444; cv=pass; b=FG7liI00TSJEbXTTGN5UCCNjl5Knwug4xXj8GlSDk4XFNzt/+oDGgjh+NuJXvsoXI2Vrus6OxcG5YmPlgf3c++ZyQvsxn37nvNRwH/8/LtMTND7aYlGE0TZPYNXVF2QRQ1Hf9Mx/u59Uo6JOpszVp+rflrbUvQ0zP3pfOfHFk8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890444; c=relaxed/simple;
	bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1mVm0K0XRlJmbJjEkFrm6y2qBzDkQ9IB/WyjACjRRIZQoWFfO9YJtIoWByxfXhzGCwOb/0fSXpiLThKj38i6rMITrVEBD4ldWCb28tUPh/vy1WHgIyfXYoOOZE+OduYahm+s5hbA54dMTaqKbh8oefWg6Pea38zXsjWP0UgErI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjnq4TL1; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjnq4TL1"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c9879395so419777a12.1
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 21:14:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890442; cv=none;
        d=google.com; s=arc-20260327;
        b=DxybLo/9288tobLw60Uw4Ml6RDHnCZYYpusnv3MQM6J77XkVSs1pwZTTrCxm+1b4yM
         DNFaGzFNRID8+R1KS2SKung4MXuBgjQ47XLbR9nyKe9PYmVHbbbGR7rGAcNa41jliG6+
         p3iRbrdkNGCE3CrvDGKuG4WKOijB2tdkk6mJIPERUnfKzSOsm1x1luJmrnahuM7guB4Y
         6CXnqRhiCrBCDIYkkVu/DKA2ojTysZY526shswCAkUR6dGbI5EIbRvixuEb9cdxDM1D0
         YZuNMkZN6fg9RgjygPNP5MUZJ9eM6J9GmwVpfkSdF/6LrJy1887selNKPZ1jCcEhqsK8
         JIHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        fh=pkWB4U59Y8XmDvCw+iyL+pE5HllETe7Try5k9eK/aoI=;
        b=fxz7P5c+X3Brh4jH6twj16h2M2ND1nCVlG7ZZ4H2AP//AsbGeuP9oADeWyqYnn3R8n
         B5laUcULFrpVav25rHF6ANR4O6SduviwaNfzu0HPbPwc3q722OZKueVmZDRy8132oyNK
         jbDPaAPJK2+M+wAOBSYTQdNCPJ4jHNdOsx9VtNJDo6MvLgOrwEptlIFCz4DJL6DBfZRL
         qJ61On+mr5l+bSU5fk22+lF2h6WHMzaWw2EHzgpm4XXih5+dw0o/2y21dmoEix9UOzgC
         +Vc0ss9YMco40KV+DDlWEAMV50nGPoW8qh3ZbXi06xfiK4JJTjS73/1jW9LLFYuludN3
         UPbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890442; x=1788495242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=fjnq4TL1WLLFKeEZ+ln8wH3/AUeovHd+IbAI/9laUT/WbE7oS2O280Ioip5RuyaP8N
         myYGMxDQeLRF0u9WUnVzlcR6ARTTQv40EOr/egR1l5bdEvJoBS247GnCaAZlMYyH87DG
         39f95zybQioUpefe9j6CZkN8SnEOQk4zREuPSKFztz9l47zgKleKrHWg0LguS3h3keam
         OISGu6tNCfDC+NlqlHxGShKV5YsTgtX03EScJ0rSzm5VuXdUzb0xiOEXnpg5anZPXfjh
         fy5Wy/ygvxiLkf/4Q8f7dGT9B8as9uwaix6Xidl7lS0M/rCNBub9UDVU0MdXxsmk494S
         IxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890442; x=1788495242;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=n8JxP2xROiXOygBm9puWMwEPHmzxTP6kSGSN4IA6reC2tWVYVqAsCtGhfb54v5ZqkF
         L3eNMB5o77bpH3wNAE2OM93bvarJtYPALAGqeXk9R+XTE4oyCb7+wrhMjifE5p3ohSLE
         X1VkEdE2U4CB0FrqO0Zv2zFh8+q7/4J9PrfeqjEC/1hXJGq+FTvFRQ/YBKnf0YhtrW4O
         YTWNzqVvFP6cEmmexjgeR1onb5mQv/uyBmh1bqlsdqMFkTpdKbhClH7aM2U7Mo2sPtBg
         2BJNpZUtNvSnnuE2NxN4zWPC06b1RxEC7GaAdDU8lhI3Dms3D4PAhWPYfMLPTibHS1KZ
         zAfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop8aXXQCp9yKxFJj7NtXXQMNv6A+W/5G9qHyT29bEPVddzCwkRxCc0cmmL+ihNG/5yNKWm6W1Thr0BFA==@vger.kernel.org
X-Gm-Message-State: AFuF++myKzR/Wtt+9nUYmo/ns/ggyXnZ4r8KGYz2JAr859KqO3w9ZeY/
	qeKDO0t8uT7fPZ50II9D4IDvnDdLAxoMNORk4nFnj8h7U1vZ0m8J7xFbkWY788dXPXUqhUk1zjr
	BUUiJ6+/vTU/0henmOKKRj/wQGQm6m18=
X-Gm-Gg: AR+sD11dzsQocoCvyl5VClrP5Okkx2TTF/TCGWAXeTZW27FmxMaogNXjLnGMw6epJEh
	VFCiY+D8q3OARrY5at9aX241p9MjK0k9UXl+fMB2G54XyQRN3vkRI4g0AWrIrzpBMac//+uNeUA
	M73goN6OsnYC513+bGW30D6PunS21o6beUEPCaYEeIIeFNzCkTlAaruRVlZs1ItlNwpYeiJwsre
	hFSVWjPF1rMfTQtvUsbDNcmHiVCcNxx0TTSfikBRj9hkj1G1Hoaaz3Zm1enV2ZV7R0EvdijnmO/
	FLmv6W4DKF51ff3ePkwKzlNt2iLogXqCgP4/VbCa3ji8Wa7tKYh7L0QuERNbVwsTUTnMf8ckyZf
	OGbJhC8RcYu0zljo3va8+Jb0IpOE2KcKXNJnJ8B3U0aWXUAz2e8Lk6YOr
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id
 98e67ed59e1d1-396d0ed0023mr8931366a91.6.1787890440156; Thu, 27 Aug 2026
 21:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com> <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
 <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
In-Reply-To: <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 28 Aug 2026 11:13:48 +0700
X-Gm-Features: AcwNN1VmqsU00XHb8qwR9ukL54h8LR35XqmovAAS6AwR9_5yGXPiNF5RdG4pFBY
Message-ID: <CAABR9nG=CNwVPcqqDE96JWsFYiJN7pBP0Daz9wi4DvYoGiz2Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark, Cezary.

Thank you for your feedback.

>
> > To be honest, after looking at the code for other MediaTek SoCs, I foun=
d quite
> > a few logic issues and inconsistent clock handling. This, along with
> > the git log history,
> > makes me wonder whether these code paths were ever properly tested on
> > real hardware.
> > Therefore, I have stopped at mt8186 for now.
>
> There's a lot of code there with shaky error handling; probably the
> default case works but things blow up relatively easily on error.

If you think these code paths are generally functional on real hardware and
the main issue is the shaky error handling,
I=E2=80=99m happy to continue reviewing the remaining SoCs.

I=E2=80=99ll also apply Cezary=E2=80=99s review comments regarding the cloc=
k handling in
the mux disable path and returning directly from apllx_mux_setting()
instead of using a goto label, and incorporate these changes into the
next patches.

There are also quite a few uppercase goto labels.
I think this cleanup can be addressed separately later.

Best regards,
Phuc
