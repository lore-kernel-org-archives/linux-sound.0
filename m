Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BA03B443F
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453403; cv=none; b=fJYD9V6m12etXwdTapxTFoNjhS70q3j2L3Pzy/PzsovrYXcjAg4a5I3FR0A+orxfFeQiNA8jvoOcNzEtYj/WtrzgdRw6mAEwpsBRY/tutgNFtGiVAjnRNHqBsiGRXDMO2exg1yjAktR+AXx2CrQc7NFKGa4YA0EqEqUSmL0BUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453403; c=relaxed/simple;
	bh=ez0hYLD+nS53bPDoJ9heVWsVQpr8/69Rd8zaPJI4Zv0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bv01NJz70g/DnkytDP/Yn15Tceomdzme4CFwIxOrKJTjuuYRU5rsH9ucnfOFOs7NxrtUirEYa0hwMmsjZqu7dHmaK9IICJmamRJ1ol5iKa571WbpQJ+HIQz9K6qS4Uzlzj32Bec3ucRZzJNUJ0+1+FVtxqMiWMf287e4unreTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hAbeCpKP; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hAbeCpKP"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd124546379so1173559466b.3
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779453400; x=1780058200; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aJSWrARkjD03TI4/Uxwgwntrjkc/Y5COT9xgvg7ans=;
        b=hAbeCpKPSy1+LZ3JYjyc6MzswTMOI4SVRhxWAeMfwK8mSUIzl+tL4UHuyLs0QUe8xH
         5SSLAJnPJqOdVFx/cse8ez7qLYwFLVHeXDeJ3yHUb8nJF0ffq3ilr5KhVkieqAw02o0e
         kNqndlGERucxAtibz5yay9ecD6AseFvqK5YdDbshEm9q5NRdQxli/lrFS+Vi87q1xAvQ
         eVgyy8zVDx4CFZQv3ispp6PFOiLhkCjQe7qSUwvgbvdsAWhvRB6YEwS4veAt0lqm1jXv
         b1wlTOdweHZFigv7Eu/SVHzHSNxEFAkyvzNoy4T90uaKDUBPU4krUrIfGG2/CPYrb3EE
         uVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453400; x=1780058200;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aJSWrARkjD03TI4/Uxwgwntrjkc/Y5COT9xgvg7ans=;
        b=aPCEbx9LZIIy2ZKBNUBlQwAOu7TX3WGLekmdESpMg04ZVuaAbFWzOwIQP4f4BwpNTD
         F8C+wpdA6Ifxz9Ev64F1KfdbyQ17/6unQ6MNOg9xbI8CwuTo3LNuu/R7Ux6VQOCcV7jk
         Zr5Gfj/4CFoskS6Mt2rDDdbgtkYOpefDmPEIdhOUtiegnH/U2Bz3kBZK2NRY7gKm5Qts
         a+oc4dPaaXqDdC3aCxllcupZSJjrjSV/KhklS+Bov3/C1xAaP7C8gBgIQ7dBP1BYAE5/
         rCxxWKm1FnFAeWeS5Vk37Jf0fSAo1S0l9IBEjQk8yli+OSGcLVIgQn3JgPpO2cxyNGu4
         V27Q==
X-Forwarded-Encrypted: i=1; AFNElJ/ZevCjk4o45NKkd6F5AY8TfrmYEucwMYUZLY2EH3HyYzaHNq05sw10XsjegWqJCTrhDuIxIlR698foLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuvSSm/I2YqEv74koAQr+hwIGcTAmbiQ/WJkQd+FDFVhKrXOXA
	dQOrgdaD94fAq3lnfTDvrv0vMaTptJzS72/B6Y4H2m/nM4xsQ0yKyEzdUtUp5qbNXjw=
X-Gm-Gg: Acq92OEfDNpaFj/XrTjpYMJeopjPM4zc/DmwMn6C7V7v3DPHuzPRfoqs65s8rpdN0KY
	DWc49Bn5wKWvrBqalQYRcvF0doDedtuw1ZelRquNKnTW+PIVe2rCyX18zqPlH5dWptMKvr4Dfqx
	z04yO0Ojv8YI/QBWg+gm1XNmNoBBAsrveFsQjBqm4/dHXahEfP0yJD4UasdmEn+N5YeNW1fUmnB
	HClXZQrAXPWXkLszSoOCDQFE/a6O5cjmmindGjnoR4fEVmIHqmRjP9KKNiSJnbdl3VbQ65Fx5ha
	MoqMwV8ZPtDwgk9AbnTCRGTooLpj59iL6nv9zcjuRVS4Wf1gONp2oL6GGxrWBb2ZC9o4geEYZvF
	EAUyvVzTP5W2eKNbw2PEEpzBQF76EB3rH1rjO3rtmjFw2mT7d5FK5+CLDwaPCwBj9KaSDCHPDYf
	YSs4OCr59jZvkFuRL6llGAbGL8Ic+2oeB86cbERrPHP300MQNBhA7FpwcVKdKfh77G/cmr
X-Received: by 2002:a17:907:1ca7:b0:ba6:8f34:b419 with SMTP id a640c23a62f3a-bdd23602369mr246277066b.13.1779453399721;
        Fri, 22 May 2026 05:36:39 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm640495a12.5.2026.05.22.05.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 14:36:38 +0200
Message-Id: <DIP7L24WNIUT.2OGXXQG15MPZ6@fairphone.com>
To: "Val Packett" <val@packett.cool>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] ASoC: codecs: aw88261: fixes and cleanup
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260518220906.347958-1-val@packett.cool>
In-Reply-To: <20260518220906.347958-1-val@packett.cool>

Hi Val,

On Mon May 18, 2026 at 11:44 PM CEST, Val Packett wrote:
> The Awinic smart speaker/amp drivers were merged in a very
> "downstream-brained" state, where configuration was only really
> determined by the binary "firmware" (register list) file instead
> of properly participating in the ASoC system. Let's start
> untangling this mess. This series makes aw88261 actually usable
> on devices like fairphone-fp5, motorola-dubai and xiaomi-pipa.

Thanks a lot for working on this!

With this series, and simply hooking up the two amplifiers in dts,
speakers seem to work without any issues, getting rid of the hacks that
I've had in the tree before!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

>
> v2:
> - Add missing sample rates to the switch statement (turns out we do have =
them)
> - Process the conversion from requested values to register ones directly =
in
>   the ASoC ops to make sure EINVAL is returned early, from the right plac=
e
> - Do not include untested aw88258 fixes.. (why did I think that some supp=
ort
>   for it was already present in the tree?)
> - Do include TDM support, logspam reduction, a newly discovered mask fix
> - Remove misfeatures inherited from downstream: async start, fade-in/fade=
-out
>   (hopefully this won't be too controversial?)
> - Also overhaul volume control to make it actually usable as PlaybackVolu=
me
>
> v1: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/
>
> ~val
>
> ---
>
> Val Packett (7):
>   ASoC: codecs: aw88261: support changing sample rate and bit width
>   ASoC: codecs: aw88261: add TDM support
>   ASoC: codecs: aw88261: reduce log spam
>   ASoC: codecs: aw88261: remove fade in/out on start/stop
>   ASoC: codecs: aw88261: remove async start
>   ASoC: codecs: aw88261: fix incorrect masks for boost regs
>   ASoC: codecs: aw88261: make volume control usable
>
>  sound/soc/codecs/aw88261.c | 612 +++++++++++++++++++------------------
>  sound/soc/codecs/aw88261.h | 179 ++++++++++-
>  2 files changed, 486 insertions(+), 305 deletions(-)

