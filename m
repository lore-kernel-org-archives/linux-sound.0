Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDA23624A1;
	Mon,  9 Mar 2026 07:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773039929; cv=none; b=fQFhGuGMAlKzYoI6tD4hIMce60R1+WTBRDl3U8O4ji4+tVU7GGKVYtlZZr7otsG4qDQMbwvMscNKAfwVYMJgirK7EeNSlXA2qmU2vYyGt/6f54p0Vy5VcA2/avfw96L2vvcm6tyI+fYVhOrnn8JqyZDXCDt+YoHIB21OUMtc9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773039929; c=relaxed/simple;
	bh=cKLyM7+JdDmwXWhJfBXYC9c3bLlDfqq2D6TdxVAV+JE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qF7CUoaF7to+m6a8ELM8LguH4gzy3pzi2gomJ/63rkCc4F/MP+2Mk1NJKs/cViQHqyiN8qwWhbEzvpHMx5UcGN/7pQ/3MHmo+X5jXJMDF/L+fnJav92o34yrf96xYG65pacYgRvGvOXU6ArkVUbi/kO28Y8qFjkixO4qmtSRrPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CllkrxY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CllkrxY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EFBC19423;
	Mon,  9 Mar 2026 07:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773039929;
	bh=cKLyM7+JdDmwXWhJfBXYC9c3bLlDfqq2D6TdxVAV+JE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CllkrxY7QQo3BuA7qpDguSKe/rqSziuGEGQX/vogRnlBXKz+FXpoS3D4g+KF6TARB
	 dJaA8tUBXNHKWmCyen4ZsgPjZoGPZnBcL0CymFOOP9FA1osnS0fVPmqOSnqYL5GWyS
	 TT++KUEVX9e1rxK+NJRKjWl6HmOycniXASJO/FmbLxtcDTqKnATmqaBQ00d/KKinVP
	 3aoywz69p3RlcCyxc3qe6QxWzWgMIfP5puRju2FNhO/9HA5GKQxKt/gYr/EbhUDfW0
	 ycIG0cxMMW3nwpm/IE/beszm9xHoP0GHLZJYKsRp3jiKGCjXls11jwsrk5M8XJU9c6
	 Ya5j+oa/G13Zg==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com, 
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
References: <20260226065638.1251771-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V6 0/2] soundwire: amd: clock related changes
Message-Id: <177303992707.65210.5693315984444138192.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 08:05:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 26 Feb 2026 12:25:52 +0530, Vijendar Mukunda wrote:
> Refactor clock init sequence to support different bus clock frequencies
> other than 12Mhz. Modify the bandwidth calculation logic to support 12Mhz,
> 6Mhz with different frame sizes.
> 
> Vijendar Mukunda (2):
>   soundwire: amd: add clock init control function
>   soundwire: amd: refactor bandwidth calculation logic
> 
> [...]

Applied, thanks!

[1/2] soundwire: amd: add clock init control function
      commit: 2a267a8410841ba1c71daa41d1fb2cc21ff23e6b
[2/2] soundwire: amd: refactor bandwidth calculation logic
      commit: 27ab4f1e4909a674dfd03058fb9802cae2343a36

Best regards,
-- 
~Vinod


