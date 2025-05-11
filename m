Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F80378F39
	for <linux-sound@vger.kernel.org>; Sun, 11 May 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746973505; cv=none; b=lYkr7DA5cm/6N+X0a6v8Cs9GzGA91y6ImSq5vKK4yf+oFaHbinpeHLVvw3sv5yU4G9A5fBqZCmZ99iTuwWw+LeCLkYzKqYJMr2CTPfsKpNFzLi/UR2Ib3TsGGiUrbujEPFjt36Ju4V/okfhC7aEZewUPY9vRkf8YTOtktHXgMEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746973505; c=relaxed/simple;
	bh=3LNeqj7yizrQD87IGHqzAUO5DbwNFOcFqfk2dXj6qL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pME0sOKi4iwwkArVkH6mbi1EVi/Y87QQXG26nKx8PSHEN3/C/YEXdyVcH0kUNr7iDcyda1OtKyIKaVi/MwJJoaGOdVfY8ErVyMcHp+kxKIm+04L/jXrWh9tFyS6UqWZ6jbXdbjNuGufM03R8n6UE9ErRwg4erHTNmqvseojjy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IBzKRkzm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IBzKRkzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DBBBC4CEED;
	Sun, 11 May 2025 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746973504;
	bh=3LNeqj7yizrQD87IGHqzAUO5DbwNFOcFqfk2dXj6qL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBzKRkzmL4+/eefxFoY2zK9e3Mi6YWjiXLS/e24qOPIo6ksa6u5gCVxM5JU2JFu8j
	 MLqXs26tTKI42J0o2SW2NkWvTatg2pM9rj2zUfoAwvUQxPZdh2Yj9HxtW/9oon/AoP
	 ZI78CLLI3YzLRIqgzKw0UkFfO5MPXKaPqmZ9hNt8=
Date: Sun, 11 May 2025 16:23:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: ump: Fix a typo of snd_ump_stream_msg_device_info
Message-ID: <2025051107-hypocrite-john-2f1b@gregkh>
References: <20250511141147.10246-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511141147.10246-1-tiwai@suse.de>

On Sun, May 11, 2025 at 04:11:45PM +0200, Takashi Iwai wrote:
> s/devince/device/
> 
> It's used only internally, so no any behavior changes.
> 
> Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> Greg, I'll take this via sound git tree if you don't mind.

Please do!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
