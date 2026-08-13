Received: from mail-m1973178.qiye.163.com (mail-m1973178.qiye.163.com [220.197.31.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E4A2236FA
	for <linux-sound@vger.kernel.org>; Thu, 13 Aug 2026 02:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786587437; cv=none; b=MNtL13HVKs5O45V+UI3Mz0TRSizhfMOO9+tf99s7hq5ouPALTjTd6E3Es/X1ox3ykS3VuP+jz82VO1WzzYs8bUiA/AWIXmmyOUSP8RTNZaTg9G2TPX4QAVDrX33UK5vjCs4wyzF8tZr1zBh00LcLBHUkFkdAliFjpYVm/MAAhZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786587437; c=relaxed/simple;
	bh=t/THvzdKOVE0XahqZmM8zk9AiJR4yDLEiatnKTNmBRE=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=mHzglQ1kt5ctJxPuc5a2ShaAjaCngeuoHEV17SqK/kEsRbSBmEs1B9e0kXPqGuz/DudPvzDNNNNUlr9sGD6VbIrgKdV+5+ZDms5f4BQ8k719eIvESDieXB4kjRg0Lkxb1Vfj/G5n9HWx5m2t1OYjK4zqJN+sIuGNDWvb9irgJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=Y3uk7P64; arc=none smtp.client-ip=220.197.31.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="Y3uk7P64"
Received: from Wangqianghua (unknown [182.148.129.247])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49cbeb9b3;
	Thu, 13 Aug 2026 10:11:52 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>,
	<liam.r.girdwood@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>,
	<cezary.rojewski@intel.com>,
	<bo.liu@senarytech.com>
References: <cover.1786511177.git.qianghua.wang@senarytech.com> <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com> <2d46a294-b7e9-4be4-bbec-a44b056d9776@sirena.org.uk>
In-Reply-To: <2d46a294-b7e9-4be4-bbec-a44b056d9776@sirena.org.uk>
Subject: [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Date: Thu, 13 Aug 2026 10:11:50 +0800
Message-ID: <005a01dd2ac9$1a9ddf90$4fd99eb0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFzE36xPgsAUv4/OUonqm2N+dVPbgGbwKZHAqquntq3TTd2YA==
Content-Language: zh-cn
X-HM-Tid: 0a9ff8e3e44b09d8kunmd20b2902478063
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSE5DVkoeQhgaHRpLSkhMS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVJT0xZV1kWGg8SFR0UWUFZT0tIVU
	JCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Y3uk7P645/aOOSF/WN1xXZu+7X1Dx4HjZQKqiNiQmcpwET7Z3viboUUzPpmkW/efh7fGEdqwlxzc9DT0ZPU/v1+mCiPRPlTFz0df8xRQIb4a0SFHF2qGkqBbBtOhCP45oQOQkBjX2HW3N6Vq6kpxHKx3HZFyvWxSZmSkzLUFGsc=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=b4Zzg1O/qx4UCJ/655pwaY1DWXkXFPS+ibjzsSWuMcA=;
	h=date:mime-version:subject:message-id:from;

Hi Mark Brown:
	Thanks for your comments. I will address them in v2.
Best regards
Qianghua Wang


>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=
>>>>>>>>>>>>
Re: [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver

On Wed, Aug 12, 2026 at 02:59:42PM +0800, qianghua wang wrote:

> Add SoundWire SDCA driver for Senary SN624x multi-function codecs=20
> (jack, speaker amp, and DMIC). Extend the Senary MAINTAINERS entry for =

> the new codec files only; Intel ACPI match tables remain under INTEL=20
> ASoC DRIVERS.

This changelog describes the series, not this patch which only adds the =
CODEC driver.

> @@ -238,6 +238,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_RT715_SDCA_SDW
>  	imply SND_SOC_RT721_SDCA_SDW
>  	imply SND_SOC_RT722_SDCA_SDW
> +	imply SND_SOC_SN624X_SDCA_SDW
>  	imply SND_SOC_RT1308_SDW
>  	imply SND_SOC_RT1316_SDW
>  	imply SND_SOC_RT1318

Please keep this, the Makefile and the Kconfig lexically sorted.

> +config SND_SOC_SN624X_SDCA_SDW
> +       tristate "Senary SN624x SDCA Codec - SDW"
> +       depends on SOUNDWIRE
> +       select REGMAP_SOUNDWIRE
> +       select REGMAP_SOUNDWIRE_MBQ
> +       help

This also depends on SDCA.

> +/*
> + * Trace helper: load with trace=3D1 or:
> + *   echo 1 > /sys/module/snd_soc_sn624x_sdca/parameters/trace
> + * For finer logs without trace=3D1, enable dynamic_debug on this =
file.
> + */
> +static bool sn624x_trace;
> +module_param_named(trace, sn624x_trace, bool, 0644);=20
> +MODULE_PARM_DESC(trace,
> +                "extra dev_dbg for probe, jack, SDW status (default=20
> +off)");

You probably want to look at tracepoints and trace_printk() here, these =
are much more flexible features and can be easily tweaked at runtime.
In general it's probably better to skip all these module parameters for =
upstream, they all look like debugging stuff which should hopefully not =
be needed.

> +static void sn624x_log_power_mode_once(struct device *dev,
> +				       struct sn624x_sdca_priv *sn624x) {
> +	unsigned int pm;
> +	int ret;
> +
> +	if (!sn624x || !sn624x->regmap)
> +		return;
> +	if (atomic_xchg(&sn624x_power_mode_logged, 1) !=3D 0)
> +		return;

There doesn't seem to be any way to set this?  Also consider =
printk_once().

> +static int sn624x_sdca_pcm_hw_params(struct snd_pcm_substream =
*substream,
> +				     struct snd_pcm_hw_params *params,
> +				     struct snd_soc_dai *dai)
> +{

> +	stream_config.frame_rate =3D params_rate(params);
> +	stream_config.ch_count =3D ch;

Do we need to configure SDCA clocking as well?

> +static int sn624x_sdca_dev_system_suspend(struct device *dev) {
> +	struct sn624x_sdca_priv *sn624x =3D dev_get_drvdata(dev);
> +
> +	if (!sn624x->first_hw_init)
> +		return 0;
> +
> +	cancel_delayed_work_sync(&sn624x->jack_detect_work);
> +
> +	mutex_lock(&sn624x->disable_irq_lock);
> +	sn624x->disable_irq =3D true;
> +	sn624x_sdca_jack_irq_mask(sn624x);
> +	mutex_unlock(&sn624x->disable_irq_lock);
> +
> +	return sn624x_sdca_dev_suspend(dev); }

I'd expect the work to be cancelled after disabling the interrupt, =
otherwise the interrupt could schedule more work between the =
cancellation and the disable.

