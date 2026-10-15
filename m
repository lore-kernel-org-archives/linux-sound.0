Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080473C1966
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077570; cv=pass; b=W8AEMXqas/U6ldjfyCZf/tYncLzIK+Akv/jCAdlxIdSP1qp3nnnVZZC8ENgcissqIp377dj7Uf3UH8RHSOuxQYcqMoAOb8RhOH2JWN1CpOaDWxG7dX7Av3O1uaI/Q/vHimR3YmQD2iu+c8fciXgvpz9SMWv5n7QyIRD/PSZDkf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077570; c=relaxed/simple;
	bh=pKuJFFIObsTW8E1vxj5zIM7WjIDHbM6IQyGrRxGOuIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSpNu/reUT3vXQPtud2pfZjdFzlNLeJcNaSoVZTPN1lzzBZGhNMqp9454+lwm4FzZZmOsKMpcjj2x6cG3+rZCbNuHawTuGeJgJasr6mO/kcTJ5HI2xSlSdIo3jCJBOMkubMAeb11P0NM9WDbEv2dkp4j6GjwZrbBARnM4Zkudlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWSVWed9; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWSVWed9"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67921b515a7so5480597d50.2
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 08:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792077568; cv=none;
        d=google.com; s=arc-20260327;
        b=AqYH+cS16FiaR8NTz7LlOHu2robSiXlQ0bcx4Ba6sKCylLOsYa7JPGU+hTdzbyjT/4
         5f2JPCR5MhTeeB9p5+b4ow+w9twRwykwNVMCMUTfwhJkd5AyMjI2+qUhnGE4jI62ZEkY
         2PkmhB5hSAAfgXXY8UJ3NA6YxhQIICiyjxeRXoMdnC1rKpYUB6LF224Cr6fip1/AZ6zA
         EhtaYDCDNmEuBweX60F+bgKgGWukfPmZNMWbDypQ6icr7FxaDxJwipmQKlura3axG8aI
         IJq7z3mMd5a9O3rLB0m69PciWtdLIqFUmRjrLVxcv7ANSFYyjlwoW23FbGHuSM09aD+k
         DWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0SPCm5eDdaJD53SeTJrax7D0+CUbBZkE2aADFfA8a2Q=;
        fh=p5b7djo22/yQvSh9U/sNQaWwQ/Q9BhCMQzX4GpNIpwQ=;
        b=EO3tc7iict0d0j539oeCyjpgJjMQkjgdRegrXhaCsYXvSeZKrWvUfcAbncstrzbuEe
         /zd+bCz0i3d1GX2Q52hPD3dvNXB+NljCJAWRwyiIEyLHmaFTyEIaugnBEOnuER6flY2w
         /aCnNXrYlok0mXt833ZYK/1d2UxVkGHvruLlFp381ozwNjenyPq2FtBIywMVIc1Z9ynj
         prW3bB9+G/NqGlPmG/m5ZbkzmPKN3k/GY6KsER7RJNHsG60VOe/Nvo0qANVisHYj4QJc
         Op17QAzDYpA+z6NbwdwLi60/Z0JVyl9A/7zkbuIkNOzoas7lxuk1g6nJdBn1YKugYcJW
         lN7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077568; x=1792682368; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SPCm5eDdaJD53SeTJrax7D0+CUbBZkE2aADFfA8a2Q=;
        b=NWSVWed9KFgjH3f2dPhgr7ler/WR0HEQl89IwDckl9+d+cZ1s+Ynesv/wAzEwOmsWw
         z1JckFWzrbl3S78krvLH285BXVhmjv/8yrEQfYeBJTzWez44hlt7lADATw4+VveaZ9nX
         iTKrhgO6Oc+5YT9JAbwrQOXV7oOjnG7GRVjXZuaZxeuhafTbymVgTBSD17Pmzju0Z4gB
         ei8/i6uN80waP5qWFOhUyFPuu9xkV2s6tILDw8uRSF5ikndj97mEekCZF0x6z66Cpcnp
         AggIQdMHKD2P5rzLu7T0c6Gcjc1AG3nbJxn41iowaDGYWAUMaKoNfEAqSoOjLQWk9QS3
         kpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077568; x=1792682368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SPCm5eDdaJD53SeTJrax7D0+CUbBZkE2aADFfA8a2Q=;
        b=h7suwMxqKLTVbKLvo7X8qPLtM+pmmX6i53RhGe79z702vErW0nA4Z5z8vLQAaahQth
         EBuRRBb84IevWFgha9+6yVijz9I99eZb84hqJixKEVyGZxYX41o9HI5il3884sr/aOaB
         jBCEapIdTa6bpEG3e9z7y/dalCoMRSzwNBhsR0wieghxLOtOFd/lTzqqOf+fIgmUS2l3
         iOeigrHXlcrq6t86DSHhlJGpj+lu2z1PzwMswjHor643At9ohmKkbFS3PyB0Ju+aPJxw
         a8MrRO4VyDlGrgzGfvAxpfa9o82a+cBWKwHV66a7djQZ6QUMoXre1og/nzucDzwH8zDq
         CtLw==
X-Forwarded-Encrypted: i=1; AKwUvBzegjzEaMJ+D3ENzaN+P7Mb6ptk/94ayUjU1fohe+skepdjeoiBNwSsairmxGOH+ghkkGNIUZi3VFY7/Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqZ8tvjh41UXjnnYyoYasogj2zjIgA7/eLe+R+ipBL7TPgtL9J
	CHO2wEVUW4ttGcC0GqzNuFQosky3ffidxhPRt/dn0rll72CgRatC1dtzsFzN45tBexEe8RUYYLG
	M6ZEBlcp7ITyIFWAS/AOypWv1r5qHdzs=
X-Gm-Gg: AYBFou0ZrMOCsiehtM3f92YTmp3ued6B/doaVVOKRE+bQrt8chl08x7foxAK3y1haDA
	4plc/cFFI8Fno3LhyA62kEndT2kK9gtYfVJaV9fk9naiPImnlC5y2XAaipQQQmhxL7z4T4gymCB
	6caRAjvadh94gVhdjeXgXQpPdgoufbWe95mZgv/A0uYQWpNf4CX8StxmcmFmFnR6rX1/9+dKSJC
	0dqG50r8Ggg2JSBIO/TKMzWxen/fnZMOxMoSiBBO/3A009gjMi9ArupFmRMPlzG5qUYuLDbXCUe
	XchHN2RSeAPeq0R7LnU2d3gOEGCMBjdBMwRbzoYUpRPjve2htgw6PKC1+Q==
X-Received: by 2002:a05:690c:698a:b0:891:c494:1a99 with SMTP id
 00721157ae682-8b07ed49b2emr78442367b3.24.1792077567764; Thu, 15 Oct 2026
 08:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-pmb-9c80f858ccc13b3de84d-v7-fcd8c7aa0e837bf0b036@gmail.com>
 <87zewgcuhy.wl-tiwai@suse.de> <CAFRLqsX6Yz2dv_dV4BvV6_F-16WDWYTAk5ikC9WY7ZySkoJKUQ@mail.gmail.com>
 <87qzhrmnz3.wl-tiwai@suse.de>
In-Reply-To: <87qzhrmnz3.wl-tiwai@suse.de>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Thu, 15 Oct 2026 23:19:16 +0800
X-Gm-Features: AclHuK876HwHtGIkGUp_g_PYTFsJH2TdNPY_O1Ztauu_w9Y_Sayq96gfdd5293s
Message-ID: <CAFRLqsUgiNEGPhfnUhTaSRjDKKo_7vc-gvyif=wyn1c2YTuRtg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: pcm: Unlink substreams before releasing them
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, phucduc.bui@gmail.com, 
	cezary.rojewski@intel.com, cassiogabrielcontato@gmail.com, 
	kees+treewide@kernel.org, yilinzhang@moonshot.ai, sammiee5311@gmail.com, 
	kees@kernel.org, thomas.weissschuh@linutronix.de, tglx@kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

>
> The patch I submitted yesterday is such an attempt:
>   https://lore.kernel.org/20261014141212.316223-1-tiwai@suse.de
>
> Unfortunately it couldn't be reviewed by Sashiko, as it's based on my
> latest tree.  And now I noticed that there is still a potential race,
> and fixed now.  Will resubmit v2 patch.
>
>
> thanks,
>
> Takashi

Thanks for the update. I=E2=80=99ll take a look at the v2.

Best regards,
Cen Zhang
