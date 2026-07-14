Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC1346AF03;
	Tue, 14 Jul 2026 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784036578; cv=none; b=tyO/i5VjhRmcRIVWs8sMV5lTmRQ4M6tXsuTXXkctC/7Gap+fLoq/slcB5SIXlF3atLYrcE561fG44wBM9PRem0Couk/Q3KpVHt5od7tHd/9qgCVUIzmrLgCwus9wLKqvuaZ06R4SXvnws5VrCM0DtrInoqyD175P0xbrqbZhrlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784036578; c=relaxed/simple;
	bh=idDGELONgZ52OifakHCe+BuhXiOt2OAiFE4f4B2+F5I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f0uhSS8xHvHI19vWKd4BHPFT1s6UhqfYJUnxGwY/hRudgdhKHzUheKRlcU6EiIMJfguaLH70Y3kFcNmqrqW53dGfacGBDZPKAGJsx75zjnmSjSmfnpOCN2Vvsmyic37zEAszDFf+NULYABlDRlPUcpvTdM0HvPOM4yBr4+qckRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDzZeztr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDzZeztr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0DB1F000E9;
	Tue, 14 Jul 2026 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784036576;
	bh=7YJzkaie5+VlwVn57W5/flcIezivIunP3rnkxr57+OA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CDzZeztrAFQpCjzmRE1DLc6jE1LP10VeUQZkG7hG6ixDXXVhIUWwF54hBpjtYftjb
	 XvAwRwR4ucgbQaVvfk5IC9hJWveFkq7QyZLA8LnS/M5UIt6LvWhHvKuRp6Ps+c3hUc
	 teA/MS6J8VCZVEsosCVglPSzjoPI66/8Ser5KJKFbNkSDf5Qm/r72Bb1LrQwdXBGrc
	 zvO+mP4EZqiAIyAdSg0eE0LSSN8cb20VDxXeiN5UkLWxW6Gx3UbcZpE/VFl+QZtPmm
	 baWavVAsYF1f2uqYOpIqUuDYi1K43ixgY+FDREQIJZHSsUy3MnB9Oy4ErqN7sTfjC2
	 A7uhemRFGaaPA==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260708122948.1502227-1-ckeepax@opensource.cirrus.com>
References: <20260708122948.1502227-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: Add cs42l44 to
 wake_capable_list
Message-Id: <178403657419.851500.6808762256972959878.b4-ty@kernel.org>
Date: Tue, 14 Jul 2026 19:12:54 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 08 Jul 2026 13:29:48 +0100, Charles Keepax wrote:
> Add cs42l44 to the wake_capable_list because it can generate
> jack events whilst the bus is stopped.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: Add cs42l44 to wake_capable_list
      commit: d08e4d9197396ceb906715d976b63aed0c5cc8e5

Best regards,
-- 
~Vinod


