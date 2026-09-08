Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023EF399368
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 07:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852780; cv=pass; b=d9f8Fe8MA05QZfHaJT6t9VpVaZQ6HBXi7KNlLk8s1Ao9ZCRpL5zufKTVacweGld3jmpl6nKpukfq36hLtFFeEaZECKmhqiGwztg0BEx3d7jKYQKwhGOWBKH7XfnViUD8sm772/CS8FxkiVaF5MPjO+LGutnL9OLd+/DYM8W3bHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852780; c=relaxed/simple;
	bh=CCWnFFymHxgj5y7ooHLgVOk3FhWqdRL2iKWDIp4mYRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKehjyaxxVJdJ/E+Ad4W3Xk0GkaP3NHUoCgp9Q+3B/sZQcOmpZEmyqmbWmxV0fnNdo7RxinrEYoghdwy3sG/mzTtcxy+NF875c217r/XfpOoB/Usn9MyCuUsC7y24bJokjcaUjeTnSUSgiZOGwMZfnRDZYYdaQfblZvXExOpkUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+ycxQsR; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+ycxQsR"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a8eadb2e20so158174a12.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 00:32:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852777; cv=none;
        d=google.com; s=arc-20260327;
        b=iPF9Hpm58+iz7IwZQuxrwmArmk1S7AEoNr3yf1RxlkEftdDYB4g67RKqbDWDYfT7Zm
         +UtKC38uK+hVJITV+plyaVPsVz/6altGenoTR6UiLb+TQzAbk73eZrJOK/WKu9P0q2/r
         jI/+fvnHF8jcFrohj+BkslAmOnw0Ifu2WjqLVjoRSU4hFUXZh5eXp9TBeMIcq6oTTUgX
         yqLJqXphxMroHwnsZKEK3Guxvk7M5iREyHHY4/1l6aDaJ8VaODu5VQKbibZGYTaNt/dm
         wQyWUXwY9fl0iTuTB0dGjU2/CAtXgo25wiPuv7E3WO2tL/kr+67R/PKedx4IHGi4kDhl
         TRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nvyvXElKF6PnOsUQbFL8excuTPpXutA9PseCbC/VnRM=;
        fh=V8W0TViz8XU8Pp8/scINkR8Za+A0ROkPCVAQr2owVZg=;
        b=FwPBjVGJqZmnBVOCYsNJC6wiZimhR4t+0KSJg90m9H47IXrmuFzNnxP2qRP0dJQ8mD
         9qvCM9xMOv6TFy4MoZyF0yh2h3ktYw0HoxsH6PIyoNwDMLep46cCktQQBDuMQgDmuqkN
         8YCziNVp5pdulJZrXfmowC/f1+jdgDuc9QGGE6Bvq8Y7OWDlVFzDbFBVU2o64oGfREvE
         n6Z3SHr2gP7F7ktgtxN+FVnEnzweNT3jiiMUNdW/SP3NhqkZVmDfx5jct0MrX6MDKWXJ
         6496GdFT06BA08Nci+v/895QpxP2b5yVIEnBLlGyf9ryWhgq/sDMKrkjgm0PM8ZqeVc1
         HuEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788852777; x=1789457577; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvyvXElKF6PnOsUQbFL8excuTPpXutA9PseCbC/VnRM=;
        b=T+ycxQsR7bYsZiXBs8+Cj7D4a0BksHRLb9XasbYNxN6PkPQJC+e6pFOWf7xIVFS19N
         V9fAeJGA9qXdu29KLiHInxc0z6vWNp4j0zZKiI2+GZGx8LygdnpW4oupetytTAzSKBGw
         /Z+FKALjG0uBJhJikU4suHf49KlDJ7aW/PxitTF7iiPIPkHNy3dVQzc+QltAOlds9M5Z
         mWG4j6yv88Y5gThVRO7sufgdmkHiBIrHXcJypxOGanVYTKaeZs1hmEsalSJ7aL7OVSU+
         MBNDJC5PqIhuTmsSXorGKVAAX/yycI0SJNYTdtQUVMa4fJ9E1yGxQR426ueiWb3ExzCx
         MTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852777; x=1789457577;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nvyvXElKF6PnOsUQbFL8excuTPpXutA9PseCbC/VnRM=;
        b=Z2mWJnXjyRRJnQR01h6wLMjApvgiZh3eHU7A94TB2hphJj2CMNRIndDcN1yv1/uOuO
         jU9w6eKoBICbW3xBk0WIX+vhlRazYWbiHnJ6muo3grJkK5PRNUDpSDCcGcutI1Jr8/Zy
         o7boUWKNyuTZCzJkU6QeEUqr69JkDRmNSE0t71xz5+mXpVwzm7veJKaWE+85dB8odk1q
         I8NLjbW3BTxe3g9fbiyOgeWRF0jq159hA2klUu1WHQxbaRXlN897ml1/oe4bGSTsfc81
         I7PJDzpblfvkjvKtZ2ZC66dFDR4zQcCxO+WEkf1issqujAtgmqDjlLahakrlGYeeF+cH
         EfKg==
X-Gm-Message-State: AFuF++lCTBru5c9AyGtr+ZZjdONV+4DXO8eCFw8RTAmkSRisC44djrNa
	9E0z81JC0g6SV5msAJA0ZtsX4pqvdxc4GTMh29VfE6HPDKajGOk1iOCBkWLIMojObCpAhYhuXi0
	IO+oEk1PIzKR5JeJ1xCPL0huJ9WX8+IY=
X-Gm-Gg: AYBFou3Lfi1AtgLBasxXuJ8NYmZ+FxmnsOhcc+nSfWxBgSrrnEKfEa+RVZWf9niNDA8
	Z5I6TJLOmIXyORr7hIAWVWmRNJ4kmRNw/17GIbf6NlhfVldZsKDQAcX80u6gksCWVBJRNN5S1rK
	T9PSwMTRhyCarsMQt7JQnqSm8gphaZ/D54TW2YUyOa4STKWv975fe3FeBl/QORM+g/GWkdYtMnb
	hxKh+gFoQJrOrG2u+6GZgF2/oGaTUESZX6tZFq5sm7LUi0mipAdLvAZ/PvfSWP4OEIgwBS1cWEF
	CdlBwh6hGjiYDK516+mYMQU5fzb0hh4yyX3FX7RhQheTqg==
X-Received: by 2002:a05:6402:530f:b0:6a9:2a18:fcf9 with SMTP id
 4fb4d7f45d1cf-6a92a18fdbbmr87261a12.45.1788852776426; Tue, 08 Sep 2026
 00:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKwi-_QqvHSDFnt3A71RRZRyaWPAOWArZBHVHffE8znQw+B8+g@mail.gmail.com>
 <878q5cqk8u.wl-tiwai@suse.de>
In-Reply-To: <878q5cqk8u.wl-tiwai@suse.de>
From: Eirik Kvalheim <eirikkva@gmail.com>
Date: Tue, 8 Sep 2026 09:32:44 +0200
X-Gm-Features: AcwNN1WFnu2xb8gNsod-m2-SKZNX-yfToKMoZq7T2zxRNTsHZBOKXjRBQPcVfAc
Message-ID: <CAKwi-_RK0no1S4JgNBj85a5ZC0WiK1fb9u+Eh27kFCHvFyf_7A@mail.gmail.com>
Subject: Re: Jabra Evolve2 30 SE (0b0e:0e36) needs QUIRK_FLAG_MIXER_GET_CUR_BROKEN
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Appreciate your swift reply! I will check with 7.3-rc,

Thanks,
Eirik Kvalheim

tir. 8. sep. 2026 kl. 09:23 skrev Takashi Iwai <tiwai@suse.de>:
>
> On Tue, 08 Sep 2026 09:14:19 +0200,
> Eirik Kvalheim wrote:
> >
> > Hi,
> >
> > Note up front: this report was researched and written by Claude Code (an AI
> > coding agent) on my behalf, on my machine. I have read it, reproduced the
> > behaviour and verified the fix myself, and I am happy to run any further tests
> > or try patches.
> >
> > The sticky-mixer heuristic disables the playback volume control on a Jabra
> > Evolve2 30 SE, leaving the headset stuck at roughly -48 dB and effectively
> > inaudible. This looks like the same shape as the SteelSeries Arctis Nova 5
> > issue fixed in commit 0663d1df8d28 ("ALSA: usb-audio: Fix mixer regression on
> > SteelSeries Arctis Nova 5").
> >
> > Device:  0b0e:0e36  GN Netcom Jabra Evolve2 30 SE
> > Kernel:  7.1.9-arch1-2 x86_64 (Arch Linux)
> >
> > On every hotplug the driver logs:
> >
> >   usb 3-6: 2:0: sticky mixer values (-12288/3072/1024 => 3072), disabling
> >   usb 3-6: check MIXER_GET_CUR_BROKEN if you believe the mixer is non-sticky
> >
> > and the volume control is then absent entirely:
> >
> >   numid=7,iface=MIXER,name='Speaker Playback Switch'
> >   (no 'Speaker Playback Volume')
> >
> > -12288 in 1/256 dB units is -48 dB, so the headset's internal amplifier is
> > pinned near minimum with no control left to raise it. Userspace volume at 100%
> > is then just software gain into a nearly-muted amplifier, which is what the
> > symptom sounds like. Note the third value in the triple differs run to run
> > (3072, -12287, -1023, 1 across reboots), so the readback looks unstable rather
> > than genuinely sticky.
> >
> > Interestingly a cold boot with the headset already attached was unaffected,
> > which masked this for a while - only hotplug/re-enumeration triggered it.
> >
> > With the quirk applied:
> >
> >   options snd-usb-audio quirk_flags=0b0e:0e36:MIXER_GET_CUR_BROKEN
> >
> > the driver instead logs
> >
> >   usb 3-6: 2:0: broken mixer GET_CUR (-12288/3072/1024 => 1)
> >
> > the control comes back
> >
> >   numid=8,iface=MIXER,name='Speaker Playback Volume'
> >
> > and the headset behaves correctly. This has been verified across hotplug,
> > simulated re-enumeration via the USB authorized toggle, and a clean reboot.
> >
> > The quirk table currently has one Jabra entry (0b0e:0349, Jabra 550a,
> > QUIRK_FLAG_CTL_MSG_DELAY_1M) and nothing for 0e36. Suggested addition, in the
> > same form as the Arctis Nova 5 fix:
> >
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@
> > + DEVICE_FLG(0x0b0e, 0x0e36, /* Jabra Evolve2 30 SE */
> > +   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
> >
> > I have not sent this as a formal patch because I did not want to add a
> > Signed-off-by for work an agent drafted; if you would prefer it as a proper
> > patch submission, say the word and I will send one under my own sign-off.
> >
> > One small documentation note while I am here: Documentation (the ALSA
> > configuration guide) describes bit 30 as "mixer_get_cur_ok" and the kernel's
> > own log message points at MIXER_GET_CUR_BROKEN. The string the parser actually
> > accepts is MIXER_GET_CUR_BROKEN - passing MIXER_GET_CUR_OK gives
> > "snd_usb_audio: unknown flag MIXER_GET_CUR_OK while parsing param quirk_flags".
> > The doc wording may be worth a look.
> >
> > Thanks,
> > Eirik Kvalheim
>
> Could you check the behavior with 7.3-rc?  The too-strict behavior
> should have been already relaxed and it should work as is.
>
>
> thanks,
>
> Takashi
