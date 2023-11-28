Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49E84BAB0
	for <linux-sound@vger.kernel.org>; Tue, 28 Nov 2023 09:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkDLR5C3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D01DC433CC;
	Tue, 28 Nov 2023 09:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701165524;
	bh=LcD+ldJkLkGq0ZEQhTcLuS/VhjTh8l+OCqrr7fSArpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=tkDLR5C3UywF0mRe344TagJiExVImW2+HXTOqoplnlCrUQo5sdUm1i9DjueHX3YDz
	 3nv1aMCXbt4hN/PDbPWVrWxN1wPWaqDWikrnZrR3BYARa7jLvPwPJaa1fwNhmG4OEI
	 Ote3rT5wZ/OEjNeIyZ8HWo9GFL0HxXp7CrAOd+eDxdass5Hqd/XrchHswiCYAVeoHo
	 A/xNwhLHpDH4AJwwR6zcOmVnLDZ/0ehnVsajl8QVNZo6zZxYtL5YOW7IGi7ccBuV1t
	 16ckgqvFfB5BlajCu27yvklYUCO5t/iVTn7hsOuhQgasPvV4AgE61DwzbNt53OIfkk
	 XSufqXVZPvF7g==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
In-Reply-To: <20231127124735.2080562-1-yung-chuan.liao@linux.intel.com>
References: <20231127124735.2080562-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel_ace2x: fix AC timing setting for
 ACE2.x
Message-Id: <170116552221.73476.13450222254446640671.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 15:28:42 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Mon, 27 Nov 2023 20:47:35 +0800, Bard Liao wrote:
> Start from ACE1.x, DOAISE is added to AC timing control
> register bit 5, it combines with DOAIS to get effective
> timing, and has the default value 1.
> 
> The current code fills DOAIS, DACTQE and DODS bits to a
> variable initialized to zero, and updates the variable
> to AC timing control register. With this operation, We
> change DOAISE to 0, and force a much more aggressive
> timing. The timing is even unable to form a working
> waveform on SDA pin.
> 
> [...]

Applied, thanks!

[1/1] soundwire: intel_ace2x: fix AC timing setting for ACE2.x
      commit: 393cae5f32d640b9798903702018a48c7a45e59f

Best regards,
-- 
~Vinod


