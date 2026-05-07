Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B8D2857CC;
	Thu,  7 May 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139688; cv=none; b=dumysNPfskNuh195ve0tEhJRMwom7zw+UNh1oRaahbth712M9T0jOWZ9uA+p/zyWkE0pFsU6ehJGaWtNI4AB/cjx0VkepTfs4FOdmRgRVSxgFqniuX5f6qaQC0fZI8MvBrr9RWvuNeXDXSyz9qIW8XJYzw9TkI0ggI+yzF3qxAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139688; c=relaxed/simple;
	bh=W4JKHNNObvYcbw1M/wavJNgkwNLY4ckI2xXeC6hgVWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oLCTBvWx3l86nuSov81FL1MHENmZ41l3z1tqiHmNnVsZyeRgMKaVzCEjdbhcZkO+Em7rPNUhNLhIs/g2+EDoMVAkygptlXGKIiQocz1ryZ+Bw+ly0dVjzMIVcBFsxSdkUP7h+3lw5NETJ4G3A9AF4W49IBVvSalLDMAJzNCofms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK3W7OeI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK3W7OeI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A8EC2BCB8;
	Thu,  7 May 2026 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778139688;
	bh=W4JKHNNObvYcbw1M/wavJNgkwNLY4ckI2xXeC6hgVWE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YK3W7OeIokEOKJ1omRKNnmmjZAXaGB7k2LxMlT5a1EKQWX7QpQwU6JLrCf+62h+PL
	 YT68/ZltbkbgtOzGImnyjz33gPnvhbiYgRzsLkQIyso5cha6TBKp2w3yWr8T2Vb7JE
	 Xb2s504vFEZfxTBnxRB1OKPsT2h6aQZq08pycYNZOfHsUgOjQ15wiM5S1IgqvXLQe1
	 3gGWNoS930gUuPmZJaYzKKqPCCRjNloPlhMoJYp/TW3VlXZNhn8xxDSeGad4VZNY4B
	 o+lUM/Nj9Ayye+n/x+nvJbjImS7RAk24yuq9Tw40drysKEK9EmM6xLNBZ+7bIMKaGy
	 w0Io7M9fblASw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 bard.liao@intel.com
In-Reply-To: <20260428084612.322701-1-yung-chuan.liao@linux.intel.com>
References: <20260428084612.322701-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH RESEND] soundwire: don't program SDW_SCP_BUSCLOCK_SCALE
 on a unattached Peripheral
Message-Id: <177813968548.210449.9976042554518092971.b4-ty@kernel.org>
Date: Thu, 07 May 2026 13:11:25 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 28 Apr 2026 16:46:12 +0800, Bard Liao wrote:
> The SDW_SCP_BUSCLOCK_SCALE register will be programmed when the
> Peripheral is attached. We can and should skip programming the
> SDW_SCP_BUSCLOCK_SCALE register when the Peripheral is unattached.
> 
> 

Applied, thanks!

[1/1] soundwire: don't program SDW_SCP_BUSCLOCK_SCALE on a unattached Peripheral
      commit: c368dd5cbd61ffab2b6f8a89b0d5775e2e16cde6

Best regards,
-- 
~Vinod


