Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25F029BD9B
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 02:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759891251; cv=none; b=e9Y87u8BmlrCKK/PgjhXTOQ5tlm4cIAszuJwddgAdnlJmZSwVcExPPsgR+MI+7orM977hWP/GDmjvUhrJRckgg5+BAZOpaEhZaH/K5VdrwFNhqHOkw5thI67TRqahp3Y/w9JkAz/o1q+s0XY7NQKBiX7s2XqENO2Jpj1YYpfZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759891251; c=relaxed/simple;
	bh=vbpwXTejC+yajTX3XXncJGeds605AJHrgdSUCP7BbNs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oqmK0hYk9EWeDTaJldubzNkXgtR6JhgAUywmU5KWH85sLqfQKeO6q4LRZtdptura7IgGow7oO3kBy0DlxFgZfYiUDr6f8LW5eQEecUPv+cWzqIHHiDRVSOexZvUBaVc2wVOGeVk/8PUti7HfRUEBsX9gbf/jd4bUgXDdEXpLr2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hTAdcuHp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hTAdcuHp"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3fc36b99e92so304940f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759891245; x=1760496045; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbpwXTejC+yajTX3XXncJGeds605AJHrgdSUCP7BbNs=;
        b=hTAdcuHpIxENGBpN9STA3bI7YsxHoTZ6EtRCkJqoMD/wiGNCAwTIKV7IsP8wPyG4bB
         U6GLpIU57vGx18Wjj4enoKZBERR5wmO+CeozzgXfVXfvblWakhfgees/6FpyeltmCUju
         r+vcJuwd/tQkQivDRtnhhfLFNyUpFiDRI8wWzWJph5fSpU5lb4/WfoN4XMlMK2tNKP4c
         q7vH969Hk7rYMvcGQmv2gquNNzh3cjb7FCO5O54XwwE3VQJr5H+Ly2ZHS94RxjpZKVZp
         Ty+Q+9JpswO9NMCEI7NDDv3pmVG0bz3NJfKPd27U5kJIHoTQcYK4lmCsqIRreMdBdLK6
         1NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759891245; x=1760496045;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vbpwXTejC+yajTX3XXncJGeds605AJHrgdSUCP7BbNs=;
        b=AIzpWA78Xng0Qbi/eKHG14j5BeIaV4XbmD/ObK7OaqXZPvIVPKlcfl5OewKT6WxN4F
         IPiQhOa81dsZasB/sAK8W52cVzAAAAEEeRE6PHAitn5KFQkXbky74b6u1vsaUlMz0Zo3
         7bjyVYr9YVs+Q5wkvVP1O+/SJtvWfQATfiyrZRFseZC/077P9kjBJd+6WwE3qgwhObY5
         MQMcN/jnH0zUYI7tvvMg3Fq2g4iLKUSu1nEr0AIbibVVnjO2BDAc5wX+Uw/YuTlTDqwM
         BK0xiJ/zwX1lH9c3C9i+/cXxLhgOzLitjCl86IRmKBArfbUO2ewoUqcvlWhXXVL6NhtG
         qqSw==
X-Forwarded-Encrypted: i=1; AJvYcCWltp2s3Q4ULjsOzLLUpDi5gBoiRJBTuWj7IqsnaqLSHqgn6jUsVqtSr3ZXbEL6jtF3TuJB6osMg8+hCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKc0aiTW7Wy/4fM65fgHv61MZDQyKX9vZnt2euZs7c3lVNWWaZ
	8rAweXRoXChOBmIShqkRtbEFAJmQlrGu4URoBoiSvt+ObPmfvoDT/NQGQoxmV1fD8qA=
X-Gm-Gg: ASbGncu3IchbUmI4zktmKyzWCD1k+XQhotCjorkllM4mC83b4oNHf7qpJ/qNuJMIsPY
	g5UY7o+O3bCvhxHQi/prfH2IgHHOvL6LtyVLo4Q5nIVbIqIH4pYCntdGuXs9rHjI/b9S4NOeXo9
	8se0zG2RNuU0c0rkwRuyMtlS2UJUq0xWu7lkSu4hqjrpRkMWds7Rgk106MdL1evlzGIYWUh+afP
	EhARYNaOrWWWgoiqGKWWqlrxVDhEeJHQGf1ro564vl/LyJ6oCA20P1CG5uraLb+Mrua/oOti1m4
	tegvvAdIMM6B7HGGDAApS5iGIsI4nvlDsdKmEJvcR7WbEanRnp4U9LsNgnUpVe3t9dwfRi9uQ+h
	sG+4K4Qiqh0MgnmM+cvsQ8oBP/m4em8Fj32E/KDd1QMCbbxRZItTFo2g=
X-Google-Smtp-Source: AGHT+IFFqlDGt7h0nc+NuKrTo3pc2pheELlH3q2GeHR9OiCLFLF0nYVBjizloysNNRJBS6y4P310LA==
X-Received: by 2002:a5d:584b:0:b0:3ee:3dce:f65f with SMTP id ffacd0b85a97d-425829e7935mr4259067f8f.14.1759891244667;
        Tue, 07 Oct 2025 19:40:44 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:8c32:dd4d:57f2:8be7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9724sm27496800f8f.28.2025.10.07.19.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 19:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 03:40:42 +0100
Message-Id: <DDCLDNFBCALB.19TNBLSQJ5X86@linaro.org>
Cc: "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 <linux-sound@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: qcom,sm8250: add QRB2210 and
 RB1 soundcards
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251007-qrb2210-qcm2290-sndcard-v1-0-8222141bca79@linaro.org>
 <20251007-qrb2210-qcm2290-sndcard-v1-1-8222141bca79@linaro.org>
 <67e313d3-1f91-4205-8aec-fbbfa41004f2@kernel.org>
In-Reply-To: <67e313d3-1f91-4205-8aec-fbbfa41004f2@kernel.org>

On Tue Oct 7, 2025 at 2:45 AM BST, Krzysztof Kozlowski wrote:
> On 07/10/2025 10:26, Alexey Klimov wrote:
>> Add soundcard compatible for QRB2210 (QCM2290) platforms.
>> While at this, also add QRB2210 RB1 entry which is set to be
>> compatible with QRB2210 soundcard.
>
>
> You explained here what you did, but you should explain why. I don't
> quite get why SoC sound card and RB1 sound card are both needed. I would
> just go with one.


I wanted to go with none in the first place and just make it rb2
sndcard compatible (as a fallback). Then Dmitry suggested to follow other
sndcards patterns and implmenet it like this.

There is also at least one qrb2210/qcm2290-based board -- UNO Q and at this
point I can't say if it will need separate compatble or can use
qcom,qrb2210-sndcard as a fallback.


> Please use subject prefixes matching the subsystem. For bindings, the
> preferred subjects are explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters

So the order in subject should be reversed. Got it.

Thanks,
Alexey
