Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1393B8111;
	Thu, 13 Aug 2026 09:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613248; cv=none; b=AVG4RJzo7Og8DPABLJYURbFs5dP0/oPROiS3WNhJYZR6e9LTM2ZYJd8A8pAlIgZlDEkBAYQOAvZLTKa68iojQTIFcM6Sovj5aKCj6986zmvmEkDiS6VI+Qga6lF8WkWfGVvaiZQsh5Bkg6B6g10fjpVvzwTaY7mg7u+Jmyc8ZIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613248; c=relaxed/simple;
	bh=OZfQtgwufem8rlbDbiG95vnf2U3lVvDw16t7Kkqt7d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MX3hio8aAG6+E3lmeg3Wnajo3dGxO2+e7hXQCJs26KXpcLTj2sT3mf8FrPcM/auwOZIVhs02iFgJdxZzRBmKQFhrKyXB+eMqJXxikB0TGpgd4EtKA4m4xvRREfs45vhkl3Rfk8uAwuSSi/YP8YGHSVl+wFiKhJbO+8OcVNat+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g+yDO3rS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g+yDO3rS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3931C1F000E9;
	Thu, 13 Aug 2026 09:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786613244;
	bh=YFIri72onxVC5FarQAPn92IFND73hAGbg16B+ainggo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+yDO3rSui4UVsRgyuXzXqaKB02XA6wVoa0I8/2IYgbr0rxOEoFwcPih2/JDzKr1c
	 m1xB0qOvlH4kQ9520QG+68G9eQwoN8xULndlGDqUp7Id4zjWgXKzCd7cVmGkgQDd99
	 /MyvEl9GTVe3M5JBylTUqA8RxcXrZpnm/RgIiA10ECwahZcc3VrxSgmP3GVGjUVMlB
	 dkr/RVX6RtQD2/1AaPZVAHgpnkE3nNryuWLhNQOAgx/kHyWi9QSUuaM1UxFllFXwlo
	 rVfqLEOYqdSHpwyujUIvbeybdPl6pE0klXrg1nMx4l2PQazr52JtgsVn6Upbpc/B2J
	 RShbhgc+qcMOw==
Date: Thu, 13 Aug 2026 11:27:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: sound: qcom,q6dsp-lpass-ports:
 Rename QAIF clock IDs
Message-ID: <20260813-lucky-hog-of-contentment-333695@quoll>
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260808181948.2489187-2-prasad.kumpatla@oss.qualcomm.com>

On Sat, Aug 08, 2026 at 11:49:44PM +0530, Prasad Kumpatla wrote:
> The QAIF clock IDs were added with a LAPSS prefix typo. These IDs are
> new, so rename them directly to the existing LPASS naming convention
> instead of keeping misspelled aliases.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            | 56 +++++++++----------
>  1 file changed, 28 insertions(+), 28 deletions(-)

You never built your code...

Fixing existing defines is on the edge of churn, because you would need
to duplicate the defines. It's fine if you insist, but at least this has
to be done correctly.

Best regards,
Krzysztof

