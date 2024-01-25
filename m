Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFC1350E5
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 19:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706209242; cv=none; b=ocVg6aTAZmv15RfwnsBlkdKmvIaRqjTaUjs7jKTxH64muYRUva3tPz9zTOtmsIfADeZT6OhPjjN//QmyQbqTi1BztE/dQoY7ymLMQ/2AA3m5uHaNTpEVJovTg6PiHW5xtnwYaj74H9hSMCwuvxH412kVrY0a0nR9mLl2taGE6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706209242; c=relaxed/simple;
	bh=k4alKl4ZXoowv6FzIFl05GN/hgyHnj+4p9u8hin33Zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dK/ayo4+JJPAYnlMTZeOkAo8Ar04aAJ/hoB4aGZ2z2pDzbhYyxp66PQ8sP6MjzXTdSpxG3VuR74Cte6drzPAbrKAbk3N6y/n16X220BBK9VzN2ozDEtHcoP4mNiAdhlqw+7axItLIM9tj5E0y4hS3hvwZriN523wQUiIQ8V7DJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YahIEBM/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YahIEBM/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a314ca7852cso172059066b.3
        for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 11:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706209239; x=1706814039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k4alKl4ZXoowv6FzIFl05GN/hgyHnj+4p9u8hin33Zk=;
        b=YahIEBM/0WDwLNR37lGCbWjfo8XlPHuXapKq3GF76o6VujEIEiwW3nuaoyZgWRmUhv
         wBYTV76Os3M0gOgBpFlOjMVcRSiP5W2hVJew+cG9xxI47zWmTyvSH+TTNsJ9DHJPKT79
         hmtcbx7EMH0UWnKHwllxtvsLsGUXELRR1eNVB+zCg31fH97e5Yv+YE0Q2fbrf5g6qIaw
         U8qPTtF7xW4T0DMgVK+8894sWxx1mx4ADqbo4uR9cKlXLITvmpO8S2MoayQn7YylBMgp
         Ks2k2IKFHLQDvEfIAsi/vaEsGtp00ku3kEZ37wcVft3ZkEOCBXBrAHAW/DBea+/Fj4m0
         k1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706209239; x=1706814039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4alKl4ZXoowv6FzIFl05GN/hgyHnj+4p9u8hin33Zk=;
        b=wZvx3iqK8g/aEAzbRQOVEKKDmD6m18S26G7Ochsq+0gFUS/kvY6RUvu9lYpwDSdroq
         kiXMWWGSSbOlbYxqSCLZoG6xIKVAY8J+t2S+HkQm8nbnlQjxQkw4a9/GKOYFWWsk975Y
         yp7XEwBlQ4Don/2KQD8VJqiKjzByuCOwNq90it25NRDXQamYZAmJfrDn+JN9KpPGYTZL
         7BK8n4Sen+sL0ZDOkudOi+rdwXfpWcLAZ0dyO5Kr3SsDCnogo5pmIkdrjKhSOFcTFkYH
         oM20ssD1Bpd2DDC6njGFWCIJCeLKYgWgqbR+6ds5I3If0W+uWbHpaGI6S9SldNFA/sUk
         Xhuw==
X-Gm-Message-State: AOJu0YxcuGPc3UBWkjuqGRs0NjorMMvcOVLASeWLlq07JcIUwoM7qM65
	b/Tx/Ua30a0xwQz/VfD0mNtoffA21hkS6VJxqRhb9RNOlBkupKLWjWqnULmvB+mX37/NQlNcM30
	VIayIOAXzeEuQ4gSLdBvyB5/oTXAnnWn+neQ=
X-Google-Smtp-Source: AGHT+IH8LUXM8+5/hOq34RBERyrCuIHb0Q0VNE8VNaYRCZR0HhtyHp7VfZXdBR+c0W4guh0qyebXkCH2T/7DnipEds0=
X-Received: by 2002:a17:906:b245:b0:a28:fe84:f2c6 with SMTP id
 ce5-20020a170906b24500b00a28fe84f2c6mr30455ejb.15.1706209238613; Thu, 25 Jan
 2024 11:00:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com> <20240125103117.2622095-4-ckeepax@opensource.cirrus.com>
In-Reply-To: <20240125103117.2622095-4-ckeepax@opensource.cirrus.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 25 Jan 2024 21:00:02 +0200
Message-ID: <CAHp75Vd7CsZAMNKGY=a4+J6Wzb7a6oDa3-coXoDVK8AOgvKHGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] ASoC: cs42l43: Add pm_ptr around the power ops
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 12:31=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:
>
> Add missing pm_ptr around the power ops.

pm_ptr() (here and in the Subject), but it's a minor one.

--=20
With Best Regards,
Andy Shevchenko
