Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DB424A06A
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 13:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782827466; cv=pass; b=gT6xMSRyzYKlY8OPVXpgNRJOfzhnGn2Gzd6kgfeqyXuR9F5tjr9MsBhRO1n/w0Z6Ik6gvLpdJTeXANVq59ciwIRQEPV7Uf9hE2vEeX5I3XkBF8dL41TyJevDbDvcFThtftzwAmx7MPwbqRvjTcnk89MLpXEiIWrBt5ud4GjOylk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782827466; c=relaxed/simple;
	bh=57Qx2LhiFMuzG8d72fpu0Nv6Bu6S04EH6MNhdzbnRWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBovMpOGr5umh6SPDeTR2raep46x2Sqt9wjBOGMEg4jP5QgKl9+lZQIBSPur9LgS4x8PtEpvAajILKPmzgr9o2GPtQj0idx7GlXA1GdIyOwfJ1P8UbyO4rwpMRK0eq+9fDtiMukpz03vl0qlZzom9VDVPi74UQJx+Tz6aUQWNwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVm20OHk; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVm20OHk"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c9e89fded0so21706495ad.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 06:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782827465; cv=none;
        d=google.com; s=arc-20260327;
        b=eR8RmLXFwbyQ4gweQE1ygFJZBIZBJeYs58ySDQ74dVrdlHcRkGzO7z0OTfBUu7uysU
         YTrU1QXMVwiE+mJbJ9eJfGgvLpn7PzwF9i/ss93eU6rGorXBWepni7ha7kIinl3LVPOd
         Mc2Ke0SdWJaUDNRNYTCe7ZT81/x/2cMNOCoS1vvXsFlBvHPp6/cWLggJnolNaKNqo2mn
         AKzCavSDuJGBkVYMS21Fbswc0oYEJFUP2gNT3dSSyB+1ZHuCoOTFw4hwUkyCb1dGiAE3
         QtZRC2iW/AQ/x9Cic/7VsmCbrNjeya3Ml4A4/we3WqimSJ2aoCGDmWow2zmek6Z6Zwni
         UUxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        fh=XClryzd1E9X9Xr9LTzB8kh5Mepzz91jP81LVCTNbfUg=;
        b=TRbVhyfJYwJvTs1reUoD/mSQey7HKKfLIX4FsrRE6DNATs3eSdzKzvTIkHkXUgwm3P
         ULfWZInLmWWuynyVXOAZGx2JLZ7Gn1gdIZPIhu3u5vel4ViMX2j3VcVHnlNwYQeun/kq
         tEiyj+AniPQpsc1445m0a1+lgRvpIyhlI6W5v5E/YZ+ts2XQ3jd3/s49e3G6RTfgroiJ
         CbQsFx0fmKk5tFKGVrO9MrnJ0T+RE4wX8K1PaHVPBudMkHa7mzQCmMv7X16iKvlkkXgy
         ypFH49QE+D5s4RsZ4adrh+xTkC9n3YT6iQWIfKA5qLxGdKnMwMKXlnwSDAf85zBoO4ss
         9YVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782827465; x=1783432265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=BVm20OHkO2ysV12cv+dia37H/g/sz1K7XHeB+B8efvfBHVWYEbcB/FU9z8Qdemmhvq
         GJmh1nWD2zM7EHAYABvKzHIGkGdhFON2AawSUFUZg4OZS4H1jTa48igQUc0exa+k4Iaj
         kfK6StxzwSmVTnwiUDWeaiAxR57ZUaij90eRBRizpNvdhyWhkNz4VvYPcW5uk6wrj0Fo
         4+Cgm+MTXoGRFSfpoR5LTH1mnrR+pV/AzLZngvAYOUBct1ahQ3e0VQiCiZeePlKlssVj
         G925LQcMdHwSsyRf3tPj2qv5X9QFadTMHFsVpZ96NNHLKiI3z6H8mvpwT+K7MmWekmjj
         zeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782827465; x=1783432265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6lTkuJtbThV57Tf5WWEoPXOogHAi7+jN4q+aTmy7jjI=;
        b=bkYI+cWtTMPbzLlyK6UZMJaBq/oRj+g/N5l4l7lClU8G4l/lL9ob4CRqUxnQ7KTrsQ
         Xf5SydNwQhUsDebj3Bf+uTucMc5EOxgqQevciDiR6TAA7w364RXC9qbK13eEPZaMIvy+
         tIqPwFgXLaadjfV5qUFrt6N9OclTbvpYsYdl750fXiujW6aG1AUjonzj/CTPfuIESvWl
         1eDsucM8GgJBOwNQsAHTtZ00FpHrQziiawqKB7xavyJqvE4b0WYFjCBk0AbcyBAbVpsy
         8k+6GDQkHTWEXUmRC0AlV3ANu+jPK6bd1RqH5V3RDmYNDIQu3kxF4GJcwyFfLCBDNxx8
         lm3A==
X-Forwarded-Encrypted: i=1; AHgh+RqdRkAYjy0QM8Qm9LkRTprILTTAhz3gp2viaZjLvo70t5QrlkQrGJ7vI1ik+NFiQ59An1TY2v6h07iGWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9LaujK7azghri//Qlh4JEnpwYop25CeHGF0776LEYxqdnDNzI
	F0DCCXSTRwpA3ty6UYHhjgkSM0DhJePjX5uwbmL2ve+atqEcn8j1EA+T1nGm5mcfLVQMNoGNNwM
	7qYiFcruDmNa5SLfcgb/+qyx5pWGhEio=
X-Gm-Gg: AfdE7cnNC5CvvnBqKntthViyCDOkWvA/+smaddfF0UuchOyKFpNJk4H/cp4dIGnWxGW
	FjaHHk6v2/pMFaDjnkqQlNO2jbxucB6hqRtp/nJAGumO1yEBUoCPgsYtl6LM5SEtT+MtXOMyTtL
	01hi17jyWm44CNhQqFTO+NvXTEcVAQ8y5XLcx4Lhu3l9xXlxscYeCyWtEVDCsxC78EapjGg4YTk
	BessSoltHX2lvdS34YDLZeH+SdXq8Wu3Oq6GyfVjBhFU9kup5yE80h2Zgy2gj3en8vVLMazF8qv
	YA2EsoxoF2U1xmP9fh667pDEeCQcJUXZgy2ec8YLJnbscfuKiYcttxjvqtpiuw==
X-Received: by 2002:a17:902:e947:b0:2c9:c517:d078 with SMTP id
 d9443c01a7336-2ca2ea32743mr30876155ad.36.1782827464698; Tue, 30 Jun 2026
 06:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
 <20260630063449.503996-10-phucduc.bui@gmail.com> <20260630092821.650c30ec@bootlin.com>
 <CAABR9nG5Wo1Wb+2_T6dR+6XTw8Vs9awSpQrSZ+k6=jp_ogoGCw@mail.gmail.com> <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
In-Reply-To: <f5ab965a-9640-4df0-8108-7877f34b6950@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 30 Jun 2026 20:50:53 +0700
X-Gm-Features: AVVi8Cc6YVwHmJJJBcmL6xlBLsZj8Ul3JarMT_3ATDvT8NUt9u8sy29ELCp0KAM
Message-ID: <CAABR9nGGTRTWTSDmzZ4OcXmQ1zmWgnm8yPN5vM1DFLyn=AgwOA@mail.gmail.com>
Subject: Re: [PATCH 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Takashi Iwai <tiwai@suse.com>, 
	Nick Li <nick.li@foursemi.com>, Support Opensource <support.opensource@diasemi.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Srinivas Kandagatla <srini@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 8:29=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Got it. I'll make sure to trim the unneeded context in my future replies.
Thanks for the reminder!

Best regards,
Phuc
