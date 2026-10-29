Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793270536;
	b=HT85nfqSZmgnVE4MQzkMRWcbZ70aQn4ND4lFpihTHGbQ2iXVhqDyeysTavyZ48y8RSli
	 YxSLBO/Ag7zpuUZnbxCp4bPE9FvP7lr4zycVhjqYRwu41ig9XksvoKmSEEB9m/YB0Nl8g
	 sL5dW3X20S0Lb8aTgD5Amj+YVxXkiWrohVwa3QqxYYMh/EQwxsMti+acUjTIlxhOyY627
	 Mnc68TAl8w+5CMnM6S7SWIIAySAPQRwFcZHYV9hQSzb9ZMy/525hEyFlIPuNpkvM+8Eru
	 ywi0QISZx9A8Tp5bxlaokaj60YG9t4g8ECbupwUn0TtWWi3HK3FlcFo5OSx4Z13GYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793270536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2maSFqt0daC16nIjh+ROktTfpRQgphIb0icr6hD/9IM=;
	b=GZyZkWJyPWsUMMkhQMxpsC7EJlI1Ul4qFjCTLwrSpesiZ1sGnxUfX2W7RDUGnkVOQw0B
	 MHddVxpnFakTtzUTLYJ85hUuWKnzd0GaRdVjRJLsiMpkaqpJE/taqnayyKCgFlJ696jaE
	 D3iMoJYPKGtp2jYybH6x3aOPYOslY7uBC/z3/SC1z09RqxStINKeJIPL+4ajk3gGhfItC
	 nPqUD8IfzgQc6XQXaG/npwrviuQiCIP8uNx1npNXQKly3honmrdFLUntTYP0NeMFf/2rP
	 4sKgy3IJtI01gcGEB3rAPAfZvMiNcoVcTrcfMFF5EMIAKMVKnOn+pewwnka07b+5GyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cp97+4yA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5215606A31C
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 10:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cp97+4yA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105301F01825;
	Thu, 29 Oct 2026 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793270535;
	bh=2maSFqt0daC16nIjh+ROktTfpRQgphIb0icr6hD/9IM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cp97+4yAcbOxNm+EPC+OzdGkp/rJWWdo9q+lRMj7eSUSsQR2+wt1QWo4khxml5LJG
	 ReuAs5N24WjxpTtS3auE1gDVGX+ma4Q6q2tFvcPRDm84dkcpfjxq7eNcFpCphI5cou
	 A3K0irdixTnz8BP//84siqeptfP8OTYAK0nIYvwT/lwDVHP45dHkZY77a3ejeJczOl
	 zCWF4bPX6PIo6q4vN2Md+xApsOO/T/uz4xs5RNbiQOj1eEE3r+cWUgG9egFvmKq50O
	 jgdFVwV6e+Fuf30sf1Ui36AMFyRa9IIDao/r6euQmrYf0GpLwLPJ7fW97q8irxLLZ/
	 9HFng+s+WO4Dw==
Message-ID: <sashiko-outbox-189144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9] ASoC: wm8994: drain delayed works on remove and
 probe error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tristan Madani" <tristmd@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261029102515.3417777-1-tristmd@gmail.com>
References: <20261029102515.3417777-1-tristmd@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 10:42:14 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ASoC: wm8994: mic_complete_work cancelled before mic_work allows r=
e-arming
- [High] ASoC: wm8994: wm1811_mic_work() can queue jackdet_bootstrap after =
cancel
--

commit 04e84773079f92c3b3f2e772c451810f75d5d070
Author: Tristan Madani <tristan@talencesecurity.com>

ASoC: wm8994: drain delayed works on remove and probe error

This commit cancels pending delayed works in the probe error and component
removal paths of the wm8994 codec driver to prevent them from executing aft=
er
resources are freed.

> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index c65a7769a9d25..cd5f134c70dd1 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -4574,6 +4574,11 @@ static int wm8994_component_probe(struct snd_soc_c=
omponent *component)
>  	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_FIFOS_ERR, component);
>  	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_SHUT, component);
>  	wm8994_free_irq(wm8994->wm8994, WM8994_IRQ_TEMP_WARN, component);
> +	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
> +	cancel_delayed_work_sync(&wm8994->mic_complete_work);
> +	if (control->type =3D=3D WM8994 || control->type =3D=3D WM1811)
> +		cancel_delayed_work_sync(&wm8994->mic_work);
> +	cancel_delayed_work_sync(&wm8994->open_circuit_work);

[Severity: High]
Could cancelling wm8994->mic_complete_work before wm8994->mic_work in both
wm8994_component_probe() and wm8994_component_remove() allow
wm8994->mic_complete_work to be re-queued after it was already cancelled?

On WM1811, the delayed work chain proceeds in the order:

  jackdet_bootstrap (wm1811_jackdet_bootstrap -> wm1811_jackdet_irq)
    -> mic_work (wm1811_mic_work)
      -> WM8994_IRQ_MIC1_DET (wm8958_mic_irq)
        -> mic_complete_work (wm8958_mic_work -> wm8958_mic_id)
          -> open_circuit_work (wm8958_open_circuit_work)

Note that WM8994_IRQ_MIC1_DET is not freed in the err_irq path of
wm8994_component_probe(), nor in wm8994_component_remove() for WM1811/WM8958
when !wm8994->micdet_irq.

If wm1811_mic_work() is pending or executing when
cancel_delayed_work_sync(&wm8994->mic_complete_work) returns, wm1811_mic_wo=
rk()
enables microphone detection in hardware:

sound/soc/codecs/wm8994.c:wm1811_mic_work() {
	...
		wm8994->mic_detecting =3D true;
		wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_MIC);

		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
				    WM8958_MICD_ENA, WM8958_MICD_ENA);
	...
}

When WM8994_IRQ_MIC1_DET then fires, wm8958_mic_irq() queues
wm8994->mic_complete_work again:

sound/soc/codecs/wm8994.c:wm8958_mic_irq() {
	...
	if (wm8994->mic_detecting)
		queue_delayed_work(system_power_efficient_wq,
				   &wm8994->mic_complete_work,
				   msecs_to_jiffies(id_delay));
	...
}

Should wm8994->mic_work (and WM8994_IRQ_MIC1_DET) be stopped before
cancelling wm8994->mic_complete_work and wm8994->open_circuit_work so they
cannot execute after struct snd_soc_component and struct wm8994_priv are fr=
eed?

> =20
>  	return ret;
>  }
> @@ -4615,6 +4620,11 @@ static void wm8994_component_remove(struct snd_soc=
_component *component)
>  			free_irq(wm8994->micdet_irq, wm8994);
>  		break;
>  	}
> +	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
> +	cancel_delayed_work_sync(&wm8994->mic_complete_work);
> +	if (control->type =3D=3D WM8994 || control->type =3D=3D WM1811)
> +		cancel_delayed_work_sync(&wm8994->mic_work);
> +	cancel_delayed_work_sync(&wm8994->open_circuit_work);

[Severity: High]
What happens in wm8994_component_remove() on WM1811 when wm8994->jackdet is
true, control->pdata.jd_ext_cap is true, and wm8994->clk_has_run is still
false?

If WM8994_IRQ_GPIO(6) (wm1811_jackdet_irq) fires before the IRQ is freed in
wm8994_component_remove() and queues wm8994->mic_work (wm1811_mic_work):

1. cancel_delayed_work_sync(&wm8994->jackdet_bootstrap) returns immediately
   because jackdet_bootstrap is not yet queued.

2. cancel_delayed_work_sync(&wm8994->mic_work) then waits for the in-flight
   wm1811_mic_work() to complete.

3. Inside wm1811_mic_work(), force-enabling MICBIAS2 powers up its parent
   supply CLK_SYS:

sound/soc/codecs/wm8994.c:wm1811_mic_work() {
	...
	if (control->pdata.jd_ext_cap) {
		snd_soc_dapm_force_enable_pin(dapm, "MICBIAS2");
		snd_soc_dapm_sync(dapm);
	}
	...
}

4. Powering up CLK_SYS invokes clk_sys_event(SND_SOC_DAPM_POST_PMU), which
   queues wm8994->jackdet_bootstrap:

sound/soc/codecs/wm8994.c:clk_sys_event() {
	...
		if (wm8994->jackdet && !wm8994->clk_has_run) {
			queue_delayed_work(system_power_efficient_wq,
					   &wm8994->jackdet_bootstrap,
					   msecs_to_jiffies(1000));
			wm8994->clk_has_run =3D true;
		}
	...
}

Can this leave wm8994->jackdet_bootstrap armed after
wm8994_component_remove() finishes, leading to a use-after-free when the wo=
rk
fires 1000ms later?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029102515.3417=
777-1-tristmd@gmail.com?part=3D1
