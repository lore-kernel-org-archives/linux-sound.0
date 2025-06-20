Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95F2040BF
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 06:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402291; cv=none; b=YNtH/03p6q7KZ1Y9wgCeOj8gw8AI9jY8qM25nHGU6N6Nu3PwqyDHW5NeFUjawzHeeK77sXWIUsXjMOenGOIh9+zYikW9yL620ko6/nmXw18tcbrSxq9HTytArFs0KxWQW4ipXIPuQj7ktkXQ26/8boDUGpJRyYm/NbLTN4bUsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402291; c=relaxed/simple;
	bh=6U9JHDueiSiwD9dmFLZlkqH4jnW8IW7FZUQzTk4PucE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=itrOSF4qkI0vPFBqvmWusLnh6hZB1v8EwzAVKRV2fq2QPj7z1K8LSf2Yrq3W80VXiG6WvXu/k2aTctGMOHXUwsWn6oBUO24Y5/fZfkGqGti8/nFDmZ8esUIn29v4ss+oGhtZ8JeqiX6RBDUyMWiGNmesFqSSBhc8civxmQNoKMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOj9OUTO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOj9OUTO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF9EC4CEED;
	Fri, 20 Jun 2025 06:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750402291;
	bh=6U9JHDueiSiwD9dmFLZlkqH4jnW8IW7FZUQzTk4PucE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mOj9OUTOMVsQfFu1qfeJGVASBcMUhFLY8TeRvxDKMPJFrGZb0rn0QlMlmW4yUCgua
	 QJKUL7ZpGt2tTF74dZ40M7NJ9RELznXA6ebRQTOBXtn144UqAeytcrjFkaa5Ds6fAE
	 yocW8q+HyKN+AScKU+/atcVlhD3nGwrEjrr6bDeV47qavjMiJN0dH3lnX4YGlvWdyH
	 zZFFtZiLPlY/AmYtmDbr5irKBfsveTajG3PweGHuvjo/Tb3K+X0Z4qcFKO2+nMMWAV
	 mk8EXvzAkXtnnUwTpgw8y4kbWhPB+DPcvIxORKuwxNumqwkJzwj3On50Fg9AopuNgb
	 zGBw8UtVWAkbQ==
Date: Fri, 20 Jun 2025 08:51:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mark Brown <broonie@kernel.org>
cc: shumingf@realtek.com, lgirdwood@gmail.com, bentiss@kernel.org, 
    linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
    oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com, 
    ckeepax@opensource.cirrus.com, bard.liao@intel.com
Subject: Re: [PATCH v2 2/3] HID: core: Add bus define for SoundWire bus
In-Reply-To: <48b1cade-6ff0-48fd-93c0-04e7a717ffc3@sirena.org.uk>
Message-ID: <2pr29o9o-r220-9rr3-5686-oqqq9srr6sp5@xreary.bet>
References: <20250616114907.855452-1-shumingf@realtek.com> <48b1cade-6ff0-48fd-93c0-04e7a717ffc3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Jun 2025, Mark Brown wrote:

> > From: Charles Keepax <ckeepax@opensource.cirrus.com>
> > 
> > SDCA (SoundWire Device Class for Audio) uses HID to convey
> > input events from peripheral devices. Add a bus define for the
> > SoundWire bus to prepare support for this.
> 
> This seems mostly an ASoC series, is it OK to take this via ASoC?

That's fine with me, feel free to add

	Acked-by: Jiri Kosina <jkosina@suse.com>

for the HID bits. Thanks,

-- 
Jiri Kosina
SUSE Labs

