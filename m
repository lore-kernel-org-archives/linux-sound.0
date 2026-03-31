Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D52FD695
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968624; cv=none; b=T301yWh+CvsfNDjz8fnOWzu+/h3ERYSDCoXBftQGKPEHvbNLPkgxzBpCwnAd2V+uydJPNcBHD2983LfxUBFJrRiqk+TgArCEKNWN3HiU0tbz5AWpSgzboygQB6ioxxO94UNTTOn8ll993CVTcd3GiKPif4bQ80TS8X9yj82o7y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968624; c=relaxed/simple;
	bh=4iwRQ1MpfreIizyhrQqEYdzG5pASF4SllUb4qLE7oAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAG1wgC7JJP7BIZdYnjJMa1EXzUqWzvlTXt0DGBRJ8f6DjEiGOkSR2/O4ODE5nKkGwFV8xt+w4tJP/nTUfyLwTd5RU6LWuXBXeMFTfajEx21BfsWaLPGqAOrNsKpYg5NFZBXIasAyUEmlw91oq2LT/Rq+i9nJmU/IqCBCCIEwXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=psAZf786; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="psAZf786"
Message-ID: <2336199e-5fa0-4990-b3df-495e3c3e893a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1774968621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4iwRQ1MpfreIizyhrQqEYdzG5pASF4SllUb4qLE7oAE=;
	b=psAZf7864WgKepi+CZ+PV5BQXJP3UteE3qBScldFyA2fjtEgTxBNqPZPtIVKSECSefTp/T
	sggikv74KK1FKh3ta6B5oHAIRxanFoYWTjrMl031JM+p/llusoCylpI43wJXT9eQk/lFED
	ZvU+qd0Z3jE4ugSoYaC9YaMODuygFI8=
Date: Tue, 31 Mar 2026 16:46:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 4/6] ASoC: es9356-sdca: Add ES9356 SDCA driver
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
References: <20260327095954.3465-1-zhangyi@everest-semi.com>
 <20260327095954.3465-5-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260327095954.3465-5-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


> +#define SDW_SDCA_CTL_MBQ(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | MBQ)
> +#define SDW_SDCA_HCTL(fun, ent, ctl, ch) (SDW_SDCA_CTL(fun, ent, ctl, ch) | 0x80000)
> +#define SDW_SDCA_REG_MBQ(reg) (reg | MBQ)

these macros should really be part of a common header.
Alternatively use regmap_mbq() and hide those access details...


