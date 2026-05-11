Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E137BE87
	for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 12:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501294; cv=pass; b=GUNk7EPF2sHEOXgKN0cZWdlk0Bi2ULOB/QRHNKSuBGMdb3P6Is4C80SQsZAq0m08nHOfwRV9bKrAkf3pz6Cjognj6clo2o8Ck/RNBS69ZPDmriaCl3541GcoI4PZf6F6Mdj1d7QqV6tQqsijlGyXHrw6lwulw6YgchkasJOvqpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501294; c=relaxed/simple;
	bh=tK4pb3Gh9MN2V0SiI93nGuINCXuy0syKVkePRinTfKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6ZcPYintXenFxvbEuAi0uMJSe9i+ZjO7lwvgF1cjxBBrw5c9UAKyjOYR+L1qKUrhN4yJro/fr3M3TYakBzrUvFhmkJZUSpPtVGrettZ6Yr9EJW3X/j6ykhASKP5CLu/jrM9Vg+hXdPNE9FyThf1pfoRtN12SS+3a7Or+gYcH88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RWbjWlhh; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RWbjWlhh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso4176237e87.1
        for <linux-sound@vger.kernel.org>; Mon, 11 May 2026 05:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778501291; cv=none;
        d=google.com; s=arc-20240605;
        b=M3SU0KpD4WgIcfYsxzfUoQ5T2I/689nlZejB+deF9eVilMBtIM21fNZxNySj+VPqaw
         Pv8nle28UH6amasNXpdn0TZ4u8sGzJulr56dkwL7OLQCFijyW1IRK/47lxSIQ0M0/k0x
         tt00Mv3wokg/dCiIQ3FMRe1Ty4MkstxxNJT0LHkSMwUMNtnbicW8xmjW1OGW3o/LlqPv
         gl7LbDVbI81wEmWSj4KJvXj2NG4ECz9p4+Mz3ZamQBaI9u/PAT5aLi88egTnRHBOZEs5
         ZeZ1PYNAx8tYoVfZOxqOdtJcgB0HY6EiPRj9Fe0o+ruxwFlUpl3RxtAj02HD6xkKW24N
         fxbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0iu5YFRe2egDpWdvuccfx6BLFOyAGEfVC0ZhRaeX5Gc=;
        fh=QrLU/lNVbssrRHL+cyaV+IhI050l5hozSIRuGaCjPII=;
        b=V3gynx6G6crgpiYYC8gocVJVaR5GWu3ZD1j8y8BDmoMtNwEDrXOyaZ6ZH19mOwrcZC
         96bDWGPrxdVmj3o27mm+AubpHE4hD+aQSMhtNLG7f/bPD8luLdrcL9oo2rouzR0W8KV5
         cMsL06ZMyzw0uMZ3sAeAqnpL7EhjZjQI20K5wis/oQCbKhH1yIxuGX9rKBVX/V2mnAeD
         gl8F5CcbiqXEniCuRKoG91zD9wHh2Hy6eylVT3/XU64V1ejsE8uKxnPDjuK9tR/7awJY
         2jJ4tgZi1ZrOhgb3bpF0RheVKMZaKH0XHV4Noqx7ZQV9dB+ym6t7xNwo8q7p1v00jQnD
         CKoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778501291; x=1779106091; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0iu5YFRe2egDpWdvuccfx6BLFOyAGEfVC0ZhRaeX5Gc=;
        b=RWbjWlhh/+jEYGFdiDu6W3e7HxhTVWH1QacDM5UTDj3zK4eAkxhLZEZCXpehQligZ5
         NJEvVBzGXSjUuvwJvPyGcmTBuj5n0G5Prj45+208CqfO8HdxkpTCD5D1Q6iXv/xnlk+T
         qZAWc/HDPecam3b66twGJu+9hJ6RBQtLPXbMFfXKPReas9UkeUMAPZLepUn45NzY/Asa
         zTb65R6kXzrr6xCqoYtNAl1rDIvyLGZLxuWACr539BwWh0ws+qJ2wEIwzGth+7LqcPTt
         OOqFXONKZnupuqKoJtq8peRsfRz4Xb31nLUP00aUzKGSOLPngBt0bhLAH2OacMWCFCOu
         ginA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501291; x=1779106091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0iu5YFRe2egDpWdvuccfx6BLFOyAGEfVC0ZhRaeX5Gc=;
        b=WAyfJhSLjwK3oTM2hXj9WYbWuR2NpF81OOBFMpTTSuyF2xRvi8254wq8qDIAAvvkvi
         hGXfFSdMSkc7jWJ3mNpm80Itbm85J+7iRuGkQNzA6qKNroHmIIznIlZ+G7DkJM01dKCd
         wag6cRSsTeF3qzlEUpZvQYsPFLQHbxvnpAHVePHaoCs/MDgAG7ya3OOcHoSriLlv1pxB
         VUXFWsK579bTecnd+fG9/AfP6Hr165rRd38KJVPFhlyTb5lcrbG/ZrpM1i3ow9AQ4R17
         QC1cvPzs+8kAKjJ7TSD2B8+CJu/KIsD5wWtBpJVe99T0WrNbz3rzWwe1/2XChKmfZTOp
         +i5g==
X-Forwarded-Encrypted: i=1; AFNElJ9qS+SlT4X7OSG3tLkG/b+Mwrn/TUeWrZeynmpXQYgVLHLridpBpVCs/+EdQgNMQRtWxnZzi1guS5wRCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWWLAC/eWRgkZfKw9I7hzfR+gqu+RX6b+V/1l8yORvezyaOv2V
	v6tCThKMF9UWzHQGCSvDImUnBmmNvnxeF8zxhYPM+ugmnlB8k3RliWtq9SWk2wOevhVItTlHfuv
	7Reel86NkQq9kT58r9OshydCCBGHSFxwYKbx5caHZbQ==
X-Gm-Gg: Acq92OE544/Rqpel7tBMpXYFhYLX/Qi9iKaqBUsJ2/vKdpKPQYu2FkbwdiJfOd4ev80
	hJaWb0GUBg8DgejqLe+8HbfeB581HcpDRyPAg3NcZn7rJ6AtLiUDwDU7DNGRzXlQUYu7J+p3NxS
	uMbiWQn6n1XGvli1lgX6s5mfNed/+Ez40P67jALpBRPxuNstL7QovNM0rWfO3x0Cy9btml9NAbV
	l2FiPBsClqQ10Sl5O9Ne8sX81erJ8SLr5K49jZYiDSBFq7y8CqfKgbueR6Jz05sDea+eFQFNRku
	/2NGtWSsXeua8Ba2KcbGt8GwUjO4rlk8fGm6Ng28D26bDWUBPIM=
X-Received: by 2002:a05:6512:1246:b0:5a2:b3dd:7a74 with SMTP id
 2adb3069b0e04-5a8b709dfc8mr2539236e87.33.1778501291160; Mon, 11 May 2026
 05:08:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508150327.351779-1-marco.crivellari@suse.com> <177846077642.988959.10334055002931155522.b4-ty@b4>
In-Reply-To: <177846077642.988959.10334055002931155522.b4-ty@b4>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 11 May 2026 14:08:00 +0200
X-Gm-Features: AVHnY4JzXkYBE0gFtUEXIi7pCztT5yxi9IyAjp4uy3ezjw2yRXF4k5oBu5i64Sk
Message-ID: <CAAofZF7WVsvrjE2j760DFHhvWYYs91EuuruSbgJCx5H6Vc+0Rg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] ASoC: Move system_long_wq to system_dfl_long_wq
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Oder Chiou <oder_chiou@realtek.com>, patches@opensource.cirrus.com, 
	Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 2:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> [...]
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
7.2
>
> Thanks!
>
> [1/2] ASoC: cs42l43: Move long delayed work on system_dfl_long_wq
>       https://git.kernel.org/broonie/sound/c/45f7d7af0eeb
> [2/2] ASoC: codecs: rt5640: Move long delayed work on system_dfl_long_wq
>       https://git.kernel.org/broonie/sound/c/11b92ac8df44

Many thanks!

--=20

Marco Crivellari

SUSE Labs
