Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FFE269819
	for <linux-sound@vger.kernel.org>; Tue, 25 Feb 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740490724; cv=none; b=oj0Ih/sBzRXelbdo/mykvoo9hamoI9CIwbjqU6meVc19V+gALTXUcbuucgCX3/8Wx7J4O1TtkZmiOs2nLwgvQlGjnGq4K52o82QC2gLhZd1qUsKc9dT25+KNCZFCO5TXmkfsMdhMaod0PSXbTAhY8FBh6sAnR/aO32jyZHob5qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740490724; c=relaxed/simple;
	bh=VQQ3tfdhuiZOJaETR0gtKr/t8m/ZjoasMFKJM59eNxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QaP6umXdB8FDhPvhmhLM+6fqtzAUd0S6QkvvXmvQRzbWHc0YkjKh4o0XrHH/o9S+nMkKEskSIzPsKeoPtqOBRDQBKevK1NU7Pum4+NXyWrB0hFSv2xYyhEYocdkoziokdKjD6eApC0XqnZfG5CvAHaOqPQHOMzPe4aSQ5IxzZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWnU9YFp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWnU9YFp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0098EC4CEDD;
	Tue, 25 Feb 2025 13:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740490723;
	bh=VQQ3tfdhuiZOJaETR0gtKr/t8m/ZjoasMFKJM59eNxM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TWnU9YFpY09GzmUB/h2a/Ee/pjhwSk1gfjYvwNx897GrP4Elh5rnBVncT57Ceda9+
	 hFAYlYY0ozXGINzIDYL0XlSxPGK7KnIHAOdnIxkqJia5+DwiDieKUI4iX6jmpxzY5i
	 mWYnrolTUXB+pM8cUVYr8z18uU5WnaIOLonKSWv2BmdMSNsjUlR/bRgujR+2ygxRdj
	 Ev/FoYrdJd1i4syD7eQBdaGX386DHCvq+Cu5Elha7pn1VeGixtAI6lLkKhJcdM8+76
	 vkB4qRk6skVYu8SDmoYVHbLWKg2a7YBsBjCcL4SuArXu6dwvv4/hiP1CzbhTrjGbQo
	 FpK6QJRfDH/jw==
From: Mark Brown <broonie@kernel.org>
To: mario.limonciello@amd.com, lgirdwood@gmail.com, 
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com, perex@perex.cz, 
 tiwai@suse.com, Mario Limonciello <superm1@kernel.org>
Cc: kernel test robot <lkp@intel.com>, sound-open-firmware@alsa-project.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250221181840.2639793-1-superm1@kernel.org>
References: <20250221181840.2639793-1-superm1@kernel.org>
Subject: Re: [PATCH] ASoC: SOF: amd: Move depends on AMD_NODE to consumers
Message-Id: <174049072070.42497.4513505959055428564.b4-ty@kernel.org>
Date: Tue, 25 Feb 2025 13:38:40 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Fri, 21 Feb 2025 12:18:12 -0600, Mario Limonciello wrote:
> CONFIG_SND_SOC_SOF_AMD_COMMON is a hidden option that is only selected by
> other options.  It can't have a direct depends on AMD_NODE because select
> can't pick another option automatically.
> 
> This was attempted to be fixed in commit b47834ee4485b ("ASoC: SOF: amd:
> Add depends on CPU_SUP_AMD") but this just masked the issue as it was found
> in another config.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: amd: Move depends on AMD_NODE to consumers
      commit: 91b75129149429bb16927cda8b5642c04c59e6b0

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

