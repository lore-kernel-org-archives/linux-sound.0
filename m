Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E363E3158
	for <linux-sound@vger.kernel.org>; Mon,  3 Aug 2026 09:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749298; cv=pass; b=Lt3OU7uja/gsxq/tg2IPCwxFmQ/3tcgAyr0RRapU43hJZhXfTUZVc4zELkzFbBLbDj+c7mPFQUnI6ky3xQ7DxC4FkZloLSaptcrqLvCrnn1f1zCOarzOKERPXdHdIoen8lVhOlVhDls59vFMXjepUTHum5hZjTzJNhKqA1F+bok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749298; c=relaxed/simple;
	bh=JcolyRM4Q9A08BjGnFLe8Q10QS8hLNpVVGooG+UmAjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6QAVuHYz0xfruneqbVfL6PzB1vF882xNAmyKvEw9UkJq4opyeArF1w82CoivVYKlBRhKn1VFaD41LU6+/Kv1EfMrpCR6wEvFqakaYDT2lPSEINg2ggCzLOMy1RZaiZseCK/7WnWNtEIRLrdF6J72Sa2cEVaZ55mlyGNdQkSygw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw3jv5+K; arc=pass smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw3jv5+K"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so3643507b3a.3
        for <linux-sound@vger.kernel.org>; Mon, 03 Aug 2026 02:28:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785749280; cv=none;
        d=google.com; s=arc-20260327;
        b=mi06pMvY8y8kMxW254ZaDa6pdwK277HsybYadNkXNxtsmo0XGwfrhjPosEkJRi3kGb
         sQRfPUl0M6FJ/XCJ2GNxM+dOwh8asVupLByU7jH6OkLIyCtJnD+itMOR/nhynCuZuhu7
         Ls6y/oU20DkeNOOMwKqUeb4LOY47IsfB2V0HmlhEQ47CPUznywi0vLoqSU6Iwq2afzOE
         AsR4DLxHun6YgYAZTkEMxmpyBX47lH6ZyQv7hN6RyYhQ1y5mGRgAE+dwutu5EVl0oJ9G
         m9XwxjrDJm5RUNGrpGy+1mM6SYcBMYGhXsD2i0MeQt2VgBQMtrxR/uYu/D4Uw5C4i3qT
         mqsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UlMsIl+VuXlHygu2TPzW1vTmqDPiR/bgauI+jx9HDk=;
        fh=EhN6nDfPmMdR+rxRbn1vxvfXBWiG8hvgtIU3vVoa2Oo=;
        b=DF7elvplefK/zcmlBferLc6JRXY+HlawBx5M/mXiXQCoWhp0o4E0zxRmUyhOtLYf+5
         Gq7qhQX8g19e7sb8h8fZ/hojYc10fgtf4nfx6E5U30IecSAhm9Ez3ThOk8PZDlSRXe+j
         NESBHrTMZ7Jpm1gRlwRoHfHsAh+Xsz4Lv/F9QUfgXUgu6yc4SRQjepoptvQAzoEjdJ90
         2k4Q3uNXe2SkNuj1gdjdkfeMfUpnNmMN1kUeRkljWVOTbeaTMxvJQ3jum4onjoHysuKr
         ur7SyT4EoYZZVyrCCapPkHYrhJaPDdBxyyGQzYGFIdKi67GeLLLrlELHcsNmMF/4VpCd
         VOwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785749280; x=1786354080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8UlMsIl+VuXlHygu2TPzW1vTmqDPiR/bgauI+jx9HDk=;
        b=Pw3jv5+KlBknocuCXkrFI++qjZ1SpXdTRGhtxAz8Ul/VzEqNGw+Dt4ao7DSTNmbLKn
         KzUrzwEiTkXivlB0CiP6HEJ1vLXpbpGD9PmxH5v8FtDBEL9ccKKU/l9fRYhLy7HMA/NO
         SbDvCB/u8KEVwnwfpC0Oevmwvw9JjZThhWyi4hbjh7XpE8/QEjX1glYgaSxSP6WSJef/
         FguL+6gLLPgOJK09fABbS9Ht5oFewD+XPwKV5LoXYleHSmovFZ43czyZd+i5fypXW2a1
         5QlH+ZeOZiNHE+TGhpvdIAxBGausv3x4KWL3546166qJWcdInRzaKbibjDqnYwYpvAvt
         C5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785749280; x=1786354080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8UlMsIl+VuXlHygu2TPzW1vTmqDPiR/bgauI+jx9HDk=;
        b=FfyNilTSDOCyb6oeGCSVWLxlbKp0ViiAH71WcqpjFuxCl6bpJgses47765dkYSsCWr
         TK1YAuXLXxkNWTT8dtzP2FJhCeFzt4LsRUAJOc1/+RhRzaNjZfh3Q9SFHOQ30CK6xOOe
         LPqrtfBgkO+N9b2b58jucVXd/uXABBUYU4NwN9r/eEo4tM1p1+Ont8XCjq2mZe33m/u3
         tmLaA8cPDD6UIGCezREbqQw9cUE8aSxlRpmFEplEl0TJG2eIN97bMKXoxSMlunkMkUmR
         ygRq9YZodzZ6Vi448poWbhaOGxI8/Pa0PIZxq9y6tUeuB0dL6vDsa/1sqBqr080R/u6u
         pveg==
X-Forwarded-Encrypted: i=1; AHgh+RobAZeJr+CHoKgY/REbvLlKvA8od9InJ2uIae3DibvtZgCbbuRwWLcyIw2A1VLBKYc7fa23LRFrH/yUDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfiyqFRsQHkX9z02lP7QrKbDGfBiIOPGyj+cB6ojIuDWHKU0P
	Tie9O5GKDuOaA61N1YwYi5O79Ys6+Pa9Io8CbplQmG4yxqCUtBEoGZcUMZqiAfkHM7KZ+ltbovI
	xUJ79Dik8E5bEjwUi0Q99ieXvhkFPLG8=
X-Gm-Gg: AR+sD10D+RrXGJ2PqmT2emElhz6pEBUwhnp2PLazDDrBoHabnB9O/MNM37yO4pM0pIc
	SGjd776PQwz2pV+KeX4LaWrXRto5lUtmT3bliEs66G/xGsN9vzITuZej7ynuRVB08U+1l5edY12
	EuXHLs5O2BBv1SOfrliG8AK4B25ttriBJP8t9i5z26MXc/PG1FNWjXkh8hLT1ClwfSI5feWgHDH
	GMjwyWdttZPLstaPjQEqwKY56l/vBuww4zPkSlwsuKR3HHNBLjOf/LXwDjUhigKhhT9TV/F26LE
	ay+7rRhIZ12fwPTAQVQ9Jpy+ZcLfGdplGZM7dFqe7H9EMmclDYMCebCn
X-Received: by 2002:a05:6a00:1911:b0:846:f502:4cd5 with SMTP id
 d2e1a72fcca58-84ee47c7b94mr8424797b3a.20.1785749280073; Mon, 03 Aug 2026
 02:28:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALSz7m1PvKUrYvdXfQdA01gfZPh=1eW+1n6HTkxzmk4azn6CHQ@mail.gmail.com>
 <IA1PR19MB7712F02961FF50333D5055B5FCD72@IA1PR19MB7712.namprd19.prod.outlook.com>
In-Reply-To: <IA1PR19MB7712F02961FF50333D5055B5FCD72@IA1PR19MB7712.namprd19.prod.outlook.com>
From: Pengyu Ma <mapengyu@gmail.com>
Date: Mon, 3 Aug 2026 17:27:48 +0800
X-Gm-Features: AUfX_mwBycPQtVffHPpsXjATJCTAqCqnpXrKf_RHCVc83qRzbdTgy9bRUIEq19M
Message-ID: <CALSz7m2msK78ffGQAW0gyFKLFsh8JWTtoFEgZ-U4V9OPmL2sSQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] ALSA: hda/realtek: Use AW88399 I2C fixup chain on
 Legion machines
To: Marco Giunta <marco_giunta@outlook.it>
Cc: damien.dagorn29@gmail.com, kailang@realtek.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, perex@perex.cz, 
	songxiebing@kylinos.cn, tiwai@suse.com, zhangheng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 2, 2026 at 2:34=E2=80=AFAM Marco Giunta <marco_giunta@outlook.i=
t> wrote:
>
> Hi Aaron,
>
> With the added context from your reply, I did some more testing of
> your patches on my Pro 7 16AFR10H and I can confirm issues 2-4:
>
> * With the current upstream code, plugging in a headset locks
>   the mic to the headset input and marks the internal mic as
>   unavailable/disconnected. Your mic fix resolves this; internal
>   mic remains selectable and functional with a headset plugged in.
>
> * Headset inline buttons (play/pause) work with your patches but not
>   with the current code.
>
> As for issue 5, it's true that the "SKU not ready" warning is caused
> by the 0x1d pincfg override, which, though harmless in practice,
> I'm happy to drop.
>
> These are real issues that I missed because my testing focused on speaker
> output and basic internal mic functionality, not headset behavior
> specifically. Apologies for that, and thank you for catching them.
>

Hi Marco,

Thanks for confirming the internal-mic selection and headset button fixes.


> That said, I still believe the correct approach is to add these further
> fixes to the existing Legion-specific chain rather than the generic
> AW88399 function. Would you be open to preserving:
>
>         [ALC287_FIXUP_LENOVO_LEGION_AW88399] =3D {
>                 .type =3D HDA_FIXUP_FUNC,
>                 .v.func =3D alc287_fixup_legion_16iax10h_aw88399,
>                 .chained =3D true,
>                 .chain_id =3D ALC287_FIXUP_AW88399_I2C_2,
>         },
>
> where alc287_fixup_legion_aw88399 now includes the DAC override,
> mic boost limit, suppress_auto_mic, and headset mode setup in one
> self-contained function? This preserves the generic/model-specific
> separation while incorporating the new fixes.
> More generally, I'd appreciate your thoughts on my comments on the
> series' architecture, as this affects how any combined fix is structured.
>

The current chain reuses existing Realtek helpers for the required mic,
headset, button, and DAC handling.  Its inherited XPad setup applies to
these laptops because they expose VPC2004.  The ThinkPad helper returns
when the ThinkPad ACPI nodes are absent.

> Regarding the DAC routing: I understand 0x03 also has a volume amplifier,
> but 0x02 matches the Windows driver configuration and is the established
> pattern in alc269.c for this exact codec and pin. I still don't see a
> practical benefit to routing 0x17 to 0x03 instead.
>
> Regarding 4.0 channel maps: I remain unconvinced this is useful.
> Even with speaker-test -c 4, all it achieves is the ability to play
> tweeters and woofers independently, which no real-world content or
> use case requires. The correct profile is stereo 2.0 with both driver
> types playing together.
>

Thus 0x02 receives FL/FR and 0x03 receives channels 3/4.  Forcing 0x17 to
0x02 collapses both speaker pins onto one DAC and gives the parser the wron=
g
output configuration.

The four speakers provide users a choice of output profiles.  For ordinary
stereo content, 2.0 is the preferred profile because both speaker pairs
receive FL/FR.

> Regarding the jack rename: I understand the symptom: GNOME prompts the
> user to choose between headphone and headset on every plug event.
> I don't see this on KDE, which suggests it may be a
> desktop-environment-specific behavior rather than a kernel issue.
> Is there a reason this can't be handled at userspace level, rather than b=
y
> renaming the kernel control to something semantically incorrect for
> hardware without a dock? Alternatively, can we find a different solution,
> or more simply a different name?
>

The jack rename gives the headphone output a distinct ALSA jack identity so
PipeWire does not group it with the headset-mic route.

> I'm open to collaborating (e.g. with a Tested-by tag) on a v2 that
> combines your headset/mic fixes with the existing DAC and
> architectural approach. Would that work for you?
>

Let's wait for the maintainer's review to see if there is more.

Thanks,
Aaron

> Best regards,
> Marco
