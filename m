Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590FB2F747D
	for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 12:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766318703; cv=none; b=Af2Z4YuwEE+paqQI63pUBN5A8LTBePkiNqCEbItSkXAy1VissD4LSTvjJFYwlUIPxsIfAdPQKg7EhwbgGsub24y/VyP292H6s7c6qpSRoRvYX9Ovmc7+QUcC7hzaW67n6INsupSZFzxd8b9EjzltPjyg22R728dst4d7nLhAKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766318703; c=relaxed/simple;
	bh=QX9zjOg+I9wGSrUaXshubFFf08J1rzDDMMt27c7QHc4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bf1dwoVCHS7xT8w1rzRF7L2vb2Blfq6I01uLIcIrcslQwD5dyBqFdtKezzPjWeIzC38uTJAnsXxHWAIdfUj/bAz4wjbj3PLYLeYmpa/1Nfr9lhEdyyM8pcXC+KiV+VORnNoAPDMvqIK105K1LQ2P2fX9vU5s6BogVsO/xN0PMlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRYOQVvf; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRYOQVvf"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so993162a12.0
        for <linux-sound@vger.kernel.org>; Sun, 21 Dec 2025 04:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766318700; x=1766923500; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jf7ROTwiax1oCNeYfMun65vgngFEmp831IXo7tBZOXk=;
        b=jRYOQVvfURimJJ5ZTPFtSuMEZ/onc+AUQgDYus6sHyI0C+wm5+LC4+LUK+XcQ923/B
         hN8wChUEOfEILMICQrWJBB7C6ZCYDKmcJXFy1oXtww6aGV6Mf7VrgRoDEOFn4yItUObh
         j4wHDv8FPsSulBVzTTcOrhSKIGTBR2HpFdOtLVslT58lACYhuJFNxHlD2O1iILEnTTFw
         pGXmpNjJ+3aV/YSDVao59DT/mRCa5F22EjLI8OHnfbW6GBuGe41IoAadnZnPpm7Jk06s
         D7TNgMjOrr7zkovo3cNcj90XoDf8VFycoh+Qgs/kownRVwR6u7ZDARqmhNNlqIe9XryK
         dkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766318700; x=1766923500;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jf7ROTwiax1oCNeYfMun65vgngFEmp831IXo7tBZOXk=;
        b=uV5tFlwhsRA0d6TLf+gRrGIYfvFJG+46iiGsq7qRwsZDJjwHLR08aqFbHoD7+UZYQj
         n5x07fgQb4RZatUEL7tdH0VMCKJJzyq6Qp0YVvp/iehPcbIy1XoN7cC2F6zaJEKw9Fba
         FyUOwSOX1W/d+Cjbdt6mNR01vtQoFPI7yokJetZvrLseJ2iRbGXYtCFbVTLi73YXqFiY
         RJ1jPL2dox3dmtOKi4zeCvzZGojdv2EoRKZVVmLhjXxUCRX/JtLT42eojicL9PbH7wmB
         u6FpgEP3rUnTZWtcatAtPh8NoRSpLJtXHY3zw6XlQFGJ2NI7lsTljNEY7cjDAusRs8oX
         imrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5MgNAONwIvV43SPeZAhgH7w8lsPumKtvZldICVhwEMB2AOdzknBCMxIdzBQA/ATCVgwtBXWCemSOIJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzcR2tLIZ8Hb1Ao3OQSwy0y69aON0Hk72/dAt88HDEJJIjr24
	MmL7bw0GaztmGStMh/3TGPnziKjc2CvVy/lujVBCOeovMXA57NYJpfiZgNphD+qQkmXTA7s9Nmf
	X4uwtmVWDWkEcWL3ErH8AmYVegZcIECI=
X-Gm-Gg: AY/fxX5r1ABzZ1zVvfCxzm55I7LRJWFz6f9YNaEJMtrn0fKbjLGaZJVtmkstayMYkPB
	9fXr1M2RZIqRvu9lrVMaDWPqY6BBqDYdM1nqMBSuWqngKoJi1Ii9vC3Gwkgqhx44W6W+DYqPr+W
	cdooKz0MUKABkvE1iPhiWd4SmOs54OB5DcapZethXSQ+VWihU7AQc92e8egaj1+DH8pHrm/hJWt
	2AL0nwxAhpxHMWpZBKirmfj673gyN/X6RimBT2ze9iJzWFHPQvj3c+zw9kV+U0AVadMnQ4=
X-Google-Smtp-Source: AGHT+IHoJaiyK7NHuL8X9Mqi+S2jjmKKHkMhZq0PzqpQUxDAg0sj6lptadYvboJ5goRPamvE+NfdeX2YdZdUNM/cBn8=
X-Received: by 2002:a05:6402:5194:b0:640:a50b:609 with SMTP id
 4fb4d7f45d1cf-64b8ec6c59emr6953455a12.16.1766318700350; Sun, 21 Dec 2025
 04:05:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221035715.1722584-1-wens@kernel.org>
In-Reply-To: <20251221035715.1722584-1-wens@kernel.org>
From: Code Kipper <codekipper@gmail.com>
Date: Sun, 21 Dec 2025 13:04:48 +0100
X-Gm-Features: AQt7F2rsE8tgKwxlCN8K-0sf04wdCUeFm-SzYtd7-Ga0Vv4H9rY1FkQekuM53ls
Message-ID: <CAEKpxBnaScxoCGkhwUhnnwb7sO-sw6hEasCZ_RWWydRfyPTXdQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sun4i-spdif: Add missing kerneldoc fields for sun4i_spdif_quirks
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Dec 2025 at 04:58, Chen-Yu Tsai <wens@kernel.org> wrote:
>
> When sun4i_spdif_quirks was recently expanded, the kerneldoc covering
> the structure was not expanded to match. This ends up causing a warning
> when the documents are built.
>
> Add the missing fields.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501311953.0Ox9CW5w-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202503060947.QKUUR62l-lkp@intel.com/
> Fixes: 0a2319308de8 ("ASoC: sun4i-spdif: Add clock multiplier settings")
> Fixes: 4a5ac6cd05a7 ("ASoC: sun4i-spdif: Support SPDIF output on A523 family")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
Hi Wens,
thanks for fixing this up.
Reviewed-by: Marcus Cooper <codekipper@gmail.com>
BR,
CK
> ---
>  sound/soc/sunxi/sun4i-spdif.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
> index 2e7ac8ab71bb..1e755a716c63 100644
> --- a/sound/soc/sunxi/sun4i-spdif.c
> +++ b/sound/soc/sunxi/sun4i-spdif.c
> @@ -171,6 +171,8 @@
>   * @reg_dac_txdata: TX FIFO offset for DMA config.
>   * @has_reset: SoC needs reset deasserted.
>   * @val_fctl_ftx: TX FIFO flush bitmask.
> + * @mclk_multiplier: ratio of internal MCLK divider
> + * @tx_clk_name: name of TX module clock if split clock design
>   */
>  struct sun4i_spdif_quirks {
>         unsigned int reg_dac_txdata;
> --
> 2.47.3
>
>

<http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Virus-free.www.avg.com
<http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
