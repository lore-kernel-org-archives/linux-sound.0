Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02062DE6F1
	for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 17:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753896107; cv=none; b=Yc+ex9gXLDnJmdNtWEVXGO1CzkexzfxgA4ZMy7hLmKLdIfJ980qdW0CgAlkpbzG/j1jnc3rNOhw2J+uTxHvLkumJXB3uVfOwgExFL6zvMburUwK6cy2MHdilnHMYnGmDZ704uyQFRf7yxQBUsy3LXDuoTdHpfk2vCo7851EwTgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753896107; c=relaxed/simple;
	bh=uZTWbNp5UQgpwMG41jKfjHK5L2cgnLut8dHcJchNR8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tn3v8XYxOra6Zy6oK43j/TPdotstZSEHwnHEziPAnJb5ojjpT0fmhp/mr7ADIqvKwgg1L8Hso7o4oGWBZ9WJHA4wsEQubgb9Xq4WJ7IqcEPmBubDKr2W+kwP2Mll5KSq0yK+U1zHgLVoUkjYz9pYLXk8tJf5x/GHrMtOPjB84HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RxXA2Ocl; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RxXA2Ocl"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-af66f444488so6477766b.0
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753896104; x=1754500904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XviGxGGSj+ExW/gtBrrBLfUa0g6+/sZ66LLFHVBs7nU=;
        b=RxXA2OcltaA6jYeXM+4ngfaY2QTS9dp8zNyACAzBu1wmzVjMR3Umeh85vOAtfhECpf
         6rr4R00Rul2IvHh7v5QTFOhQYydEjgYLn0Bx5BmB4c8jSZzWg1zIY4hLyxLY6u0/L3hP
         C/SRkFYlTW1FYmCX7kynEQieIfVPmkWNdq2eM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753896104; x=1754500904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XviGxGGSj+ExW/gtBrrBLfUa0g6+/sZ66LLFHVBs7nU=;
        b=YozzSyqPZzJkrDGDxnGTjxcx71lejy2eY73kchyB4C8L8Zl7uIiWcylOSzAOCuYBq0
         XeKC/ATeWZvoQhozRqpptn2bicDE7j57G1xJ8cvaNAadLvEZi0pQyIQYz4v8b1+BGVhl
         Ubg+4WQcEogeW12btIcFdzJU/a50aJLC3yyeUt6hXN8UL8PdVfl85L11tDkvN4XWlCCs
         kh/ZHzAYu52Ns/3gSPzU0eTOYOJnijz9wEhCQoNYANLuiKEHfOzOtaphOBlP6tRI3n+Z
         eV5b3UGv5WFlGdiwb7VNh76ZM01GY5m78Dbzq4GIIhnJZnTtVh5jyhonCcBxfHUfGPb8
         9lCg==
X-Forwarded-Encrypted: i=1; AJvYcCWS30Da+c9c8ftjHHEka4ZJ03pZQxeBzKgl2GX1XrPmFe8q5vHhE4MEecd2NsqMQEkZ2f2seowywWL7mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXSxNcX6S+xbQE5ot3j5UeBTOVsmrU2uP0cSEC/6R8dQTGxDj+
	+iRsfJj6Q7Bew7bAdqG9lgW0IZnj+BpYnD6KJ5hUjoht0AkcH3lCkEjwURJtalgzcMkTa+LZyB8
	JYfrCmas=
X-Gm-Gg: ASbGncvKLqQWlnAVTVGvYwUzc0Y+ACaLFP0sxuANVFeQ5PjUWTkYls+x6p8gMej7+kW
	SOA48Lt9c9PX1XpaUn+P/LZVB3afKDrKpfSmbw6GPMFn+Pr+N942ujhW1nS9wYTrdzGP6VSKLQ9
	66vsrowJel9OVypwXBxgwZccTDkQ2m2LGLC2UBT3k/G790KWaZopYGdrQrz6HUieBOCKwkT+0It
	o8Dw3jIpTgCSZLQrpWhBTTTP8kLyGxzTA5krXmQHLdDEcxKwlLMUcP/+YJPdjSKwBrgoP+XRSDq
	Yode8bsH4tgmLe+hw7/401gnYqNUdVuJPCaE3OrcHHhIIKorXRIAAThrAMih6vqBHgFyiZ/pPJX
	BGSAixG38bKHuT8KlyTqdZC0HIgkwFyeLS+u/MDlWPsp/WOwbdsJboJd/k6i17523ZHjuucpV
X-Google-Smtp-Source: AGHT+IGda/Vv74scRiuYHXEL6cQq8Mms+mwTSD1+CVFvlvS1+o9Csu90EHtgOQcF5xZ/y3sJyt63+w==
X-Received: by 2002:a17:907:96a3:b0:aec:65de:5258 with SMTP id a640c23a62f3a-af8fd691e69mr505365766b.3.1753896103555;
        Wed, 30 Jul 2025 10:21:43 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a183csm775348266b.50.2025.07.30.10.21.42
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 10:21:42 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso11359484a12.1
        for <linux-sound@vger.kernel.org>; Wed, 30 Jul 2025 10:21:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWe7YlnNSmQUoeP71IiQcVUcEorLQNfMw55nhaIchDCy8YVmR20kIju605W+NVHqvFeeYxFCXyP7C8V2g==@vger.kernel.org
X-Received: by 2002:a05:6402:3546:b0:615:4b3:a62c with SMTP id
 4fb4d7f45d1cf-61586f2a6e9mr4722955a12.10.1753896101790; Wed, 30 Jul 2025
 10:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87ecu4idvc.wl-tiwai@suse.de> <CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com>
 <CAHk-=whvoZuw-Cv2Bx2ip8Kq4j9jw0meLBg0xz8GbxzFmQK7QA@mail.gmail.com>
 <8734aeteef.wl-tiwai@suse.de> <CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Jul 2025 10:21:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjwR=hNLA7SzdnM5BvaBAwm2cVeZRR7uEo+3625SaiOjg@mail.gmail.com>
X-Gm-Features: Ac12FXw8U-wQfGTvfoAcOoJvQvmgALq7PY--9KMDtp2xEI7r3qeUomSmM2CLTcQ
Message-ID: <CAHk-=wjwR=hNLA7SzdnM5BvaBAwm2cVeZRR7uEo+3625SaiOjg@mail.gmail.com>
Subject: Re: [GIT PULL] sound updates for 6.17-rc1
To: Takashi Iwai <tiwai@suse.de>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Linux Sound Mailing List <linux-sound@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Jul 2025 at 09:50, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And no, the answer is *not* "make everything enabled by default".  If
> somebody has a working configuration for their setup, new subdrivers
> shouldn't be enabled by "make oldconfig", because clearly those new
> drivers aren't relevant.
>
> So no - not "default y".

Ahh. I looked closed - I should have done that earlier. It looks like
this was just a split, not a rename like I thought earlier.

But a plain 'default y' is still the wrong thing to do because you do
*not* want to enable this if people didn't have CODEC_HDMI enabled
originally. So it would have to be a

        depends on SND_HDA_CODEC_HDMI
        default y

But then you couldn't disable the generic code.

What *might* work is having both

        default SND_HDA_CODEC_HDMI
        select SND_HDA_CODEC_HDMI

which looks confusing, but should mean that if SND_HDA_CODEC_HDMI was
selected, the sub-option is on by default

It looks pretty iffy, honestly, but I _think_ i tworks.

I do think that the right model is to keep the old name for the old
functionality, and have a structure something like

  config SND_HDA_CODEC_HDMI
        tristate "Enable all HD-audio HDMI drivers"
        select SND_HDA_CODEC_HDMI_INTEL
        select SND_HDA_CODEC_HDMI_...

And then the new common hdmi code should have a mew and *different*
Kconfig option name that the sub-drivers select (so
"SND_HDA_CODEC_HDMI_COMMON" or whatever).

on't re-use an old name for some new fucntionality, unless you've
waited at least a full release or two for peoples kernel configs to
have been refreshed to the new setup.

With *that* kind of structure, you get

 - people who didn't use to have this enabled still don't have it
enabled by default, so "make oldconfig" does the right thing

 - people who did have  SND_HDA_CODEC_HDMI enabled see no difference:
they still get all versions

 - you can now decide to disable SND_HDA_CODEC_HDMI, and then enable
the sub-drivers individually

so that would seem to have full functionality, and avoids the
confusion of having the that combination of "select" and "default".

            Linus
