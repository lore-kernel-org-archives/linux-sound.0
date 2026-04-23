Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADD23E2754;
	Thu, 23 Apr 2026 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935995; cv=none; b=fEHJ8IqcfhcJJkW0jlz8kg34SL2Fxc8/tgEOiBIU8glwMj3TUuWMrcxOzBGOET0niFvU1nmDjrQJXd5kjEvyzIG7lSAWZCk/4FGbcErHzfwjMY2NIxxgRcoVeCmrwmQNPvQWfI47OiXITv+JqviyivNS0S45U14yFQisWbcbYRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935995; c=relaxed/simple;
	bh=qKg5bxgpTTQfFUZxcCD9VWvBgzLKpR1Iot7so2sqo0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKLXW8D9S1AWfiQKLhlFJMk22jXp1zP3kOjkOjdzgo4L8p0KcF59QfgF6NItDN3gf6hVBjfxNx1VytJrNXCt6hoDDo2A/WUWhvjO0r6655DESpFk6jim2bvuVAbVqV40VkuZ+wZ3jArbOkhI/vJDhJNqB5QgZXZK9M6VgYByP8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTxiAzAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTxiAzAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4B2C2BCAF;
	Thu, 23 Apr 2026 09:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776935995;
	bh=qKg5bxgpTTQfFUZxcCD9VWvBgzLKpR1Iot7so2sqo0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTxiAzAvZ7aeMDFlB8ptP+zBdIrxvGYToMwpCPaQ6IUiGmd97xPwNwHPocfDTmgfj
	 3peDCXfEW1IXekkaN7ymT0Eg7CfcXEs/NT4dIaOj9viGUg6yLTF3TOlEXwNwgUKaUc
	 Fma3Yv00kKTj39H1p2VWps07J+EnS8jthRfRNATnWi4ewy4w5+crY4zW6b0ViUNOUZ
	 Kyr1tjayGCVhd9UhkCi7Ger/qDGRF1+ges/MpE7ol36Ngj6wF3AFkIb37XVeV910+T
	 gRKeDo7bhtpmt2HbNL3t7JvKS4vaurM2H3dzdGDA3VJL/bZxcfdtII8+fLAE2JOpqY
	 nIiCVR1XfZcdw==
Date: Thu, 23 Apr 2026 11:19:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>, 
	Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
	David Rau <David.Rau.opensource@dm.renesas.com>, Animesh Agarwal <animeshagarwal28@gmail.com>, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: drop redundant wakeup-source
 definitions
Message-ID: <20260423-ingenious-psychedelic-jaybird-40bb4d@quoll>
References: <20260423042831.21114-1-phucduc.bui@gmail.com>
 <20260423042831.21114-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423042831.21114-2-phucduc.bui@gmail.com>

On Thu, Apr 23, 2026 at 11:28:31AM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> The 'wakeup-source' property already has its type defined in the core

TYPES. It is plural.

> schema. A number of sound binding files redundantly specify the
> 'type: boolean' and provide descriptions which only repeat the generic
> meaning of the property.
> Drop these redundant definitions and descriptions to clean up the binding
> files and rely on the core schema instead.
> No functional change intended.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/dialog,da7219.yaml  | 5 +----
>  Documentation/devicetree/bindings/sound/realtek,rt5514.yaml | 4 +---
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> index 19137abdba3e..fab37cd92e0d 100644
> --- a/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> +++ b/Documentation/devicetree/bindings/sound/dialog,da7219.yaml
> @@ -45,10 +45,7 @@ properties:
>        - wakeup
>        - irq
>  
> -  wakeup-source:
> -    type: boolean
> -    description:
> -      Flag to indicate this device can wake system (suspend/resume).
> +  wakeup-source: true

That's wrong. Commit msg is making here false statements that it is
redundant. I checked (and you should too!) and driver does clearly
device_property_read_bool() thus the property CANNOT be the second type.

Best regards,
Krzysztof

