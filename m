Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508E73CE0B4
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445385; cv=none; b=OZ3146TVHM0Pyz49Q4VPlxmrZr13ECvGxrRsLHyRGDMuMgnu6S34aJiX4SB9+Ba7N6VC4lFsPhpTwGrMCqxrapthOQfd7dJXw7CmzaUuqNuhoPeTeOhRMONkf7qU+8qoYX3zApO3WGZgZJU/C+erNzN4RT7cCA0BGVdbLGTrXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445385; c=relaxed/simple;
	bh=vTfXDbzN7k135QP/c3H6YSLjyyWxHfuh0iWDi+qXMsU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BnyRbkz3JJ9MrSXz8OVbJMRofkJaheUSzyf9LFF7zFd7f1WZRfaZ6EsQYexw6fZaCtFjAejF6Z96H8WdddvB3vePNKWvUX8+CkZoWvGsUlf5pN+Noa9kqR8k8DztIfLnjBZQvzzSj+rOsd4lEgpd6xrYzKXpptupZNVy5VEZG/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VTMQQ82f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VTMQQ82f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014FB1F00A3D;
	Fri, 22 May 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445379;
	bh=xJTPO4B+qe+uavvQxU4dVRLoWLFZUf88L+685Fb5ilM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VTMQQ82fNSze5dlVLkTb54TUEbsxHUgQiEgKMkpEhjtqKt/c5s5z5cdG8gWdQlKjl
	 JmOJeXKBFVlGCv+zTRTec3PsF46aMzyVr1A2oQ4MBp51m9l4jVfipbTHPXh2WfogdD
	 oah5kPUavEb9vU3m1pIpCijpVFT2CksgUlzfX8W0WIFw4eXNMAGiKbzPMQBjWItbv9
	 aPaa+Rb2TEgDwLHa1tns3rKxiUYC8P1eKkwDG3zRZPJCi+LSEXBmC44LkhhyPtPNNY
	 S477Q+gjlxa7lLE4IBaZslnPj5ckiHtdC6x44KItsxcj/IVFMUo3owWMdIiJrMHJZh
	 dJShPOTx2dupg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev
In-Reply-To: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
References: <20260520150639.25301-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Intel: Enable offload for UAOL for LNL+
Message-Id: <177940539913.58022.2361595138022681215.b4-ty@b4>
Date: Fri, 22 May 2026 00:16:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vTfXDbzN7k135QP/c3H6YSLjyyWxHfuh0iWDi+qXMsU=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhiwBvYa7V9fde/bvwQHPc92Mwg5Kr8WCxV24q7sfHc1ob
 GXRPnizk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYyHZn9v+lX5cu/Hv/stCn
 HydaAy/Ynt40cXWbyG0fRs2G4+K6eg4bhO/4Z5UEN5fJtSUa8txkFdphlLt3TrOjUoXx5JX6gks
 FimYftLl7p6fTX3n2tV7PVRosyewl119H3RXrOcXj9bS9v83JxSRyinM2400/lr9SEZ5v7mtufX
 D2zzr5+IVaVYa6bt8/CAit5ojhu2rzYpnmo/Vst0/pHvJ1EGwrmNnwVKt1TuMGj3VsFYyZSdEXG
 m10pjWmX5BSzJ60hX3+wppmEZYnTew3/vDG7s9wjxdfU94avCipW8fR6+6UXJ1V4R2up9USPh6t
 8PqhxveTO7BDb8vt4qNrLoc2fEllN2c7/bvV4efb/m3uAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 20 May 2026 18:06:37 +0300, Peter Ujfalusi wrote:
> ASoC: SOF: Intel: Enable offload for UAOL for LNL+
> 
> Hi,
> 
> The USB Audio Offload (UAOL) can only be used from the DSP side and
> on Lunar Lake (ACE2) and newer platforms the access to it's register
> space must be granted by the host, just like for SSP or DMIC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: SOF: Intel: hda-mlink/lnl: Convert offload enable functions to void
      https://git.kernel.org/broonie/sound/c/978152b2cab5
[2/2] ASoC: SOF: Intel: lnl: Enable offload for UAOL link
      https://git.kernel.org/broonie/sound/c/fdfbd9ff86a1

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

