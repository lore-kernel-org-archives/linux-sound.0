Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632369;
	b=H/0sJeRypiy8L3zqRu3tmioiQZloYzJqzvi8M/6XvQCRetmaq4IxR9T1lma+CdMlWHs6
	 Yts82GjITvP+XL+/JWdqyIxYyx36+pFKCAQ4it/wL2RZCx8+pZTpmeZzpB+A8phnuBf6b
	 ocwf+MPoiqShcp9VYG5CkclHpE4n8maziec/4hD8W+3Nk7Z95uXW4ZP9x5Dwqz2vqvq7T
	 hqRdDt82c7cyuNN17km7dtx83iaEp+0TJT9dQ/0BoXM8S5Vzoz9Qg/Wn8GvJPxDH3Ri/c
	 JxWc6gT4/D8C4k6nyddj0aiM/6VCnBRgsHTTszadOC3kHjLPdnxEE6jiXIS6Jv/RiJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632369;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oedhdsZ6PIBcZ5IJc7r5nVXU5U3ygTTi51F6AATh+SQ=;
	b=gKe+aWantnmrFq26INmQAla1xWhzFSH1ULcqQFfX/tI1xJKDE7zGthmQxrJcpN80VuYy
	 w+LMvoSlr7HVJu7UeG3uHe9sWPhiLXdWr1PnPSjnqchRf3bQ6YUsBCs6h8+FPcdDlx34g
	 q5BDwzDpzwI4V8SrlK4Xj4czCC9OFWumQAs9dHloKkdOuT5synFjh33m5onZd3zk6lccP
	 Ol6mRARCSPP7O99nmmJeP82k+NelfNIHmN/QqqF275NnVz9NauaoCSasTuQvRHeFn/v7M
	 CnPJoFBtoip1sTU6un+H9FPfgr0t1IeYpuphi9qhXm7B0BNtvt7YZOfo3AJKGuzZbaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZigZGOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7D2606A335
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AZigZGOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA011F000D1;
	Wed, 25 Nov 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632368;
	bh=oedhdsZ6PIBcZ5IJc7r5nVXU5U3ygTTi51F6AATh+SQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AZigZGOqD4HjhxMh7esnW8ECB6YMslH19k0HPPpzt9ZBKcTo3VRcldes9vZWyrqT5
	 9HKhshsFuEqM5kz9APJRW1sbHsMApTcbwc+sJNrAf08rWIRrzCUhCEt98cPN5Qz3e5
	 ByoMba96jSe6lsInuXy2Q7SFob1NRZiwkCDxrzaN0slsXtdF8kUdQC9VMDRqAp+I2y
	 mKf5uZghlCPdfvT9ohOyLvaQ7r53C/9N7hRjv+6XjywbvnzDQiG5zKh9eW132tvGG3
	 5Pn++R37mWMb7NDOiE6vL36t/luRfxk63EAbFwUqU64ctOPg4j2fn2KzdYYS/Ksmvc
	 QG66WBYSO2yHQ==
Message-ID: <sashiko-outbox-234012@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: fix link failure with
 SND_INTEL_DSP_CONFIG=m
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jude Gyimah" <jude.gyimah87@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261125183706.53331-1-jude.gyimah87@gmail.com>
References: <20261125183706.53331-1-jude.gyimah87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:46:08 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: SOF: IS_REACHABLE() stubs out
  snd_sof_get_nhlt_endpoint_data() for modular Intel IPC4
- [Low] ASoC: SOF: conversational email greeting in commit changelog
--

commit 92afe44aeb8258bf82f3d1cf70150bb75c4ca99c
Author: Jude Gyimah <jude.gyimah87@gmail.com>

ASoC: SOF: ipc4-topology: fix link failure with SND_INTEL_DSP_CONFIG=3Dm

This commit changes the preprocessor guard in ipc4-topology.c from
IS_ENABLED(CONFIG_SND_INTEL_NHLT) to
IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG) to avoid a link failure when
snd-sof is built-in and snd-intel-dspcfg is modular.

Link: https://lore.kernel.org/r/20261107114944.561731-1-jude.gyimah87@gmail=
.com

>     Hi everyone,
>    =20
>     Just to bring this to your attention.

[Severity: Low]
This isn't a bug, but this conversational email greeting belongs below
the "---" separator rather than in the permanent git changelog.

> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index 9a3f8896d7cde..87b3c34351620 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -1793,7 +1793,7 @@ static void sof_ipc4_unprepare_copier_module(struct=
 snd_sof_widget *swidget)
>  	}
>  }
> =20
> -#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
> +#if IS_ENABLED(CONFIG_ACPI) && IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)
>  static int snd_sof_get_hw_config_params(struct snd_sof_dev *sdev, struct=
 snd_sof_dai *dai,
>  					int *sample_rate, int *channel_count, int *bit_depth)
>  {

[Severity: Medium]
Does using IS_REACHABLE() here break SSP and DMIC DAI setup at runtime
when an Intel IPC4 driver is built as a module alongside a built-in
non-Intel SOF driver?

CONFIG_SND_SOC_SOF_IPC4 is only selected by Intel SOF drivers, while
ipc4-topology.o is linked into snd-sof.o (CONFIG_SND_SOC_SOF).  When
CONFIG_SND_SOC_SOF=3Dy and the Intel IPC4 driver is modular with
CONFIG_SND_INTEL_DSP_CONFIG=3Dm, IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)
evaluates to false in built-in ipc4-topology.o and compiles in the #else
stub of snd_sof_get_nhlt_endpoint_data() that returns 0 without setting
*dst or *len.

In sof_ipc4_widget_setup_comp_dai(), SOF_DAI_INTEL_SSP and
SOF_DAI_INTEL_DMIC leave ipc4_copier->copier_config as NULL and
gtw_cfg.config_length as 0, relying on sof_ipc4_prepare_dai_copier() ->
snd_sof_get_nhlt_endpoint_data() to attach the NHLT endpoint blob.  With
the stubbed implementation, copier preparation silently sends the DSP
IPC without the required NHLT hardware configuration payload.

Should SND_SOC_SOF select SND_INTEL_DSP_CONFIG when SND_SOC_SOF_IPC4 (or
SND_INTEL_NHLT) is enabled, or should the NHLT lookup calls move to
Intel platform callbacks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125183706.5333=
1-1-jude.gyimah87@gmail.com?part=3D1
