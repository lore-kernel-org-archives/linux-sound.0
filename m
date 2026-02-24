Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74EF335070;
	Tue, 24 Feb 2026 07:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917231; cv=none; b=XG/Vd4hV9sxjhIVcBVB7HZ6E2J88roSByXHv02W6w4B8Z9DWssqjoLRoDPIgrzlg2xMoVQmc4E19ZUYqdwPfzH6JjssfjqV/ot5g5iNzAek5DbSvcFc657g75j3WMDy+JOXUMGid762tbFqdDBHAcX8b5iRs7yLxdrBCCytw1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917231; c=relaxed/simple;
	bh=FQamdmZaoJ8xo0nPOyMKJc9fOMLgHwt/UXChThxbThA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHMSgy1OybMzNH8byk2+qwEOaGDl3pTs07E/hqRwTzGHIEbp8AyCPjzpLRwxXkQ9ZOCyZs3qVpAkWX9qZm6HcCCYIzEQ5OdC0vHcbi90R+C3cV9+YbM8pivvW0NoSHeexvTnaFK/x3HAau+yOlB4HHapToLelmvyXf7M7bX1FOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr87+wFB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr87+wFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAD6C116D0;
	Tue, 24 Feb 2026 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917231;
	bh=FQamdmZaoJ8xo0nPOyMKJc9fOMLgHwt/UXChThxbThA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sr87+wFBiBgeQ50+gu2HdljV887bYfBPBSwOR24iUlvn+LvloxoN0v7gsX+XeMxU9
	 CkhXECdhcDIiJoSAT05htoxgu63s18Bw0n0qtAPitsUs6ydBtGc8Cs/vKkZkoRZqMP
	 Bi69ii2GyelYdTyWT+hRoFPg5t+QnM935r7luAATQwlfQjc0S+/8JN4lB5BUwyQDyL
	 sD6ODp0W3mU7B4byv3Fbt3SIP1gs2usdEcY4ZR9w+zQcKfVHgDi4B0/6lB4mBBtZuJ
	 uzZ9wAqEqe2ngpUzVHb3IEMpRcRMll5KCC2yPVJnh773Lse/LHz9NkVIwVvN3JAoxM
	 6bsrww0q0Um0Q==
Date: Tue, 24 Feb 2026 08:13:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mohammad.rafi.shaik@oss.qualcomm.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, srini@kernel.org
Subject: Re: [PATCH v2 07/14] ASoC: dt-bindings: qcom: add LPASS LPI MI2S dai
 ids
Message-ID: <20260224-awesome-ibis-of-tolerance-5f7b98@quoll>
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-8-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223180740.444311-8-srinivas.kandagatla@oss.qualcomm.com>

On Mon, Feb 23, 2026 at 06:07:33PM +0000, Srinivas Kandagatla wrote:
> Add new dai ids entries for LPASS LPI MI2S lines.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 10 ++++++++++
>  sound/soc/qcom/common.h                            |  2 +-

Separate patches. Probably checkpatch was reporting this as well.

Best regards,
Krzysztof

