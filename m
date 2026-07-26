Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D42C3F8ECC
	for <linux-sound@vger.kernel.org>; Mon, 27 Jul 2026 22:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785192941; cv=none; b=e9y8VsN1ttqGmztYFX83aUkWHs2gGejND+QLrrZEr6NY/IcmDONaCA9ZYyzmRhw/4wdj6rdZ+aCqzRscho9toClyGoLaL7HXB5OxySeG2XtTDAjNVOZJY9TE8jkdblBtkwPVlow/0p42HbmfSWRwYJxJCyLP4eeQc+kjg5qz6qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785192941; c=relaxed/simple;
	bh=TQ1eSKEo1txhPUEigIU8mPPTXRAUmki4tIERNDh8hxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DGSEcak5MAqTNR/InywVf7BFrMf1dHBpakEVxZzzHqfxFk4OcB8cqYpwc4LgJy74uPhgMCRW9dyNYAcuJDG2MeG+nPZgeV4vBoFRPB1PEVSmTrS6sohjM9JVUdd42W2i/fn/HfZHZf/KG+7fv8V3AGMlnhz9WB1AfaJPpp/xTRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMFPygio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMFPygio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B971C1F00A3A;
	Mon, 27 Jul 2026 22:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785192939;
	bh=2rUUeYF0sk/47EcI8jv8Rkup7AJvo3PrNobOTVCAvow=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CMFPygioovJGQjw8VzxxCWeEL4MBDnPLe/Bu1Ze5W/HoLz/Lr/gGJnd0DQiZhTe3B
	 ktLxMnSA9lygEBrX1o0zLYysj7yOL6Mw4BBUhAgaXa7gzckbRasfYfOaaG/+KFzyv7
	 AlCQhLR0LsN4V18/gVDMcEuerBOWGsE+XK315LwfqUDiELs8vQjhRqFv5DbUpguzMH
	 XRCgqjAC3vQ0qVOzWB2tsTGxQUcgt8me1EwE89IYP1zKk12QjR7msgWbB/BOFRsVyS
	 mJQhqJDXUPD4OZ6FtyIrc1r3cTMzCjTMZJ83yh5GTsJWQueOoBLd1PORYPWj0HTE9f
	 et4xwbXysW7XA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, 
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
References: <20260723070521.870256-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: soc-acpi-intel-matchs: use function topology
 by default
Message-Id: <178508622170.10630.10596567270574090824.b4-ty@b4>
Date: Sun, 26 Jul 2026 18:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2243; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TQ1eSKEo1txhPUEigIU8mPPTXRAUmki4tIERNDh8hxM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqZ+HpejFAUA+3PxblXPffNV6u6V+B03XITz8y+
 sGa4+lAre2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamfh6QAKCRAk1otyXVSH
 0MRDB/4huLLzHh8a2CXhFmKhY+uZ+B3Vps4JnWCHTEP1/JGCadpLZlhfL6VDp5WJg5mSVa0dExY
 2mOmo7o+s3B8sJh6Tc00+lAs6Br/vjBMYoHYIdirxy0CxOywlfj0nzNU/JDcsC0uNtWM0exrfz2
 rL4YdJEwbQ3Yy6N5Z4fr6O44UX6miRwYh0gVjtGPTHHtGAmzP42llk4rf7seMB+w7TT7142InpO
 Z8NolQN6dQXLYYfoDE/creO7tL9pTehcgLjk+b11ViV49CWEE9a6l0PpT0cV3Z/hnnDfPorQ45o
 XYq++MpgO65XhnbQo9qkNap7wKdJwCBv3v+QUpg3+10WiZmL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Jul 2026 15:05:15 +0800, Bard Liao wrote:
> ASoC: soc-acpi-intel-matchs: use function topology by default
> 
> With commit c84179a1d36b ("ASoC: Intel: sof_sdw: append dai type to dai
> link name unconditionally"), function topology can apply to all
> SoundWire codec configurations. Set .get_function_tplg_files callback to
> use function topology by default. If any required function topology can
> not be found in the file system, it will fallback to use the monolithic
> topology.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/6] ASoC: Intel: add snd_soc_acpi_intel_rt712_vb_no_function_topology machine check function
      https://git.kernel.org/broonie/sound/c/c626e2e0b279
[2/6] ASoC: soc-acpi-intel-ptl-match: add machine check for machines can't use function topology
      https://git.kernel.org/broonie/sound/c/168e80166596
[3/6] ASoC: soc-acpi-intel-ptl-match: use function topology by default
      https://git.kernel.org/broonie/sound/c/3b4cfca660b5
[4/6] ASoC: soc-acpi-intel-lnl-match: use function topology by default
      https://git.kernel.org/broonie/sound/c/c4611d4c476d
[5/6] ASoC: soc-acpi-intel-arl-match: use function topology by default
      https://git.kernel.org/broonie/sound/c/3f17f5a1e2b2
[6/6] ASoC: soc-acpi-intel-mtl-match: use function topology by default
      https://git.kernel.org/broonie/sound/c/da1e707bc258

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

