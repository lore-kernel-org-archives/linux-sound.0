Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075135;
	b=xk63KeIutfTu/3IaP5mv6e3zfbNOgP/0f7513OD/CoFnv4UdbZT8SQBYnrWZmr8vGoqw
	 Pv1LNR8PT1bwew/WFrCRND9+DPBMOJlXarg1Mqmt5Staxpde02rQN7+Ogjnjm3RuecZUb
	 z3+crxwMIElA4W0N9XhObZkR1sI/B2FB+W+VIpLJgKX1UJv/4ashCY6wh0ZkCgQ9D9kB9
	 3itYxV4mWGYFIBS3yFKqtINx6skJneC/KvJG3fEVBY/9tZdz5cE8OOD6lk3uUqhvfRVX0
	 PIQj5fD8y8d6GkS6h1pqxhzDO62avIZTkHfChsonLeE/GsktaVlxjP1n9UyqcjRMaUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075135;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MUeEJ6hyI9NAzO8sngAnFiiCHxQVSAsFx8yzIZ0il7Q=;
	b=nhyHG1X+VqVyWjNZX/FziRsGbpEf0GzI5jLh1VLaXBwWjnLWcaOFuHr7+hlHBp9uKwSG
	 jYeFioMR82oH/hcIBMnDEnQ5C7GZ7d9GZ41+YyJ50jv3qGguh1hiyKeR3WOo2NxK/sy6j
	 cyw/WqSfAoTlpyKLzDyMfZajNO7A30B1/u57L8klsni4M+fNUqnYZTFfrqi00wgQzAklO
	 Dkf9p/9E3cgTlHGdbEurTBh4zBj5nuNF51rUSJw6rowC1s66VpYIQMkS/EPelakPWle6I
	 MPesPv9Kq969QPzk37M34bYRkTerafhkxHYz2dxHTt4peF1c8GMcydtRzPyO2sBzlBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WLuP1/jj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F170F606A32C
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WLuP1/jj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BD41F0089F;
	Sat,  7 Nov 2026 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794075134;
	bh=MUeEJ6hyI9NAzO8sngAnFiiCHxQVSAsFx8yzIZ0il7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WLuP1/jjSfLK9mzTrqMF37U4T356RCmB45yEg8pdMZVt9HZ9cKvDOh8e1/IjVYGvE
	 5B2P0huV1AJGpPzNzSYspgd/1ecD/doTG6A3pPZoZXddfblkr43o6YdkcO29s5c3EW
	 zHKYytVfct5TIoPeH4HQ2vPKWV1gDQsYoKJype9ssnov+3hBmWlALWSR4JpUNmEFVw
	 BfaMDh8CWQN+ceKtgEEJtbeCIaARydcT6g9Op8oF9HnSLDMF5OiaNvm8WkzQyZmYUY
	 Keg4zOSeD5nxI2KxrSOoISj77m8M3gahCK/4c1JLoLWfbafGvHoEOklT1tV0IzZ65l
	 N7dwy4ZAetF3w==
Message-ID: <sashiko-outbox-203157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/4] ASoC: amd: ps: guard SDW IRQ work scheduling with
 interrupt_enabled flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107175339.3547918-5-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-5-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 18:12:14 +0000
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
- [High] ASoC: amd: ps: build failure in acp63_irq_handler() due to
  missing struct member
- [Medium] ASoC: amd: ps: TOCTOU race on interrupt_enabled in
  acp63_irq_handler()
--

commit 371c40e74acce37765aa0469d9b4a4ac8ef4b3eb
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

ASoC: amd: ps: guard SDW IRQ work scheduling with interrupt_enabled flag

This commit guards SoundWire manager work scheduling in acp63_irq_handler()
with an amd_manager->interrupt_enabled check for both SoundWire instances.

> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index d0b66df101579..0442010e969c0 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -215,7 +215,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *d=
ev_id)
>  		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>  		if (adata->sdw) {
>  			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> -			if (amd_manager)
> +			if (amd_manager && amd_manager->interrupt_enabled)
>  				schedule_work(&amd_manager->amd_sdw_irq_thread);
>  		}
>  		irq_flag =3D 1;
> @@ -226,7 +226,7 @@ static irqreturn_t acp63_irq_handler(int irq, void *d=
ev_id)
>  		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
>  		if (adata->sdw) {
>  			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> -			if (amd_manager)
> +			if (amd_manager && amd_manager->interrupt_enabled)
>  				schedule_work(&amd_manager->amd_sdw_irq_thread);
>  		}
>  		irq_flag =3D 1;

[Severity: High]
Does this break the build when CONFIG_SND_SOC_AMD_PS is enabled?  struct
amd_sdw_manager in include/linux/soundwire/sdw_amd.h has no
interrupt_enabled member, and neither amd_enable_sdw_interrupts() nor
amd_disable_sdw_interrupts() in drivers/soundwire/amd_manager.c sets or
clears such a flag.

[Severity: Medium]
Even with interrupt_enabled added and cleared in
amd_disable_sdw_interrupts(), can acp63_irq_handler() still race with
SoundWire manager teardown and cause a use-after-free of amd_manager?

CPU0                                    CPU1 (<hardirq>)
amd_sdw_manager_remove()
  cancel_work_sync(&amd_sdw_work)
                                        acp63_irq_handler()
                                          amd_manager =3D dev_get_drvdata(.=
..)
                                          if (amd_manager->interrupt_enable=
d)
  amd_disable_sdw_interrupts()
    interrupt_enabled =3D false
                                            schedule_work(&amd_sdw_irq_thre=
ad)
device_unbind_cleanup()
  devres_release_all()  /* frees amd_manager */
  dev_set_drvdata(dev, NULL)
                                        amd_sdw_irq_thread()
                                          /* dereferences freed amd_manager=
 */
                                            <-- use-after-free

acp63_irq_handler() checks dev_get_drvdata() and interrupt_enabled lockless=
ly
in hardirq context on the parent PCI device, while amd_sdw_manager_remove()
never cancels amd_sdw_irq_thread or synchronizes with the parent IRQ before
devres frees amd_manager.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107175339.3547=
918-1-Vijendar.Mukunda@amd.com?part=3D4
