Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1473A7843;
	Fri, 29 May 2026 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780036732; cv=none; b=spyQL1AhSvkKLJuAulXxHTwVXWQeYrZBYNVzC1ndJm9evdqXXm3DQG9/zblMargiYV8KAdzgkbqwM+fQ64b+E24QayQV7f1FLIhTfwizlvMeMBQWvwrkJLoh941hb1yBFlaoCdDBs6BREVKpdopRsBDXLSm3YkuQpcMojJZ6ELE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780036732; c=relaxed/simple;
	bh=ZjHltIu0z5utND1D/OCIVr8knM7kQ+MqsilYFhjH690=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RE+xmRMxRqLQWr3CBgYfRQ8Ge4DG5I/+U6OsPvUKc3+qqHc9ZlS2gwKhAF4FB2yafI8ldBEf/toeR7V3NUe4NcMpdKZotC4eVQLi3rmFxeIl3wXYDykxGjIHvyr+s352Ij5QVIZG8jiVUO5Me6xF11+hHR7fcIeMokfg49dhO+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRB/RI5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRB/RI5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E651F00898;
	Fri, 29 May 2026 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780036730;
	bh=hPVKN36OHteaKtEeNptEYGgl9uIUZZyPuL5fQQ+vn9Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NRB/RI5F1mwlQxIjMkpuo0CDf3ZJzFkYlgoRTFppp4q6Mr3I0/+uREJuBJRCz4kX8
	 Q8jk5Jh2me/q9ASGUO6vKPk+8G/UuX4bzbMDVANuLAQSQgwlc1VU5BdFW9rbmhq0v/
	 05A+qpT2M4yMRtgpBsfP4JNw/fZxeBnyYIOcmTo7zujWvOQG6Ikj2qnN6BPogoqzB3
	 9rRuZgMLdLYiaIeipYlcShKyKbwl1LPWR0MBH+7it4HGXj5eB4sDBQ2NKFsedutDBe
	 b2scMzzwuxuxoAifc2ifJrILHUbq1Ke0nfFO8AgtBa1BV00dsnM600LLQwznIUPXaJ
	 wKdTHjL547JFA==
From: Vinod Koul <vkoul@kernel.org>
To: broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 0/3] Update some topology matching for newer
 laptops
Message-Id: <178003672639.923776.9694489783017380565.b4-ty@kernel.org>
Date: Fri, 29 May 2026 12:08:46 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 20 May 2026 17:36:28 +0100, Charles Keepax wrote:
> Now function topologies are being used more routinely we are hitting a
> couple of issues on some new laptops. Firstly, several laptops ship with
> devices in the ACPI which don't physically exist in the laptop, this
> confuses the function topology code as it tries to add those into the
> card. Add some quirks to ignore these. Secondly, remove some unnecessary
> matches and quirk the ones that remain so they only match the laptops
> that require them.
> 
> [...]

Applied, thanks!

[3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
      commit: 4dab2b904414fac53535c4e4cdad808132f4cdc2

Best regards,
-- 
~Vinod


