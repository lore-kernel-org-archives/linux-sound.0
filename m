Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11D61C84CB
	for <linux-sound@vger.kernel.org>; Wed, 22 Oct 2025 22:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761172933; cv=none; b=jVSE8YN3sVWnBL9FWQOfchVfabN11fMuEEwplzV/sDuca9u37oXijBGFZanCn40njDibNhfLET3KYGJaba+VhCw574V9Wsqn8Zw/e3I8I9xy9SqrBvoKrA9hEkIL0FT+VCiGM5Jfu3lBZ4a6L7t3scvvUBpSVSjR1bmMhYKmlac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761172933; c=relaxed/simple;
	bh=ewwHoBO5hyBSShEsXADH6ATkKhiGMstG4l531OoXCzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wc78JHc1/9RKfYPVBiHzeFYsGB4TIz1eXUaumgEeN4FBxn7MO/lNOHVdIGnl4bnmbk996apjbd0S3kaF4Ui0nrh0G46jLaS/jhra3syaL6v61+W4Wk4enYvOgfd2gRBVX5D9Hf2rA/JPdN0GnPZ7UHUKk5EVWJ+NOGcl5vQCdk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGwqeUqR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGwqeUqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33614C4CEE7;
	Wed, 22 Oct 2025 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761172931;
	bh=ewwHoBO5hyBSShEsXADH6ATkKhiGMstG4l531OoXCzk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rGwqeUqRDfQE8TD9nAoJP9COCOyW2CLpvXxzCghHofO4VDsciXdq8JqSRj1Ozn3gE
	 LWPMMSByiMpddffwSVwzevJ2Yw+VQHsKobe72nov6l6p+gqbadrdR9rQtgGBHpQodI
	 FoRt9qUlUKm6TG/R6WJAMuO/23/AxTUhVQObuLIRagSKEgT9gZBjRtG5qzDiQHt2Kq
	 roDky6d41MAc6RQAbIcFAO9gKCPpVuUKy402HFJtNEMQFeil2lhO1NtKhP4PcfwoDK
	 Y1J2JCw9Nn2OqWEVpnoYp6AZKMvos5kIzKc0qD/zTDw9NtzViKEH2k1AeCh17eX4kE
	 ioguajVTOZPZA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com, shumingf@realtek.com
In-Reply-To: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
References: <20251022073952.327451-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: sdw_utils: add name_prefix for rt1321 part id
Message-Id: <176117292980.371920.18192336996222606673.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 23:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-52d38

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

