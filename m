Received: from mail-m3276.qiye.163.com (mail-m3276.qiye.163.com [220.197.32.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA671624C0
	for <linux-sound@vger.kernel.org>; Mon, 17 Aug 2026 03:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786936549; cv=none; b=Br99BAs51XO75fndN54CxpOBE8dBbII+41LXvH8gximlZiwRcm+OXB8nLIHKPvGNn0mQmPXf/ViLLJJ79OtkFFUmHLeR1XxVk95nBwzxRVNs74yIjKOnbs5P83rzevPJ1FZim7ZmJxG2E3h8Dk1+uB6yzNT75R9IOhGb6ePJv/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786936549; c=relaxed/simple;
	bh=EapEf1tUMpRduUUQMGc3pyH2y35LLPniqxTjNoY9Em8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=UZxOdDN/W9mxiedTRENdYRx04/PtQ1wlBq+V8V32Pu6DkThi8303BTfhv4tnA9/OjuKrr7K9/f3Ei6H9SDpeI7Zvy1zV3UWVHLMFtXGD5H7q2aMLmpbp1ura0FKkOUcNV/IJhdYPidMqm6cdlpXbC/Fdte6VL8KML7t9eVcKs+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=AnC3rXpm; arc=none smtp.client-ip=220.197.32.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="AnC3rXpm"
Received: from Wangqianghua (unknown [119.4.23.72])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4a311a034;
	Mon, 17 Aug 2026 11:10:25 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: "'Mark Brown'" <broonie@kernel.org>
Cc: <linux-sound@vger.kernel.org>,
	"'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.dev>,
	"'Bard Liao'" <yung-chuan.liao@linux.intel.com>,
	"'Liam Girdwood'" <liam.r.girdwood@linux.intel.com>,
	"'Peter Ujfalusi'" <peter.ujfalusi@linux.intel.com>,
	"'Kai Vehmanen'" <kai.vehmanen@linux.intel.com>,
	"'Cezary Rojewski'" <cezary.rojewski@intel.com>,
	"'bo liu'" <bo.liu@senarytech.com>
References: <20260814025653.5484-1-qianghua.wang@senarytech.com> <20260814025653.5484-2-qianghua.wang@senarytech.com> <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
In-Reply-To: <4b1dedc3-91b4-4905-a402-d67e41bddfd5@sirena.org.uk>
Subject: reply [PATCH v3 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Date: Mon, 17 Aug 2026 11:10:22 +0800
Message-ID: <00e501dd2df5$f12bf450$d383dcf0$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0t9ezEOt56TuIgSja8Io6Lm7rsHA==
Content-Language: zh-cn
X-HM-Tid: 0aa00db2eddc09d8kunm640ee5837321a7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGUhPVklOGExNHhhKGEMaHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSkJVT1VJSFVMSVlXWRYaDxIVHRRZQVlPS0hVQkJJTk
	tVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=AnC3rXpmez58J43Ufvasq3AeLYrjhUzfD+2D+iylbDQgvkWnL/gJDLzyTs9fcIhVl33ZAFrQftYC63LUqY6JACB+xPJ/L2afLp/B7d9XVTR0VHmgs0pA8bCyfejVX/DgtiendAkZosZUuZ5yYyiWex6qhZFjMUXqY3oJs0vLopk=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=SzK7M1e5bXme4DfpSZhcF8bbfQNahT/fcisI3kiiSvo=;
	h=date:mime-version:subject:message-id:from;

Hi Mark:
	Thanks for the review and for taking this through CI for the merge
window. 
	On runtime PM: agreed. Enabling it unconditionally from probe after
register_component() allowed set_jack() to run before RPM was enabled,which
can mismatch get/put counts relative to remove()'sfirst_hw_init-gated
pm_runtime_disable(). I'll send an incremental fix that enables runtime PM
from io_init() on first ATTACHED instead,and keeps set_jack() from using
runtime PM until then.
On the build break: thanks for the log. The SN624x call sites need to match
the current sdca_asoc_pde_poll_actual_ps() / sdca_parse_function()
prototypes (drop the unused device argument and the SoundWire slaveargument
respectively). That will be in the same incremental series. I've also
re-tested on the LG Wildcat Lake / PTL machine after thesefixes; audio comes
up normally. 

Incremental patches shortly.

Best regards
Qianghua Wang


Re: [PATCH v3 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver

On Fri, Aug 14, 2026 at 10:56:48AM +0800, Qianghua Wang wrote:
> Add a SoundWire SDCA driver for Senary SN624x multi-function codecs 
> (jack, speaker amp, and DMIC). Program SDCA SampleFreqIndex in 
> hw_params, keep SDCA jack IRQs masked with poll-based detection, and 
> extend the Senary MAINTAINERS entry for the new codec files only.

This looks mostly fine but you have some issues around when runtime PM is
enabled.

> +	ret = devm_snd_soc_register_component(dev,
> +					      &soc_sdca_dev_sn624x,
sn624x_sdca_dai,
> +					      ARRAY_SIZE(sn624x_sdca_dai));
> +	if (ret < 0)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_enable(dev);

The component is registered before we enable runtime PM, this means that
things like jack detection that try to use runtime PM could get run before
it gets enabled which will result in bugs with mismatched counts or missing
references.

> +static void sn624x_sdca_sdw_remove(struct sdw_slave *slave) {
> +	struct sn624x_sdca_priv *sn624x = dev_get_drvdata(&slave->dev);
> +
> +	SN624X_DBG(&slave->dev, "SoundWire driver remove\n");
> +	cancel_delayed_work_sync(&sn624x->jack_detect_work);
> +	sn624x_jack_rpm_put(sn624x);
> +	if (sn624x->first_hw_init)
> +		pm_runtime_disable(&slave->dev);
> +	mutex_destroy(&sn624x->disable_irq_lock);
> +}

The runtime PM enable is unconditional in the probe.

Since fixing these would be relatively small changes code wise I'll push
this into CI, assuming it goes OK there I'll apply so the driver makes the
merge window - please send incremental fixes for this and anything else that
gets noticed.

