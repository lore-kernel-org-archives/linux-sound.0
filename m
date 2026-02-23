Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F705695
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 23:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771891121; cv=none; b=r0LIgS8+29VTGJk87ntX0NT8lVucptTcW3D2137eBGm5I+61WDH2tm0VxNyAz7MUoYgav0O/TXfPUeYe0uJnZ/UUh2U64KVeHnj6jGUZhdtaA7TvOd4W3rNauYgdtkAtytaz724W7PKlQHOux9W3F1ETZvsoNpJZk5NgutrxraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771891121; c=relaxed/simple;
	bh=OBb3x/truGDCCFIPZeH0rrEVFuYOxFOq7Vz5fDajFOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxEAPmzttPnNeZ/GAE1sx9mFTYayVHlIovq0slswaCDHFLMR8EZ0NYolxV1TeSEVdccyu9tAJkSuP0eKW+/FvEvwbVsaLl93g62etAqp3K7TEkO25HJd+8fvkc9Iljsn6kO9hSAIx1bQDV3v3+Qk+wUo8irNrCdrs/dNSGsEbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=socllw+7; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="socllw+7"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 16A47674077C; Tue, 24 Feb 2026 10:28:31 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 16A47674077C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1771891111; bh=96jLiM6fbHrstpfR/wo0kpZY9B+wMufjfPoGi6qLkfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=socllw+7HnNfjSyThlWbTFkQrvS2ps18cRCFFF74zCmuH4TuTflHpN4bVAa1Db4ak
	 k0DA4nnIZ8bfrlyBG6H740wxf9tGvTsrwYedgmplhYTZItN0vJHzbaIx7CfpKfddbd
	 2qEpARG4wyGU+z9I1uYYHkORvL7EZqehPmprPoYUulRUTuzpDASY9Kx/MMThHrSvsP
	 G9k5wpx6IPjEoW/08kk1buv58sYhoHqeocVTiMCdwJS1miCSZmdjgm5N14YT0nkWdP
	 IG8i27OEx9Xazk1AlNFiIsrb3n7r7p77Hgj/NNZ+JIAsayEEO+5zBy2ow7CZBQxT0w
	 uYEM22tXkSPRg==
Date: Tue, 24 Feb 2026 10:28:31 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
	Alexander Tsoy <alexander@tsoy.me>, Tina Wuest <tina@wuest.me>
Subject: Re: [PATCH 0/4] ALSA: usb-audio: Fix Focusrite probe-time side
 effects
Message-ID: <aZzpp6XeFsiwIA6/@m.b4.vu>
References: <cover.1771594828.git.g@b4.vu>
 <87zf4zlttl.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf4zlttl.wl-tiwai@suse.de>

On Mon, Feb 23, 2026 at 09:58:46AM +0100, Takashi Iwai wrote:
> On Fri, 20 Feb 2026 17:03:11 +0100,
> Geoffrey D. Bennett wrote:
[...]
> > Geoffrey D. Bennett (4):
> >   ALSA: usb-audio: Improve Focusrite sample rate filtering
> >   ALSA: usb-audio: Remove VALIDATE_RATES quirk for Focusrite devices
> >   ALSA: usb-audio: Add QUIRK_FLAG_SKIP_IFACE_SETUP
> >   ALSA: usb-audio: Skip clock selector for Focusrite devices
> 
> Although it's a bit risky to take, the result looks still worth for
> 7.0 inclusion, and the code changes look mostly only for Forcusrite
> devices, so I decided to apply those to for-linus branch now.

Thanks Takashi.

I've packaged it up for easy building out-of-tree for anyone who wants
to help test it but isn't familiar with building kernels:
https://github.com/geoffreybennett/linux-fcp/releases/tag/v6.18-f15
