Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55978311C35;
	Thu,  7 May 2026 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778139014; cv=none; b=EFQtqwC9i6jHiMPf61Qmd5J6hpXOc3ieiDEt1GigT5j/Y8o2/2+OuiCFpTlCP/F1L9fdE2m5Ko412qdLrcz5+Z3US4CCca6VjN3OGwXmqQp1erl2Ak8LFDlZbZWqsrvDnIIYFXt9o0m2O5iRWQpb4lnKeE6bU+Cd+yUmlgCBwd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778139014; c=relaxed/simple;
	bh=ef+FgAkilPCbc/VfW9S1n2E/ykFCOoK1nO2629q4Q3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n7HTq4VWZ6KisIVsluU+/GIa2DmoQ+EIBzzEIb30MtOYMaSHkP6saQj6RHZKTVvK4DF+tsXo5o4Ut7Houdout6aC++kMyJh3Y8UE+jaPVZyOKQ84+Ue+9XR+wrndsupZtUBMFFhESmgR0+D8H4f6Ulw4isYtOtMpfau1e8Qsh/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DoYL47Xf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DoYL47Xf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E297C2BCB8;
	Thu,  7 May 2026 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778139013;
	bh=ef+FgAkilPCbc/VfW9S1n2E/ykFCOoK1nO2629q4Q3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DoYL47Xf7B5DEmeMcPqr1GFYXx+hQwfm+LV2DQBaDZEuO+wuvN3rinFuMPthR+9Ef
	 3JTtwuh7XEqzjG5rf6QVpnPch2nRRnbkscl3JFVUnEZBIUA2abIDz/044D+cDGZSUC
	 XWw4MfuuILa3uPYGhOnBTmlZZUQJHXQ97xagrdik7e+cCD6QGHjGZognIOjjSp4rBR
	 yEmhLF916IzvEFku1AyMokwmvislAXpVNxzkLm3uXWyiqXghK+8eZeOkPGKr5iQIuj
	 yrCCNTEV+ZkEVJHy9F+btdeBObjcLq779P9nPnHHSQ8DUvr8rKRRzOVx+bcyv0EHw3
	 KoBp59cAdrorQ==
Date: Thu, 7 May 2026 13:00:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com, oder_chiou@realtek.com,
	jack.yu@realtek.com, shumingf@realtek.com, shenghao-ding@ti.com,
	niranjan.hy@ti.com, kevin-lu@ti.com, baojun.xu@ti.com, sen@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 01/17] soundwire: Add a helper function to wait for
 device initialisation
Message-ID: <afw_gkXbl3Wvp2xk@vaman>
References: <20260505164807.4108684-1-ckeepax@opensource.cirrus.com>
 <20260505164807.4108684-2-ckeepax@opensource.cirrus.com>
 <afohYUQLPLjRXjd4@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afohYUQLPLjRXjd4@opensource.cirrus.com>

On 05-05-26, 17:57, Charles Keepax wrote:
> On Tue, May 05, 2026 at 05:47:51PM +0100, Charles Keepax wrote:
> > Add a new helper function to wait for the device to enumerate
> > and be initialised by the SoundWire core. Most of the SoundWire
> > drivers have very similar boiler plate code in their runtime
> > resume, and that boiler plate tends to access various internals
> > of the SoundWire structs which is a mild layering violation.
> > 
> > Adding a new core helper function greatly eases both of these
> > issues.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> 
> Sorry Vinod, it appears I somehow completely forgot to CC you on
> this series. Let me know if you got it through the mailing list,
> and if not I will do a resend.

Thanks, I was able to get the series. lgtm with only change required to
add stub as you already noted

-- 
~Vinod
