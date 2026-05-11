Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632D43A4F23;
	Mon, 11 May 2026 16:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516508; cv=none; b=VMKNAolH8L8KXxySkdlq5DXGqK+8pzoqPvw0/8HQGgt77hfMxOOSXXbGBZX0eGHP95TzNK9rsXi6a1Pi9lMOjO05KftXe/kVd0eoAdGOzFCIyNw9/BoOGH5skWhQKz5eqJYKfVi/40EK0lSAnYfZWb8bP6M5vrYqN93cFLYCOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516508; c=relaxed/simple;
	bh=r23m9WLsBRtPtkCtOHBtWu9d8MmLFZBzvvBPwzsyGcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpTOh8NRFyNAng/GQ308cjdjMeMY15atZLt0h9iNWI5go605ZqAAKvDCuBgY6G7ApcVLpLgA7FM9gfli9DFe6+I5e7cK7/OJJTrUQllu3e8iQi8pGmvfBkkWJL/OLnJiMU1MryciFPJQaI1B7E6KaA/QZ+AnlbkJP33SfqmZKK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RP/oMK6q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RP/oMK6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17005C2BCC9;
	Mon, 11 May 2026 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516507;
	bh=r23m9WLsBRtPtkCtOHBtWu9d8MmLFZBzvvBPwzsyGcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RP/oMK6q2wRru882Wpljh/TgGUIgbZvXLTSB09ndEF4Rja0gJra8Ti2Y3RLWfFATP
	 fFlNoVLYJpY/L6AmK4jaWs+Hxl0JBcoaNq5NlgCe0/hDvy9VRepQVSN920YKOkqbU5
	 oqgy/oBO8M/tBCQ6r607Qh6SaGpI8yWNtfBlSdOjLF4AbxKycmeJfPOZ6yDclVXNP1
	 jCQr9aeHZv3/Aj7iLmAfkjw7VOdsHljCm1n/jhkZjeX6zjIQIeIhA4HSm2bI86cjeX
	 qjfdEhNy58BEy4Al4P3+QU9zKnkdq+vYOhW2kfh9o3NntcEdhMXjJlfTS/LsHewzcf
	 tvPGDbdA70tSw==
Date: Mon, 11 May 2026 21:51:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
	oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
	niranjan.hy@ti.com, shenghao-ding@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, sen@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 01/18] soundwire: Add a helper function to wait for
 device initialisation
Message-ID: <agICGFaDZCpu_Nym@vaman>
References: <20260511141029.851125-1-ckeepax@opensource.cirrus.com>
 <20260511141029.851125-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511141029.851125-2-ckeepax@opensource.cirrus.com>

On 11-05-26, 15:10, Charles Keepax wrote:
> Add a new helper function to wait for the device to enumerate
> and be initialised by the SoundWire core. Most of the SoundWire
> drivers have very similar boiler plate code in their runtime
> resume, and that boiler plate tends to access various internals
> of the SoundWire structs which is a mild layering violation.
> 
> Adding a new core helper function greatly eases both of these
> issues.

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
