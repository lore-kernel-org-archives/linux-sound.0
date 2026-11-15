Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748651;
	b=eCK72QY38KY7f9qJP5CFVKg2mkxVrVaIXLCygq/NtvSZXUJnCNngPZZsV7vAp0ssSas9
	 B6X8NhZ0FfjsSiolP98kpaLTGpvnKmOPSoFJkXMLfz+4bjuAEYmdKQIPzHkkGuuR50kzp
	 p6nKEcFJp9WawCKgJzSQ3U2O9Zot+fT6BfNwVvQktDzqG1Gcq28ScjY+GWemi66GyTJFI
	 DZTifgmvusnIc28q6vHSDhqKuXOltAXZlEXTX/WLR4VoyYReiF8bdKO94NmgTSn5n9Ziu
	 Fe17GD1L7yS8Y9Ic/4ClUCh1BRevicI/4pS3nRICc1FCskrK5Dw+vttX1txJq2X5h/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748651;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EVZ8n5niBbV60d/xVEjFDweO3Ri3IuUXNrDJ/yPkcyc=;
	b=VGgxnMCcegyh/GdPMBarqSyT6MqnBcTrZxtwILlwCMdNx+WcNkjJ4Bbyj8HnfNNMOKgQ
	 uZ1njbz9wMhG74YFh6HZb6ESMmdBPfB5kwcskreIQEBUH54k7J9SO4It+yGf8O8dQDxJa
	 QEk5vElqsYziUUtiEOJ4VUG75jPFUoEJUzxMDlyiCSH0C9VgxulKnYVcR8IQ0w33V3M+h
	 OLOleLIpZuenfh+r1pyUHlCoFPb6t4KJ5JFQQRe6LSVcGRqY3X8zwlrHzEvx3t8viWYn1
	 V8KwPFPByOe7s0hnpFie97eH4r+XDfyCs5BTGqwrki4JSKDk1dJY91bTPXh4BP4yEEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCwukOW5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE0A606A31F
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nCwukOW5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF361F000C4;
	Sun, 15 Nov 2026 13:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794748651;
	bh=EVZ8n5niBbV60d/xVEjFDweO3Ri3IuUXNrDJ/yPkcyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nCwukOW5srankE2Xe2dNuZwEsxmZG7uV73Zg5GEf2dF7Fbx1XbaFSKIjPE1DlbR+o
	 OenzBr+hUQR86WgDEU/cxP0hYEMtMFepznbRevUS+oH93VtHUgB4K3SRCptjqpeN5e
	 OjPNwgN1a7qdvuzsBXeayzO/3ceSNEKHoPE5V/UlsfLrab6NxwP+AJYQojKgGMeTbe
	 t0hZss+abhchvMfXilRLK77Nds9Jra0M+WdUn5hMnfHRoyiQR+v0gr1aQNz/Rl/PmO
	 imjF5pMSnXC7WgjFSHY3A0/Jg/zWgV425mv1hs+EB8ew5gZSxcxut9ez9B23+7TlhZ
	 6YMS8yI/DSp7A==
Message-ID: <sashiko-outbox-215518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: qcom: q6dsp-lpass-clocks: Set driver data before
 registering clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: yzddMr6 <yzddmr6@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261115-upstream-q6dsp-clk-drvdata-v1-1-4d7dbea52e52@gmail.com>
References: <20261115-upstream-q6dsp-clk-drvdata-v1-1-4d7dbea52e52@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 13:17:30 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ASoC: qcom: q6dsp-lpass-clocks: handle used in Signed-off-by
  trailer
--

commit ca8f162c7c729ca1dd4a09d6760be1eed11d7dd6
Author: yzddMr6 <yzddmr6@gmail.com>

> ASoC: qcom: q6dsp-lpass-clocks: Set driver data before registering clocks
>
> The clk ops of the q6dsp clock controller look up struct q6dsp_cc with
> dev_get_drvdata(), but q6dsp_clock_dev_probe() sets the driver data only
> after it has registered the clocks and added the OF clock provider. A
> consumer that gets and prepares one of the clocks in between
> dereferences a NULL pointer.
>
> fw_devlink does not keep consumers out of that window. The q6prm and
> q6afe clock controllers are described below the ADSP remoteproc node,
> and their devices are only created once the ADSP has booted and its
> GPR/APR services have come up, long after the remoteproc device has
> bound. fw_devlink therefore makes the remoteproc device the supplier of
> their consumers. A consumer such as the LPASS LPI pinctrl then just
> defers until of_clk_get() succeeds, and its retry from the deferred
> probe worker can run while the clock controller is still in its probe.
>
> That happened once on a Xiaomi Pad 8 Pro (SM8750). While the LPI pinctrl
> probe registered its GPIO chip, gpiolib read a GPIO direction, which
> runtime resumed the device and prepared its q6prm vote clocks through
> pm_clk. The prepare op then faulted with a NULL pointer dereference at
> virtual address 0x350 (trimmed):
>
>   pc : clk_vote_q6dsp_block+0x24/0x58 [snd_q6dsp_common]
>   lr : clk_core_prepare+0x7c/0x298
>   Call trace:
>    clk_vote_q6dsp_block+0x24/0x58 [snd_q6dsp_common] (P)
>    clk_core_prepare+0x7c/0x298
>    clk_prepare+0x28/0x44
>    pm_clk_resume+0x10c/0x188
>    pm_generic_runtime_resume+0x2c/0x44
>    ...
>    __pm_runtime_resume+0x50/0x94
>    ...
>    lpi_gpio_get_direction+0x4c/0x8c [pinctrl_lpass_lpi]
>    gpiochip_add_data_with_key+0x7b0/0x10dc
>    devm_gpiochip_add_data_with_key+0x38/0x8c
>    lpi_pinctrl_probe+0x2b8/0x320 [pinctrl_lpass_lpi]
>    ...
>    deferred_probe_work_func+0x88/0xc0
>
> 0x350 is the offset of desc in struct q6dsp_cc; the driver data pointer
> it was loaded from was NULL. The oops left the clk prepare_lock held,
> which blocks every later clk_prepare(), and the system did not finish
> booting.
>
> On mainline the window is short, but it includes a wait for prepare_lock
> in clk_core_reparent_orphans(), which of_clk_add_hw_provider() calls
> right after listing the provider. The kernel that hit this had
> out-of-tree changes to drivers/clk/clk.c that do more work at that
> point, which makes the window wider.
>
> Both q6afe-clocks and q6prm-clocks use q6dsp_clock_dev_probe(). Set the
> driver data before the first clock is registered.
>
> The oops was analysed and the fix written with the help of an AI coding
> assistant.
>
> Fixes: 9ab71ac37240 ("ASoC: qdsp6: q6afe-clocks: move audio-clocks to com=
mon file")
> Cc: stable@vger.kernel.org
> Signed-off-by: yzddMr6 <yzddmr6@gmail.com>

[Severity: High]
The Author header and Signed-off-by trailer use an account handle
(yzddMr6) rather than a real human name.  Under the Developer's
Certificate of Origin in Documentation/process/submitting-patches.rst, a
known identity with a real name is required for the patch to be accepted.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115-upstream-q=
6dsp-clk-drvdata-v1-1-4d7dbea52e52@gmail.com?part=3D1
