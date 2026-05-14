Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C8342885D
	for <linux-sound@vger.kernel.org>; Thu, 14 May 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771469; cv=none; b=bRrXTvhYp7NIq25krDaVNqwrnXTTob4bRyu7dIo98zWtzzqHIdAE4nYb3sLbLl0vLQN5e0f5orpa3CoiwaHv6Ue/oR0HbfQFhGnI9JznhyaZvZGfpyEypCwtH5jkJPZqUkbW5F4c64dWX7H/yB6aaW1Y3TSspU2wEwhOQR/wUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771469; c=relaxed/simple;
	bh=lo5YvtRplCnd+W7njdA9CpzwDxeYLdK55o53o24XuYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ehTxDiUgqV1Zt9E2lN4vAAqCZx1JyFK3WXlYDo2EC/7L8EMNv3HMD3JMyv6sEBBS2BdJFei5veL5FCpHHkE99mh9Pp7ZPysmNQabpf14cAodRRISitbmFJNxpyFu//DeNp4CG9pBg7mD8vsynhCaQT4tjODtsd/VvV4yaRtc+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiIPC4nZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fiIPC4nZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB44C2BCB3;
	Thu, 14 May 2026 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778771468;
	bh=lo5YvtRplCnd+W7njdA9CpzwDxeYLdK55o53o24XuYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fiIPC4nZNM+NtzLrG2ygZxSCCpXy8gB9udllXcgGj4C1YJrwgwDIY0DeUqxm3d6b8
	 KXiHjFE7juyuP2QDFo7NoiwkvfUEpwGrzNK2lMpDZReFN0/9StxFkd/agdj3w3ejI7
	 thukjhmi05RzZKoFMEJp0g/41GzQp3ZvfRUNCGPNcYUKbjG95+xuaTwwIbHws08IqV
	 VkbByQidtMw4zr/Fg/5qsViQyjD4wPHJc8eOs3mF5L5keyzrInb2U84s9UZ9bFBojX
	 85+z0ZFwtamPP1S1mZJPw/ocl1+so+UQ2usdoj1MZBOU3FdF0OQ40o26lfKDX0a9/b
	 Z3Cuh6ZrpyWsg==
From: Vinod Koul <vkoul@kernel.org>
To: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org, 
 Zhang Yi <zhangyi@everest-semi.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 ckeepax@opensource.cirrus.com
In-Reply-To: <20260514075206.3483-1-zhangyi@everest-semi.com>
References: <20260514075206.3483-1-zhangyi@everest-semi.com>
Subject: Re: (subset) [PATCH v15 0/6] Add es9356 focused SoundWire CODEC
Message-Id: <177877146553.1054194.3697039298167289311.b4-ty@kernel.org>
Date: Thu, 14 May 2026 20:41:05 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 14 May 2026 15:52:00 +0800, Zhang Yi wrote:
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.
> 
> v15 -> v14:
> 	-Change `es9356_sdw_remove` from `int(*)` to `void(*)`
> 
> v14 -> v13:
> 	-Rebase onto latest linux-next for-next branch
> 
> [...]

Applied, thanks!

[6/6] soundwire: intel_auxdevice: Add es9356 to wake_capable_list
      commit: 4e90368e8680d9ddcb06f82f2e63cbbcf21cef2c

Best regards,
-- 
~Vinod


