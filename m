Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3F3AD53D;
	Fri, 17 Jul 2026 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294303; cv=none; b=mLH/t8H76lVwx0/fhBbfMAXvAWZkAosPxpG2fW4o1/Wpu6JfgrE7SAAm94I7IMb6e63m+03ScBtRvFU/9YqZQ4N2q9tBAla6gL61qKUPwcQ2wDTt/twe6qYr44h/EpQz81cAbOaxfhrNhW1yErnL1OAEFAye5t128mvrULGpTrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294303; c=relaxed/simple;
	bh=e70fDeQim/MWDRrTOmdhuDhw6lDZyKBApSR1JMCv+24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYvg8G5q6hNimCFbUpYWd/Vf8d8cCApa915iG8FdVFEpsqYTSZsE/Uw1VHdFMJvFAZZ7mq8r+1ZbMQ6wpHe0raagOu7MPjOgUXivnBfSSXqTuqIw2buWEwuqTi8M7HTBtl5veUKTIx7HWYz11Lu51xVLugMf3WHNOLijx8h00YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J84p+him; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J84p+him"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC881F000E9;
	Fri, 17 Jul 2026 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784294301;
	bh=Uh4XCxDriZjBlzGWFplos4EPd6YZSUw43vAMiQgC2Ys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J84p+himzXfBVAFy06agW8C+zWgIvib4+bRlolClmIjZMjKPNDVzcODzgfCPsGcRD
	 8qZEVCTjBaBliElPGMzcRDWkkEMnLvyiaz3k3IXcBd0t0yj28TraU5thRDb4cVhvif
	 VnbQFBGDQNrx2dQweLqxslzIqMbvVNOGjZlCDKQCSBR683LyCshFPc+0ih5yL6Mx9Y
	 cFVQHXT4IkUqF0mDZnGmBllEYGe9Zv5J8ARCiYXOry+lmK+h6Al+C2h4yQdebfdJjl
	 L84BDNK8uFrBtOAbUEbSzVspYhupjovGrEJfcNXfLvbFAb7JJ+NZOIuwDpnLPdr6gb
	 H2nYryHaIEanA==
Date: Fri, 17 Jul 2026 08:18:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, krzk+dt@kernel.org, mfd@lists.linux.dev,
	conor+dt@kernel.org, linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	lee@kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44
 variant
Message-ID: <178429429622.271292.14339576753594370408.robh@kernel.org>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708140039.1993489-2-ckeepax@opensource.cirrus.com>


On Wed, 08 Jul 2026 15:00:37 +0100, Charles Keepax wrote:
> The cs42l44 is a cost optimised variant of cs42l43b.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

