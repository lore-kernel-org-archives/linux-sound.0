Received: from smtp.smtpout.orange.fr (smtp-66.smtpout.orange.fr [80.12.242.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA9A22ACEB
	for <linux-sound@vger.kernel.org>; Mon,  4 May 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913275; cv=none; b=DNbgXNYfFgHaBAnT5Dlnl3iXJ4Qk/dWj//slEmAzmhj6HFYoC5ijgm/mSuCLmpkuj54WUbWl/ghB1q8gvQKBQPDJChxaQKIpJckKqmt7GtoA4viIG9Iv7Pdu7oNt2aEnNHbA0fWfT+dRxQZJzvv6O67uVWAa5w+b0a/jtSGj1c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913275; c=relaxed/simple;
	bh=YqmHa3LdPlJzMbDJ/KWBLqRfD9g0zio154tUG8tfEfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfAdRN/iAy1e8ygfGVbD5sbZ1QP/+4P4jYTqf5RcBiJwUAY8x//Op2pWurOe8w6ACKcHdtcV1Za3n/ROAhPAw5UVcKhl2si8B1Wey2mvpmCo3G4gZ+wD8+chzSIEo8lwRZ82HFT4hyj3GFj/PMdXHBWGg5pyyELSuJyMSmU91vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=TyHlxWxM; arc=none smtp.client-ip=80.12.242.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="TyHlxWxM"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662] ([10.65.86.53])
	by smtp.orange.fr with ESMTP
	id JwRMwGEv50806JwRMwHo8b; Mon, 04 May 2026 18:46:40 +0200
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id JwREw4A3CPPElJwREwp7mP; Mon, 04 May 2026 18:46:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1777913193;
	bh=JtL7ldjxVHXMw0Ht4Ud2IBM4Q9F6t/sVFS0tjXFrsVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=TyHlxWxMTIl7C/eF2psSf6P1OoA7g+QyLGZxtDv/ceI+/qANt7lDjjIP7Wt2T9YH2
	 TAA1j4N4/zaYHs6wzI49yraFmC+NwsKemu0QtEW5fDRc6O9I2fvem3YfB8GzBdFZzE
	 P3XpoajGInlJM+X+akpPaHss1RKa44rYBaOdWVQLkLenwaQbuQvjcG6tQp1XRUH0/R
	 5poKb2fwUxf1vGzryLuiLTHAgksh65gRO5SGimo9RH+pwn8DNfZQoDw1ccpaCYMEqD
	 Tl/faAvSjM3GZqfnahJ5z33Xq1uuj2RSQkbPUgHIGYkATb7YjoBRAmz0nO6MQ1ey3q
	 IrzCam/wjtldA==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 04 May 2026 18:46:33 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <e322b673-0eda-4342-bebe-2a444b004bc0@wanadoo.fr>
Date: Mon, 4 May 2026 18:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: cs35l56: Use devres to destroy workqueue
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260504151006.3374934-1-rf@opensource.cirrus.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20260504151006.3374934-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/05/2026 à 17:10, Richard Fitzgerald a écrit :
> In cs35l56_dsp_init() use devm_add_action_or_reset() to add a devres
> cleanup function that flushes and destroys the workqueue. This replaces
> manually calling destroy_workqueue().
> 
> The error path in cs35l56_common_probe() did not call destroy_workqueue().
> Using devres keeps the destroy_workqueue() automatically ordered relative
> to all the other devres-managed cleanup.
> 
> The call to destroy_workqueue() in cs35l56_remove() has been changed to
> flush_workqueue(), as pointed out by Sashiko:
> https://sashiko.dev/#/patchset/20260504110743.3341869-1-rf%40opensource.cirrus.com
> 
> The use of devres cleanup was suggested by https://sashiko.dev to avoid a
> small cleanup inversion window if destroy_workqueue() is called in the
> error path of cs35l56_common_probe().
> 
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> Closes: https://sashiko.dev/#/patchset/20260501103002.2843735-1-rf%40opensource.cirrus.com
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> Change in V2:
> - Call flush_workqueue() in cs35l56_remove().
> 
>   sound/soc/codecs/cs35l56.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index 378017fcea10..26fa94c98775 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -1627,6 +1627,14 @@ static int cs35l56_control_add_nop(struct wm_adsp *dsp, struct cs_dsp_coeff_ctl
>   	return 0;
>   }
>   
> +static void cs35l56_dsp_workqueue_destroy(void *data)
> +{
> +	struct workqueue_struct *wq = data;
> +
> +	flush_workqueue(wq);

I don't think that an explicit flush_workqueue() is needed here.

destroy_workqueue() already does the job ( destroy_workqueue() --> 
drain_workqueue() --> __flush_workqueue())

> +	destroy_workqueue(wq);
> +}
> +
>   static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
>   {
>   	struct wm_adsp *dsp;
> @@ -1636,6 +1644,12 @@ static int cs35l56_dsp_init(struct cs35l56_private *cs35l56)
>   	if (!cs35l56->dsp_wq)
>   		return -ENOMEM;
>   
> +	ret = devm_add_action_or_reset(cs35l56->base.dev,
> +				       cs35l56_dsp_workqueue_destroy,

so, I guess that destroy_workqueue() could even be called directly 
without the need of cs35l56_dsp_workqueue_destroy(). Not sure it is cleaner.

CJ

> +				       cs35l56->dsp_wq);
> +	if (ret)
> +		return ret;
> +
>   	INIT_WORK(&cs35l56->dsp_work, cs35l56_dsp_work);
>   
>   	dsp = &cs35l56->dsp;
> @@ -2066,7 +2080,7 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
>   	if (cs35l56->base.irq)
>   		devm_free_irq(cs35l56->base.dev, cs35l56->base.irq, &cs35l56->base);
>   
> -	destroy_workqueue(cs35l56->dsp_wq);
> +	flush_workqueue(cs35l56->dsp_wq);
>   
>   	pm_runtime_dont_use_autosuspend(cs35l56->base.dev);
>   	pm_runtime_suspend(cs35l56->base.dev);

