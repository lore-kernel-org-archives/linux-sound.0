Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E45438486
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118747; cv=none; b=XoeVwLVJl/afDgpzUSY4849X/pD/Xea2jB0lNEgHFwvdjTQMMAvC30jLdXpDg4oClkzXMG34OvQpYFgWPJAG/hkxFBf4pZexhJ08huvclkYJgcm04uTwN7Y3FQhUW3AEhdHcs83KM9lQTIf8nU69LbYMalDAvgiSa9F/N0jstoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118747; c=relaxed/simple;
	bh=nLrrO9a5FDvLXPDTDgTNXqlNTIzB9MFwtWCZwYqMU/A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q9NtWU5lxYBsbL6mYZpnnc0CbVFSBXqBl/YFLjCxGtRAUpj0uoZcoXIJS/EF4+4Pr6f7kqwS5Z+8c32c28tQv/6K6ZZKiIIOvCG5XmsVFxoRWYbByrLQlGkg4hyTw6UQ18tD4fbP51lHxZglZytMsFZa1qFBLipEdkc4YSm5824=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMgsSQli; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMgsSQli"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3144C1F00ADE
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784118745;
	bh=nLrrO9a5FDvLXPDTDgTNXqlNTIzB9MFwtWCZwYqMU/A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=bMgsSQlitoFBpZNJWPAXzIyeTB5HhzKbby+OJHVjV9DcKqZsQMjhtasSQDgUAHr4C
	 MMnYccrEBMCBlST9nOGNHq37P4is4RvhJrJ2gIDPzHrb4rG2UeRGEC22dhZRTsyUIb
	 bXVsGy2TBuIhjcb5a/iRA0Mp1oGKFMiaZUA03YLLBtvbLuJ/VVVvP8yDzNIgVroElA
	 71m5AHgyFH5S/vRdvla+UeqcAHkoiYM5aFkkI1aGPKbv6PGl5xwF41j0xA8ZSV4jFa
	 lIbRg+ii2C5XGQwgywP4f1bOLC8dnEwZSJ3K/U/sTfxzLcNVDfOIBiL6LC6Os2t9O2
	 Qi5buYB8sJWkQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39b3931e259so48931911fa.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 05:32:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrFA2dYoSoPro3hPm5eytpTElfIl8FA0fvbKr/8mXT8dRGHN2wAJFPCswXNTcsYwh58F7LIEx5312kLuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAMcqV8Dcat5Mv3vEZmGbdgzqkFcB4fsTF/d+QyVh+ynBY7GKC
	9+rfInCsJDFI1EHr/Dil4Ilj67nwZOmI8DlVJ4QgsuPtudyyEsnXwxBGriIrQBqJZ7JbojpbRBR
	tXQCWHSlrk1ZBe5fHyMWJiqBDm7WNcro+3/aq86rt3Q==
X-Received: by 2002:a05:651c:2222:b0:39d:b6f7:1155 with SMTP id
 38308e7fff4ca-39db6f712d1mr6252931fa.4.1784118743871; Wed, 15 Jul 2026
 05:32:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:32:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 05:32:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com> <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 05:32:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me5xOtzN7THcxTJBz1WHk8t8nfE_zFwQEG+27y7f+PZcg@mail.gmail.com>
X-Gm-Features: AUfX_mwONE3HUiepgt5qG9O1QTuquRHj-FAXux5aqRiuCzG5jMVsGH0QzcddGDs
Message-ID: <CAMRc=Me5xOtzN7THcxTJBz1WHk8t8nfE_zFwQEG+27y7f+PZcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: lpass-lpi: make mutex cleanup devm-managed
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Jul 2026 20:45:45 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> The driver registers its pin controller using devm_pinctrl_register(),
> which keeps the pinctrl device alive until devres teardown, after
> .remove() returns. Explicitly destroying pctrl->lock in .remove() and
> the probe error path leaves the mutex destroyed while the pinctrl
> device is still accessible, risking a panic on concurrent debugfs
> access during unbind.
>

That's not really correct - the mutex is not destroyed as mutex_destroy() only
marks the mutex as invalid for lockdep accounting.

With this addressed the patch looks good.

Bart
