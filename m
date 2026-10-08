Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AA0282F0C
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 10:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456585; cv=pass; b=cHc/OrVXq0i0+tOlN+705ORIpQfO0296CNtDh12QdtVZUIXqxZtjzk4TgYstcdYYdL3vlpQbjSkXFAqj9oZVyvnpBvgnRuxsv+3McsnFMQg20zW+i5xK/27D3OVKA3UX9rrjn6pJNsZTbXS7RNxbogWDGmhQRjZ9UUDwBSsdxNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456585; c=relaxed/simple;
	bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aEbfvhqMtRuGPemOTOh8EeXvbZDBPM93LOjKp8SrTQ/eypwnVmyTLWWATnu63PUA3xriNJC9oWEUIrOapN9c7LQgwOi9hreHWGTtb6FUbH9tNeqCEMS7faaEn6NFs+7bUETgWAQD6/8UrNhrl6tq9qiV0MSoLZU/m5kkqiAoVBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0tLDTUo; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0tLDTUo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so7205247a12.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 03:49:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791456582; cv=none;
        d=google.com; s=arc-20260327;
        b=PO3Ni4jtV6QuF+0nsuctLQkpozO5byZv1rYddcYhCVtfZgx/Fh88cuOfVtzKR8egGT
         2QuSbmtiG3Bx7tsJ/t2465ScPBdGTQPWHEroAkKpYZ2Kko7AHhTpxyhNhT1ZZKKx7bDx
         KfW/SQb4r+ah71SDzNu7Dxf0RpjOB6BtmBEErb6h2MIBuVm6t1jwEk2PjU16Q/RVidOi
         JDYsQ5FG4tw9n5VLMRTRe4kyys9+ioNUCdiX/Bd+BtUxjvzEHsZ66DZagL9Bs1NKutHF
         ntNOm6yeMoElMTkWVDKvXcGFiAzDQW86ppcTTWzb/uB5DLnMM3rd2ZW9JRE+kyaMiQEw
         N+GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        fh=zulSMM1lEjdLouh96G+PlsTr7pyxjdqcK/0KKkclV44=;
        b=GBKLmaDWkwYgJJXL+Kvto3/pTc4z4TFQ1H6jwp77DRKmz26JrV90kJvYQ3kURuDdSG
         EUnpu6Ac6uIxvKQwzSKxhLOOYHCwTzwuN1q1xZEA3uE+FUQ11Lhw6UtOSI0I8Kk5cYKk
         FPt7XumP3Giv+gckG+NuLy9sZf+IN01iTPMDltGjEFpc3UsIKWhCsyCZTdHp7swpuJiP
         f0iP1ZAuDSAgqCI+Vl0joaFMFdrd17DZ8dPpE3J5vq+3CKrAI5fueUvs5VuI3rhFh2/l
         0v/xgJsZnnLKCj0E941yUakDtPxcgDKzGVezW7HXrdzBEbg0PyqJNF13XSAjpNgNhdzd
         vwtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456582; x=1792061382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=I0tLDTUoPKoyMunz4I9sOPhke7R3WJmC26R214stz14xyi3OyEkGQPq/NJ6FrR354t
         Vd6An2g2rsK44LU2qTLQhiBa6Tm9nZgxNb3Ag2eBw27BdzToCmKren2pMuTipCb1v9ws
         ZqLTdYOKiR3ATkNujJktAfA11VtQHYBEh2261JGqO1cjSt9RN6+BtpLp2gTNk4guTs6p
         dopO3hOUPfpocp5DYcCZtr1Z06ZMNSv2daeCJ7IlLb8s8uWPOXiL1rIMK6EP0fwd18H4
         4P6n+j9TZOX7GbHvPiEWUIsBgfuTo4+WYCxyBIoklvuL9nkfNgzpi9Splmglb+OZ5z/I
         1BCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456582; x=1792061382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=PdAcp1Y8icuQa09tRKqk8yTvhXCD9De3YVdka4tSkqEgbYGp94iSlof+LoPea/McX9
         LMDNsAwjdVu2iGSktwfFt9btToLVIlzBbQ70mm3RMRkTQkOtL6uXdE3TueReoKWvepMV
         KofrjCkfLYUpwCsIvM8veGwLlc/PDcRfFP2trJx+q6Tj28t5wQvNVd/R7Bgm6hKeZbre
         l0v1Zobjyy3D1GvxdJvaxBuO0gRwaQgOt3cYipSU34I75doN+RhnlgUbV7PLCK3PImpN
         W7SYypRciSLWo972LgA7L7d1allyUw+/qyzdF4veSxj7udCVgJroobPdhBt8La99DO7f
         gfsg==
X-Forwarded-Encrypted: i=1; AKwUvBx4iH9Hiez/EDbuT/MVKlAKv3oseTeSqxl8kU3CQ9Qm5VAG+WzNaszM0ZVg0RfY8U6hXig+Yhn7fzgzjQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2hSRGzFYnYq1SikfZwm0NLTqOZP7dHjnsCiwyKsT+5RygTsZF
	iR5VCqBHT4kWygWgmPpN1myCXmmx87b/dJGrRdGszAdwjI+YcIq36huiHS8k5cyDHk4k9Cdwn0P
	Ics4IPyq09yx/NN7W6+goEQRt22TAer4=
X-Gm-Gg: AYBFou2UvZOFbxqXnVwLoE8Ty94f44xP8r0SsNKO05Hulr94gNvVqn5V2FAtHEhn/WK
	uwK1ttojinLpNx1Zep82NfuAa9nU99Zq+t42mXhjtJLCCyEUnebmEX8dKkGWotrJ+Yd0zl9Fzzy
	YgYEHfLuFKsfnY5Lmb2G34GEuO1p7jnZJxsPhO0m/z2fbV3IrZpHN10lBLxYCQrEZVkO8UiTnWV
	Ahx0Rn0n2KPRTtBYWXevQjS0aq2zdxKJm5dnXJU9jwlWF7SwSp7hrZMuf1RVGsmYgRbHOzFh5uC
	an03CAbo8EASXQ//7hqO5BQVZScriYWK2UDmDKnSSX/03eGmUebzNxxylVB8zR1CUvu48CgNJeP
	EVYdJ7hejiFfNAIUEo0b3xlPR9lT1XYQUZaOL2LazkLEdNkSSgxVKtZtli0HIcrMdOIc=
X-Received: by 2002:a05:6402:4019:b0:6ac:afa3:6f72 with SMTP id
 4fb4d7f45d1cf-6aff3756d74mr4800849a12.5.1791456582185; Thu, 08 Oct 2026
 03:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007110858.509341-1-phucduc.bui@gmail.com> <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
In-Reply-To: <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 17:49:28 +0700
X-Gm-Features: AclHuK_fTTXIpKAwLFkuMWapY1wvxwZhKpPugkOpZYUioKYV77e-gJQAnEgFPDk
Message-ID: <CAABR9nEOBf18aC3yUx9-d4TdUYdpdoxuXeNSu76Y3B1HYXytJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in
 FE startup
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary.

Thank you for the review.

> Thank you for the update. The snd_pcm_hw_constraint_xxx() finding is a
> good catch.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I actually found this issue thanks to Mark's review in another thread,
where he pointed out a subtle issue with the return value.

Best regards,
Phuc
