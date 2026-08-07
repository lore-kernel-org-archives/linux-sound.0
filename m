Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146AB47728A
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117312; cv=none; b=XrSVUUkICzUzfGvmOw/TZNklo7h6PsHx+KsMV+5yfo+BhiFebp8Fn8tP+Vx9tnZZ2Ht8Inkz6H1BW8yggjnER+iMf91qChMsNDJWGwHsWAIJf7aD8AK0nDJAXOyUxeHgeo7y9Ud8H55Ne40pv+BCOSTYM12blpu79/quWNg2aUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117312; c=relaxed/simple;
	bh=x+I72SNOGyldQff5bNCHimqzCxMWtyiogesLGVpujEQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RnJ04QCQEzjmNSAiZQEaQd4PYq3PCeCtcVtAz5flzBJYtLfvstBR8ON1df6j25jRXCiji6Y3T6sLsfqx5W+SmyJeKF+07JsgKVFqzAafIUGDD8EFrOu2DxHnFrgll/G6eikzhWJKCeqSGKu1Ojhe0W7k10iGI6iXQmPEzRMHb0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV8L6KGe; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV8L6KGe"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3900e39d935so3315318a91.0
        for <linux-sound@vger.kernel.org>; Fri, 07 Aug 2026 08:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786117310; x=1786722110; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zw4tEI7v5Ozfyr0IaEycsWq3znAQRlLmo34+BVtZE/s=;
        b=lV8L6KGeicdgbnhn3TUoObu3Q8Rw0+zCiyo0HaHtfTqhCM4Yz+xSNLsArsxge/Pwar
         0nnSRcSpdrNyIN1pCpBol39GUxkNbFr2G5DA1w/+xCO4MRan+OSa6Etak6QJRRlaedAv
         4MfmASieA5S6OOufWrSUMtH72AEXaolahrXdf9A9gh5KBWzR+ZkonRAJzjK+eQPMP1aB
         bugnZnhTkKxZCcIVJXvimYrNmYMPYn4xGhUCbaGIZD0ccyHX/RPtXA82HEuey3jQxbAI
         YcP7AYqeSn88Y6jnALKT9AuKGne5h4aWCx3hAh0b7MfENy/b97JTFWp6BHFAf7CXhyh6
         DdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786117310; x=1786722110;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zw4tEI7v5Ozfyr0IaEycsWq3znAQRlLmo34+BVtZE/s=;
        b=elHQRIbZtMJH2OBCiuwZKlku+Z3BD+TU81I2qrY0kOY85HklbopWHQTVV29nf4HtCl
         NTt2mPBOUD7ul6q792gzZVYn9TdMVY8jnCQ3Hoygt3jFj/QRTdsNaUro2saJL5TqgqIF
         6kjgNbOm6OU7kOoJCsDEReiV7aEalYVwgL9bxoQAKsKfH8Q5EtKiSt6e9VFxllGWKXxU
         HbMYLYo6dW3Q8OeKLYL5VA2YMQ0BL62/HjzbjM+kW2Xu7858F5qReOcvGI7tXTYLm7YZ
         SPZnIZdwfNjyMrFLKBPIDbInfbll9AzapYrSCTCSg5c+ukSzZvddMwrVDYPrFPU4CD45
         9n2Q==
X-Forwarded-Encrypted: i=1; AHgh+RrdCU/N2E8YaSrc/Hfa8xvbpbX+TMXbQd2HbED0XJo5P8t0uq2z0GUzq3eE58o0gBvjNSs8si8YM7387Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx15EWYn8983HpeJiONzSQeX/L433SD4HeTR4/ipXUVqWMnVDem
	E36cjf/+p+lZhNu3ry8yCL97L+hhh3pgKSneDoi1T83Diu4GhrV1cwUz
X-Gm-Gg: AR+sD13xF+itzLLu/D3t2mgjnNjLrwb6PFbAI3iK/exux6kWxs1Fk8bRrgFS7/wINbV
	Kyfn5vw539YZkj5d8Y+5WRMw2yd/5ZzKP7VPJvEBYpDw2jWcB3Xd6Jpj3iCO60jakmaYDxY3uTI
	37mN4jlR/6+UACB7E1B1kNyMeO+NRYhKgns3ByFtdRZgJ7TUHkUUs4M6/ZFq6NLaVeC4Jtafz2S
	Jer+l7nLI2xH+c3E8LJTACetsecAlRyxq6W3ifqmTAPRPdFSM+JiZvx9N/HgXBoq5sUEOUja1ZQ
	v48i0EtWFN31XYH9HRx67X+Enh7GkKPelOcJ/xkHearPBvOYZRfLI/NIY6xhj7S2aDQcZm1bG6X
	tD0qjie5MQWsanpIjaSSVlJoG5Ohcx34ltBbam6YfZ3iSmd+TI3j2Aau59GencGau3ZLFpNwMGP
	kw+/y34pq8TSEM6k52cOCiFwOMUW4EeEUiQqmxvW+VbfcC0CUQPqDRM9fVpBZGmB/kgzfDUg==
X-Received: by 2002:a17:90b:46:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-3903c5363a5mr26961879a91.6.1786117310240;
        Fri, 07 Aug 2026 08:41:50 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm10212507eec.5.2026.08.07.08.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 08:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 20:41:36 +0500
Message-Id: <DKITQMNPN2I7.CH00E8CSZMXI@gmail.com>
Cc: "Takashi Iwai" <tiwai@suse.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Kees Cook" <kees@kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] ALSA: remove remaining strlcat() users under sound/
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Takashi Iwai" <tiwai@suse.de>, "Mahad Ibrahim"
 <mahad.ibrahim.dev@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260807114139.1661-1-mahad.ibrahim.dev@gmail.com>
 <87jyq2azz4.wl-tiwai@suse.de>
In-Reply-To: <87jyq2azz4.wl-tiwai@suse.de>

On Fri Aug 7, 2026 at 5:15 PM PKT, Takashi Iwai wrote:
> Honestly speaking, I'm against those conversions.
> Why do we have to open-code at each place with strlen()+strscpy()?
> It's just harder to read than strlcat(), even more error-prone.
>
> If an alternative is something like this, we really should reconsider.

Thank you for the quick response and feedback.

You are right that strlen() + strscpy() is tedious and annoying to read.

sound/ already has helpers that do this, but each is local to one file
with its own signature:

  safe_append_string()  sound/core/ump.c
  append_ctl_name()     sound/usb/mixer.c
  hda_append_suffix()   sound/hda/common/hda_local.h

Each of these functions practice the same string append technique
however to slightly different effect. safe_append_string uses
safe_copy_string() whose function body is above it in the same file.
safe_copy_string() performs analogous to strscpy() however adds a
filter which drops non-printable ASCII characters during the copy phase.

append_ctl_name() is simply an strlcat wrapper which when transitioned
would result in the same strlen() + strscpy(). Only separating feature
is that it returns the length of characters that would have been
written (not necessarily the actual amount). However none of the callers
use its return functionality.

hda_append_suffix() is a verbatim copy of strlen() + strscpy().

A solution I would propose is that all these functions which do the same
thing, aside from safe_append_string, could be moved where they are
accessible globally across sound/. This would remove the redundant need
to use strlen() + strscpy() in replacement for strlcat() and would unify
the sub-system under a single string append API.

safe_append_string is only called once in the entire sub-system, and could
be replaced either within the function with the unified string
append function, and a separate filterer replacing the safe_copy_string
function or removed all together and managed inline within the single
caller. However this function would require a more involved removal as the
internal safe_copy_string is called twice; it is called once in
safe_append_string(), and in sound/core/ump.c for a wrapper function
ump_set_rawmidi_name().

An argument against this suggestion is that it would confine a string
append helper to a single sub-system, while the rest of the kernel uses
something else.

Additionally patch 1/7 shouldn't have open-coded anything at all.
safe_append_string() was already a few hundred lines above the site I
touched, and I should have used it.

This was based on https://github.com/KSPP/linux/issues/370, which I
should have linked in the cover letter.

Thank you for your time.

Best regards,
Mahad Ibrahim


