Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52343D5C3C
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443938; cv=none; b=FIhITFin3lfJ9mXXDAAtpOqIO2FIh2ImXy+qVOs6kFgWc9Y6tTFI6oMQ/PFloM4773SIIErkCX5XmJt0nNpT9/XU0E0X0Uex7lNbXlk+H8NMg9Qi1EAyI7+9UpT73/yT2ALvGvQe9Kmu8okJVlU/lDWicA+B4+pbo1ck/fdtXWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443938; c=relaxed/simple;
	bh=S/h9h03lQLVu40StmL5wZB50b196OkyTTDnjdKx0hqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=emlnb+pHYPY04lRygtoxByM5P1LEdW7Zd2yuPRUxET/QfqXCYZ30Ztdy5lufah7Wo94yueo3ig9O+NP2n0cnWUPSRShWqDyvWexqoKFVJDHckNvXkVtM9Eccd4EeLgz/pCibn3VbI6m+YJ0i27YNIRfOKbB/G+LwK6P2MpVOcbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0mFrBIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0mFrBIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B491F000FF;
	Thu,  8 Oct 2026 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791443937;
	bh=jECVxjPLgkT4XRyTsIXggJL2UpccXdsZBHZoujf0WcM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X0mFrBIlz3/Bf/sD3/hoUKOPBNA9p8e0DHj6ii0GuhsjyghMZiFtR4craV42DnZzv
	 K3yBl7gjbc4gIoOoQVHvi0DauiRW6Nd8zRDvnoHZbogJPgoLbQORRGhdZ+M+Z5CXwH
	 1NSBwGbu3pqKCG9yjOrrMzFhTVaTFt2pSi5/Wrq7ECcdqmXxBI3+DvhDO5BoOecBSS
	 IfkkD4/r4B5p4/OOQ+hez6MMX1xr+cerd5UzUQML3LY7i+gO5oQm5wKX+oEGLF9+VE
	 KUlbYn5SLlCZkUJU7JRBRy2o5Ir03eV2HO7U5Kgbjfm12RHOPRqrWsiNM0gCbR9PDQ
	 wKbjQPXTVS+xg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, 13916275206@139.com, perex@perex.cz, lgirdwood@gmail.com, 
 linux-sound@vger.kernel.org, baojun.xu@ti.com, k-lu@ti.com
In-Reply-To: <20261002025230.1959-1-shenghao-ding@ti.com>
References: <20261002025230.1959-1-shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2781: Fix TAS2781/TAS5825 PPC version
 logic conflict
Message-Id: <179138779227.2423942.13883691329504292072.b4-ty@b4>
Date: Wed, 07 Oct 2026 17:43:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141; i=broonie@kernel.org;
 h=from:subject:message-id; bh=S/h9h03lQLVu40StmL5wZB50b196OkyTTDnjdKx0hqM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqx0Pc04E6qoyy1bpmGFzYDUijW6hVsQlYEZGgM
 fImuvfJGBWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasdD3AAKCRAk1otyXVSH
 0GS2B/4wP5Y2BGjjp60LoUc2+mvfKBfNwlCtEME//zmXQBkJXZovTK97B0weVoSkl5RZvuIsL18
 qjIwBiz2Iw65XQZxGrVwiYc4/oPeXM1KzLS1+YiyUFHma+ewsXUw1LtHWZfBw1TQTr/6M85VePi
 zZMlr53pugKxwuX91u0jauQlXVJAISb5bHJ8jfe8XdpsBNlf2RNX2Xt82TJB/ehNKaS3Vi/1ks+
 U8qLVWZkh3PzucPmNrPGV5Z6hsSdMex9rB0EXcNjJdxdRdgt6OMfd2w50bb3hww23WMN50WZLTC
 FDVdXQu8BjgW5cJAwcP/QGQCDuPfROpfIwC9l89/EPVPcds/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 10:52:30 +0800, Shenghao Ding wrote:
> ASoC: tas2781: Fix TAS2781/TAS5825 PPC version logic conflict

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: tas2781: Fix TAS2781/TAS5825 PPC version logic conflict
      https://git.kernel.org/broonie/sound/c/3a05cc2d7394

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

