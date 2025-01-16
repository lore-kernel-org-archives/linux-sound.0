Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25841990D8
	for <linux-sound@vger.kernel.org>; Thu, 16 Jan 2025 16:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.16.231.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737045818; cv=none; b=eOuY3bYEW3oHqVf4xRvPx/tX/NCfSrjcc5xsqJijcQHXYRks8xmlPkRYNtxKi2zln9fl8x3DSVttH1MotoQPeb8+0eEn8JenBUOMjsSMpBxWhgEo2ncD7vKXkmOT2FXISAgsoalcvLXk0+qvxlods4Cx672xXH41cXpGk6L7uWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737045818; c=relaxed/simple;
	bh=o5JmDwdNCTqCn1BJf6n8uYcxttSgVYiogakObgNgj+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTDKBZxC5nDTPk1UQ1mDO6HsTHkjX7szj4DP7r8fBjXkM+yV4YnDUZQk5Wlx+Ze8iXpCGdJHGFVpUk/MgC6ScdnrmleOrKm7vWC7BToKY1zncj2EZ0y140ADKdD4vfRK3W6AV0QEOePcQYfQB0KyFfMQhqk/3iHcU3fikV0K20o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu; spf=pass smtp.mailfrom=b4.vu; dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b=Ysax0muJ; arc=none smtp.client-ip=203.16.231.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=b4.vu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=b4.vu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=b4.vu header.i=@b4.vu header.b="Ysax0muJ"
Received: by m.b4.vu (Postfix, from userid 1000)
	id 0FAEB64A5801; Fri, 17 Jan 2025 03:13:31 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 0FAEB64A5801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1737045811; bh=CHj/4YEAxUZohsSoTFx9rKSNa7Nub60r8mGCnzK00UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ysax0muJvAW0Bajtu6wxYoBCorWailblDIczpsK7e9MB6ja5+M7cQpk5TxIQnD6ho
	 sI/y7h2Ao0nLzGhRK8ffqh2i3WRihYbd9NZNQnxZcSNmXr1UmOEcnOcm8YZGhP1DNp
	 8QqdW8nzd5+rgPFBx7QWBL+tc1UPb31cWL12kABiOpuueD4cxOWx6r0qF0AdZo19Ie
	 Mn4JJhJ4CZgKcA9ZtgcwylKcVSXe2pSmihQnZHHX92fmhDPeVAw016w+6JOPNm0bgg
	 KB6YlG35DyghT+tD/XyNnR2N3bsGs8wF8PEeIaC6gNRw1vZ8HWG9Ov4pj76VGXyQZX
	 X51HXc66GXLSQ==
Date: Fri, 17 Jan 2025 03:13:31 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/2] ALSA: FCP: Add Focusrite Control Protocol driver
Message-ID: <Z4k3M7S1Bo2EDlDO@m.b4.vu>
References: <cover.1737017960.git.g@b4.vu>
 <7355f25d9b57386c280aef651b6ba2b96cf0d5a7.1737017960.git.g@b4.vu>
 <878qraiywb.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qraiywb.wl-tiwai@suse.de>

Hi Takashi,

A couple of questions for clarification:

On Thu, Jan 16, 2025 at 04:03:48PM +0100, Takashi Iwai wrote:
> On Thu, 16 Jan 2025 10:03:35 +0100,
> Geoffrey D. Bennett wrote:
[...]
> > +#define SNDRV_CTL_TLVT_LABELS		0x110	/* channel labels */
> 
> IMHO, the data definition looks too ambiguous here to be put as a
> public API.  It can be also a more specific name such as
> *_CHANNEL_LABELS, too.

Do you mean e.g. SNDRV_CTL_TLVT_FCP_CHANNEL_LABELS ?

But still define in include/uapi/sound/tlv.h?

And 0x110 is okay to use?

> [...]

Other comments noted and will update accordingly in v8.

Thanks,
Geoffrey.
