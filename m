Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E671E457E65
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 10:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196503; cv=pass; b=RWFqNckj9R8XNAqr5ka4bPuv85q5QXb0vn/qqKNot21+5B1/VEldo5waxRtU02Suhf3MMNJJY2gkWPKv4vM4OVLKJsxa16ubz6BtG7znsJ/WtCFXa+flLYPXSI0gEyg7mH55m7opDAq9aQiWIwMI7OUza8Bk3nUoVDPOsXQzpHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196503; c=relaxed/simple;
	bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MT/XLZHErZiYC03dCrQW8ZO+osGwK6bxM5RrG2jZKI1s+KWyWWQvr1u3yvwJ30gJogyQ3oT8nQTYX8eh4vsmJvD70YGcdJd04I+K/s92hCt6kDbdj1ejHeFgUe1bQmrjx/vBZubZaFEpzh7ZVI324GESUyqbvinmBGt6TDjrC1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUtBeRCn; arc=pass smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUtBeRCn"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2db1ca069c8so6418305ad.3
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 03:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791196501; cv=none;
        d=google.com; s=arc-20260327;
        b=szkjWniA7GvUpZdtbLKC6t335qs7GWPs4GAUwq1pmWRwk8cD7ci6/DygLB5Fm4EM5k
         1PKq+RKHcjwXfwfCtMiJAvQ4fO5b8QOaLHFoDzHORqq4+R5hACHZTjGfstdyYGdLxCig
         TC6p/lG7crnSUDdAXbK3sN7EZgAZ8batHQzs+3Ix0KhxhkCaWytq7N5h+pFvJLf46Qyf
         sdAmnVCe90oYLbQqLNVKqiw6zPb1QZ8FBqASqxZrR/n62rSX6ZtCMppiwgp6ovULf8G1
         1tKoYMy6MtSw5bA4FdnbKdSl6N9ZSi3tV2kjMEglLtfebVrFvva1FzJRdPCfmbDNpaBg
         UgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        fh=5e1SgAhxDMgbgjBFEd4XVr5iP+IvjYxXmwD0lDTMHNA=;
        b=U09OYRKmKMfr68+jIAoKA2Yf2qwJP+GYxsjEfF+LwgEAH8vOfHNbXv2jiLa0341YwZ
         oMtl0/uOUrA59j0NRrJdQD9VCl/xld6ri5e2sOIRokjQMpdjdKSd8lsouK1HVFmmKErc
         LiEY/5kxLx2kBkzdjns3xhX+NnAnt/7XxOz32R6PT0hn3Tp2ZnLfofPf/fOmT0nNOME+
         OiXUWaooOOmlsyhbpfhrc4D63F62Qb+mgB1m+XJM2wRA+F+mcCQSglIq6NP/t+DEoCu/
         9simQDv4NDe9ZQPkS0fxN1kuTe/OnFqRT6lWU+xdUQVaUj/1P2khXAKuD/P3NiGDCT0Z
         sGag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196501; x=1791801301; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=PUtBeRCnu0CHbPiuimt7q9Cc7TG4ogrIJCvcS6wmrdqkHDPwaoCoAvYIxOlnlaoMtl
         rXva7qlqgWWHqYDJTFKdZx97YBPWiYIxrtvhIUmXIIh1ace6JHB5V6y42DbE4pWEAIuM
         Vi192RvrcFTvp7Yj5iBOXaHida7G+/ul9GxGEFH8ZVZh8wg4TP07xfsFqug5nW9diYK5
         ccqZOSYEtdCp3gTe22sqJwQTdu8T4IFOaC5ITaYDob8p/8mnJK9V5mG+Ey384Q0Fb/nD
         I2oASzZTjtNYZPOxWkhMlghtO2TpVON+unzev9JBDkkuPY9Zh4kSMTok95zDpRvYKe92
         Aldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196501; x=1791801301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=c3PsUCepXb3uy7iToXtRMCfm+U8h72jV191/KDDaO6oy9mVoB8ZLY77uqhoTwnQexJ
         a4pvyzo7dlaGHM2SLqsNbB5sRpMD/9x7yOtA/DEjQa8NXuFHlhgRnL5zXx+DX1mkhnT5
         RJMUbw+mYP34xNk4zwgSQD3JjfQy8n5ZpBPIxNy9OEYrquEVzGSuZadfILBLOTntzzHM
         pWPnSNicMIXt5ARKm8mlf45BUqNxIIkaCSneUNPHqT5nqEsYV9/rZblul7Elf/sQpqFf
         nn6sZk6mGDHj+cKp34DLgGy06FaT1n/JKKfDPMbUKJYJv327tb2Wvcy0t0kBhv82sZOC
         C/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBymyxl08OgBm6hv540tcB6wlBIrY6Wbnnhw79oP96nt8SEqslNv8CTm0Eq/OOKPdF0GAytuOA5UldQ24Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKqjNUkp6MLj2+jI5t1CSpUU5/R6BiQHbeA+ukOeGuiinNFwli2
	hErk5RpNusKZDr6dpQ9o8H5KQywwWENyFJHr/FxWAoq+7ryMCMGhDdmyCZWX40i+scVdMb8bAlO
	CI+WYks1TRcdKxLPKLU65uItLWe4pWGo=
X-Gm-Gg: AYBFou339i4y4540Ni+PBUkxljQh3qvE8iJSymf7t/boAzwjY72U36L8+FGGas24hOy
	GHpAUcG+hK3i7JihMhpBXgSrBTCq4cAZSVJw6sIZyvxsMrAxjoorVb5vzu2EirYrMrZj32rUnhF
	q1eY4pONF7u8v9LKb49mQagnHpL6333CfVoTbJWTXnlUQcORCVOdAAXYaJSXsgNz4hVEN2dpfUO
	npjlqZxbi86FQPW2rAj3w4srxoXPgKXtCP4cQCNrn1k3ENVNQWXSjIWDD7GoUGICm9WhFQZ+itO
	OIuED5KGdY4WMkpnkVOQP5ahYYBt5Zap6eAWFVMbT4HRb8ffwq45foZYQm0ExJch0twXGuV7Rsk
	u2qHTKqsW6Yfri3qz77jjQPWrVsAqJAi7IdmB8iYYL+Rk2bnWmOLfDZnIjLu0HCGgq3Y=
X-Received: by 2002:a17:902:ccc2:b0:2df:8aea:7d92 with SMTP id
 d9443c01a7336-2e49b7f79c5mr90908515ad.47.1791196501061; Mon, 05 Oct 2026
 03:35:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
 <asNbjSrPYVbeqSae@sirena.co.uk> <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
 <asN8HzfxSHmBjfu1@sirena.co.uk>
In-Reply-To: <asN8HzfxSHmBjfu1@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 17:34:49 +0700
X-Gm-Features: AclHuK8Ugc5AChxqexu-mkihhLXhmwiRf4SISUAZ4NMYY9zRq0-VJGBtciRXzWY
Message-ID: <CAABR9nFg2mPOA65Q-9SEDwmEoJ+-YUQqOi=c2nspSYF=UBejYA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

>
> > On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
> > it calls soc_dai_mark_push() only in that case.
>
> > Is a positive return from startup intentional/allowed?
>
> It shouldn't be, no.

Thanks for clarifying. I'll send v2 soon.

Best regards,
Phuc
