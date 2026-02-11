Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A578729C338;
	Wed, 11 Feb 2026 06:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770792705; cv=none; b=oQqxsuBReA0I6YRl0DgS2eZFH1aTV+aw7DUBc4XNkqgYAok1WU/BV9486MMB8qmNYZaxc82Ble1QqfREV4HTEhK7Pm135IYEPqPprD2dXceou1E4yCf8L6ES54yovXeJoyzpJ74tHcMk3BDykHu7/XZxYD5pb97dpFv+kIXg+PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770792705; c=relaxed/simple;
	bh=PO0Yb4rM2R1rp2phrnWJC2V35SZWCeVXeIfWE+OD98c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNbK/i1XnUy4UVN37cPeDNCFy8RZiEZAozkyEoRmCPe5yKlq4lvimQ2CQAC1PHyOxleivnmzS0k3Y95lmrzAhsSLvjJmvkWCmAaXLpNQgDSM68K34178qEQixvBRU0pBEokN73vRlw/edWXYafblrsVoGiGbMsIeKzWQmifYR1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcZtjG1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcZtjG1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFEAC4CEF7;
	Wed, 11 Feb 2026 06:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770792705;
	bh=PO0Yb4rM2R1rp2phrnWJC2V35SZWCeVXeIfWE+OD98c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcZtjG1hcJDXtq7ZjHLlhYsbOxP0YzKaAfnCaBVCig97WJxZDL1tN4ast95KMcDxL
	 2GkEdDnSCjLs1eNty3lVC37u5+eCH4eG2zUbFONdH54p3n4IiEJ1KiOGCgQdhZH5bK
	 e2YTBmedcYBIHYwd+Fo3VSCN1OP4PTKUuSB/tO4DKK/tjlj7sjCx9IOx67Jg+9xsmo
	 CYBP/GwHeFecv7WydU7smqmGleKQ44+JCc84Dk3iV+ii72CsVWH7Ezc0LjUcGF2Pl6
	 XaNP9lIhprv1gMbDtRv2C7kUVdq7s9vFTU67iJ2FL6WydYCnMNqhsOhRyE+v2znRPR
	 q0TCTv1yFUWkQ==
Date: Wed, 11 Feb 2026 07:51:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	Nickolay Goppen <setotau@mainlining.org>
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
Message-ID: <20260211-skilled-transparent-moth-fac10f@quoll>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>

On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
> > From: Nickolay Goppen <setotau@mainlining.org>
> > 
> > Add compatibles for sdm660-internal based soundcards.
> 
> Why is it called "internal"?

Yeah... I am pretty sure there is no such sound card. You cannot have
sound card internal to the soc, because you need the external components
like codecs.

Best regards,
Krzysztof

