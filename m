Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C273B3D75C9
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778505200; cv=pass; b=SAiiRlwOsUy7CH1vENwm/6Ewfnmo9nJL2dSuhL+piLRrUURIZRPpTtHETxyL0HnwG/CBBTn2Tp4C805pYXo2u65ISdMPpmlM0RbMjWOFbHDq4CS8XauE1ooOll4Xy9Zq5yo+OBTElbhxjf5cnV8U/SOwjDUWQzjJ1UnPiPO1aBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778505200; c=relaxed/simple;
	bh=/JhRm525cR3bPvca552Xx/Z1BTer6+bShyTO2rRXwXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRta6WpRirA4f7KWxfGanDD8C/6c1NbmOz3j/D354R8XVEnaiB0OEerYi4uCpsLiAf5FB8Qi8nBclsPX7ptPDqdbGS5r4q+JN/xjdeCQXAx0Ria4hiePi7Jb6B37d7a4OPMW8bSVs4whF6VbweTs+vvXPRJD+WtgrTHGWNHyXqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro; spf=pass smtp.mailfrom=purdea.ro; dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b=ZF2oMzn2; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=purdea.ro
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purdea.ro
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=purdea.ro header.i=@purdea.ro header.b="ZF2oMzn2"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a40502e63bso3831304e87.0
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 06:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778505197; cv=none;
        d=google.com; s=arc-20240605;
        b=CDbMk2Ot62gAQP+QlRP0vTJpIonqxinGYYjgUOJuKK5W1OASno3ryuYP7g549RojJF
         HghN9egJR+/9sQlvSQ56jIJYH/CoENkTc40hh7ml44cqdzqZLteq9LkoOzaKOg/FPNFt
         aC7Z03/mmZzsHQ3djh6pgseTu6HKcAXhohEI1KO/CnjQOixTeO8mhTBbTDLdMYpU4/C/
         lXQbjzyrRo5pZS9dMLE9n3bk8l6x50HvQJHD/SRQw9RytXPsbIuHv09/JEqPjZepKMZs
         aydrVSwqL/fiR9n8z6NGNI3nHjYd35WK/zewgtwrRxDnyLV07TsXYM+P0E9v7TzrcvJs
         SDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4TsvCyfn4Vons4rSkCHBRhV0pe1329O/JdQeh1GHje8=;
        fh=KzGK1ZRFawJznBgN8n5ZC+XQk2HI50dNPloeRvTKDdk=;
        b=SjqRrU8swAiHtI19S+xIHn8Z3rmdrJE+7SQwoQZyYYzyfeWwgRGDSX2k94GidleCzP
         quLMImA9lb6DCTrlQeWCK2IX/iRsTPE+vUjYTXoIISWxnPSI8QvhhPkSMtt0YU3kRsVj
         hQJFQx+hqCLze2gxhWsz4bBpKpmZVo4JIEb1AgiZqwxkHTdxzc9wPtDVo98GmjgMPRcP
         4OnRGgRyqBEEWGcz2ndsqOHZNSnVA74ukeBZtVLxp1Z6+yv2S8EJsFOhuu3JT/jGro07
         0yP33JQYQr2KgHOHTMznKgUaVC/FJ9fPyGUgB0OCDkdK7PJPoKSGMH4S/ZZeolHux3Rz
         /Y3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purdea.ro; s=google; t=1778505197; x=1779109997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4TsvCyfn4Vons4rSkCHBRhV0pe1329O/JdQeh1GHje8=;
        b=ZF2oMzn2G/kuH4waLom9YPqx+Z5bTXBdrwa2Psj2wnoC7DlnX4w6KMNEvaic0vi6fg
         LhKN3LJsWWt3TP7lAc2Optka1S+ey045/iR3CllZPMEQVDRSBCOOMwh1YsxvqqJM7HYC
         1QBpM1s2SvkRYXWN8hFBSvaLbvGMmYdoE/kkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778505197; x=1779109997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TsvCyfn4Vons4rSkCHBRhV0pe1329O/JdQeh1GHje8=;
        b=Qt6OSe7RX1bqgxd/hx3lLv5ejMRXO3hW9/TiFdzA0juYrOzW8FAEQ/AQkYuhr/D4GO
         w5+MHzliqXeqhz1EDOpqbqEIYNewTWQbKoHqkI4qVBizF+mDK9DDBOKRIEVl06xRmw6T
         ViBtgPP/2rZIUcrSEFij3N5n+aP8U7xS2KkD3RZe/zQO91c8MWb7t2A7J31y2qVmrtjx
         zb46X2rr/82EnRzbSkW8FWCOaWJ6XEda24z617XFI9Kkkpt8IQv6HJW7tRA6ZICRUURG
         XwbUh5vVGF4ulccwb+Dsc8xEFkoXAoffx06nHtAge08VnflY3R0rfVOKLPBnzzVZ2gQh
         Rnmw==
X-Forwarded-Encrypted: i=1; AFNElJ8Xq5YkAXPdxiObBfftFr2vVH4YLZPH53u4Otdt1si+doMqO2R+AJQDDdz7MjNldUWEkhe/ty5PdWkYdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzna5r2OZbZ1zeZ6helTE/2YfmurF11oRCxpF4cBB7JZpoZ/Lpz
	OA4Ozj8eboBkJdKJHz8GNs/k3Csd+DMQaz2eX2U5MqNY/YUZzimj9Z9sKGm7FR+OBH+XWZPnXjs
	mR9/ULDiVKt3QNvs75ZA7YNpptm/InEg00fMvqRO1
X-Gm-Gg: Acq92OE3mbQZRs4+UoOUrCoHt/OAOYs0m54N1Zf1Ou6Euae9WOB1WDtwJDVOz4hsdEp
	5JrxCQPODdDtrVoxe1lzemAb3Z8nXl5erK9ooWJ6veVNwHOkiOkAXekrDZd8SU0SCq+ARyzt3Gl
	splP6AJkaM3VoWBtvQZ8OT+O6pGkwcG8y+R+Ikq6WBEVgB2u/Sb7pTxR25plWgpRpKrvOvQ1+xG
	K1rVXsqHqFMTt4DFAoFR7MAqgCVfeY8Ggkjyt0zQdUUxIl3eMtx5SMCAOOKk1zQfqucdNXTHELS
	ff/Ov+E2K/bJ7UH6gv+SYrbkEH9+vOpQ+q/YZQQ=
X-Received: by 2002:a05:6512:3e25:b0:5a4:74e:5f75 with SMTP id
 2adb3069b0e04-5a887add952mr9396583e87.1.1778505196891; Mon, 11 May 2026
 06:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7cb7d771-5bf1-4d26-ac0f-c8968372bfba@al2klimov.de>
 <20260510230853.154050a2@pumpkin> <agExLK2GR0w0Z_N2@geday>
 <CA+mMEgdbDLZS01WFrquyv4NecVwVOB8a=5Bio2VxFFpwmKc7AA@mail.gmail.com>
 <20260511103854.GCagGxvmZvHL8sV_8e@fat_crate.local> <CA+mMEgcng1bt=ZysgofrGAMA0oMO-9DxSALXdcT9tK4YgE_dhA@mail.gmail.com>
 <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
In-Reply-To: <20260511125137.GEagHQ2exHlDch_hMA@fat_crate.local>
From: Andrei Purdea <andrei@purdea.ro>
Date: Mon, 11 May 2026 13:13:05 +0000
X-Gm-Features: AVHnY4Lz6FCklWCE5fuSqs-XJBmGPPcjsNOrgia6Bch05QJIRN7pCIeHg_JGq3U
Message-ID: <CA+mMEgepR=5P0TxfW8wQ5rtr4u+1uAO6F-1dvxktTaRFDjUVPQ@mail.gmail.com>
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

> Pfff, that wasn't really clear to me from the explanation of strscpy...

The third (optional) argument is count, which is specified as "Size of
destination buffer".
strscpy() does "Copy the string, or as much of it as fits".
The doc also says "The destination buffer is always NUL terminated,
unless it's zero-sized."
strlen() return value doesn't include the nul-terminator, but the
destination buffer must have space for it.

So all of these together imply that if you give strlen() of the source
as the third argument, the last character is gonna be cut off.

But this wasn't spelled out explicitly in the doc, because you're not
really supposed to use strlen() to specify the destination buffer
size.
The destination buffer size is how much space is allocated in memory,
and that's it. If you don't specify the third argument, it
automatically takes a sizeof() of the destination buffer, which only
works if it's an array, and not if it's a pointer.
The size of the source string is handled internally, (i.e. there is a
call to strlen() of the source buffer internally in strscpy)

> > strscpy_pad(chinfo.name, amd_rpmsg_id_table[0].name);
>
> No, as said "[h]owever, just to make this safer, we should min the size".
>
> IOW:
>
>          strscpy_pad(chinfo.name,
>                      amd_rpmsg_id_table[0].name,
>                      min_t(size_t, strlen(amd_rpmsg_id_table[0].name) + 1, RPMSG_NAME_SIZE));

Why would that be safer? There's already a strlen() call inside
strscpy. (and even if you don't want to read the implementation, the
documentation implies this, by saying "Copy the string", because bytes
past the nul-terminator are not considered part of the string. It's
how all string copy functions always work, it's what defines C-style
string copying, otherwise it would be called memory copy.)
Plus strscpy_pad() needs to know the actual destination buffer size to
know how many bytes to pad if you want to pad.
If you give it a 3rd argument, then most of the time it's gonna be
less then the size of the buffer, so it's not gonna do any padding at
all, so it's just gonna be equivalent to strscpy() without _pad()

Andrei
