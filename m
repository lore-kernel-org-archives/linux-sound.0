Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493137;
	b=FqGdZjhHCmNRe5n82WO8NWxo6LV+omV8IeqHv5RhRaON+dgzUNOrt2AnWQM72/tJnZNw
	 tGRXLy1Yf9Y9lyqeec99vKjhy5VyXxrcwpOxGik/GFP21Fqc3TKEqzed+4nNLAUDGuo5z
	 cZaZzcRho4j/qpFdIfaCQKtlD5BIPAJnWYLiltsILIothoCRTzVc0u6XVv1+AHiW0PdIw
	 dhs1vUrhTMXUBGCdD1af1btQcbU+KB3/FKc7yLkVUlhgGQqdGYBuPSzp0/hA/TnTBPf5I
	 qe9zDQFATP2PuojEC8/LCgMKeQr4EUch7y1Oxff/Zj0Evl9ii+hi5fCQcz+/hdFPYiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493137;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BIHokt5wa2Hjkr/6f5QONGzDl7eI1lDtrTov8rO+5DQ=;
	b=EBxHfP4erUEWxO2tGTWMnTJbw++cWCIuB/0D6bSp4c7Av45SS+PwclMsoOafZv/Hr1rj
	 m0TkdkLMnMaTYNDm//zvISxxiPcBREndDmtQY9kC2bq0j3XqcVL+1DsIUI/D5FbFjy9Vg
	 sJMIPaqeOdBHnVV2pzLaW0sWK+v4Ql2mUEpiNiLEdwboywCJBVVr7hRdJ6L7QehYRf9Oi
	 Zzp1JGMhymbj5arFvJ1BbuaGOJycAePXAFpxg1k1F5mm/YUd9ggS7G8u/H1LPPYNw6Up4
	 Vfi6gJAZfUTJTY42wfwZWuCR9TibMQhmvdJcBbyASowGzDnEY6jZUCItTgghzu8TyMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lK8rwHNx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAD7606A331
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 14:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lK8rwHNx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3291F00A05;
	Thu, 12 Nov 2026 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794493136;
	bh=BIHokt5wa2Hjkr/6f5QONGzDl7eI1lDtrTov8rO+5DQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lK8rwHNxb+RHB/uiCUmvHieJyFEjIhFvvWlWwpm4d6wuGcMHrDENullYKoI+UlhoG
	 Luc7tToiqQty86YjgWKFTeZpQNpsBLVM9uGLRmtDa37+oiEFikN1alhngpwv9sIH7V
	 2ews+L9mlINck68bN+zHnkF1i5Xb7SjTxde2gpGGAFauKqysr1IequHnhayM4wTn06
	 wPMkv3uCKWJlpKqNMVfbR/4Izcg0iSDomcc8qVX4L8ziyLR//zLNaOKRblk6cQMcwq
	 aGjllZN0qo9IzR4funBI1RjVuV4KxkgUwDZ+V0+/CeOV3P+ug/tadyAJ1dv32o9CvB
	 eeoXI6mcXkWfg==
Message-ID: <sashiko-outbox-211294@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: wm8994: Fix potential DSP control text array
 leaks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261112-88a3a7ff32-asoc-wm8994@mail.sdu.edu.cn>
References: <20261112-88a3a7ff32-asoc-wm8994@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:18:56 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] ASoC: wm8994: uncanceled delayed work in
  wm8994_mic_detect() [1]
--

commit b1875e92cf130d31ec4640f8cfad93d507df6633
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

ASoC: wm8994: Fix potential DSP control text array leaks

This commit frees the DSP mode control text arrays in
wm8994_component_remove() and clears their pointers.

> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index 6b91e02f130b3..1c7619f1d481a 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4640,6 +4640,14 @@ static void wm8994_component_remove(struct snd_soc=
_component *component)
>  	release_firmware(wm8994->mbc_vss);
>  	release_firmware(wm8994->enh_eq);
>  	kfree(wm8994->retune_mobile_texts);
> +	kfree(wm8994->mbc_texts);
> +	kfree(wm8994->vss_texts);
> +	kfree(wm8994->vss_hpf_texts);
> +	kfree(wm8994->enh_eq_texts);
> +	wm8994->mbc_texts =3D NULL;
> +	wm8994->vss_texts =3D NULL;
> +	wm8994->vss_hpf_texts =3D NULL;
> +	wm8994->enh_eq_texts =3D NULL;
>  }

[Severity: Critical]
This problem wasn't introduced by this patch, but can wm8994->mic_work
remain pending [1] when wm8994_component_remove() or
wm8994_mic_detect() tears down microphone detection?

wm8994_mic_irq() queues priv->mic_work on system_power_efficient_wq with a
250 ms delay:

sound/soc/codecs/wm8994.c:wm8994_mic_irq() {
	...
	queue_delayed_work(system_power_efficient_wq,
			   &priv->mic_work, msecs_to_jiffies(250));

	return IRQ_HANDLED;
}

Neither wm8994_component_remove() (after freeing micdet_irq) nor
wm8994_mic_detect() (when called with a null jack to disable detection)
cancels wm8994->mic_work:

CPU0                              CPU1 (kworker)
wm8994_mic_irq()
  queue_delayed_work(..., &priv->mic_work, ...)
wm8994_component_remove()
  free_irq(wm8994->micdet_irq, wm8994)
  ...
  (wm8994_priv / card freed)
                                  wm8994_mic_work()
                                    snd_soc_jack_report(
                                      priv->micdet[0].jack, ...)
                                      <-- use-after-free

If wm8994_mic_work() runs during or after sound card or codec teardown, it
accesses freed wm8994_priv or snd_soc_jack memory in snd_soc_jack_report()
and during codec register accesses.

[1] https://sashiko.dev/#/bug/linux-f4847a1a-9821-49ac-b084-a432a2aa712f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-88a3a7ff32=
-asoc-wm8994@mail.sdu.edu.cn?part=3D1
