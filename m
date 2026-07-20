Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA92C15BE
	for <linux-sound@vger.kernel.org>; Mon, 20 Jul 2026 19:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575849; cv=none; b=YX4wnz8MShVTPGy5ubBD6xoL29MBEWBbbF5RHqkg1U3n5Lu0pIJs+6BPaJCV8lHKZvErJHJIiyQZZTcl/VB3VpukaWYj4QMtNvFcv/YDctUnb1DpJbYJNWqDzzYMONMAjVUexHC1VxB/Hat4H8D/0CWV9FLgOYOeK4065q0MZIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575849; c=relaxed/simple;
	bh=7skgVc6273QkEFZHd4UQk+PRxSzhlM0DTWewI8WAxs4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BZdzKbgJIR/xjCmt2JE72fvmuMvR/xFdiFVMZjSVJAXsy0GL4KMNugs3XDam43katVGdJovp4W/HfHY9DykLVkXFRn55/7zSDWgnc7Iptuw2ZQn4CZZNKp9azmSgjf+JHw3umaDMRSytqy+FF2xGMwP4Ri3onbDpTCFsu4JEVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZNc1cZ7J; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZNc1cZ7J"
Message-ID: <ad18e774-3478-4a7a-8b29-86564f77ad35@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784575845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NX+PqfLcX+xEyxswbAcY+tNmKhjF6VmV3OZ+qzQ4qRY=;
	b=ZNc1cZ7JU+Z6wwpS3eIBUIY+lTj0wE/IJ+fg1RhTYsiq+9BGQ+NPHSW+Rjot+2poNMr8Ab
	Syj/tRv1Ny5/CjIaN1SSoCH1V/rXbTJ90MadvFHgcx/JdkpuE+uYlUxBK2Jx4JZgVwNpZp
	suomdyU0H4juHE/zrF+qpkoTOmz6uto=
Date: Mon, 20 Jul 2026 21:30:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: SoundWire: amd: all peripherals stay UNATTACHED after s2idle
 resume (AMD ACP70, ASUS ProArt PX13 HN7306)
To: Antoine Monnet <antoine@montane.tech>, linux-sound@vger.kernel.org
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Vinod Koul
 <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, linux-kernel@vger.kernel.org
References: <466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech>
Content-Language: en-US
In-Reply-To: <466a905d-8203-46d2-bfe4-a3b3f9b5d68b@montane.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


> One further detail looks suspicious, though I have not confirmed it is the
> cause: in the POWER_OFF_MODE branch of amd_resume_runtime(), the clock
> resume
> handshake is conditional —
> 
> val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
> if (val) {
> val |= AMD_SDW_CLK_RESUME_REQ;
> ...poll for AMD_SDW_CLK_RESUME_DONE...
> if (val & AMD_SDW_CLK_RESUME_DONE) {
> writel(0, ...);
> amd_manager->clk_stopped = false;
> }
> }
> 
> After amd_deinit_sdw_manager() and a D3 transition the register block
> may well
> read back as 0, in which case AMD_SDW_CLK_RESUME_REQ is never issued and
> amd_manager->clk_stopped stays true from suspend. Whether the peripherals
> require that clock-resume handshake before they will re-attach is a
> question for
> someone with the ACP70 programming documentation.

Even without the ACP70 documentation, if the clock line doesn't toggle
nothing will happen on the peripheral sides. That's a generic SoundWire
property, the peripherals can only look for a sync pattern on the data
line if there's a clock signal.

I don't have any specific info on this IP, in general such bugs result
from one of:
- manager IP not powered
- manager IO pins not configured for SoundWire operation
- clock not toggling
- reset sequence not applied
