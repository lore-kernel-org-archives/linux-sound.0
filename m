Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A134B2EB5A9
	for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765476714; cv=none; b=IpFmDY+wFjIwA5qrgmYssF7qHpQNxKwLC0gZNE0kcWgu2ErT+EsJ1mvG99lSaSHfSTMenlfAM/XuJ+2b26kK49J2vFD1g9z2iDudZBdkGC8JwC4geDbaWUdQkHJTmUgJyUdiIaB592/fdis8lOQnoQgYpcBkNkSEU1dKfZAyXi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765476714; c=relaxed/simple;
	bh=ohNRR8mRdaddagF55e/ewnAj0hfyCt/6ndE4X2UBo0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAuJrPOZyQlGhJ6gStTdyMepPwf68fgtE/K+SsN4uHXgXmbOD7+/GMQfR3Ejlt97fHkRrJ4KyXKHx1eS7QBCo7H+ypM4g3HpFmaxQsCa6poPbjv/woNX49QlABYEOYoSzIbrHV8KE/tgTf8lcY8y63GU/tGHltx4SqJMgjiuzUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnXrH3Ay; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnXrH3Ay"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78c64370309so4186747b3.2
        for <linux-sound@vger.kernel.org>; Thu, 11 Dec 2025 10:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765476712; x=1766081512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDp1RXcJwC2kzIqG/Erv9zF7oztqaR2rGAAgD3AO8Fk=;
        b=GnXrH3AyZra2IjiQu7YJNxiDwWOxER1CAFPMWhGxlkquejDzkOGn0RLrXflr01ye3w
         A54bSDZi83FI3gYzZSdv4X4Rxh4GmWpZ/LsLFJL6EUDjXa8YdWvdfAW705Z/lpg/qFAa
         esW76zNyaDESgKB5N4KAg0O/x29cVEk3E7mx/F0wPbmGRZw1i9Vx2Hw0wXDtRH116Mg+
         X9MNH+rPCFD8twgufmBx8tBdCa1pjxMtF+1ws8c0Mhp/vAIH8JysgsALKm6akbJG0ujp
         wcfs+VGR6z1o/B8MKbzZhbMuPPpW7lJEUSR4ld1Z9X6iZyiWDBqkgVquhqML449WxP3S
         E2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765476712; x=1766081512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SDp1RXcJwC2kzIqG/Erv9zF7oztqaR2rGAAgD3AO8Fk=;
        b=TuYJEyNkx7bfZ5cmtdTSZxziCqiLMG0TRbPt0Uu4DpA9IdGMjTTb2MdwBq5KbZBBPM
         FO47ZpAY7W9mUiXquC5hBAC1zIdds8G432eoqrA3abB8kcuhHwEj+sGCNA63LwhcDy5W
         XWs/hpCOu0C7hUCmT/dYgqni+MEEjO0u2J5hzYX+Ew0Za7GF78XeeUuFC2tE/Bwv0ieI
         pgRAg6K92SGREbYE2BajIo1ADFsouTS3PYmyiIlj4yyUinb8fQdP8IbZyasJ8Q0XmTTI
         YJYGXqSzO6orw0IXJLXROIyF1O/52eK5bFpLcTR2/akU9QHv20YKf6o8ZAc7cwgp0oEc
         Ke9A==
X-Forwarded-Encrypted: i=1; AJvYcCVM5/BwS9Ogvwik4phxnRVka5G0cyNsNHOcasGniRg2k3oynNYHPFOpgf//UrEtNgMGnmJn0T2D4jWsSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXuPhMio+jd6a9d1IgUrpOuCsKIHvyzrLD6hThnBl1GZ5RGMGU
	5hh2MSwGWvUfBHqdjh/kNGq8YJmEHmXwqFAutLpcyWgJfdHaFvmIIxy6gywqMe2hyXj7oqqoP/Q
	Si49GOrerbpng+0Tr5nCSxlG1kGLNkHM=
X-Gm-Gg: AY/fxX4Q6PDmh5xZsjdAvAlkPIRyXzYbtXW7Vz2nbu86BDeWIqPFwJemD4XWhSKGlPV
	wVdcVuvm9b88SLLEw9vn+GrHzHahC9rQIIWHYd5QOM2J58Zq04vpzzXjdwi9OgUmvb+vPEUEBc+
	dSWufHNWfA4db65WOGT20tp/2alu4rR3elf/ZC/VyzWszXB/4rtDq6EF6VIm2PCWa217lpivb2R
	+lLobu8yVTJf0QoRuWXA4CPdcD3HfIQ8uDZblEtZJjKpRYISZWovpuNsUa2WqH5QqwHQVIe
X-Google-Smtp-Source: AGHT+IFRzgGjcYxIbLMExA6spsMBuwax3EGl9r6dtOafMGycs0N9+jMTSH/Ac+W+oS1JYN3ndc0s25a9u/TA2UWi42U=
X-Received: by 2002:a53:d003:0:b0:63f:b1d4:f9e3 with SMTP id
 956f58d0204a3-6446e948acamr4367472d50.9.1765476711525; Thu, 11 Dec 2025
 10:11:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87o6q8l68r.wl-tiwai@suse.de> <20251015145749.2572-1-safinaskar@gmail.com>
 <878qhckxc5.wl-tiwai@suse.de> <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de> <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de> <CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
 <871plbucj3.wl-tiwai@suse.de> <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
 <875xagt7d1.wl-tiwai@suse.de> <87y0ncrons.wl-tiwai@suse.de>
 <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com> <87345iebky.wl-tiwai@suse.de>
In-Reply-To: <87345iebky.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 11 Dec 2025 21:11:15 +0300
X-Gm-Features: AQt7F2q_yl_QsO8lNkmidwy3ZCDdGlJk7jGsZGeMqFXZskur9LDYPeAhNm2kr9w
Message-ID: <CAPnZJGANGeXuD56sfNMN4D4gVQD=4eZ4bA2bTP3yuBJhatXeow@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com, 
	baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	regressions@lists.linux.dev, rf@opensource.cirrus.com, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, sam@gentoo.org, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Daniel Xu <dxu@dxuuu.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 4:00=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> Actually this tag isn't really right.  This commit casually surfaced
> the issue in your particular case, but the bug itself was introduced
> from the very beginning, and it could hit earlier.

Then, please, add this:
> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code=
")
> Cc: <stable@vger.kernel.org>

82d9d54a6c0e is commit, which introduced "intel-dsp-config.c"
(the file was renamed since then, but I think stable devs will able to
figure this out)

--=20
Askar Safin
