Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2693E1A5B9D
	for <linux-sound@vger.kernel.org>; Mon, 13 Oct 2025 05:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334211; cv=none; b=ab9M5Lrq0fvcAiRBZaqDnIXZLeQ7cssk7p6gBYtdyE0MMhf2jicuUSYJjdftpePRm+0PyUINelTFBMMmFcLZCmmPNDw85XxXUpeQy33oduo9pzDCEhAUA1C5yKZANd/nKHL0idMzA0YHVzXjD/Y3VI4y5aQUS5qufKPh8lwNsjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334211; c=relaxed/simple;
	bh=TochiNYgpWVkOpKaIAINIAk0t+o+6orjhlKPe2qGV8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCh2YhWTirsXXNeYZJkbsMrp2bSlnKs8C0vJyZ7whTyaW4Vew1XTTyVZpzciuNbPGb530gzMqC6nXcEQGIGVgI0CQXLCpVJV7BIbso44Lfu7KLBy5O0H9M0J3/lWHVpPgQlPZPk6d6Cc9C/UHIcuNtFTtzVeFWeXC495AEJMvD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkDZ660X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkDZ660X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2ABBC116B1;
	Mon, 13 Oct 2025 05:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760334210;
	bh=TochiNYgpWVkOpKaIAINIAk0t+o+6orjhlKPe2qGV8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkDZ660XfufDdBmK6ogJi0edCJ4pgXD33sKWu27x1SoMqUS21K/u5o2p32gViSOAB
	 lw0RAyuJ8za7bibjx/s9UOirO5juyHwxO3U6zOJ2A//LYxuI2PvRlkhdvy5s8ZTitD
	 YLicWfL3AznxKHiNbiYjJh4kmVTRAPxUHESW09+zEiDGnFcXmkzHJ0vFFVOl0aVO9X
	 ChdrjsyOilnzNCvzALTzLoehHvLmM3gsHE+JXrbtXGfGZ0/D2FZ5+gyMawfDgo4r+4
	 V7avztUuFVw2p0xfZ7vw2ZQ8YGeUreAKajAdZN641zyTkX6ECFc6JI2kreAuwf9UKc
	 YTw7GyDFrGeew==
Date: Mon, 13 Oct 2025 11:13:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
	shumingf@realtek.com, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/4] ASoC: SDCA: Add helper to write initialization writes
Message-ID: <aOyRfoOGy28h7fld@vaman>
References: <20250925133306.502514-1-ckeepax@opensource.cirrus.com>
 <20250925133306.502514-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925133306.502514-2-ckeepax@opensource.cirrus.com>

On 25-09-25, 14:33, Charles Keepax wrote:
> Add a helper function to write out the SDCA blind initialization writes.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
