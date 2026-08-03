Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D532E7370;
	Mon,  3 Aug 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766235; cv=none; b=F7ZarehzzUTZrvTgYhs+8oxRjkHnMYZ8B0st4ApT64n44cqOVjMo3LvWClTa2uKBoSjfEVesPjPirmhX0yPLugNP1PER/VHpcV4xN726boA9ERlsxKR/QsLOMA6lVFmlw1tkEwrcbjnmIpkZDmXboz6zeag7SSXLO7asqNa3q5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766235; c=relaxed/simple;
	bh=4mz27+a1J+Jp8j9W6bqeehSiOY34eworYz+oTQio4pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xmck0Xaa5+LBoXb4Z7G+zax1RODhnUDV8t3DlPvWNXfv8Ua0ed1/+BnmTzqvRHaIVvEAxQaDx4v0PYEEEdNyt5Zl7wDJ5FQU6WMbrYKh56fWUajydTL7vbUcQFhUYfDm49f3b8WuGOISbaz/4dxB1C/yxNI5afSWe/LSSFksbjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0jJyogJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0jJyogJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03921F000E9;
	Mon,  3 Aug 2026 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766234;
	bh=6bLPoXyW/nuFn6O2vS2mnNbHO2itc891hn1C6FGQRms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P0jJyogJC+E6pnMRNxXlxvAuuAAxdvOCmL8f/Wg+feZC/uC6N4wuDQiUFQtp0AwYN
	 WDrfympx7Jbztc4r3aXS0qbcsfOuwno//8CGof4YmQKMT/F3VEE5Wn0uNtzMpk1QQr
	 an4nL0Wq6Mvl9BgJEIER//GggHQ208uHNYeru9SeU7TIws42OM6dUnafGFAEOZvKg9
	 q3Ag2TFdkLEx++SMV0mjCxYkG6sCmC8QkxQRtLt7KA6X0NeB22dqlAX+KoXKlXEk6N
	 GflxRunuwZSzSuHQVnT3zGSp9wKJv3BJb5y310aQvQnKbsoBN+KLDvxBrgty2MEoOD
	 ZaFVh93M05QDg==
Date: Mon, 3 Aug 2026 09:10:33 -0500
From: Rob Herring <robh@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
Message-ID: <20260803141033.GA3231247-robh@kernel.org>
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801054610.4047089-4-prasad.kumpatla@oss.qualcomm.com>

On Sat, Aug 01, 2026 at 11:16:06AM +0530, Prasad Kumpatla wrote:
> Add the LPASS Audio IF clock IDs used by newer backend interfaces.
> 
> Platforms using Audio IF module backends request the interface bit
> clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
> header so these clocks can be referenced from device trees.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Missing krzk's ack and comment on the subject.

> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
