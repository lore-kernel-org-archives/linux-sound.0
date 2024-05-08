Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F6ABA27
	for <linux-sound@vger.kernel.org>; Wed,  8 May 2024 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715162359; cv=none; b=ADBdeM+d+7u1yXOQ02v4i3dlI2dkHnZ80HvcSdn1KQsE2PTuOd0pZCjyowbnH56AGGW8F2ZE2HBV/kHEv12P5jupAUuzT4MSzAR87W2CDLq9Ar+y5auZw2YkGCQDWjfOZm9polq98IRMiDhTTvnWnq+L4QuS5nPLn35VeZAweJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715162359; c=relaxed/simple;
	bh=OPAVBXbgJLVckgSSxKVtg3HQwXyIPaK5XYjD+Y9k0KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYkCh3QebfjJcwQwMAK7poSlD9wg1xUTevgkNbyVKqpAhcaGlSdUbs1l6ywetgT7GefDktPeC8Ap2aaKOKl+rPXOyfIWjdck4VBcnTk1kNne9hExOV6itJBVzaDQvsap32O4Fl5rV1Khwo2iTd7Ibr3ZtoJYSXFFz7fiynCRry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=E80690qM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GDraaw9R; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="E80690qM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GDraaw9R"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 94D8C11402AE;
	Wed,  8 May 2024 05:59:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 08 May 2024 05:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1715162356; x=
	1715248756; bh=Uq9D6T9cN1YrnEEOgIrmAWA3DEtkUz/N4GnLLqfeCfE=; b=E
	80690qMDAxL/immv5TYUV1ze73rXotleXQy7VnogZ5AIMDX7D42zZ07omOsWmblb
	dPIMgfFrmR9g7C5LCnVf3HMzs5IHfo+XN7/dZOG/kCs1Jg7RMD5fjps3xyqIToaj
	cKVMpKPPOCt0pLzKt1iOZbPmVVXR1P7E5clkqx9Xt/yz2ym9bMdVEvsVCtIop0Dd
	NTu0vQvuRxbQG2iXK4lPsEP9XrdfkENnhSdeEbfbA/HWaNhGf0WWYHREB+KKO1F5
	3BErxpj58Dd8Rdh3GRGnH/u7nkO5RJX7Vq3MZxSH1fx7Szbkngo1Vw5wNvDf0Cla
	CCf+o7cnECwLnrD60CmWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715162356; x=1715248756; bh=Uq9D6T9cN1YrnEEOgIrmAWA3DEtk
	Uz/N4GnLLqfeCfE=; b=GDraaw9RAsdezuFc8qczcCyJnxOUU5nm3RpZ3iG4mAmq
	eqfcuKP8T95Yr24q6IftDHjKhpCe+Gssnv5an+ky040WZ42q1eCZb9wc5GArXCCv
	1q0icbDBxg+tDPDXKS/9m88vAAT1vmum2BImLQPUyqRsnGzSdJhtQXs7du0hz7li
	j58gZv4A5L6OO7Ou8gL1TQkaTHx4j6jjzsXJH6C7yTHPkONdeZeuaU4ItsNlM0VN
	ZSDYT4WzsLvUaPm38tE0QaW6/FSONJCjhVVZbA5cyom+NKNJeBkcVhZwzr8C3IgW
	sfG0XnDr7mQkfhZ+JP2Y2hdeiqJVtWDtY8mYz6Ka1g==
X-ME-Sender: <xms:9Ew7ZsC-Nxg_dshvZMJoRCeVzI75yu8m3ny153_jKkadyWl4QPXGGQ>
    <xme:9Ew7ZujTEgYvLnCDUGBiH1XdEBd51d8qKToN7U_agH44-6OTpGEn3cZ5Laq8J2OYK
    jakFMfgeoaZbrfrWF8>
X-ME-Received: <xmr:9Ew7ZvkBpwEqEd16TrJETxB9kJfaZipI22ByRD9DZ_kSuRXkBaFfbngfh5-DAA91Hb9351CarUzr4HdGWwSQxF34LBaQSon98U4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeftddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:9Ew7Ziz5UMRefuz7XpZFj0v5dMH0AMFKshavBNwoq0KER-Wgk3w0_Q>
    <xmx:9Ew7ZhRkK2-uX0SzQNa19e3yoskRbggDFLXA75dors-_09hB0NUNCA>
    <xmx:9Ew7ZtYwumz3TH7FaTutKSu-bfk3mTBSo9ZzTcc3-vHlMS1SANXuEQ>
    <xmx:9Ew7ZqSgDJ-DJOMnxFpSRqMNIqG5yOdiT6d3Q-bLIAvkWEnsLiR7_g>
    <xmx:9Ew7Zjeb64aC97JVRqH9wdJ6PhW4mE3HaYX4BkiQT2lKzZwOPSKkk69A>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 May 2024 05:59:14 -0400 (EDT)
Date: Wed, 8 May 2024 18:59:13 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 7/9] ALSA: firewire: Use *-y instead of *-objs in Makefile
Message-ID: <20240508095913.GA436898@workstation.local>
References: <20240507135513.14919-1-tiwai@suse.de>
 <20240507135513.14919-8-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507135513.14919-8-tiwai@suse.de>

Hi,

On Tue, May 07, 2024 at 03:55:07PM +0200, Takashi Iwai wrote:
> *-objs suffix is reserved rather for (user-space) host programs while
> usually *-y suffix is used for kernel drivers (although *-objs works
> for that purpose for now).
> 
> Let's correct the old usages of *-objs in Makefiles.
> 
> Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/firewire/Makefile           | 4 ++--
>  sound/firewire/bebob/Makefile     | 2 +-
>  sound/firewire/dice/Makefile      | 2 +-
>  sound/firewire/digi00x/Makefile   | 2 +-
>  sound/firewire/fireface/Makefile  | 2 +-
>  sound/firewire/fireworks/Makefile | 2 +-
>  sound/firewire/motu/Makefile      | 2 +-
>  sound/firewire/oxfw/Makefile      | 2 +-
>  sound/firewire/tascam/Makefile    | 2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)

Good catch.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Thanks

Takashi Sakamoto
