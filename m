Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3029639EF32;
	Wed,  8 Apr 2026 10:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775645175; cv=none; b=dqblCQQEQnETKtZPYawcNk1Lu/hmF23+/b076d2BkWDl7445MyMUDCUN3WWLhrdeXmS2bh1dqjcpoCbtduMXI4vxYKswNoiVTv+nx8DmUjhiwJgkWoHZ/xVtkcVH6RaAdNgJRSqz7T5oIAc7OgovCoRt8SceqL3AHn9GS2QCq38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775645175; c=relaxed/simple;
	bh=4h1CwtF278yYJjTLPSP1P9LbY0I2pL8N6Sph/eMspqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJED8yTV3Pgakhp2VIYe1VtjH2zets5dTVx8YC21wL3VSKYEDnWgQMNeR04ELzZ0KofQdf9T3TAbB81ZFARul4Dl3MumQQtIrkmWkMCKusF/qFa6GyqYC1GFNN2H0bC42VwAuxyzbwas1kDv5JpzRATpbrk7ZKVGMaQCkzC00+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jh0ejZBu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jh0ejZBu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E6BC19421;
	Wed,  8 Apr 2026 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775645174;
	bh=4h1CwtF278yYJjTLPSP1P9LbY0I2pL8N6Sph/eMspqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jh0ejZBuEZnIOGK3V/V9FqLGrgG1kv6OLVjdUnn6eAD6UUi/wfgiBAojpzHGpqilJ
	 Jlmx3h58KjHrGi3Lc01NaikEYSZkglPKcOZUtyeSewlEHc/BvqdGSgePtqJ3eEJg8w
	 yVmhBvN9kivOwUWbakGNC0qfdNgF9VCC8rsycOFE=
Date: Wed, 8 Apr 2026 12:46:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.de,
	linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, stable@vger.kernel.org,
	liam.r.girdwood@intel.com
Subject: Re: [PATCH for 7.0 1/2] ALSA: hda/intel: enforce stricter
 period-size alignment for Intel NVL
Message-ID: <2026040848-stiffness-generous-94c3@gregkh>
References: <20260408084514.24325-1-peter.ujfalusi@linux.intel.com>
 <20260408084514.24325-2-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408084514.24325-2-peter.ujfalusi@linux.intel.com>

On Wed, Apr 08, 2026 at 11:45:13AM +0300, Peter Ujfalusi wrote:
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> Intel ACE4 based products set more strict constraints on HDA BDLE start
> address and length alignment. Modify capability flags to drop
> AZX_DCAPS_NO_ALIGN_BUFSIZE for Intel Nova Lake platforms.
> 
> Fixes: 7f428282fde3 ("ALSA: hda: controllers: intel: add support for Nova Lake")
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>

This also needs a:

Cc: stable <stable@kernel.org>

As the commit you reference here is in the stable 6.19.y tree.

thanks,

greg k-h
