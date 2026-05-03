Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2026E273D6D;
	Sun,  3 May 2026 16:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825997; cv=none; b=Mpiv1iIS+2BgQnFWPjq5vKK7XX1BAcc0G6+KJjIGzXTjBWPJNThq4UgniqYVyBY0/y40tUFm+7CRH3XG6f2DnEjRKZtjMqZu3M4u5z/CETPB5vP7uEoXw//sWEN1r7JYRkYWEkh+R+c67WYNmCbrhqfuhR7iOj+m95EABrjCx5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825997; c=relaxed/simple;
	bh=/SBxFmC6JHvhB4nCjCdBaLMVy39VHyYArlMuEU0OJFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DLB9qwAaeGUl70jat/QBlMVbXHXvRWMEr5NqjDDxQ6JMqvY0FCOcuaU9zJ4IbbwlUljisvnk71Tjz92Cgx7AerFLEElVsEAOnMMGnZUUVRr1fM/MrueWgNCIUIywefsaxPWjMnygBjZjoTpZxs46OcULZa7+zW1P+AROTOCs8lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFLEcsfA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFLEcsfA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE17C2BCB4;
	Sun,  3 May 2026 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777825996;
	bh=/SBxFmC6JHvhB4nCjCdBaLMVy39VHyYArlMuEU0OJFs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XFLEcsfAhBnk7B0GINDiNhiFBcMELj5bsnO/Pl3gWhSf37PZRdEbZA99drDvkRqjq
	 w7M4zeQ6pNuPa+0ZciKWEIvtmh/2bA7IEiSFJ92sTrAjmUcIHRC+UigVf0eIvXkg4x
	 P3YS5RWMIPgg2+Alhs9YLfp4SKgmBbn27Vhqem4L203YolYMz11CBkpSJoPNhDtqg+
	 9XBGAJ0V3LUD/BP3iHZWjDM2YwRcL14UO/IPA18D/wTNwhZlbZELH1A5hMuoO84L1b
	 JDrs5JodY+C2T4CvmY1BNNp1diV85kjHO9WUbpOH3OeZSkerHZj9xPIF//iAqhu5gu
	 8S/0QB83ch/Og==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260430143353.2702714-1-rf@opensource.cirrus.com>
References: <20260430143353.2702714-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: stream: sdw_stream_remove_slave(): Check
 stream is valid
Message-Id: <177782599389.108644.14907204831190239743.b4-ty@kernel.org>
Date: Sun, 03 May 2026 22:03:13 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 30 Apr 2026 15:33:53 +0100, Richard Fitzgerald wrote:
> In sdw_stream_remove_slave() check that stream is a valid pointer
> before passing it to functions that dereference it. Return 0 if the
> pointer is invalid.
> 
> This is a convenience for callers. They can safely call this function
> during cleanup code without needing a pointer validity check duplicated
> at every call point.
> 
> [...]

Applied, thanks!

[1/1] soundwire: stream: sdw_stream_remove_slave(): Check stream is valid
      commit: 9a0afdd19a01c6edddb92eb6a464f9e99d946b90

Best regards,
-- 
~Vinod


