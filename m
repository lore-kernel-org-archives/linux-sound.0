Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30A34AB06
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831758; cv=none; b=REhbhBvXKtv9yRYkZkgiV0ER89w1OpeodU/W+6fdxASgbmYOqP2RWrOV2xFJYCWixODt6Z3dEy4tpj0LvInsLfdeNAQdUAUQIG3JuSX43otl0OcE6yTrqvFNmaibDi0zC4BrUcGVzHbgresWL7kLXl1C+y5F82A/0L44/xWV5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831758; c=relaxed/simple;
	bh=2gHM06q2iHUPcHR6Q1LzU0DwsbfOb0Sh5erbCcmqM3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ipmzVaERovhV7N4nXIRNM0xHkAtnXodLVOklGmjIMrCYeOPOZwYaid/zQpEV4ANHzdE/EjyOV0BQFWB9vf7uomhwdGMqLOB1DvFFz7YUfUYQh2svP2T8k8+Zm81KoUVchsJ4v78VeVFrigXHKnkL1dhsRuEisVmN/cXt1+zCT2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0XcDHpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0XcDHpg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B62C116C6;
	Mon, 23 Feb 2026 07:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771831758;
	bh=2gHM06q2iHUPcHR6Q1LzU0DwsbfOb0Sh5erbCcmqM3c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a0XcDHpgk8kYUZ1EZjWPyPV+83Cfuv3W6ouAfAeEjlKKI2UOi1R7AYPyKOBdwYI1L
	 XP1tdiGSY0mW4MoAk6Ap1bb/lKnRQZz+wAOJhtlqYglpsg/ukyw2mhl84E+XgOZKti
	 1l7S8LBF1ne6bwE9TwxMLTvZ3D3dIUki4mea1lasNnWkGC0AS1sArQyXZiUD/UBb/C
	 RVLqI9qiGm1xJ1QHy0r5GzVEa7l5wGYi2+jMGDmpGzwK+KZ0fANNacT6keuqHNBopJ
	 sZbZGN4OiZlVZBu03QZw2NsFZr4m2rBEg8/7rEhH8pcTeo++wArg+edy2w8+mK7ob7
	 5+1IsBuS3PU7Q==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260216054418.2766846-1-rdunlap@infradead.org>
References: <20260216054418.2766846-1-rdunlap@infradead.org>
Subject: Re: [PATCH] soundwire: sdw.h: repair names and format of
 kernel-doc comments
Message-Id: <177183175690.441060.4115681048804841279.b4-ty@kernel.org>
Date: Mon, 23 Feb 2026 12:59:16 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Sun, 15 Feb 2026 21:44:18 -0800, Randy Dunlap wrote:
> Fix all kernel-doc warnings in sdw.h:
> 
> Warning: include/linux/soundwire/sdw.h:538 cannot understand function prototype: 'enum sdw_reg_bank'
> Warning: include/linux/soundwire/sdw.h:779 struct member 'port_num' not described in 'sdw_transport_params'
> Warning: include/linux/soundwire/sdw.h:792 struct member 'port_num' not described in 'sdw_enable_ch'
> Warning: include/linux/soundwire/sdw.h:892 cannot understand function prototype: 'struct sdw_port_config'
> Warning: include/linux/soundwire/sdw.h:906 cannot understand function prototype: 'struct sdw_stream_config'
> Warning: include/linux/soundwire/sdw.h:925 cannot understand function prototype: 'enum sdw_stream_state'
> Warning: include/linux/soundwire/sdw.h:942 cannot understand function prototype: 'struct sdw_stream_params'
> Warning: include/linux/soundwire/sdw.h:960 cannot understand function prototype: 'struct sdw_stream_runtime'
> Warning: include/linux/soundwire/sdw.h:1047 struct member 'bpt_stream_refcount' not described in 'sdw_bus'
> 
> [...]

Applied, thanks!

[1/1] soundwire: sdw.h: repair names and format of kernel-doc comments
      commit: 8167d7f674648cfd428ed49773522f9df5c4fdfd

Best regards,
-- 
~Vinod


