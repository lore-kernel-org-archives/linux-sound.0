Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB403803F2;
	Thu,  4 Jun 2026 06:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780555489; cv=none; b=A/nNlS5HJS3VMPNWlEby26r07RGIXX4FAaA7fF9KMjeoke+MQkDl6QlfrcppO4HK4wV+Wp6N+Ng7gJG/S1ibm0korCr76n8o61AdF6eBaHkx/pv/T7b4N7RDhQhmSZ+nd4BkowSLKdIYkNi572uzORLCJJXnUjc87JrjWANMYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780555489; c=relaxed/simple;
	bh=r8AFu0ndSrfVB6Cb6f69ES56jOfrNKW13ofKNIPaLY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip1+tpzT5M8Wpk/pbz6G2rXLklufQznoGj1Vg1jHEES+xUeLCW98pxU9yu2kKeXkWEYlRqaqoGzeq8e/TVlcW9+tzuXjQJYbtuxfl5u/n6Zd3pZbZxmzzBNhhBKuujNGO0PMlAtaucwqdnMPPdx84K/V47z1OMZQmCpRarpdtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj7NLYPk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj7NLYPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 302261F00893;
	Thu,  4 Jun 2026 06:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780555487;
	bh=hQ9VvpoH7tgPamI9TfpHp94chB77RXIhjUGPPGWvSJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Mj7NLYPk5kYP0l7XRTiqVPM2rWwTKBQYmtAtZf3FgQd9s3gxtxT3aP2Xzr7+XYVH8
	 EG/x7q9yaD7xHHQN+w+RIqI9WATr4DR21KONKeyPQAl9M2qgaLUY+ID17O3hjU3Edm
	 0mct33cWIT3kGb22AX7WNMW7nJwWt9HbhQsJsECQgmAkbyVEDydQ/tyLzLVyK4WYRn
	 BhlvpfNZ0cfdjERmC3WKdYn8HryVMvlMcovtH/et6UzMXpCHdsOCSkU2l5VBk3xOzH
	 inGBnXiJJvnfX4q2MLGSHaux8UO5X4y8QjsN6Dx4kdy49CkrIxDfYhZ3N4QsmS8RmQ
	 7Ot3lMkOaP2Og==
Date: Thu, 4 Jun 2026 12:14:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, srini@kernel.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 01/10] soundwire: Always wait for initialisation of
 unattached devices
Message-ID: <aiEe3DIvuQOU2O7p@vaman>
References: <20260603144443.593230-1-ckeepax@opensource.cirrus.com>
 <20260603144443.593230-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603144443.593230-2-ckeepax@opensource.cirrus.com>

On 03-06-26, 15:44, Charles Keepax wrote:
> Currently in sdw_slave_wait_for_init() the waiting can be skipped
> if unattach_request is not set. Doing so was added in [1] likely
> because the core used to do a complete() on the completion so
> waiting in the case an unattach hadn't actually happened would
> block for the full timeout. However patch [2] updated the core to
> use complete_all() which means that the wait_for_completion() will
> now simply return if the device is already attached skipping the
> completion doesn't add much.
> 
> Additionally, unatttach_request is only set if the host initiates
> a bus reset. However, the host doing a bus reset is not the only
> reason a device may be unattached from the bus. Other options
> could include the driver probing before the device enumerates, a
> sync-loss, or the device itself powering down.
> 
> Removing the skip using unattached_request, doesn't cost much in
> terms of efficiency and allows the sdw_slave_wiat_for_init() helper
> to be used outside of runtime resume.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
