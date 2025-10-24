Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5AD30FF08
	for <linux-sound@vger.kernel.org>; Fri, 24 Oct 2025 10:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761301428; cv=none; b=onBVBoRXWecfP0uVsy47JzW+wdYvT2unfsntAEiCdN6wJi3cJAcHv8Px57ujndvibPpkmwh8OlxebMOnhS1DH1vo7U1I0y0HJqV+q+bPuHQkKxcBQ6L/Kl+7HGAJC0/wDLsps7EqFlhxa6ZHXludg2yOdz7tthxHXKaeYaSN2LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761301428; c=relaxed/simple;
	bh=ewwHoBO5hyBSShEsXADH6ATkKhiGMstG4l531OoXCzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RNy5u/O3p8vh/PPuU3fq1e8nScG3nuDhok77HzwSr/5Sl7xHUCF6tBfj4EC2VumHdbWucTGwAoCBi17akPGCEqw7xPV6Kgbdqc6ZbePZdUgcpC0bu0fJd2Q32yep7rK8WUte3VRnfrevx6nOXL4T/5uQHhc8Uw+fSqN6OAnsfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEuo0b1R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEuo0b1R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7494AC116B1;
	Fri, 24 Oct 2025 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761301428;
	bh=ewwHoBO5hyBSShEsXADH6ATkKhiGMstG4l531OoXCzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jEuo0b1RV/zpUWO5nrcGR1P78n6pXagWXQGdBZdmzy3gEtwMhGwoaIhMgTOHNoSYf
	 o4RM5GdYUDalgsZcZXLYzia/AxnAn9OfqyQCxi8WmKupuytAic1GePk4e7zxAFUBhL
	 B2yBaPLsiLQ3C9D0qvipFKNFNBOH0nU5aahgqFP7wl7c//njq9PV7vNiEsHEzeI+Ex
	 uPZdHrGSoJ93NwW7CGiYTN55f9UTsOzVm4foV6jItTEUSn1HgCWihs2noE7fbMROgI
	 6vDZYIzyr36wIKxE4FjwThYjBdzjqYjvSMqSUlcLuAxcewSJbg159/QfbDaWlDSY3Z
	 KVY7FnYkDQTdQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, shumingf@realtek.com
In-Reply-To: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
References: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: add name_prefix for rt1321 part id
Message-Id: <176130142719.10077.2553881928350299183.b4-ty@kernel.org>
Date: Fri, 24 Oct 2025 11:23:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Wed, 22 Oct 2025 15:39:52 +0800, Bard Liao wrote:
> This patch adds name_prefix for rt1321 part id in the codec_info_list.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sdw_utils: add name_prefix for rt1321 part id
      commit: 3293d3d7b08872cf174bb768b890655f1b22526a

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

