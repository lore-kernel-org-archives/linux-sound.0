Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351B92F3E;
	Mon, 23 Dec 2024 06:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734934434; cv=none; b=awmNi/ti/Cxhe/hg/BIYx1vkVnRYFSMXCcdqBYg0jXdv95IYTfzm4GIPe+OnAdCHQ638sQXcwellCj9D6pEYuaezQYiPQhJYu6zsmWKT265u+u3oyRK8ChSavUwEToo/MV0SBIh1jhG+cPbv3nqgRLIwf+L1B2HwmG2uYowkIdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734934434; c=relaxed/simple;
	bh=VctB/W+7HaFVArKwpe6QA/EJUqrKxH6yzGEaDyTwf48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGbnTDGl2xnx8Z7IF6os1YdBjLwxSF6Q4ZMu3BW9zsK+bmVPgxatL2+wxUYS7p7EbqVNdCsbcrSgeB+fb0Yy71xVfalusfIpV9FEqd933G9VyeBq3EPw+fQ94WdwLyanseDFUBBTrV6RUaaw/KoetjMJKrgsE0eyYl9ZfJsuF0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjQMUoGz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjQMUoGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E436C4CED4;
	Mon, 23 Dec 2024 06:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734934433;
	bh=VctB/W+7HaFVArKwpe6QA/EJUqrKxH6yzGEaDyTwf48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjQMUoGzfZ9HBSj7iLQg/wtv4EKISj2/mp1zb3F1gFPk1JZbT3ys4bPJAwvnJRFnY
	 uq88/G4L75kP72i8AR4RxHAdV3VlSm2UkpcyzSRGRTNB9i69LyHqz5tk1FrNIxhBfj
	 Szq0o1z4Vc5i0mnOXJ+wq/r+yyWxgSYnIbtrGCahPZ0sXPaRfd1X+5o/XLYgMlHvlg
	 Qy4Tk7Ei7W4EcL5GsQSTKdFL1jOn4LEZEsXP8R3AqJ4FE6W99EZpAdL+QlHlbHGdB1
	 c168frvaVzCVxa98nunFuPasOWov+E2YiNDA+RtVgBDiM3ICo/BJ0NPCgu7W7ZJU2y
	 gO8IanZU9HBAQ==
Date: Mon, 23 Dec 2024 11:43:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, oder_chiou@realtek.com, jack.yu@realtek.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
	sanyog.r.kale@intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/5] soundwire: SDCA: Add additional SDCA address macros
Message-ID: <Z2j/nQmZsU+3yqXc@vaman>
References: <20241217135921.3572496-1-ckeepax@opensource.cirrus.com>
 <20241217135921.3572496-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217135921.3572496-2-ckeepax@opensource.cirrus.com>

On 17-12-24, 13:59, Charles Keepax wrote:
> Compliment the existing macro to construct an SDCA control address
> with macros to extract the constituent parts, and validation of such
> an address. Also update the masks for the original macro to use
> GENMASK to make mental comparisons with the included comment on the
> address format easier.

I guess this could go thru asoc/regmap trees so

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
