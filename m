Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04353ACEF1
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276188; cv=pass; b=SO5e1mG32Pg8xTYAdLfew3ukS74EdhHMlG/CqI1ruNHcGTvk0e0yBJzUyesQS/W/kZFv5rBfd73NhN4a0WVvFZuDzNlql9Ty35Vpg+eeDS/89g8187ZlNkhiNjtYdKh4krbB/601YsNV8Ypsxj/rBm4u7iIhaozo9LHJ46FbWtA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276188; c=relaxed/simple;
	bh=+on5q4N8SL0w5EOH9rEDfmQSu2nzNibcQeALQEa6kg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJJ1VDW6dwSU5enXChIL+YnHjeI6Vwf8iukaR63KdFS0w3mEJlQvVO4jrAzzAhbTYcdgRz65xi+LSuXhpVHxV7S4DR2UfXRu4oQI+KX9H9TKhg6fVDc+apkFZ0E4bJb7NjZsHMMcX787cpccpcQn4UPyOUgg5P6izc9/WtjczDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EarLjfEg; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EarLjfEg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b97bca3797dso33936666b.0
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774276185; cv=none;
        d=google.com; s=arc-20240605;
        b=ftV3KOcj2a7szZpr92dv/CGGQ+SCW4lc8tR80FrcSUCjhBsEfPTgowCThOmPdMptcI
         ImTVxLxIKIcxSMD8qXrKD42ZfoRBzTqgLChab20W1sRAigXIRACK4cDgg+Z6DuRiqi8z
         vBYxnmigZYYUJBGT/thNlmZpLJngMELLweOU8vt2EvvuTbMZr+Mcorhy3Av4CrktJOlL
         4TXZSXdBQXwk2wGHPAy8/79HGJ2o/+Yx+GG1hYKS2hNGKlGnVn8E6omnpYJcFckK68nN
         Py9wCNzGi6rrRqd+Hy5QbCzmagLEC10Xk2xJbsD/Zd3Wpk7h6b5qqKndvtYHk+zc12sr
         8mcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        fh=omTL+C6ruz5B7YN9emGYnZ8jpX5S401SiNCiJtjlrF0=;
        b=BnowpCHufOLJJJWpNiI+X8yzLUHAoOTbWNEaA9OImV4YQZgrjtgiIzs4P7Xi4bsnQn
         CJcBR8+Gc9guT8tTyrPDR1gA4nkAPtx6aZfqwSt9Vuc0teWFhlv9MnKpqGmtH5m2nIGC
         E0pkHWJ7XeqICrOyxdqRa0qsk4BjxLGyyzh0YfL0FinAE/afeSXG5RyRMDRK36sSfbi5
         ym4stHQ4T0JmmRLU322vUciGuJi6SvowFnrMCJduqeelyc5edfGqPRqQstWHWvcnNoVl
         sPabF37Na1sx/XLI3ya/rc3N2Py8tJNMEDWK+GdDinqBs5uIU4mzosXb0TYbtmAog2Jz
         rK+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276185; x=1774880985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=EarLjfEgA8q0L+mwlFDSb/Jsya1AqkRGVOEPLdSMAJ77MX5lxnxT+QRFA0oAznGfEF
         2nN+mUJ0plLWWYiAPW/X1kXuZKOVozD0xKj2u2YsNGCv0YXdcpgmH3G00mjovvMWi1u+
         /AxLT5kjY7lPXfaIQ/4EbEPfCluifk1XH3imnJFze0Ftux+Ji82Nxqsb8txMGrYfFaTT
         93M5cbt8/BlNKpA2GbQ09bmrdbHGNBbSE+SKiH5g2ai09kT60GSOlzA7KnUI02sydvxx
         yJ75R0Og09ge7PwUlcRLj5WxOb470X98xhzXrScpCjYJmg7vW8Xl8LaVKgYzEi0ZyGyf
         w/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276185; x=1774880985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=fzpLPWlFSjodB/bSDxU+/N9XwDX4rjH9uuMKKDPbv9iugMeIHVLD8RUckn1L9NLPjo
         AfxevVdVEQ8EFxaKwfuqBPy6hv52wRzlyEF3Wf5uST7qaiF5i62jYnJWxT9XxndSlfpW
         OFsNuTEsxXFEg050YB8xoTqrQIiFXeBtNqBSn6U3j8fKk6VJjkCJlZhte1xz0Df0+Xp/
         ijdD3WOojPO+uvFsJ4bsk1g/WFi7GSdZTWOvECrShCoMEOxOWLhThpEQSUQ0GGEUelVB
         Z0PMU11+LnAHQoxkx+UJAJA5CvrlkikI9LwF5OZ9aTNgB8kN6zYHHRVzZVuNKGAiv5U2
         p7WA==
X-Forwarded-Encrypted: i=1; AJvYcCViMZwuY3NtKWfw8MTH3S6bjEunhnpT/vTkQ2oYD1TU8A7zimxIqIO+67Mu/JAv+x9qgr4ytqNL9QSbSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymDy/83tWYLkMX/RkNctuOOPDuraM1kZExInkcAzTPvPkrEnP3
	FF1zKNEeAFnW3ClTO8QB+j15AjRengzi7jVITMSIFBnt23fYM7VyK9hiu/4hvagdi4/tAC1/pNg
	9odegQ9zUP4sOkkD35kW3fIKNOrdxUVMUIlgl59y9rw==
X-Gm-Gg: ATEYQzyG0IJSx5311njmFChcaYMC0W9pzVcc++Zvh7WtNbdOSGk9bCOQp/XUNa+dZTr
	vx/jCUDQbLq4lsu2uPgipd4m4AppJ824qzmhW1OVBoiYXm4qYSQJswQX0eGACUHmbj0aYysYv7G
	JCLLmBd5qTeY8FSg1c63AXyRFlbK/x2RHpj9Mo887gCVHJx1vmsy+HLyul4TEoUud2ySkMlm+kH
	DySjt/crdNOypUsMTY8ztKJF2Oq7eIfrpvM1ZwdA8LN2Pqi2SpDfVMgnIbaqqvTKwdGBaNBHUZt
	gLRge41d16lIhD2uTqLODttfLRR+gSY+aWGIPNGWTA==
X-Received: by 2002:a17:907:a18b:b0:b98:2b20:6680 with SMTP id
 a640c23a62f3a-b982ee95138mr577158566b.0.1774276185012; Mon, 23 Mar 2026
 07:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Mar 2026 08:29:33 -0600
X-Gm-Features: AQROBzDAtL1nQ4PFq47to0a6JE1kiVHOZBw70rBZKtJtzPk95r669W13VmBQzzg
Message-ID: <CANLsYkxVRDd941sVq9rdn_O0eDbDcVctPpKTACVi5vfYhzgYKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 06:37, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
>

I'm good with that.

> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
>
> Changes in v3:
> - Subject fixes (Angelo)
> - Tags
> - Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com
>
> Changes in v2:
> - New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
> - Rebase, add acks.
> - Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com
>
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
>       media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
>
>  .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
>  drivers/remoteproc/mtk_scp.c                       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
>  drivers/rpmsg/qcom_smd.c                           | 10 +++++----
>  drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
>  drivers/soc/qcom/apr.c                             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h                 |  2 +-
>  include/linux/rpmsg.h                              | 17 +++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
>  include/linux/soc/qcom/apr.h                       |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
>  18 files changed, 65 insertions(+), 56 deletions(-)
> ---
> base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
