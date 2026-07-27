Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63E63E316B;
	Mon, 27 Jul 2026 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182947; cv=none; b=faNQuuUKncEj6Jsq7dDlPxlcAvXuaE9ww+4xdyCy1G23/486Mt3ei4DvoyvuLsHrr/of14BVuNO1i7ANzCz32tdBSStK6anK2dl0HDF3iQz08ig+lq+bIJIzEgXows5EzL0qzyFl2vOoJ5M3P8cGn+d8CGeicHdkeaZd21Ld9xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182947; c=relaxed/simple;
	bh=grxGf0rvgSk9EPTI5flq3zRQxWIglHH3SiBwI5XEZtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fg7b+AbphtJurt95J+zqBOxqKnFhmGXvlnpNfTDMgW6/8SU15nlYbETouBdkjX8p91EdC1DxwAqutCnj+p5WK5FHdwVpKg4ti6ruJA6NS++Fif0wAqYnUig8NKngRvhXDF36ONuiN0YXp/PzB+QNXN/1zk80fSzTETbgNTFs1v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS7VLrYI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS7VLrYI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2261F000E9;
	Mon, 27 Jul 2026 20:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785182945;
	bh=yt48Xgg0CQY2JZtTV6qIBzNY0Dk5enTCLZaiCRTR6Gc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cS7VLrYIdE/waRddn++cq+VtuzykjXm33ZcpgLUU3p8SNQlc1wql2p4mIPp/uzFfK
	 ODhg/zbGjxT+QZdOH6Fz01bFjDNEdH8HQx5RWK2vvdCGtB8c0gx6EGWZAQQvPFGWtL
	 BcrDutKe4IGLsDFcZgCyAPTuOfkp0Au2cKhDpDaYTW/IdhMFDlQxAtJJMJH4fE59xf
	 x3z0vIAW4V4cdrPYtid2l84/b1ijO7kr2mMoJBlvs5OPSgh3RutQEM5hRLI0ILUZ5M
	 6MVJxKxITJkX0LQuTFZrmkOlP1/oMdRkBkGwYZgAa36amQyiqMYeRSjquzB28r7LMC
	 0v7W0kk0waq6w==
Date: Mon, 27 Jul 2026 22:09:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais:
 Document DAI subnode
Message-ID: <20260727-hospitable-chestnut-caterpillar-3c27f5@quoll>
References: <20260727151230.408122-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260727151230.408122-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1e5ab24f-d836-4d87-a21d-3d172a03b0fb@oss.qualcomm.com>

On Mon, Jul 27, 2026 at 08:57:52PM +0530, Ajay Kumar Nandam wrote:
> 
> 
> On 7/27/2026 8:42 PM, Mohammad Rafi Shaik wrote:
> > Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
> > describe Digital Audio Interface (DAI) child nodes.
> > 
> > Add #address-cells and #size-cells to allow representation of multiple
> > DAI instances as child nodes, and define a dai@<id> pattern to document
> > per-DAI properties such as the interface ID and associated clocks.
> > 
> > On platforms such as Monaco and Lemans, third-party codecs are hardware
> > wired to the SoC and do not always have an in-tree codec driver to manage
> > their clocks. For these designs, clock line enablement must be driven
> > from the platform side, and this series provides the necessary support
> > for that.
> > 
> > On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
> > I2S MCLK and BCLK has moved from the DSP to the kernel. This series
> > introduces the required device tree binding support to represent and
> > vote for these clocks from the kernel.
> > 
> > Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > ---
> >   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 50 +++++++++++++++++++
> >   1 file changed, 50 insertions(+)
> > 
> 
> Thanks for the patch.
> 
> Tested on Shikra-IQS. No issues observed.
> 
> Tested-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

No, please drop. You could not test this patch on Shikra-IQS. It's
impossible.

Otherwise please provide steps which execute this code on the target
device.

Best regards,
Krzysztof

