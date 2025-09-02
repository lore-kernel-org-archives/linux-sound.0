Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E1A25A352
	for <linux-sound@vger.kernel.org>; Tue,  2 Sep 2025 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756848030; cv=none; b=Z7MpQraoRTCNXjkAUVqA9kyH4Zx1VN674sRF0zHM5VUQV+xBmFEtgnHLglWS6kUG5KNliOeqrXqkjsKot9sWzdDIbxQPX6YVjTCAUlWULpe5+o6gdeCJv+wsQYgJgCfIElUMNnPK2FbNHAooUY4pKQly5qZuXp8FiURnAjGnlsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756848030; c=relaxed/simple;
	bh=B3POmnNV2FjOLnxqRNgBYkPzG8MPkiahAeDLdar2dYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khTzJV5MFaRVXABHPeyFVZW2yXDDIgxJjLAobQLZwhXO9/3p4aImG4yOdDLpmDQ39+JXClt6ck4GjvPZNFU92ef9IZT7+3aJsZnglQtNv3TiMS+iUyJZjrIdDznh93pAAB+khwgFmeDVjMPjtdenrvo6714IKDqvdtMHeUW5Z5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCVAcHOk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCVAcHOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E2AC4CEED;
	Tue,  2 Sep 2025 21:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756848029;
	bh=B3POmnNV2FjOLnxqRNgBYkPzG8MPkiahAeDLdar2dYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gCVAcHOkO4ihWW+UST1hmtBj3JM4zrkJdvSjCEUgjMLJt2X37M3rzaQbe4tqM/y8p
	 mV68F/5ghVaZ9ZNwGzBYOd+BisEsvp16YSz0P7NuRFuh5EcO3R+vhehWrvDuPHzIfn
	 Sa6iPY9k+2VmSDK8Nz2b97+aRnmEBCj1r4SMTvSTig1p5LThH7oQY0sWSF4Wqo2qCJ
	 MAmmLob+T/CGx+G6s/V2sCsr+BB0LTpUY2YTUG/6E2JoVp1oisEDgMvNTWTvcUMzEQ
	 LacKwXHhp9fGTKjvT/YyHSGVKfpVpTUrV2ZvzEgZ+C1XTYsxX9WCoN4ThqDJB8/wnA
	 xYr4GPgbXqAIA==
Date: Tue, 2 Sep 2025 14:20:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/17] ASoC: Intel: avs: Adjust platform names
Message-ID: <20250902212025.GA2905120@ax162>
References: <20250902094853.1231842-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902094853.1231842-1-cezary.rojewski@intel.com>

On Tue, Sep 02, 2025 at 11:48:36AM +0200, Cezary Rojewski wrote:
...
> - for the probe-board mach-context is dropped entirely. The panic [2] is
>   gone
> 
> [2]: https://lore.kernel.org/linux-sound/20250829225532.GA400117@ax162/

Can confirm, I applied this on top of next-20250902 and there was no
crash on boot.

Cheers,
Nathan
