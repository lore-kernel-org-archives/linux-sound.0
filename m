Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2C32857CA;
	Thu, 10 Apr 2025 12:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744289514; cv=none; b=g2CaBu/edOTbItR6pbcJ6ztdrHa3u27dKLTWgVD1JMD9q/VzzteEnbhmWKpiObW+2HmTGpecWGVWO5/LIGQq7up6qBAm448/GeynHFgzzlVaFDhBeXs86ublNqSPSx9wUhlrHwK+5avzwGcr8Gb5/NQp6TjtllMOReD3Kp35iGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744289514; c=relaxed/simple;
	bh=05NYAlNIedm9FJiR3ZeIZpkch/oKPxYrgRDk6fDtGsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdxxclcuA+tp4LW0t57IzXRF+BlZKAPAp1WnRz7aKamTTEzN+ZFlvWoKtAenzrD8vE1o9TkUX4rOXafyxxg7Nsvi0kbmDVcrH3eQ58q44KoHbfUn3/b+gFmJgC5QI/C+2emIrT6SjnxdY226xnkgJY5L8VWLP6VlA4WOU0iTJCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GjgHR0Td; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GjgHR0Td"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A92C4CEDD;
	Thu, 10 Apr 2025 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744289512;
	bh=05NYAlNIedm9FJiR3ZeIZpkch/oKPxYrgRDk6fDtGsk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjgHR0TdZZbgJjXVq8J3ozlkxXxnSKU44NsqEJFedhesyT7Rumjgnb5BcUN1yu5tO
	 24rabZW4LsZJwknedAO0skcv/72oX1F3d0gCXfp2CiqyK/MG0aHgvvmTGFT47MN/oL
	 1f0ks9K8OIVN+Q1MLgHsDkjk8xAlNXRTfuDjB0Jk=
Date: Thu, 10 Apr 2025 14:50:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: stable@vger.kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	"Vehmanen, Kai" <kai.vehmanen@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [6.12 LTS / 6.14 stable] Lenovo X1 Fold 16 Gen 1 audio support
Message-ID: <2025041008-verbally-grimy-ed0c@gregkh>
References: <1e160cc3-8fc5-4fc7-992e-b24980c55c47@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e160cc3-8fc5-4fc7-992e-b24980c55c47@linux.intel.com>

On Thu, Apr 10, 2025 at 03:40:01PM +0300, Péter Ujfalusi wrote:
> Hi,
> 
> I would like to request a backport of
> 8b36447c9ae1 ("ASoC: Intel: adl: add 2xrt1316 audio configuration")
> 
> to 6.12 LTS and 6.14 stable kernel as we have at least one affected user:
> https://github.com/thesofproject/linux/issues/5274
> 
> The topology file has been already released.

Now applied, thanks.


greg k-h
