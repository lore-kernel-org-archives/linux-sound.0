Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7F1280A35
	for <linux-sound@vger.kernel.org>; Tue,  8 Apr 2025 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116554; cv=none; b=X7lydpJ6csP2pm/YyyQBE0B/FCsOjL/GimHTuK3V9HQs4BVc65Ob8bl6Lf0ZaSQxQpp7E7YdoxJqv+5yGcORY0DXR0kzl6FKzw/L4oMjwFYI+4DbDlRxNG1tiEhU/WElPijKqXHrstOjaN9emrqFJ9SwaJ35hplYaNZcdJrXMy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116554; c=relaxed/simple;
	bh=cHZarZx54XJ7QLM1pem8jn2iBlOseqrt4kaErXwhawg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E1mL4XF6lmRh5kKWX3uNVva1Db37iKj7Ub+ovKBjiV+e6qiIsYia/1As2cvdIPIJbaK4sx33G3u4hF+ZJBzhU+meUn4XbY7H5doS1mVhYWblSD1NJRDMOPcDXLLHQSjuFjzOpnzjDedkvnIVKiQIS+4HVFOEDmHCa3mKg0+g84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnvYrzgb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnvYrzgb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C358DC4CEE5;
	Tue,  8 Apr 2025 12:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744116553;
	bh=cHZarZx54XJ7QLM1pem8jn2iBlOseqrt4kaErXwhawg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KnvYrzgbO0IG6H1CSaJpSisHZJWPR/41QJ9sBpAR4o4/qhIx0uaKh5l8ISNCsAnim
	 qlQinF+PFZkinUBDpW07hzCHiWz749KcEVsu6ioMmkgqfE5m22O+YA55LoyvXqWWpL
	 7z2ypDjZGctMnNldvfhGq11wrlZSHxPdwL+cREJRBFqU3CKnASjcXdfpM8QgJdBcKd
	 4uTblaWXdhN2pd8mCFUGOoeczK1lvvTyR+z6dBwuhZ52lkQPcFswBlBAcjB2xGLhT6
	 +nFlgVzeoBpNe3by2mnoknJxvJLAZ0PfmCqGJyFL8eVTyD+Hh/FyMcNNq+7ZmomtNs
	 puUFvDUtbhcPQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com, 
 linux-sound@vger.kernel.org, liam.r.girdwood@intel.com
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 00/10] ASoC: Intel: avs: Add support for FCL
 platform
Message-Id: <174411655254.2091760.4838830135739518789.b4-ty@kernel.org>
Date: Tue, 08 Apr 2025 13:49:12 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Mon, 07 Apr 2025 13:23:42 +0200, Cezary Rojewski wrote:
> The patchset is fairly straightforward - add support for Automotive
> platforms based on new DSP architecture, Frisco Lake (FCL), a
> PantherLake (PTL)-based platform is an example of.  The cAVS
> architecture which all Intel AudioDSP followed for years ends with
> RaptorLake familty.  Like all the major updates, this one received new
> name too - Audio Context Engine (ACE).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ALSA: hda: Allow to fetch hlink by ID
        commit: 318c9eef63dd30b59dc8d63c7205ae997aa1e524
[02/10] ASoC: Intel: avs: Ignore Vendor-space manipulation for ACE
        commit: acd2563f30886730757062b9b3efe8043daabbc3
[03/10] ASoC: Intel: avs: Read HW capabilities when possible
        commit: b9a3ec604993074eb6f5d08b14fb7913d1fae48b
[04/10] ASoC: Intel: avs: Relocate DSP status registers
        commit: 75f3c607b1fa1f4d42cde8377cd2276ab01e287d
[05/10] ASoC: Intel: avs: PTL-based platforms support
        commit: af1c968d25c7c44cd2738349c479f8b610a3fc40
[06/10] ASoC: Intel: avs: PCM operations for LNL-based platforms
        commit: 716643786f140f2d68f22424c75b9198ffe14290
[07/10] ASoC: Intel: avs: Dynamically assign ops for non-HDAudio DAIs
        commit: 86b59ac80dc5a136bc434c12d37420486eba48cb
[08/10] ASoC: Intel: avs: Conditionally add DMA config when creating Copier
        commit: 796b6ab6344e3650f0da92d6f2b8a7090fe6351d
[09/10] ASoC: Intel: avs: Add boards definitions for FCL platform
        commit: 2b2e091271b0e2a7677619d4d2ccfc9bc6f1cb96
[10/10] ALSA: hda: Select avs-driver by default on FCL
        commit: 387ddbc7d474967589de15043b47a441f95a50f2

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

