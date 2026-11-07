Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794074925;
	b=FtJZ1EQxQ3jXd2jiQa14Dz8JcBIQ9YMmAz8eaZCrYAzZrALeTdb28hKCa+9+2GzI1nOy
	 Sk7+/9hoD0odnZl3ITgtnAOjYz55dXiYIVw5NxAqLPoyo/34n+wBRHtwq3Og1XwC0XvGi
	 2z/vzFYRtciak8Ugkx3qoG9Bu8VQcAw2xOBhHy3Yb0/UIZGoK5WNqe41mi7B8UamxPwXD
	 l11JzYbYyTvtGPHdKZU0jnJGWPLkZTWnI3MQpv6Zdrf+AtEJm5r4bcUIoTUhI4bTpU1/S
	 UAu7+NSLKheRNHHJ5TD82Uw9DjdlN+SfK/BcD2niJVcxqWkd01htbMnUhb2MznF5acg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074925;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sOR1MZfE16HSQtKE30fES85D0v2D0sTOmW6qORl5hLQ=;
	b=ssZpohZjfu8TAeYsrj+iNTIDnMUUien1RxIj8mnJAtFcgrXTyWe1y1hjnAmdGP1QSPCA
	 AcbvZuQzW0fhFIk+mszeVlz1CUgNPod6cbys17MO7frWR2cc6dmNBbQMmv/aPxc+3nByH
	 MjtEZs5xmdtiqV/JYSAvBNNwxLS1w3OCH/4I78hRLLWH0oFeH2abU/NZj5EFw1TDHCcOP
	 B9D4NJUg39CdlQBAohcUds3jzymyJ/Lu5B9bn/Q8kVDfrbX9cfb/m7zS9EvIinD6eUeM5
	 cnsjv0VXr00OdG4uhEwFyCdguoI/tvM77wjW10Suy0J81tPMsBV5OvHTmCEpRCaNqxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=faGwZJQE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A290C606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=faGwZJQE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1756F1F0089F;
	Sat,  7 Nov 2026 18:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794074925;
	bh=sOR1MZfE16HSQtKE30fES85D0v2D0sTOmW6qORl5hLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=faGwZJQEQXQO7zxA9g4K76F2izvCwmfyLJ2SZLXLTjKAWRSk8bE7J3J9WBCb1cs+k
	 PHs8TZEdvIah2d3tX7qFqBqIBllCQtZTO1/y4DJzvrFJrM2PrbnVeNZLtkyRnaTWfb
	 8WXTmgE9HjzlgHo0qw3WY4+w1kMEBIoqCHPy9k42ql5eRzkpdjQVlao66VzHjpDtSt
	 RYZC54fZrkLkUD/4zEPwaTnZCCXu2+me41bZuuijTSBskKtRSNtOzbKOK/owA16YPr
	 QQPX8eMgXCL7LH6t7VJFFeNTYyqeQ8BKK3PiAnU0Tuut0i973tgkk0JhFHVvpT1+uW
	 ejopGlZNA/WCg==
Message-ID: <sashiko-outbox-203151@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with
 interrupt_enabled flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
 <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 18:08:44 +0000
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
- [High] ASoC: SOF: amd: build failure in acp_irq_handler() on missing
  struct member
- [Medium] ASoC: SOF: amd: unguarded work queue in
  sof_acp7x_handle_sdw_manager_irq()
--

commit 84b5998c660c53c97f1f81d73a850a90f66dfb5d
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled flag

This commit checks amd_manager->interrupt_enabled before calling
schedule_work(&amd_manager->amd_sdw_irq_thread) in acp_irq_handler().

> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
> index 623e016f38b83..5c4eab0be497c 100644
> --- a/sound/soc/sof/amd/acp.c
> +++ b/sound/soc/sof/amd/acp.c
> @@ -586,7 +586,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev=
_id)
>  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ=
_MASK);
>  		if (adata->sdw) {
>  			amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[0]->dev);
> -			if (amd_manager)
> +			if (amd_manager && amd_manager->interrupt_enabled)
>  				schedule_work(&amd_manager->amd_sdw_irq_thread);
>  		}
>  		irq_flag =3D 1;
> @@ -618,7 +618,7 @@ static irqreturn_t acp_irq_handler(int irq, void *dev=
_id)
>  					  ACP_SDW1_IRQ_MASK);
>  			if (adata->sdw) {
>  				amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[1]->dev);
> -				if (amd_manager)
> +				if (amd_manager && amd_manager->interrupt_enabled)
>  					schedule_work(&amd_manager->amd_sdw_irq_thread);
>  			}
>  			irq_flag =3D 1;

[Severity: High]
Does this break the build when CONFIG_SND_SOC_SOF_AMD_COMMON is enabled?
struct amd_sdw_manager in include/linux/soundwire/sdw_amd.h has no
interrupt_enabled member, and amd_enable_sdw_interrupts() and
amd_disable_sdw_interrupts() in drivers/soundwire/amd_manager.c only update
hardware interrupt mask registers without setting or clearing any software
flag.

[Severity: Medium]
Assuming interrupt_enabled is added to struct amd_sdw_manager, should
sof_acp7x_handle_sdw_manager_irq() also check amd_manager->interrupt_enabled
before queuing amd_sdw_irq_thread?

sound/soc/sof/amd/acp.c:sof_acp7x_handle_sdw_manager_irq() {
	...
		amd_manager =3D dev_get_drvdata(&adata->sdw->pdev[instance]->dev);
		if (amd_manager)
			schedule_work(&amd_manager->amd_sdw_irq_thread);
}

On ACP7x platforms, an in-flight IRQ in acp7x_irq_handler() racing with
amd_sdw_manager_remove() or amd_deinit_sdw_manager() can still queue
amd_sdw_irq_thread after interrupts are disabled and pending work is
cancelled, leading to a use-after-free on amd_manager or register accesses
to a disabled manager.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107175339.3547=
918-1-Vijendar.Mukunda@amd.com?part=3D3
