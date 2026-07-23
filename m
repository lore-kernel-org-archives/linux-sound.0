Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C2427FB5
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799439; cv=none; b=RdSlgD90Qt1DKysH+dMIKnru3yIsobuTO3pK3AlCec+Roty5Hb/y3Y+473hB2ftm3a612wrHJZap+6pfDLU5i0H25+dzTxiOrNzfB2fbbaebHsOkdK3is8mH8BB0P5Abrk6uCSYf1CZUI/pquLyjxMneySDY5P5xqfx3dKHDw+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799439; c=relaxed/simple;
	bh=UHHEYrKMvzuzSupr2/g84h0S2cJB1TfXy3IzxYoKXmw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKx+w8nRmhovnufZTDqkunFEVl/DsSMJdbjsIDg3K8J2Gd/HpruHmE8cmQ6HPRaXT0vMEbqXnpPwg0hzwd1UAc4PumIQrLDNQWreINiykDrTitPSx91yjNrSlRnsgzZXq9tw0Zlrh6bR2Dbm0rkf4h0/AEyouJ+RM1NBatL1rd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WArPvCzv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WArPvCzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308131F00A3A
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784799438;
	bh=fTzES2E2d90tPH+9oRQlOp14dLhGN56YzmJZ+EdSxi8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WArPvCzvSXSojvakYJsI1YTNEyn8ihp3xCAYicI6/DW693DrDwCO7excC4IlYfSSd
	 lNGDx5gFgnb8feOiuHk4JEdMUzH0WRIZUFlxWhEjAr6tHujpPQuLYrOHfarQd/L+XL
	 ID9d1kD92q4s2ac6bF2d2RxWMLLSuMeZp5zSzE2gRR5Vu66DQxu4PS2ZK5C0zQ4lfB
	 VfLIqSc3ip3QiHOZFAxpGfUPLpdqN3BZodTZBG9TCZyOa74hqRVRjuiLq45X31ZZ4H
	 40NMmA1BBMff5fmKjTErJaI8oth/3CflwYMO3TcwqveIZhqYgBK2IQdo+fjbhCEl7w
	 QUswBNyE6laoQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so395927e87.0
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 02:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrxqZccvebtDkhOmVkIsZ9fKxpBoZbrYaZWVPhD/eaoyG0S0OoXSdHwg6Q5wXKvaL7TM+6IiatMv6bgNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmSwUpPOqfje203wvFOY6p4rwCQifasckfA/D8bV9vioNTPFcu
	M6jxLPIPWyz7HXsfbCjcPBpc+Z2FT8CHsn1nYYLDmF4PQQKl5DNvqBJJqfv8aRiYq3Fw/EXZMEe
	fsR1+Vm2TtWl5v+Vf1Nt8Zkw5JUe7dN7CB1zyIcwc1A==
X-Received: by 2002:a05:6512:1503:20b0:5b2:9dcc:8e26 with SMTP id
 2adb3069b0e04-5b2b2f7c367mr296386e87.60.1784799433063; Thu, 23 Jul 2026
 02:37:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 05:37:11 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 05:37:11 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722120217.3609506-1-prasad.kumpatla@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 05:37:11 -0400
X-Gmail-Original-Message-ID: <CAMRc=MddF5CzMgkUeCWbMFw=J3ZvbxK3qm0-oqvnaHFK61SKNw@mail.gmail.com>
X-Gm-Features: AUfX_mwNmj-4-Z-iXOivesxKtl8VG-OrWT9cvLrkpa9dzEwo-spPvV65NSiA9ho
Message-ID: <CAMRc=MddF5CzMgkUeCWbMFw=J3ZvbxK3qm0-oqvnaHFK61SKNw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 14:02:13 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> This series adds support for LPASS low-power resource (LPR) voting
> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
> platforms such as Hawi.
>
> On such platforms, LPASS requires LPR resource voting via PRM to keep
> the subsystem active. This is handled by adding a new clock ID and
> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>
> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
> dedicated DT binding and pinctrl driver.
>
> Dependencies and merge strategy
> ===============================
>
> The series introduces a new clock identifier, LPASS_HW_LPR_VOTE, in
> qcom,q6dsp-lpass-ports.h. This clock ID is consumed both by the ASoC
> LPASS LPR voting support and by the Hawi LPASS LPI DT binding.
>
> As a result, the DT binding header update introducing
> LPASS_HW_LPR_VOTE is the only cross-subsystem dependency in this
> series.
>
> The intended merge strategy is:
>
>   1. Merge the LPASS_HW_LPR_VOTE definition in
>      qcom,q6dsp-lpass-ports.h.
>
>   2. Merge the ASoC LPASS LPR voting support via the ASoC tree.
>
>   3. Merge the Hawi LPASS LPI DT binding and pinctrl driver via the
>      pinctrl tree.
>
> Apart from the shared DT binding header update, the ASoC and pinctrl
> changes are independent and do not introduce additional build-time
> dependencies between the two subsystems.

But that was my question all along. If I take only patches 3 and 4,
`make dt_bindings_check` will not work in my tree. Krzysztof: do we not care
about make dt_bindings_check in linux-next?

Thanks,
Bartosz
