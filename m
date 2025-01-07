Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC14C1F37B9;
	Tue,  7 Jan 2025 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266552; cv=none; b=ZcT2nXKR/jjwi6JeKoi0DRB/rXXg5sj9lKliMds0EaaxI5u01oHWOnPyNBJdbDFuAn4/7uwYvm6fycJ6Gey8R3vp7KE0a7/n26dQDX8N5FILeugr13HOC5e/BoPUx48BtrN3z3xpWNsLVuMMLAV5wQEQd52U/Mi/yeSHtdbcDsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266552; c=relaxed/simple;
	bh=Xg8A/TjpxrixhtZ/rKSuUAcuSitn7Rn8nsOOcwBZVro=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jrFPfGJlzgS/9b09fB098oqgXsaA11QD4V6eJjef6/zbyAADUOO9PGYghJC87t0KNAUNApXHbaour0NkyfxDzdQTRxZJnOaFX8Bpcm5nrfaD5XaLtezqNPpLKw77DZ1ALRWHMaiiNZa6sIWb0S7AV7vhndBp7W31q6fByadRMiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lf0aUO+J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lf0aUO+J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5853DC4CED6;
	Tue,  7 Jan 2025 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736266552;
	bh=Xg8A/TjpxrixhtZ/rKSuUAcuSitn7Rn8nsOOcwBZVro=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Lf0aUO+Jpx8hq6YqAz+QKR4YhvrAFUXFzQcnN+vnsZJ17FaEDhkVDhz4qar42LCre
	 6wI8f+9yG5OcLvanzoloLHw7yKjAyf3HKRoAQs6derXIPWFoO+yBDNdmNrLSOhHVHP
	 OQLRlhwavO+5LhU7ygJ+LikC348ojITMSgVyJNj2t/EGpZYOBxHIWFLcsocoB6j1/R
	 Xg73y4kgO9XLZnrmwAInmY9fi+3AkS3PwTOzM767a4NaSf326TWzqEv/aatuqqWLog
	 gLToaB6TJhNmfE7Gzaq+FR5/0ADOcJtA8XU2OQDD6U5Nh9kGptozxsUFgNmy4mJ6z6
	 vjQJwMTjN1L+A==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Igor Prusov <ivprusov@salutedevices.com>, Andrew Davis <afd@ti.com>, 
 Shi Fu <shifu0704@thundersoft.com>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125901.227995-1-krzysztof.kozlowski@linaro.org>
References: <20250107125901.227995-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Correct indentation and style in
 DTS example
Message-Id: <173626654806.139336.10060556793703295890.b4-ty@kernel.org>
Date: Tue, 07 Jan 2025 16:15:48 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Tue, 07 Jan 2025 13:58:58 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While touching the lines do
> other non-functional changes: replace raw number with proper define for
> GPIO flag and use generic node name.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Correct indentation and style in DTS example
      commit: fffe003fc209a3c1f3d07be7e860fed4e51c4c00

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

