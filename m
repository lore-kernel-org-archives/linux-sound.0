Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0472E041D;
	Thu, 15 Jan 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469707; cv=none; b=p+F+rVzlbCe+IqjgemxBOTMt1CDH8HTjDb3/c7lZ/F7HsYLXIRBqt6ODZ30fcEqvyVPPLoOrshWj4TCJoAMBmTWEA19gCpWWrKA2gFCPt7xtYRRMLYsvc9xUlYYHaElprI+drP6bKJotCtVu2UnzPUG2/lGd/ZdzNgwA9RBn2SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469707; c=relaxed/simple;
	bh=SSDkmMF+IODJFDYFIJgpnmI+1nvN8+lx0HlSTFA4zgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP7fc0eYhBiw7f6xH6hE8op6xe86+4FMFbkB46bVotprg+SnaR7oZp5WlyDyy3SLvqUwEfHL5HRDIXQfF/W2g/RBmsP7/7hqey0ahjD2O3MBrqrG4H3qER9wSGseC65nWct7vAB5daEKLziTgF+TyMuhzwry6P8eWSMdkk7Fp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMp4GtGL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMp4GtGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA932C16AAE;
	Thu, 15 Jan 2026 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469707;
	bh=SSDkmMF+IODJFDYFIJgpnmI+1nvN8+lx0HlSTFA4zgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMp4GtGL7P+vbe+wWO0FzanFpYnV0LsPC19sEANYragKdUc9CO37v4paShJlFNUWs
	 JdA8Gyw9kdLwwLnILOmuFIlo/L/w9TPoqEe4T2YjH5LVl1RHBvjDxHx7s+XUW4eFwZ
	 usqvKyxT5msdYw3X+k//CAGrEyn13KQuIMEtu2NO0nmKdIl/YRXYqSvzeYvqyC7GFF
	 uL4Ru1hEX8DfPJY1ipddgQsnCVq9X115Hvx+G2o/EkWo+7sGiJg5PKDE71u2r5P2+R
	 4gZCDl6/ccI0jHRPKcz7Vgei+iMG5I47FguPva3XpZJW7JqOfbasH7N8cmNzV32zEp
	 PRIQU4MUe8Diw==
Date: Thu, 15 Jan 2026 10:35:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,sai: Add support for i.MX952
 platform
Message-ID: <20260115-truthful-marvellous-okapi-edeb92@quoll>
References: <20260115061418.4131432-1-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115061418.4131432-1-shengjiu.wang@nxp.com>

On Thu, Jan 15, 2026 at 02:14:18PM +0800, Shengjiu Wang wrote:
> Add a new compatible string 'fsl,imx952-sai' for i.MX952 platform, which
> is fallback compatible with 'fsl,imx95-sai'.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - drop driver changes, as it is fallback compatible with mx95
> 
>  Documentation/devicetree/bindings/sound/fsl,sai.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

