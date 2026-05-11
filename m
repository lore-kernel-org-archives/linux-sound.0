Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4560370D7C
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 11:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500789; cv=pass; b=lp8EtDeWttV4XNo3nVG3vkNKtPg14Q/s6Xyyzg+4EAjaNqOuq0lZCW8Z/3d9Rtg2W6iC+keo2fe4gSPhr7lpEGbIKXDoKvBgd4mkgzcBH5stovckZlJu6ZrIIA3lLExjoPmS7VltBx2JKBUJy2yuV+GB3k0KuTPqksa1Sq6hyRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500789; c=relaxed/simple;
	bh=motJPQJjajYs4k8zeRAcM6U2uTWGfwD9/Up4NzWT+3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmmTzhRGCHgdLHBITbvlyhjZzcIMwWezKlaiiXh3ANVWQCg4oWEylMxNlVtPc5Yb+xFes3T++f0ZX4bq+60C22HzJnjezLrSNdoa9OiDJmHAgi/KGk61DxlxyCwkaKsHs9md6WEzhkG+Xp4cXe+MNT1Rf8Rko8F/KKR1TrkJu+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=nSPJjTQy; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="nSPJjTQy"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a877510541so4398584e87.2
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 04:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778500786; cv=none;
        d=google.com; s=arc-20240605;
        b=MZdAdSW9k2lGPbw1exhdHH4LMc6NEcxIEy053UqR00MAOAtuGlO6yNUuaNaaKPx3xK
         hcp43ya1cU79JpoNdod5B+Ca4TtP2Uwlirdn1jztF4zkLyXug+NPh8HnRBHWHZ8v2AAG
         4AZkfNlFr5cbpa19w3kza2NHGbpsR7zIbhxmq/pqlRnOh82VuDG96e06JnhhPm5I++EG
         OlnfUD4ji19EyvsoY8F5bsJZD4dXH5p74jAbdN4p2/2PQDrYGXC5L4Nz+K2CTZdIZYge
         0fpWeVZ3J/WOOMlPf7M8CfL11SuYaxVd71hYpTWnTll6VZ9leRUdsK1CvA4wiGv87CMA
         XJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TkKBQeZzSD6WWDsJfhDk9dVyIkNWlj1ZmLypeBPIG9Y=;
        fh=YKELLbPnNJE+zVp/JcjgDMw68/t57+e8iecgU50m0wc=;
        b=fc7P/GYnD+0nFQv4Fi181D4/D9sc4t9BcnGHlVQvCK4D7bIO4cjw8rWw7upyWzy7Wy
         CF3XR7r7RA3hN21pODkjtmRbfK7VwNYjNS7ZT/1ro9GqNMjel2Ey7TJX0xptAXv87/te
         ZBTP/xTZYyfthLucyH/DQHjObhPnCtsCfiu7r3tKOgtTAd40aZSspMQr/1l3IuZs6fiD
         uP2jKuyDxAE6QZNI4Fogsqk+aNHVAo/dnHdFriIWzYSKgsEmekGPEHVGKhX+sBVWZiM5
         etJoqSX7Bbb8EQZnnn95smho0WtCKO+xei5qNTL2rGipvwtZjxitrd/Dxjm8sWLDUEI1
         kXvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778500786; x=1779105586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TkKBQeZzSD6WWDsJfhDk9dVyIkNWlj1ZmLypeBPIG9Y=;
        b=nSPJjTQyiJQCdnNyFfnAEIcw4hqfqUXGasD5+CpQFXJ4ZNG8xqo3zNRky1R5QM6euV
         jipwWk3yxD6TWiTevUIX9mOTWliZmuoDcp02La8gYQcQODKeZh0ahfZTQo8U6quZtQZ5
         2i1aSJpeDaolA15lxnaLt4U4YmNA3Yzf4puNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778500786; x=1779105586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkKBQeZzSD6WWDsJfhDk9dVyIkNWlj1ZmLypeBPIG9Y=;
        b=bg8qho48FukPrzFULNToFKEJB8zRe7pqo2c+Vpf16vrRO1AHkq05I/8eMKMHnQDZXB
         UWfzwQv9apnnOu+ahndGg8yQYEPgu6kmIiLHEJY+90PNS8vLyAoiJ2JNSBpY6clX89CT
         VUWO5Cqto0mJso6OS35uz2bB1fpFcALwph00oG4qol+3BV6vI3qIB62wQ0hY5W6fZ4gY
         xxjxOnV+kmcX73aNsOmHkXpbqZM8HnEw4eMPMmZELHWmypXpIQjrtWbd+165APD816Z8
         dDSPf7Ka6vnoqpKvk1eL9rnu5JJd3oWGDm9QpMQ322XY3A15FVwBV1LaIq2SQVKTDMEN
         WKcg==
X-Forwarded-Encrypted: i=1; AFNElJ8SiOJZ+BQLV+MykvRQsvqnXTx2znvAw85sJ+OF7ISQI7s+2iLR29EjlMSeIun1J92HOJ4RqwQU42oAAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnbX1d5VHbe2jX7NBKLRLkNqrc5SJb+IeXH1j+Iha/U2e7UHG
	xyOIjCOJb9knIvqogqqyR/tb8pfDVU+xk+4hUHVbtVxbr4HwGj4qltB/kiBtEnAu1UOH+T1/1b7
	3rdyz5dA74HVaKe9rspUFAw7En8pLbTKyuWShZOwH
X-Gm-Gg: Acq92OFOFrPXEWPQOgh/stDgCAfG5r2d94su1oYk0yqMZRRLY1gAdlO2XRCvPKyqVHn
	hRZfrDBpqiSXk+l6g1gDt4q1049DwitoS2uCHWnVVzsN4waBKo1MJ2TcwIaAv+LtACWEvVKqfQr
	ztdbK5AmI4M0KBDxycaMIuhTZMKcSp4SYcrfeC6bqeQvkLF1SIE0LmyvO5cE1fELkI2WRnmnnop
	SI7tCfyfjvvcGx2i13276DbV2KAiXP3jcu1LNrGkVVeB338uzwwvUgGlkJBv5gzRozb9Ln1PWiD
	QV8I0HqBLUnjQ6bGr/stIyx0QTYf7qg8JvG3k9oQzqZUNu4rfg==
X-Received: by 2002:a05:6512:2352:b0:5a8:b963:cef6 with SMTP id
 2adb3069b0e04-5a8b963cf41mr3355976e87.38.1778500785651; Mon, 11 May 2026
 04:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com> <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
In-Reply-To: <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 11:59:34 +0000
X-Gm-Features: AVHnY4JGi-STlD9mzsGX0cSnGYpRU-grKSKEonvNwqBKtIss1qO7PDZXk5w8_E4
Message-ID: <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
Subject: Re: [PATCH] Fix possible strscpy() buffer overflows
To: Borislav Petkov <bp@alien8.de>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Geraldo Nascimento <geraldogabriel@gmail.com>, david.laight.linux@gmail.com, 
	"Alexander A. Klimov" <grandmaster@al2klimov.de>, Tony Luck <tony.luck@intel.com>, 
	Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Li <nick.li@foursemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-edac@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> first of all, please do not top-post when replying to a public mailing list.

Acknowledged, apologies

> > Furthermore the one in versalnet_edac.c looks like beyond fixing a
> > buffer overflow risk and code smell, it also introduces a behavior
> > change (bugfix?), because the old code I believe cuts off the last
> > character from the copied string. (Because it was using just strlen()
> > and not using strlen() + 1)
>
> The versalnet_edac is innocuous because, AFAICT, that silly code is copying
> "error_ipc" into

No, the current code copies "error_ip" with null termination, and it
drops the "c" suffix.
And that seems buggy. And that's what I requested to explain the effects of.

>
> struct rpmsg_channel_info {
>         char name[RPMSG_NAME_SIZE];
>
> with that buffer size being 32.
>
> So no overflow here.

Agreed. Also, even IF the source buffer gets overwritten with a different string
(not saying it necessarily does get overritten, but it's not const),
as long as it would
contain a null-terminated string there still wouldn't be an overflow,
cause the source
buffer is the same size. So the only way I see this being exploited
would be if it was
possible to get the source buffer to contain no null-terminators, but
that would imply
fault in other code too, so there's likely no security issue here,
(unless the dropped
"c" causes some problems).

>
> However, just to make this safer, we should min the size.
>
> Also, Shubhrajyoti, why aren't you padding the rest of the name string with \0
> *especially* since you're allocating it on the stack?!
>
> IOW, this (totally untested ofc):
>
>         strscpy_pad(chinfo.name,
>                     amd_rpmsg_id_table[0].name,
>                     min_t(size_t, strlen(amd_rpmsg_id_table[0].name), RPMSG_NAME_SIZE));

I have two issues with the min_t() call here:
1) it still only copies "error_ip", with null termination, without the "c"
2) it negates the purpose of using strscpy_pad. If you use strlen(),
then the padding will
not happen, and it will behave exactly like strscpy.
3) it is unnecessary. Both strscpy and strscpy_pad stop reading from the source
buffer once they encounter a null terminator.

So if you want to pad the string, to avoid leaking old stack data,
it should just be:

strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);

Andrei
