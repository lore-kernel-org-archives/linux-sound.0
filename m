Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971782857CC;
	Thu,  7 May 2026 07:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139691; cv=none; b=XmWt1W5WvzQ9Ko4hWdKwyNGviW8iNBJ1q2CR7VAXV5u3OXSYh7eOODkbpLVrCpUmJh2qSFXtzi1g22kJxDzL3HJU8MM0/Uryl0OCYdRHpz+16iOzh1jzw6qyuKEJ3kFMwe3TtmWAOBnZD6wEMluEbLNbas7fSaLph11L8XhGw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139691; c=relaxed/simple;
	bh=B2YwEpPSJ7tu8G/ZFXKdO40EI5vD6U3Ucc/a1odn/TI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YvTVKEl2IvQ/GnhT5S/f7WckguiLVIzNl8Y+HhxSnBvRgH3rrG6S8/M4RZbfpuituPshnyN+93mAfwjlpq7+ht2x9IB44U5Bm2Hd0SMhqaA96yd86LDfqNM1cGWBcCezy42zJL3eTrMyd4IJSjlK2hebPs3x1nizGbng0kRPUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaJpOZIp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaJpOZIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED72AC2BCB8;
	Thu,  7 May 2026 07:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778139691;
	bh=B2YwEpPSJ7tu8G/ZFXKdO40EI5vD6U3Ucc/a1odn/TI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DaJpOZIpFYpBuSYQX78d7J2johOKMKy7na5u5DPIpn9ytDW2ycmV38/EEtetIvxYm
	 g+4JIKfHK/2Tdsm6lFoa+E60KhTEcin94QKuL2d1ZT3xBmpNJ1RNru0RarGtVz5GTz
	 VrNPOR8R0qebBwa35EGJg2F3HMvRxvR3/KAVsse88BIukdh9fBFMQZDYk+py2Sxwxe
	 xfM+LOH/9PwQKB8x7bwxeDvp8BKhddW97ID0bbXacq0z7+60BhHfXLOFykICRjXW1j
	 wZvZk+GCOdOI825bFP82NctU9UeWoOVZiHMuYhvWnI3w4BJdom64sFdKfUygfGO2OT
	 VZmuMmdrzMSBQ==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Baoli Zhang <baoli.zhang@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260506055039.3751028-2-baoli.zhang@linux.intel.com>
References: <20260506055039.3751028-1-baoli.zhang@linux.intel.com>
 <20260506055039.3751028-2-baoli.zhang@linux.intel.com>
Subject: Re: [PATCH RESEND v1 1/3] soundwire: fix bug in
 sdw_add_element_group_count found by syzkaller
Message-Id: <177813968854.210449.8596023623305001825.b4-ty@kernel.org>
Date: Thu, 07 May 2026 13:11:28 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 06 May 2026 13:50:35 +0800, Baoli Zhang wrote:
> The original implementation caused an out-of-bounds memory access
> in the sdw_add_element_group_count for-loop when i == num.
> 
> for (i = 0; i <= num; i++) {
>     if (rate == group->rates[i] && lane == group->lanes[i])
>         ...
> 
> [...]

Applied, thanks!

[1/3] soundwire: fix bug in sdw_add_element_group_count found by syzkaller
      commit: f772ff5a0e6758fd412803c09e03ba3bca5f5878
[2/3] soundwire: increase group->max_size after allocation
      commit: 654a7ae10b2ee6b07d5d9193c1c5465410781908
[3/3] soundwire: use krealloc_array to prevent integer overflow
      commit: 35a5ab8ef7f0f00b30eab9d917f3f0f4a2bec5d6

Best regards,
-- 
~Vinod


