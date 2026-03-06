Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEACB23EA89;
	Fri,  6 Mar 2026 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805510; cv=none; b=ce/l4K4nlqnBCgfRgd2AL51mCtfCaLdO0Ic3OEWAxMGOyXYx/wTWisqNlRzKLejFbI0wYfcL3QxgIYSvaKRrBhw0fB2zrYZoq35a/XDqU3i1PEFrlK7X4uUW+C5MOXsB4KAHm0DH/4aOBnAXn/DhGzzVXY9MAd5x5daIwgsjVAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805510; c=relaxed/simple;
	bh=k7TNUTyJ8Qy2hb3cE4GSCYUsttb3iIMTE1H5MBhb+oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXDRX+zgqb/w6zAPsOt+YnHjPN0uU7NTZFiCHv54Y0MgwBmRk5CMPu0uK54rsAoCWeJEZ04bZmti61c0jkOprBtKtoY+bgLwYfaiLVTtct+IgHEm4E+rTGG/NMJs0LgOkAX5oIMofDFSq27kmCaUvMKwFBE9Yc3kP36ISDDaI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hKAaqO+K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hKAaqO+K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038C6C4CEF7;
	Fri,  6 Mar 2026 13:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772805510;
	bh=k7TNUTyJ8Qy2hb3cE4GSCYUsttb3iIMTE1H5MBhb+oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hKAaqO+KEBRXrmvyN+l5BaK59A9ldzQ7Iql59jPvOUzryvGwTZgljcfDABCb0nYlz
	 zQy2vQS/sNFD5qHgACeF1cbjtERdopd3sGbQFT0kw57KnU0Gsi8YA9CnFd7wQA2/Rp
	 HSgoT4qRa7M5zQcm+AHHluJARqmuYdhCEn5qGl3hQsYXPkrE857sgscciGMmrQ+poc
	 Cnh9KuKeiTdWIKMJefFGHENR0SrEPECQR+yjM8jlf1O2AJgFjXJAcNE2TImRy07Cli
	 C9NqRhtex3vMbp+EBzkNg4LhvTgeNdFgbSrIwzsnVT0YFHPchOAjHHbh7LLCvVrfDo
	 wqd1+GsZC1djQ==
Date: Fri, 6 Mar 2026 13:58:25 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 RESEND 3/4] mfd: cs42l43: Add support for the B variant
Message-ID: <20260306135825.GO183676@google.com>
References: <20260227130120.3070893-1-mstrozek@opensource.cirrus.com>
 <20260227130120.3070893-4-mstrozek@opensource.cirrus.com>
 <a141da68-35a7-491e-bb6f-ca9b448030ff@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a141da68-35a7-491e-bb6f-ca9b448030ff@sirena.org.uk>

On Mon, 02 Mar 2026, Mark Brown wrote:

> On Fri, Feb 27, 2026 at 01:01:00PM +0000, Maciej Strozek wrote:
> > Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
> > the same driver.
> 
> Lee, this seems like it's mostly an ASoC series - does it make sense for
> me to apply this along with everything else and send a tag (assuming
> it's OK of course, I just scanned this patch very quickly rather than
> reviewing it)?

Yes, that's fine.

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
