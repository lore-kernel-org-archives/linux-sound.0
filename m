Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044016;
	b=nmoDHTxaMVJvztmfNEPLBY6Qrrjd9r/7HRCSfhEaIXEmrgu8HnqAXDqQqoL3yZHmGfCp
	 WJi5iI1oNS9BfS63ZFVvLFpKC8DOjt2/ZBc2IxiHr1SLW3cp++WKaSh9uHEfRGSFIyUVu
	 5FLrsjnnkmyxN4ii60WJUI+VGXTWadgTrnFon7lDyGmCd3HpIg6X/Kl6E4HR8BnEeDn7K
	 IJGihHyPVgOqBB72fjxYQ4RwRzFKGaKcCRWGHYnXCQ9RhuQgUbxNpOEquHg0WEAKgO+qi
	 Zokf7AGEZmQeJVyQBCoy9up0zYCkpSUJTB//RBtWE61IKVy5TwPd1/BeClPsco2zpSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044016;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Zbn4xc9nVirzmZQ/UllA2MeQCv6PXgISRTXRiLXMrjU=;
	b=yivQdN+N+icQ1NbwiIQBdk0/W6o2aFANFm+iItAYuVGeHbAgvyy3C7J88m21BlLBwBMU
	 cbmt87Fq9btueUHqCkNpAyS3yeG6UrfPjCSNK7cHK4zVERguFf/uwOaYrzEEjkooA1Cqd
	 4+zibj4+PT7xvgq9ubRGVQG76FbZHtu61AvgRPgOFwMHkp1CWsl/BMlTBgCoVjVghw8kg
	 FYDClZhR8mQ2ufbPgoZQrdtqXG60XAY+Lv3RQKQaT5aiqSa4DkDjLvCavCvl9ht98pH/2
	 MLHLEfsjWdCWRQMpEIAjCyLTsfLHNIvFGXkMnHVwTv+osEg//i3Ss5eiF+iag8NcZ/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFKL9uMd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD1D606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 19:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFKL9uMd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0598F1F01825;
	Mon, 26 Oct 2026 19:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793044015;
	bh=Zbn4xc9nVirzmZQ/UllA2MeQCv6PXgISRTXRiLXMrjU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LFKL9uMd1Eg+sagLPysx4eeLRvtQpdeJzv0e0+DCsik9aTNJRzzqBohkcXDZvuDGZ
	 vi1l9rMkI4DwTa7zHbnEL6Sz3GkGrztua1517kWWK0YP5dHw3aTjVEc4SXEuZbxkBz
	 sMiRzBuUFFhBDk7Oc0zKm8nhcG4viAsXFToJ5JaOZP8IdmOlBSsVroTdKrvxr5vPBD
	 v1XvVVazyn1sGTcw2X/82P1Kzce+PQq1If57NP3GkiP51T2hCAklF/U+PqNZVErFag
	 Gvzwmz8/j2OUvwEB1Go+oxYnIiPxcNzexi+ynuxlEnAzJ6V88M5TX2dOCEY31LdLtY
	 Tv+bcwmf609+A==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E7CBD1EC342B;
	Mon, 26 Oct 2026 19:46:40 +0000 (GMT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: Defer TERE until stream setup
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, shengjiu.wang@gmail.com, 
 linux-sound@vger.kernel.org
In-Reply-To: <20261019222827.131120-1-festevam@gmail.com>
References: <20261019222827.131120-1-festevam@gmail.com>
Date: Mon, 26 Oct 2026 19:46:39 +0000
Message-Id: <179304399954.199157.12764659560169687388.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B03q17gpOB8UwLnsu2mVvlgZyWjUStdb7HGiVbulNf8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLur1Ow48jje5j9ZM0l6zbWC691g1f8+yxysLdJ8PGTM
 PlW4YCDHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjIDUOGv3LRG4rTK+af/JGQ
 qR0af7GzMcb4SM60h2ebW2u+n/e4XsTwP321SVx3tvUGnbT3e0+3CDtbnzVkWcLkssL36/s0y8Y
 yPgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> On i.MX8MP, TERE also enables MCLK output. Runtime resume sets it
> before hw_params has configured the stream, so clocks can start from
> stale register values.
> 
> In master mode, a custom board with a 400 MHz IPG clock drove BCLK
> at 200 MHz before hw_params rewrote xCR2. On first open, reset xCR4
> also drove frame sync at about 100 MHz. Later opens can select the
> bus clock with DIV=0 and again drive BCLK prematurely.
> 
> Enable TERE at the end of hw_params after programming stream format
> and clock settings. During runtime resume, restore TERE only when a
> configured stream is being resumed.
> 
> Fixes: 3e4a82612998 ("ASoC: fsl_sai: MCLK bind with TX/RX enable bit")

>  
> +	/*
> +	 * On i.MX8MP, TERE also enables the master clock output. Enable it
> +	 * after hw_params has configured the stream to avoid briefly driving
> +	 * clocks from stale register values.

Has this been tested on wm896x boards like those referenced in the above
commit?  If the card tries to configure the PLL to use this MCLK in it's
hw_params() that'll fail now.

> +	/*
> +	 * A fresh stream has not configured its clock divider yet. Keep TERE
> +	 * disabled until hw_params in that case; an already configured stream
> +	 * needs it restored after a system suspend.
> +	 */
> +	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
> +	    sai->mclk_streams)

Will this DTRT if the DAI is a clock consumer?  It'd be a bit odd to use
the MCLK and still drive the bus clocks from the CODEC but perhaps some
device can only be clock provider.

-- 
Mark Brown <broonie@kernel.org>
