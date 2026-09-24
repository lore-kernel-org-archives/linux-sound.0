Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC284252AB;
	Thu, 24 Sep 2026 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232911; cv=none; b=laVPiOCEDRU7idkXwyxdAzJ+v4xHutYqcezQ6QkFK+gCF91cUPmtHS7mrP2nKTbqVfz61bjYpkT1LsRMO807ifP0R6wcy72SkaAB+a1dG0G2HcpO8lEEHFiOtpMCxjToq2Iej9P03qCi0C6Sdak8uBTYFuFwKk9/KSq1vt/NzKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232911; c=relaxed/simple;
	bh=PmTx3nVvmRzO6q8oBv16K1gVDmX4dfcy1BwWrGLwYv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyIMAQ7lovIZ0h2ZwvdU8ym4xzmAyfKTvv91fi0HZJ38uYJ8eT23m4VsWbjSqHQIet7v+30Ro4QCM0nKNeHfLgvLme9hg37ZaYgB+RPvsOgn5qFbqkHxIrwAn/YizfBHd2NzS1kAmZwXyVZyTmq5wyAF1H5yw8GE59wLT6rMFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdENoEyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdENoEyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30EE51F00893;
	Thu, 24 Sep 2026 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790232894;
	bh=lCtdSBzZeYW3VMpSyC5oblNd6RICO241sZJgNzC3eWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EdENoEyNr14OaiwJbS/9Rn5cJ729SQ0montonmsY5MmVj8Uu/ShkgjLgNaAWzCmZN
	 772IiCk2dx4gIozywhBx5lyl6qSrha3tFu6EzEe6RcOrFJOp7fDcsdpaf4gErJi8W9
	 xWdnjUmOQ8OM+vtUpUA74hz82OxU2qlSr0MTmYDaxK/xcbmgj3tN/EH9BDsM5LpV3U
	 bRhlprO2nB4RjOcOYlZpxbEsC7T2puTvCUQn/F++cS0OLS+QXa9NC1hbp+nYwf37Oy
	 oTrFE23jtaq3AEsLf/9cZDuNAjLB1rPwmc6Q5Jihzg+buLRXqR/sPn15dSzt4lJR/U
	 XAf/VBgaNHyPw==
Date: Thu, 24 Sep 2026 07:54:49 +0100
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v2 6/9] ARM: dts: ux500: Add sound DAI provider cells
Message-ID: <20260924065449.GN3864833@google.com>
References: <20260918-ux500-simple-sound-v2-0-88d29416e3c3@kernel.org>
 <20260918-ux500-simple-sound-v2-6-88d29416e3c3@kernel.org>
 <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=yLFiYcWsRF6eR4a8o=27wcmj4nxa8jirDaOfR3JBHkw@mail.gmail.com>

On Wed, 23 Sep 2026, Linus Walleij wrote:

> On Fri, Sep 18, 2026 at 12:51 AM Linus Walleij <linusw@kernel.org> wrote:
> 
> > Describe each MSP as a single-DAI provider and the AB8500 codec as a
> > two-DAI provider. This lets audio graph endpoints resolve the MSP DAI
> > and select the codec playback or capture interface by port number.
> >
> > Assisted-by: LLM
> > Signed-off-by: Linus Walleij <linusw@kernel.org>
> 
> Assuming Lee will apply the ACKed binding patch so I applied this and
> the rest of the DTS patches to the ux500 DTS branch for v7.4.

Right, but it's not Acked yet, is it?  Or did I miss something?

-- 
Lee Jones
