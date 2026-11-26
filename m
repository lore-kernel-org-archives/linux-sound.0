Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795724247;
	b=l+DrEJlipqP4HnC8KGOj7o2u2ePKXeT+YgubrmtAZetHHQ5ebSIaGfPJ+pQ9Pr/45xbD
	 qS8JzLy0pBP9BMQ9OTKeso2QqHRD+axkumqlzQo8WYnz6t81zQkkmvjUZpDgd6V2kAs4F
	 LX0GXwMsjokg9NlBBOPOawj96gKfexu1dppFhKEAumtoDV3TXy8syOGkVy1scKFCg7FIC
	 hH2G695mPV96a+oQkzUB0uSmkU7kwQS5SWUInHHE/lKAhW0aBFn2cW5BFobf19UC5TAWF
	 zbTl4J6kiZesYOqeYvb/V1QjxeaPEIdHHvvXNvKqsvLMJhcAPNULmgW3J5HRhaEqbTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795724247;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OrAN9c3tynY/DpBuJ7vG5TphyhARolPWNJXd2naUKI8=;
	b=OfFe9vK4VrFilRlHS7FLNhVw0fsfgF4b8DOsnjvXlBugf5LLr4XpAeTcizbbxjkTr9WJ
	 USH8z///QjXqyHBBUsde+CY69WZKTwD0IAXKxK9XTaa8EZDeVMTj/F5JVtOT3oQGswm5F
	 4xONc+ERzcxX9yu5w2BfyNS9cQa7Ak3Vo7YM04pXctu9xFB5mSu9YkJvmt+YTinb9v7cw
	 YIJy7b/Eh/2vTUd30rHkAKqpBwJ/i4TNtCE6c56//jNduycR3FqnuDukasQpJexF5HFvA
	 6awqKGwmyIaeUpcagkkyObEcb6BDW6835DsWnrn+Lz1v+DF8clsrmaHeNuO6Rd/9H2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Wpk/g2h4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7678C606A31C;
	Thu, 26 Nov 2026 20:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wpk/g2h4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 483461F00896;
	Thu, 26 Nov 2026 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795724246;
	bh=OrAN9c3tynY/DpBuJ7vG5TphyhARolPWNJXd2naUKI8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Wpk/g2h4Spij0ntaXkGy+6B6FhE4nWLv1vbJr7qStLGWSUJkrQqqxJPQDITUqNtsw
	 7F5PxaE1zo3M+4C5RUnED7/5eZV0ZvzEJ+VIPXRkSX008mBIbrPliHgPT1gC2HS0Yc
	 /+MXTQaiUZzslkL/khjo58qJkl0Mkkmx4Yr40nJjLoYyNIaUXcczwEW2fNlxzf1z/a
	 R+/Neq5gTnUusAGwX78cx4UjOZ4zcM0W827iokfM45t0e9Cegi7UeJwgu2fTGLPKaL
	 1lWGtkF+OMbQEjU+ImGgzdfn8ljZaIz7A4fxzvWiJr025iwi7mtf5/viNDd98wD6pQ
	 sTn6uWWw95XwA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261125171831.1458954-1-srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 0/2] ASoC: Glymur LPASS macro codec support
Message-Id: <179571303906.142532.12603531757351486618.b4-ty@b4>
Date: Thu, 26 Nov 2026 17:10:39 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516; i=broonie@kernel.org;
 h=from:subject:message-id; bh=F1An95lPGxcReO+L4LVto08RyreBaE5IgrZNODBMBZE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Jl/6daWqceJ+JZMGTvsnNTqKB9K1doh2ZdWqzuENV
 F/3d/+njlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEykNpSR4dpnt+A/W89flNQu
 vf5U1f7TT1fPuKSl91Saz3aX7GjMucvIMPNOYeaqX4vvZP0IvXlsZ9R8Y0mmM59fMCWtUukQ+Jq
 5nwUA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 25 Nov 2026 17:18:29 +0000, Srinivas Kandagatla wrote:
> ASoC: Glymur LPASS macro codec support
> 
> Teach the LPASS RX macro driver about LPASS_CODEC_VERSION_2_9 (the
> version reported by Glymur's RX macro) and add the matching
> qcom,glymur-lpass-rx-macro and qcom,glymur-lpass-tx-macro
> compatibles to the existing rx-macro / tx-macro bindings.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/2] ASoC: codecs: lpass-rx-macro: handle LPASS_CODEC_VERSION_2_9
      https://git.kernel.org/broonie/sound/c/d8764bc050af
[2/2] ASoC: dt-bindings: qcom: Add Glymur LPASS macro codecs
      https://git.kernel.org/broonie/sound/c/9efa4eac7819

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

