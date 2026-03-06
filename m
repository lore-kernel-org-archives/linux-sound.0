Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C3377ECD;
	Fri,  6 Mar 2026 08:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772784623; cv=none; b=uxeO/kdlkNlLtbSUkIdn+itafnPhRBREy/dbacspi1k4TEzQ9wFsaCLWoxVnHb/sOTDKrlYXQiVKNTjmuoQGZ12sGsTFoVfPCXWKkpKHGtMS/M2ePR1A9z+hNva8QiIlm4jvYlmEq4sA5mURJq5ExAj5taWcH9jSnvpG1VRgQZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772784623; c=relaxed/simple;
	bh=8oeKci9lZ43gNpYbbcIUx8piLV22DLOROu/z0IK/Tdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrDt1o35Up9rl0CvsQ577RjHMojGwEHHf6ny2JLRAj42/UGL+pDlXoijlByJm+HOPfkXDs9e+nL1OAqNYBxWLE4HH8vdyoOcZKCJ6G/A5gJYP33G+9AbhXW2KC0sP9eCdj+/XKidY/1zcUo285+BnO9F3fv7l+jFJgoLsYezJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJWxEhbP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FJWxEhbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4209FC4CEF7;
	Fri,  6 Mar 2026 08:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772784622;
	bh=8oeKci9lZ43gNpYbbcIUx8piLV22DLOROu/z0IK/Tdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJWxEhbP/75mwy+rJUvacHy5gPt2xNGZnU54KbHq1yZBYxJQNEX41KK3CUNP3jMfp
	 EwwN8rzdSrGyv49UR3m0SuaiefA+jt/W++Ked3LTfJViqi6yx7DYUmEjq7nzdNictB
	 U+3g0+my0tkv8p+bZ7qyIH/CWRLidh/1W5jaTeuQg9ou1cmJnXqLHvTQfXfACpC9YZ
	 sW2Q03SHJRA9LueaRHKzy+b3tGOtXV/jtM+4688viyj2ek+meT3TGvVduPoOh5+kOK
	 CxgDwJWFGIftVQlnOXGlAw+XuslMEWtr1d+kQDZeyfDTApP1XmrgLwq6ht1ey3MSTx
	 ULEhhG7GPEBhw==
Date: Fri, 6 Mar 2026 09:10:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>, 
	Katsuhiro Suzuki <katsuhiro@katsuster.net>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Roger Shimizu <rosh@debian.org>
Subject: Re: [PATCH 1/6] ASoC: dt-bindings: es8316: Document
 everest,jack-detect-inverted property
Message-ID: <20260306-demonic-capable-spider-acf312@quoll>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
 <20260305-rubikpi-next-20260304-v1-1-327595a4528a@thundersoft.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305-rubikpi-next-20260304-v1-1-327595a4528a@thundersoft.com>

On Thu, Mar 05, 2026 at 01:47:42PM +0800, Hongyang Zhao wrote:
> The es8316 codec driver already supports the everest,jack-detect-inverted

... since commit foobar ...

> property to invert the jack detection logic, but it was not documented in
> the devicetree binding. Add the missing property documentation.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

