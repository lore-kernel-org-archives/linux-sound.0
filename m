Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF9144304
	for <linux-sound@vger.kernel.org>; Sat,  5 Oct 2024 09:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728121842; cv=none; b=kKE0EQxfGZaLLsxxWkHR3jq2wzHAmPj47rKGKoJrQo5jzZOGcZg31OOJFQqtCEOPGKqLUYA8H4g75rWmNVRZQ9ANzqMwBzWy3ZK+Y3Q370Bh1nZaiGRDPz5SEOOehIARg7mbgESzFG7c6ccgLmTYXiOfY1sxDXMfCf4vuE2MOWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728121842; c=relaxed/simple;
	bh=R4N9taiLk8988wcfvEgO/6xUaKhWwhASSEM6eFj4Y10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rZc6LUPTaIIdXuj6braYHjx4mQTTbK92vsFRqFz2gve7QmRjWamlJ8zw+7SFZxLjwJ3eY+h8gLVDNd1fQ21ptq9/7teB72n51miXSLy8M59SbziT/qQ7H5vh8AAm/0sEmKNEX7CpfnRTsBxXZwLOtNsadr92Ldcg2JtOsOrdRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pm1QHrol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pm1QHrol"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4284EC4CECC;
	Sat,  5 Oct 2024 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728121842;
	bh=R4N9taiLk8988wcfvEgO/6xUaKhWwhASSEM6eFj4Y10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Pm1QHrolJfWZWXaCllKUPsuufRecBmIOrPR+o76Aci62JP5s3fivVm4W65C/m3yPM
	 7dKdf/fTWEWRnzzbEVo5WmWNM5xaqaKB8/qRCkTfaqNtSaUxPkhIfN7L8h8agvmfua
	 aCErtDmMYpmYN+/AHE58wB7kKGsiBEp1ghHCpsQsba3eg7YUZlaXP0xTQw22IpsnKh
	 oGft5vVMQ/KC8ucwpkTnpOhgBVKycufq/NyPsx10x+GbE/8pmQlKMRoK6Swo6tOfme
	 vglLHgvBRJPKYN3+IrGmEBKdEYOE4t7LLLyuM7p3zZNt3q03j8xW2XJQx9n19RrwBw
	 Xxjv+IRL0akSg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com, peter.ujfalusi@linux.intel.com
In-Reply-To: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
References: <20241004030135.67968-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: sof_rt5682: add supports for new
Message-Id: <172812184100.891737.16193772453042006129.b4-ty@kernel.org>
Date: Sat, 05 Oct 2024 10:50:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746

On Fri, 04 Oct 2024 11:01:32 +0800, Bard Liao wrote:
> Add HDMI-In support for MTL and rt5682 support for PTL.
> 
> Balamurugan C (1):
>   ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for
>     MTL.
> 
> Dharageswari R (1):
>   ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: sof_rt5682: Add HDMI-In capture with rt5682 support for MTL.
      commit: 0f5d2228a99a4733b2a6652e16255be9caf2616a
[2/2] ASoC: Intel: sof_rt5682: Add support for ptl_max98360a_rt5682
      commit: 56d3705e4b36bf454965e66d8264356a23135aa7

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

