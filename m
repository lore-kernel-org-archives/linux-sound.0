Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE67E883E
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBFf0MSs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F81AC433C8;
	Tue, 28 Nov 2023 10:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701165610;
	bh=0XDd4GId1RUumC+pfTyLbSLBfY6q4ATklJ1bRPcr5kY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dBFf0MSsT0mRWp7hxYHFsMt2/EA775dXxS2oMfXUDMyXCZFvT1qOdNv8cfXNwvxZD
	 jIlUWD2celdR/K6UjdwDHOx6d9+sHP/E/MldfD4Wrf4VvACja4WJdDsODA+OqsYjCS
	 3MVHOJfdctK3Jwwu6fr+ejd5c38zdD+DyUpGPtcObT2+CDmmKUeWEb+BCW79gQQwYo
	 t8p2RHeLgH1PL6WRsK74WALbcNqERGjXmS51cDajN++v8DlPzpL/QpsPs9ZDEpX2/N
	 lJAtNWhfaGOLT1BwgwSJTXD4ojAou7/aVP3mkTMxJ36LfQxoQBlVCGG+KZF9yJu84M
	 y/ylJO4XKr5ww==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20231127124405.2080431-1-yung-chuan.liao@linux.intel.com>
References: <20231127124405.2080431-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: generic_bandwidth_allocation use
 bus->params.max_dr_freq
Message-Id: <170116560796.73868.7251028532785421026.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 15:30:07 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 27 Nov 2023 20:44:05 +0800, Bard Liao wrote:
> bus->params.max_dr_freq is calculated and set in sdw_bus_master_add().
> We can use it directly instead of calculating it again.
> 
> 

Applied, thanks!

[1/1] soundwire: generic_bandwidth_allocation use bus->params.max_dr_freq
      commit: 55d50ace6b88eb273a10963160cadbadccfcdd64

Best regards,
-- 
~Vinod


