Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2AA3314CC
	for <linux-sound@vger.kernel.org>; Tue,  9 Dec 2025 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285539; cv=none; b=KDmRSC2+SSJ45c9beQNjA6iJoRUlmWyZ0aQRvSCmLyAGMaM5oM+CP6hNh3aI3VYGT3cKwTnlsadpZ3LKTmSd1EY8j8v5fdxQ46Tc5m0bdovq3Q/8uY4Lfm6r+/zOJibldQyvTK1CX5gXvU1tQKq7qpqEnVpTt+3FiqT1gMt2R3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285539; c=relaxed/simple;
	bh=9rhVMk7Uv9+sshpmue8tOgL2QCKwnxNYo7mM5bOVvZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=siGkY6dFUx1UipeXhAE2njfWeuITQk42fYhqf3srZLOhzry1D5S7NYzZLwacCNdxTK1gzwIZUxrvBnzjFVAYETo/sIl5+pd+36lD2NLlpv2++SX+cvIv6+E8MeBHtCewkG0pga9Qgct85YUis7M5YqKLF1u+uPctO8Tr0bIwpzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QcNGUTHK; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QcNGUTHK"
Message-ID: <02bc8d1b-ae25-4398-acc5-e5779c245a3c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1765285535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ndUGHh+hl1llFBb9jjUOdOBAOKU4RJW1G1Wdwfv8I2o=;
	b=QcNGUTHK6CoJjOrp1E+UbPy7g7jUC5SBhFqkrNBmJ/Ohmx+LcxIDeRXZwl2noaNC5fXPRd
	mj4LidrgVXtP3aHw3eO1ti73R6XAgxv1wbZGy03W7b6bMWwqIZCwJqiEX4KzxdPR6SsZ5h
	aEE7QdkXZ+jHBcPzY/H8s+FtwTZGSGA=
Date: Tue, 9 Dec 2025 12:11:27 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 5/7] ASoC: SDCA: Add basic system suspend support
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: yung-chuan.liao@linux.intel.com, vkoul@kernel.org, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, shumingf@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
References: <20251125152128.274808-1-ckeepax@opensource.cirrus.com>
 <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20251125152128.274808-6-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/25/25 15:21, Charles Keepax wrote:
> Add basic system suspend support. Disable the IRQs and force runtime
> suspend, during system suspend, because the device will likely fully
> power down during suspend.

Power-down during system suspend (seems natural) or power-down during pm_runtime suspend (depends on what the host does during clock_stop)?

A quick rewrite would help...


> +	if (drv->suspended) {
> +		sdca_irq_enable(drv->function, drv->core->irq_info, true);
> +		sdca_irq_enable(drv->function, drv->core->irq_info, false);

and a comment here wouldn't hurt, not sure about the side/racy effects of turning the interrupt on before turning it off?


