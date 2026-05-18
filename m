Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169F3FB7EA;
	Mon, 18 May 2026 12:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779105739; cv=none; b=djlHBcLIZ0sC1L0Qmrfbj7xUjaLlLBOcZUalowbTwlfLaweGNj5v0lyEGLLYOcFdmAQxNr4uJ09IFxt5crduQj3qaL0CNabA5WC6fxrMz6Oenl3NEAFTRR+vu2HgBP4n2HOc8wmBAK5HJQKpcfqqBzcfpVE77zkuSD0irLsXPa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779105739; c=relaxed/simple;
	bh=x6CYfNWjvjQv3HJzv4ikNQ5ma1+9J3bx6JaQCwy5UlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C64xwUT1NZnTnasoO5euC/w0Oq6Sbtwh74UX0ntoeYd/GCtgZcqUYRGbYf2bnTZT+mkc1P1Xot8OMefumE1o6eiYziBC0xRWhTax/zoH88WAyYhoUGOgo0EVQWELlNeNfsMToq1ajniGwZggVwkPrbQCBDmNzgZzDMHJmSwjKCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5uRPqJF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5uRPqJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CABC2BCB7;
	Mon, 18 May 2026 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779105739;
	bh=x6CYfNWjvjQv3HJzv4ikNQ5ma1+9J3bx6JaQCwy5UlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5uRPqJFqMSnjpKtB44FV9kEOyE1OSxESjhaDeTbKnrirKUmwbGSSboo0C+ds/f84
	 5NsVod4nKW3XW/qI+5e0FWO4G6qom3I7W9kG06Q5L+CEAhxq8zRG0HQzNDgNkpYaxg
	 8/oSDoR7KIvAXxxC0D0d4m5udIwsCrC4Aq0AA/lDlirpk0yQj2HOvd2cC5X3pumhdF
	 kIRLg5JR9mrjEepmqfiugu1Uo2J93m0oMY24J9A2g4w6DxhOnwMGwGz/QC0JkQkXLV
	 HXUL0zNrJzSbxMyWzSdBXtiu4WI/Njd15LrRwA7RYWD17AU61x6ARYUmxveCHooM5R
	 kJiCGzIfJGAdw==
Date: Mon, 18 May 2026 14:02:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neo Chang <YLCHANG2@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, 
	tiwai@suse.com, robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org, neo.chang70@gmail.com, 
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: nuvoton,nau8360: Add NAU83G60
Message-ID: <20260518-heavy-bear-of-camouflage-d7c89d@quoll>
References: <20260518024704.118613-1-YLCHANG2@nuvoton.com>
 <20260518024704.118613-2-YLCHANG2@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260518024704.118613-2-YLCHANG2@nuvoton.com>

On Mon, May 18, 2026 at 10:47:03AM +0800, Neo Chang wrote:
> Add device tree bindings documentation for the Nuvoton NAU83G60
> audio amplifier.
> 
> Signed-off-by: Neo Chang <YLCHANG2@nuvoton.com>
> ---
> Changes in v2:
> - Dropped the word "driver" from the description.
> - Removed runtime/software configuration properties:
>   nuvoton,low-latency, nuvoton,anc-enable, nuvoton,aec-enable,
>   nuvoton,vbat-microvolt, and nuvoton,tdm-channel-length.
> - Added missing "nuvoton,dac-cur-enable" property for static speaker impedance matching.
> - Removed unnecessary '|' formatting from single-line descriptions.
> - Fixed typo in firmware-name property.

You didn't really...

git grep firmware-name

Best regards,
Krzysztof

