Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9F363C59;
	Mon,  9 Mar 2026 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039931; cv=none; b=pCx00gIh0bmX/H5HP9dhPGKSrFMMl4lWXunwbTL78xR46LpRlkSq20QSXdFs/SGbIDplSG82y8N4eWhBmsNVOg9yF79gCH15IG15mCX56pE6rQAlvnOAW+Xlkruw/QXz8ZFG2VFaM3X2nkZvA/QqmYwLPKhpPzeW5Pvgn+Yzbxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039931; c=relaxed/simple;
	bh=0BlS/8RVsVjLxmnf66L+Xyo5I6+Cp6TXIcds8jObGgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=S95zGxC9PgYv0L8hjFcLEc4cint9xSWtpm+O9umZj6YruMLrOQT8zJs/J7ktZwKiVJuQZuiMTS4s0lYoKBPGJ8gWFgqIWYfd8A76cJ8B3QhoqxWPasVeyKgL5pZfVMlBbBnYbggur56yIgtejvIsP11B9rDHTfK7QwuJA4QuSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B9yl6uM/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B9yl6uM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A28C4CEF7;
	Mon,  9 Mar 2026 07:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039931;
	bh=0BlS/8RVsVjLxmnf66L+Xyo5I6+Cp6TXIcds8jObGgw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=B9yl6uM/5zC21FwgM9VynT7s4eYJoSK3cqFZiCKBwopbb30WK5EYnVdCrbdKGhiYi
	 MddHySpsMnvJDMlrPwYi1whQv19BvNzgPuwPMDE6bf3cN/7rgJ41sHMtwsXQPxXsIQ
	 dJlaAfsF636fXo/HWk4zPUXLB8eAZUn/FFPEKuJQ59NarkwEpDVCMY1dLHKuewyKBk
	 MAhjbwN28njdcRn8Cz+FOLUT5vJOo3aeX11+hgDgOsjsEPOD6qlmEJZUJDITyL0wFe
	 VIz+J4w7bWQ6LGWv0xofc3Oo5ACiXPmFMRl89Vk17wSW+GCTOOHnLs1YwG5/x9Syxq
	 l9KuhPvxr6gIA==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260227111648.175548-1-rf@opensource.cirrus.com>
References: <20260227111648.175548-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: stream: Poll for DP prepare to avoid
 interrupt deadlock
Message-Id: <177303992943.65210.13043776658483865719.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:05:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 27 Feb 2026 11:16:48 +0000, Richard Fitzgerald wrote:
> Replace the wait_for_completion_timeout() in sdw_prep_deprep_slave_ports()
> with a read_poll_timeout().
> 
> The original intent of the wait_for_completion_timeout() was to wait for
> the port prepare interrupt. But at this time the code is holding the
> bus_lock, which prevents the interrupt handler from running. Because of
> this, the port_prep completion will not be signaled and the
> wait_for_completion_timeout() will always timeout.
> 
> [...]

Applied, thanks!

[1/1] soundwire: stream: Poll for DP prepare to avoid interrupt deadlock
      commit: fee12f3c20dd5902dbd95eb41f80d3fba89336d7

Best regards,
-- 
~Vinod


