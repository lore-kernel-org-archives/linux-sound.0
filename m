Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293D21991C1
	for <linux-sound@vger.kernel.org>; Thu, 14 Nov 2024 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731598560; cv=none; b=LHRNMdTjwiMFEVvC0GIZ4KdyuI3xFyZG/sJ8KuhNYgrrEZT6MSfreGrWyrWO8P/0C6SjbNtzr1AZujPFemd862OIbGIzG0/h4RgTux6L7a6psYIqJrCy989DErj2SrdhjqKXJRrOUUX2VeeiARXXTJtTgdckpAoB6PwBdtXIIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731598560; c=relaxed/simple;
	bh=Yxou5p6OwiL/13ULYLXD7nB7JhjndZThvXwu7igUhIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aas7QYUtR481OqTmCSPXpP3F3qdEGrKcUnFOGrkwrYRJwW2snOLjPqX/Kcr1+92RvLfiDuzUdTnkL72ChSiXUiiPGaPgEPgAOdHxR9vSO2g+5vuI6CkRLLf5+1EKlbVhtD11axO+hj3msiOdcrsozbCIVD8QAst1fyGymEGm8vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uDaIs4ZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uDaIs4ZP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81330C4CED0;
	Thu, 14 Nov 2024 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731598559;
	bh=Yxou5p6OwiL/13ULYLXD7nB7JhjndZThvXwu7igUhIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uDaIs4ZPUfcw1nRFkWZyTASBbBw2IN+5H63X0qnas8oNRhcaRQELZ2JKAw3ikGHCL
	 kS7kZYrP2h6iR5ASoKCnCp8mzHlsj7s7dLF/8o5EfraIcRqe88zhUZeR9GftUtoW2y
	 Q8pwsBDB3vHTm4Kstgj0dldPYbDhLmPVpL1zo/GKTU+rJ0sWp7xMIWEMJxtVheLz9J
	 ZPK6/YjNlmc5w1aNHJPb53FMHup2nJc/bSgZZ5Y2O9dejXbce7kDDv4mdirzVOR+AP
	 1WQQqKR9Kiyz7lu/DFFxvKoJxTnDGzLXpmwWetjumE4zTbP9s3fUYgBPBNPV+cG5EI
	 cP30Ki+zuhBYg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, pierre-louis.bossart@linux.dev, 
 bard.liao@intel.com
In-Reply-To: <20241113064418.162592-1-yung-chuan.liao@linux.intel.com>
References: <20241113064418.162592-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi-intel-lnl-match: add rt712_vb +
 rt1320 support
Message-Id: <173159855815.505512.11111099235229476107.b4-ty@kernel.org>
Date: Thu, 14 Nov 2024 15:35:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8

On Wed, 13 Nov 2024 14:44:17 +0800, Bard Liao wrote:
> Realtek Gen6 AIOC supports rt712_vb on SoundWire link 2 and rt1320 on
> SoundWire link 1.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: soc-acpi-intel-lnl-match: add rt712_vb + rt1320 support
      commit: a59360466a712d416f8cddfa4e52e118c53aa3a3

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

