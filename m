Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152E9421226
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973728; cv=none; b=DnbUPzV274A3xvP2JerhpTaOTlwaEXY6nGJC5OFudvwARdbZA/I/OGldKmIkW+vbAVF+tP7xmxGsLP2NLwBrtifYJJLitoEieyfJHH36DhKlb07gEyQPnJEzWn0codzWyWLxZLKKHObjkdRV5LvRFRgrpZscQ+IwbkvadiDatpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973728; c=relaxed/simple;
	bh=LrBdPhDavb+tJeAeIWChP0aolTPb9ldz+gFRPc7byYs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HmFAc6BKbzSzVz7Ol9lS4dEbzIq28QC5EIiolQ3CJXtnMB2simbdC1Ynnc+GbDvCLmvgAEdFhNB9IDhtYgiRNhiEABJ50lQkGgwfa00ukTdmej8C2QBgwiPzcZDE57wURK5zCPtUxrfx+FEOALiz4e4AVNeJ+SulgZrX3M28we4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRZk/luk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRZk/luk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAC71F000FF;
	Wed, 14 Oct 2026 10:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973726;
	bh=qP/ID3pgeyVDOwxaYgqJOHV/b0l4+bEq/hSZcT1Xgb8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WRZk/lukP7wKKiBfSs1WkU55mVC0ClWhsbF7RBJ4VmdiVjfH4rXIS3CbOjjom699c
	 L6JpRIQku5WA+WzxssiKGhvNNIATzo28V3m/t2AotdIQVyt8/HKsTxPOI528n2OhNS
	 vdij7L+uvcw4dpJyyWcKlIDbBr8DwCreeY2Wd1/o5Oz57atKG86bq0fNWlAwyj5iMQ
	 YiEisRlWFhT32DgXjoyjgejPxQPsu8Dp9I4KAcn6X4mOSV3n+Z2v2Eo4AwlaZFHN23
	 sZdV2XZdFm+uvd01tN7jOLUyr3dTXIQ/dQAZJEyC8weUAOEm6tG4Ke/W7loszZHejy
	 l5rjFZSQgx89A==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20261009052942.17346-1-peter.ujfalusi@linux.intel.com>
References: <20261009052942.17346-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: Make sure that link and host DMA
 is coupled after use
Message-Id: <179192409531.1606900.16471414907474466797.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:41:35 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LrBdPhDavb+tJeAeIWChP0aolTPb9ldz+gFRPc7byYs=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOR0Z35EtPtSxceGaux8crm3O+HF38jMcr8owsZ9Xm3
 Wcf20206ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEyoQZGS5ceWL9Y9/fIzpv
 1/kt/bBQwLZG+sfl32VdayNOmPMUXt7A8L+CPftSwvmY3SwiATIrPqme/Z9RK7FD557087R/Kq+
 9n/ICAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 09 Oct 2026 08:29:42 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: SOF: Intel: Make sure that link and host DMA is coupled after use
      https://git.kernel.org/broonie/sound/c/0688699b3612

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

