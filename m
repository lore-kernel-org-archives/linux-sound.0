Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64132F0C48;
	Tue, 23 Dec 2025 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472429; cv=none; b=bNE/f8TYUEXJ1RIJTTbZcBzoiMgiinLNOe+MHxNZyPCdMeW2/pZw7nHUTp0iZ/whU6vXfb47Grmg0Z9Y1NqVCwCQLF4cxtDUVNRUYWDdH8NuU2u2ZRvSe9u0H89f1uCKDBtFqCx541r1z5W31NZ3AhfO6kUbONhD8N7gfBR8Gf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472429; c=relaxed/simple;
	bh=FKGVd541rtXI+7s6OU7PLTV7kRjXh+fAWesttldyVIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=h/WiMdZkm3Qs1gluLsDwZlGjAorBSBOUf+1ah7yGSSNck1aDGOe+uZe7dW32xfbfMaejCr5zoCa7Q8z3lGEQ5ciMbb5h7SimAiXZZ5l4Ar4bIzgn1FdtKtIjwqUJWf7RQVg5tF8CKSs2/rxji6xd5j6BYQiHZPLWhuhIkHWw9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvyQdCOz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvyQdCOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE72C113D0;
	Tue, 23 Dec 2025 06:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766472429;
	bh=FKGVd541rtXI+7s6OU7PLTV7kRjXh+fAWesttldyVIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LvyQdCOzG4yBdWNHFBiUk60l840fEpOAMb8y7lvwgMIIb1v6Y/vwSjqvxngZxOQC4
	 iAIWmW4bkWJ0eyq8WIDjrZiWoBBF06VSvqtGKTn+V9EPK+3/zkJvwYIHtqVrkeDe4W
	 DvVcGcVTmTuKWl30dAgCvHqoqZ6Cd5uRDn0T3ScUJlESPXg5zUMfehrIBKmwkqBC83
	 mptOIa58xBqyGX75t+B65winTS5tFVLbB7mwVG2IDpeMx4u3hL62z0OI/CMXp5DTSX
	 Vz4JErEqmDcMsheti41aaC1LBcn9opztU4XMqM+0Bl35qyJthAy0xHtglV0MvAZ1Ub
	 P0N9kK9aCmYQQ==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
In-Reply-To: <20251111115413.245828-1-yung-chuan.liao@linux.intel.com>
References: <20251111115413.245828-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: dmi-quirks: add mapping for Avell B.ON (OEM
 rebranded of NUC15)
Message-Id: <176647242733.660744.16966082229786295095.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 12:17:07 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 11 Nov 2025 19:54:12 +0800, Bard Liao wrote:
> Avell B.ON is an OEM re-branded NUC15 'Bishop County' LAPBC510 and
> LAPBC710.
> 
> 

Applied, thanks!

[1/1] soundwire: dmi-quirks: add mapping for Avell B.ON (OEM rebranded of NUC15)
      commit: 59946373755d71dbd7614ba235e0093159f80b69

Best regards,
-- 
~Vinod


