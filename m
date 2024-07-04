Received: from disco.pogo.org.uk (disco.pogo.org.uk [93.93.128.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0C9224D7
	for <linux-sound@vger.kernel.org>; Thu,  4 Jul 2024 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.93.128.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720084718; cv=none; b=hdcZDRgC3PC1T9O+NI0glV/+ljjNs8I+z4x0uSIxMaIsk6Nn8bvjEBF8kdPqNHAd0qJ7d+RXQDGpLyNXsc9sQrMnV4KdRm73Wqq1arKMMimcSQIazojOuPbIsnafZsfH0zmecCkX2K7Ntmm6gYqLp+eTiLzQ7fuctX2OSwAJmxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720084718; c=relaxed/simple;
	bh=WbXzrLYbelpWYb+vWRColZJQkfGtkoJg8hCor2oynf8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=flVmcOZNsDa5MmoTWjgcSJxXdijd3szcu1vwy/ScLELSpby3+4LkvmRO8h8Afo+t4NdJ2HWc/LoHdP8s1ePETddM1w5/fwHgiHez2/BhQNUbXZbbsn/ZDYO5GgpiU2ISwc3Rjz7btq1IMMPT8Y6P56ujkN98xYfKHHt7PdH/JCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xwax.org; spf=pass smtp.mailfrom=xwax.org; dkim=pass (1024-bit key) header.d=xwax.org header.i=@xwax.org header.b=HYF35//5; arc=none smtp.client-ip=93.93.128.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xwax.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xwax.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xwax.org header.i=@xwax.org header.b="HYF35//5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xwax.org;
	s=swing; h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=Mg5N1u3NQwC0syyKbSSGXV2bOG4ZP1SInZ/6+jwqoRE=; b=HYF35
	//55ipLifYlR5Cr36CmvuBr6m7/FGtH91JJ0Carn1SD9pDdd8ZiVjE/mhKiXehddjTMkN/ol7Z1ZG
	ADvidtbirlngCNUJaGnOdypeWsxqfaJ8qbSXUpFRWPhQLZTVVE3hc8tzibF0ftLbk0+9P9Tam3EH8
	o4MWgWbF3RXU=;
Received: from cpc93786-hari17-2-0-cust786.20-2.cable.virginm.net ([82.36.99.19] helo=tamla)
	by disco.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.97.1 (FreeBSD))
	(envelope-from <mark@xwax.org>)
	id 1sPIFo-000000007H5-3d36;
	Thu, 04 Jul 2024 09:55:48 +0100
Received: from localhost (tamla.localdomain [local])
	by tamla.localdomain (OpenSMTPD) with ESMTPA id 715619dd;
	Thu, 4 Jul 2024 09:55:33 +0100 (BST)
Date: Thu, 4 Jul 2024 09:55:33 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Asahi Lina <lina@asahilina.net>
cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
    Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Subject: Re: Handling complex matrix mixers in ALSA
In-Reply-To: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Message-ID: <5e0a07da-c5d2-1209-0f26-d164f25a31f1@xwax.org>
References: <48beda37-1795-4d48-987d-1e2582cb3a18@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

On Mon, 1 Jul 2024, Asahi Lina wrote:

[...]
> The problem is that the device has a 66x34 matrix mixer, with up to 2048
> cross points enabled at once. Exposing each cross point as an ALSA mixer
> control (similar to how mixer_scarlett2.c does it) would mean 2244
> controls just for the mixer... which seems like a bit too much.
> 
> On top of that there is also VU meter feedback for all the
> inputs/outputs, as well as general fader controls for each output and
> global output configs and status. I'm not sure about the VU meters, but
> everything else sounds like it would map fine to normal mixer controls.
> 
> Is there some recommended way to expose this kind of matrix mixer
> interface to userspace?

I don't know if it's recommended practice, but the echo3g driver may be a 
prior art as it has a working matrix mixer for the Layla, and the 
corresponding echomixer in alsa-tools.

> I think for something like this you pretty much have to rely on 
> device-specific tools to make the UX manageable

For a full UX, perhaps. But the concept of a matrix mixer itself is 
general enough.

Perhaps there could be a UI tool which is self contained with one purpose, 
to control a 'standard' matrix mixer. It could be invoked alongside 
alsamixer or other mixer tool, and multiple times if there are multiple 
matrix mixers on a piece of hardware.

-- 
Mark
