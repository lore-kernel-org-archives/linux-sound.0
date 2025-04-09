Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C1925523F
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200729; cv=none; b=np4rTKmV75Zpx65oGK/jHPzYSDm7mESP+JvOjVAp3KMYcz8i1STuW4UEkSDDbzKtu3601CQMsSRlYWr6lYLzo1a/AubuVKPIbr3mhx0C4Gj5KP7IVwJ45NjxIwncLKBT5jav8b/qxjGy1sIuwjj4+vJk+19ReGcJvDVHqwiyM/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200729; c=relaxed/simple;
	bh=CDvsWfDKXbZSmdDsIgsn35rOsV1Zz3q5eKz6raf9BLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IqBL5uKSC5ypbuoHQp/1CP8H9UTk1iqRPqMKZe3xUPzfIV0dyeiT1oxrq/Eo19iYNLWHmw7GM3u3a2DNjBYnmC86IF2eKGFKI8u1DqKVWT1956XuBCG94w04V+SPDKvDhopyid3rHwIv206XkvUZwxJ2RJ8HTePaKAtcRr7o8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t4Rw8ydI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t4Rw8ydI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF1B5C4CEE7;
	Wed,  9 Apr 2025 12:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744200728;
	bh=CDvsWfDKXbZSmdDsIgsn35rOsV1Zz3q5eKz6raf9BLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t4Rw8ydIGFLkC6+aB1/7SOjjz72NLq2xQBwK0EYR3rtXfAvB5vnwIxSW4U/A9C7O4
	 Ts6Pgts7BZdrBTXN50VDJi2459nFDX2mObY/oCtBJv+TjBcaOxQmdQgJrSs0PTvIo1
	 PoLSoW3LObWQ8DhU8JskZwwWndf2zYMF8rySA5g0=
Date: Wed, 9 Apr 2025 14:10:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com, linux-sound@vger.kernel.org,
	quic_wcheng@quicinc.com, mathias.nyman@linux.intel.com
Subject: Re: [RFC 00/15] ALSA/ASoC: USB Audio Offload
Message-ID: <2025040930-catalyst-calcium-a707@gregkh>
References: <20250409110731.3752332-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409110731.3752332-1-cezary.rojewski@intel.com>

On Wed, Apr 09, 2025 at 01:07:15PM +0200, Cezary Rojewski wrote:
> Note: this series is based on Mark's broonie/for-next. The xHCI
> dependency is missing so it won't compile.  Goal of this RFC is
> discussing the direction of sound/usb changes.
> 
> Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
> fare well with Intel's hardware design for USB Audio Offload feature.
> The production shape for usb/xHCI subjects is being discussed with
> Mathias.  Once we're ready, I'll share the rest.

How is that going to work with the patches that add xhci offload that
have already been reviewed on the list?

> Note #3: this series does _NOT_ aim to block QCOM's equivalent series
> [2].  The team does acknowledge that we came the "table" late.  At the
> same time, we're prepared to help QCOM switch to the presented sound/usb
> approach if that would benefit the framework and its users as a whole.
> Make it part of this very series if need be.

I don't understand, I'm just about to take the QCOM patches now.  They
have been on the list and reviewed for years now, why hasn't this work
happened before now?  Please work to make your changes on top of that
patch series.

So what do you expect me to do here?

confused,

greg k-h
