Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77913DD50F;
	Thu,  6 Aug 2026 08:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786005579; cv=none; b=fLfyby26lQyhkQmQoW/L0aVjY88OLp7LqmMhaq0kmcVXY3TAa1fAN027jn4xuhzTEzVd6nrY6GS89yRJnzOgYT2vp6t9nRD8HteGx1VKM9v7fm1KA/PGSDoDNJ9E3Y1N4DVnHcey2eBgnjKuS6DFB0D7wfnLp/4oj42S2BpeLdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786005579; c=relaxed/simple;
	bh=R5eNi1Ge3pWmbyWbEsWXQmoY/9AVKqPA02OW2OHDcCE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LGiPOVeTks8pC8h60VWyw3VPAVjg5A6U6JKV+2ANvy0lXup7ZYm0FitB2qd1xNUcRkDQrRbGJimEzEUmJnbYxlNanf29wZ1pR7esvyXOy0nSrjaqRDnB0sSuVCu5OJwASgO9fwMbbpQkNbEn2VUl7VZRXPTqG1kiVrDLUXDX7xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fWlN2FMi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fWlN2FMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014141F00A3D;
	Thu,  6 Aug 2026 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786005566;
	bh=CSRSGTDgMGtNJ0M1UzU9+Te04yRR+lPbJqyOnqEYveU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fWlN2FMijSg4aldJsxdbWAeeZSjHOdhZWifcj3mGJdFzLyhErXZUclMk1HzbDq5vX
	 8y+xGOZMSNbYrIHN13XGg9HOwgayL2mH8BUSc0YC6NHoMvrodylBiWZw/nOmhIbhzq
	 mfR1bjTCCBsZuYfmRptvBWUeebwkgB0BNHJ2YLCLjRFp3YZKGVr6DC3yPU4upVCBrc
	 9FC7o4WvOrRyplrRJbT0c1LphbWE6R1uDpgVfbwlwjga5PyRLbl6PTIKMAPrU1F6uQ
	 kfobxM5vDvYcOO0MPK0J5X373bZoXFWxeeoXWpSlK7da0OomTVVo4LVxGVt9QK/KiZ
	 IuN+7IkPV8xNA==
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260728173542.61146-1-jorijnvdgraaf@catcrafts.net>
References: <20260728173542.61146-1-jorijnvdgraaf@catcrafts.net>
Subject: Re: [PATCH v2 1/2] soundwire: qcom: set the bus mclk_freq property
Message-Id: <178600556361.593040.3334273150692681813.b4-ty@kernel.org>
Date: Thu, 06 Aug 2026 14:09:23 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 28 Jul 2026 19:35:41 +0200, Jorijn van der Graaf wrote:
> sdw_slave_get_scale_index() needs bus->prop.mclk_freq to compute the
> SCP bus-clock base and scale register values, and fails with "no bus
> MCLK" when it is unset. The qcom controller never set it, so slave
> initialization cannot program the clock registers on this bus: it
> would fail outright for an SDCA-class slave, and a slave driver
> declaring clock_reg_supported hits the same error. The pending WCD9378
> codec driver hand-rolls these writes as a workaround, following its
> downstream counterpart.
> 
> [...]

Applied, thanks!

[1/2] soundwire: qcom: set the bus mclk_freq property
      commit: f64c5d5ff8f9d25272562560ba1bc994f53a6def
[2/2] soundwire: honor clock_reg_supported in the clock scaling check
      commit: b3d27039466292faebbfd83ed9c4a7d2c39e79eb

Best regards,
-- 
~Vinod


