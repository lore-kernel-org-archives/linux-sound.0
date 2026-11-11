Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484245;
	b=WNfPGZSTUtda233yGdbEtkho04uY6JZtH8qWVhCdzm7qlRXInccvmjuuQrrWmoiIDn5L
	 UmYB9faPovZgnju3oOtztzt7Bi3speb/kiKIOm6eRpgIqYvGpwPJ3S1ZzPhdOFNUrGVnb
	 044ilgpMCQto3YpjToVxecRm5+RbKSF6lSDShulAf704BLl9ypZGRUNdylTI2Izr6KBEy
	 RhiwOQoaHpuLHYNJwdogRnjSmSHGOc+hUkfCWnNuisMjkyOpDjUF+8vSe5U/bU1Ns1oGX
	 IWjW9/ibSSrHquserS42t7gO13prGqVZI7yJ2cXn1WEaSV4HdtmIz46T3oFIvXA7Prg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484245;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=345mQoD8JftdJx5JnjWsiPPU+f0H9IDLTyjnMxP2r+U=;
	b=3DbqzQnR9VQpPVZNVBB9am+mxVd70S2bqoiBKklNi27D03dBYLIJIgDSiM7sfwdWtctq
	 ggij+qWfG5BcB0t7/VX8xcBCPF0bbkJZab0TO4ADp6RuCQtBZeTZlFVtj3dMT5FWMRONn
	 3sOmeqpbm4WtaR3jG/Hu+o6P+BszPzakPS2aEFsUN5jqDW+qpnECPfWPofVc7G9MxzH3/
	 sxjmra/agIITxN2Bqlo1YRczTMPk1gcrXePcofrh2nGsoC93is2EAZR5A9upigy//6+0u
	 ZClADDLpIwA/cq93Bl/ozk20rQxfya/EE3hptlIg8t5d4GNIFpftbFwxtH8U8dMLICg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgXqKn+x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2895606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VgXqKn+x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7387F1F00A05;
	Thu, 12 Nov 2026 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484245;
	bh=345mQoD8JftdJx5JnjWsiPPU+f0H9IDLTyjnMxP2r+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VgXqKn+x/tpDxSir1bzndBinsZRrZOcD8AcT9hE78xD5+gmyh0J66O3jdgzVaP6oC
	 VI3lpOikrotkNf/sOzME5+d+gMRMvrQC9R/CPFzb5R/iEETRFp3hUJp/lO8AbvdmZa
	 +Tfk444H47v/et6t+5Q4NN7xBKOhoqW5Prkva2PJJr0ciFTM7CkwmVTZHkK/fylKwv
	 jIJ7SKCxu30pZPrq+a3AanA2AawKPRNzwrI9nZBWuzRJOTyM4yqba7FerZQH8VnssM
	 e4FursPuKyehAavTWJ8FlvZEe3ceoO3wekiFyqK0IzDnjxow9OiIaHDDQB9UCKmK08
	 3Q693A9mbFyYw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20261104024047.1508601-1-vulab@iscas.ac.cn>
References: <20261104024047.1508601-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: drop the ASRC device reference on
 probe exit
Message-Id: <179442016743.393238.15199613082080741753.b4-ty@b4>
Date: Wed, 11 Nov 2026 18:02:47 +0000
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
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1148; i=broonie@kernel.org;
 h=from:subject:message-id; bh=lZ2H/ml9eX7NRB3IqtIG43AmPeJvw7J1SXjcXAaI8xk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+rhDU+p2674WExoOlfa7NxlfY66xyOlP3HlEtmfRs2
 ZfPL3UudJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiu4oYGaZsdrEO6du27JqI
 1USzZlu/i9889nekP5v5ZdFO98BwzTZGhoMWVQ90O9qltaau5H+z7uzxrbZvAqJ+fjy9cNXVm0e
 4QlgB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 04 Nov 2026 02:40:47 +0000, Wentao Liang wrote:
> ASoC: fsl-asoc-card: drop the ASRC device reference on probe exit

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: fsl-asoc-card: drop the ASRC device reference on probe exit
      https://git.kernel.org/broonie/sound/c/a3ab9f0e66d6

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

