Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9232DF3CC
	for <linux-sound@vger.kernel.org>; Sat,  6 Dec 2025 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765057231; cv=none; b=u3UdlCHshgc3ha7NvD8ltLl2xtGmpWyIOS9KtaoxLDnZnVIp+hZFghjLEIDaLq0IyOd0ns4WJpb9LOnbLiwC0/GTOS93tOkpGqEmuFPpQ74SdL+1HcZcCQ/MrQfo5kG3yz3/b/osXHG2us+33j3Qiv2XV9UcFA2dNEgDiKI1FTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765057231; c=relaxed/simple;
	bh=NtKxi7YsFujc1I7HbuzJSsN573ytnARDXoaQUKiX+cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d8a1oImbMJLckaMHVFvsTf5evKWIOCfTsZ6znxM9uh7H3bKQSuPgAmi8E562EwKM2Q2Q6fWE2XHeBhJShSkEbM3Kyghfb+ZibnneM46zuY+tIDqMuZIdNW0JjV0kTGoeegv+15jULIwBNHuXauIhduw3nNyMdJ2BwmWpb9jnWqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPkGwS4R; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPkGwS4R"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-787c9f90eccso32220237b3.3
        for <linux-sound@vger.kernel.org>; Sat, 06 Dec 2025 13:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765057229; x=1765662029; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmZLch+tsUFf8GGxDj+inr14eUW0ua38vm6RI6oO3pE=;
        b=iPkGwS4RshWupwzaC910sbQd7CjF+RTc8i2SM0iagzvwJS17j1SpEl2l460eRPbx9/
         R6+AXZAETocb8O+d87p5KWylLgKpDH+r8RwieTppqi1ZSfqo/q3M3vJYHaNOFWOCzIyr
         OcvBHDe1jV/dGUv75QTKpcMPXsYcLMBHZPUr7QW/ASSktS7ftCNAsEZ9U8KTgloGWrgm
         k/KNLRprq+LMj/u2OHWFlyviYb3pwCAjOBTw2FaNbv7odKZrXZ7rA6WEu+eePSKM1xfa
         hQef9gn+LGqYAkZTPGCDgO6QOoiymBTvUPTUIsC+AseDTKujkB1YvRjiMh4E3ERBrVEj
         /3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765057229; x=1765662029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BmZLch+tsUFf8GGxDj+inr14eUW0ua38vm6RI6oO3pE=;
        b=Qc2ML8pbzSW8fWjnXUKh7uNvh8PDcuWEnB8dquLHCVW4cZvwLyxYG0CB0nksa7591l
         zBT1z6ezQyestgQ6c8c8F+/pojJQb/80UY0/DqCcjEZloEqDEvcY4irHFOCBeQWD+FrK
         87KTy3hDgbteg4qezYoUW+4nJDLX9m/8rqI81VpP6fHinOtyxAYvWHFXkyEgOdKA2kHh
         il+q9XhHCKxqnSpwmZAafaMAHxrJRcnZL1s/DKOsXLORm2AZuAnFmrZZG0HV6ZGUchZ8
         zKYutksgJC7vGjiAQY5MKyyWEYJxk9Bcme8ae4hfjm8NWr+SuHA7FTpQxqxwmKsuQkhx
         SIKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrRzOkFtiKL47YYdERB10yBG86V+U70PLEgj+I0+e12dyH1YpQkrq0xmNAz29V+2qdXp4Qtl+SSEkTaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WZ1uWDC6cGkoL4KzACQA0FgaYJh42BRLxiUo23tbyGmFsB8m
	5qMlrNDfZ7/ANacph70KUMa85KMyvCFlY0icxLarrCUheNW5sseaZ3kwDP8pjTsTDbgApnH5pKE
	orMofLo140cv/s4SorP9zITdDM8g8pWU=
X-Gm-Gg: ASbGnculQQDcORI3kWjYFaST2GPYg3SLvHdqhgBkBtg/TYHBtYMr8FxZnNrL+iFVyeE
	jMm1o9TIIXUSoepMUKwy+B4nri6epscRFHnrEvsnqpcnX1qWiq1s9AW4jSswTeYCSl4kO/oo2pG
	BjapD/tjm339/Dee/svhbJvPUMVfdACEgWLHz/zVtcw+GRwkbntiPf5CpBTS3DUZMbTgVE2sbE/
	Y3OobBbGKA2BQ7XnNJ1ijVzJ67XUGq54e+dmfejNwV3EP5X5QXRY4olonGZ8SOP1PotKIOe
X-Google-Smtp-Source: AGHT+IHqbqmEJ2vaB5W4uwBXmi2AqqrA+VzbtYcWwJiGGaH0O5ufb0McVeuzgrEaiVyROG/3JlGg1/jbdyFP2FsqpvQ=
X-Received: by 2002:a05:690c:f06:b0:78c:28b7:88e4 with SMTP id
 00721157ae682-78c33cd4cfbmr30764857b3.69.1765057228766; Sat, 06 Dec 2025
 13:40:28 -0800 (PST)
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
 <871plbucj3.wl-tiwai@suse.de>
In-Reply-To: <871plbucj3.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Sun, 7 Dec 2025 00:39:52 +0300
X-Gm-Features: AQt7F2oxKkU3ePgE3Z0z9BFc8gUWWy2Y-S8sruhwpHi2W7JaGHpQyHor_1Jl-cs
Message-ID: <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
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

On Wed, Dec 3, 2025 at 12:42=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
> A rather hackish fix would be something like below.  Instead of

I tested. This patch works. Thank you!
Tested-by: Askar Safin <safinaskar@gmail.com>

--=20
Askar Safin
