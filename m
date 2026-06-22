Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A73E2AE7A;
	Mon, 22 Jun 2026 04:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782103558; cv=none; b=AaD1fqm76ZUlhW5LCdIDMszs+AKm8aV+c4iyxQGJ9yXfK97qpfXQCaQIkJb1qjQZwK2qqXh47dcFhIWpUaRY3076bLDytvS18dE8tY8NspdaaDT//Vs/7TF+W5BvtG4bdQJKfDCAgvC4oY57NkUpWgPTFMntOXZBDf9qZYz/pKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782103558; c=relaxed/simple;
	bh=0Jj8Lw5QDbGYJbu7TLV8H9IhsD++mzcquDl96cRros4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUGFtIERozfc9rHldaWABYSfcqXlTXqFvb1zTEbIQhlET0VB30iwuZAOguHmwwJx92OEP4eW8O+hqhvPRWUd6GSvXl3CegEE5OP/mnM1pZZ6+gl8cI6ZgMJ7LhEpYiaiJcM9t+iyANas/cCevt6RqWZrKZrCw+MClsf1ioh2Uj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=avfD1f7l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="avfD1f7l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABF31F000E9;
	Mon, 22 Jun 2026 04:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782103557;
	bh=tnEp/KcmNc2eeTvFvjVGf6BdIPbHzeyg+qZgDTFXqtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=avfD1f7lWO4E8oXtoN0uYl4g3IpTVEVbHgec1+YBGjXAItDM3kFh3DRQU96JD7fO6
	 SL7Jhtll3qMcFoHCIoI6z511209cegXB/4OZaLXssP5HQqR6Oa1E4j3qNdRlQUiVlv
	 /YqctzJLAT257o2dzZwohvJhA+2P3Eam6degBp8RE/oud+SNHYPE2JR18MNtyIJNTA
	 ir73o2GNFGNVoe/glXy6RaNtPrqL9/IqQpJylnzKwh9+xfDH4Usgj+KYqFwKyT56k0
	 v1+s2DaxpKzcQY7s+KzLEVPO6ZPRlBYXfjwXhogJPZD0gPmY3CUDN7J+JbBruVB2ZT
	 gIQpcSqAjJ5kQ==
Date: Mon, 22 Jun 2026 10:15:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, arnd@arndb.de, lgirdwood@gmail.com,
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, niranjan.hy@ti.com,
	shenghao-ding@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
	zhangyi@everest-semi.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/5] soundwire: Move wait for initialisation helper to
 header
Message-ID: <aji-AfRs_0bbNGvI@vaman>
References: <20260620110237.2684234-1-ckeepax@opensource.cirrus.com>
 <20260620110237.2684234-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260620110237.2684234-2-ckeepax@opensource.cirrus.com>

On 20-06-26, 12:02, Charles Keepax wrote:
> As SoundWire devices tend to enumerate on the bus after probe, drivers
> frequently need to wait for the device to initialise from common driver
> code. The common system is to split drivers into a core module and then
> a module for each communication bus. These two facts tend to cause
> Kconfig issues, the issue tends to be when SOUNDWIRE=m and DRIVER_I2C=y,
> this usually selects DRIVER=y. The driver code then wants to call
> sdw_slave_wait_for_init(), but this results in calling a module function
> from built in code. A depends on SOUNDWIRE | !SOUNDWIRE could be added to
> the end driver but this seems slightly off as it adds a lot of counter
> intuitive depends.
> 
> A simpler solution is to make sdw_slave_wait_for_init() a static inline
> function. As part of doing this add a check for the slave device being
> NULL acknowledging that this is likely called from code that is shared
> between control buses. It does require dropping the call to
> sdw_show_ping_status() but this can be added back in end drivers that
> used it originally.
> 
> Currently this is causing rand config issues on RT5682 and will soon
> also cause similar problems on cs42l43.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
