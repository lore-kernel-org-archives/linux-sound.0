Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBB03B4EBB;
	Wed, 18 Mar 2026 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773850887; cv=none; b=BfC13aOrfJYSqInTj95KkJREq66q6Tv3j7bTgFbQorzqiCUjB8Z4ZwjuIWKCkUqzk1qVvKbe3e5VPSut5PG+qmR/22uepq0F1izBJIHiszIbul6aU94AzSTKUHC5Vde86DY+VAyJYQtQnd/QpOSX+340pIwZkOIUZVUP5zIOsog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773850887; c=relaxed/simple;
	bh=/EB/uHdixnUIsbGBPolGTHHeUAvQLqea0DxfJsTkML0=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pnCSebLUNoD+BtXi7221eZi13p9wfuazndykqptylMObkT5pYjRGh2AhK9T1tsPvdyHNYUqe6XSQsLWJUqblKej6VBf0vFVysodFb4wX805dspulpy5nVF3y4k6u9PDL/v+as3EO7pip4TMl5tjqjYWXq7L0tp2bJCztwyBiw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aq4AfMJg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aq4AfMJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E0DC2BC87;
	Wed, 18 Mar 2026 16:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773850886;
	bh=/EB/uHdixnUIsbGBPolGTHHeUAvQLqea0DxfJsTkML0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Aq4AfMJg+0FMNGdRUJ+sj2nEmAi7F3W16j9H0mYxmMKEwRwHwHsImBE/CGyOb0bsW
	 n/FlcsCOQYL4bpCaVAJqkr2IDP6QAC41l/TtuXlyAK767K/reaTCjfSQrVST2414gd
	 qKfoYZ/YsnFYtJPj58oeubCvLB0zXCQUkQxQnfncJJYRpmk97CYEeeAS2DHxVEzgWJ
	 mS8E5tN5n6RUU5+rGRK/myPw9uaQ8P0G5bLsMFJA/MtepakIDbD9aFD9/VaL5B9RaT
	 fN0wi3tr5TFQ1WoqDMoqqT5w5bMHeanZQTuL5vx8v/qTOX2AKzvjgWwPZag6VufMZl
	 fy2BcwhQkx9Yw==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alexander.stein@ew.tq-group.com, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
References: <20260318102850.2794029-1-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 0/2] ASoC: fix usage of playback_only and
 capture_only
Message-Id: <177384043777.5804.1690204717989500617.b4-ty@b4>
Date: Wed, 18 Mar 2026 13:27:17 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9787
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/EB/uHdixnUIsbGBPolGTHHeUAvQLqea0DxfJsTkML0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBputEEwXf6dvdDoJUf/BLD8MMTBDbSrUgKixREu
 v3BM8ltImiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabrRBAAKCRAk1otyXVSH
 0OtfCACCaPAu49sfMKF3u8+ljhs6G85Hp3KlOQmwDVjUuIMfl8Un5Yy3qOWCW618MjTnTf84oUH
 ug8iUQQIbaytNH5dtoYS0k2J7TV7ww014UumGMMJrNtD0Z+pmVT8DeGQfnGpU4aO9ni0cOPSC2T
 JNftKddg3flyIIlBbaKR2JCqdQvspw8ZcyhRMM7IGd0hOvW9LlppfoPWSYqmgnN9fyvIk/MymEy
 c/4UrtvSCu8TvAIIWiHfR9xLaXymayI6jPsTlvR6AzpZetgjYirAsRleSC7zoA8pL8+3FxWsupV
 xrvhoKoPMqTAFtxZsLylYX5wTS6ONLR1prU17ec9/e6PbGo2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 18 Mar 2026 18:28:48 +0800, Shengjiu Wang wrote:
> ASoC: fix usage of playback_only and capture_only
> 
> Check value of is_playback_only and is_capture_only in
> graph_util_parse_link_direction() and initialize playback_only and
> capture_only in imx-card.c
> 
> changes in v3:
> - initialize playback_only and capture_only for each loop in patch 2/2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/2] ASoC: simple-card-utils: Check value of is_playback_only and is_capture_only
      https://git.kernel.org/broonie/sound/c/0e9fc79132ce
[2/2] ASoC: fsl: imx-card: initialize playback_only and capture_only
      https://git.kernel.org/broonie/sound/c/ca67bd564e94

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

