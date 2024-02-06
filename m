Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0E12D761
	for <linux-sound@vger.kernel.org>; Tue,  6 Feb 2024 09:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707212268; cv=none; b=ddfzn/Hk77+m7D7//joZshjRpXXh1v1mYG5cFjfqYH5HZLzXvv74KUmSBTynfPSZvFyWX5Sv+Znv5h+ign0WSd28l7gLgDppzi05coRieOi+t3OUIwIOmCF05Kz7SqYWAf5SM+UYST3NuxkoT9h1xZ0WvXVUyA5G9QyTcWBFEB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707212268; c=relaxed/simple;
	bh=8Q3rZBp0QdSoT8AB/VNdTixvhfVDTbs7lsqe5RokcrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GRbY99tZoEG769xkxxoee02/TSIjgw4WjeyY4IEHGBex2Iqw+POgkiIy8UpljvoGib0/EX3k/TjMDa2ABpZ2fkQxu85//BjUDq7sXa9Vr7UT7NtR+zcb+w6MRxG6ct1qlNnLDiEODtbA0SEceoRAlMlY1q78jBRLfZBeiQ7I4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxV0+WND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxV0+WND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0769AC43390;
	Tue,  6 Feb 2024 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707212267;
	bh=8Q3rZBp0QdSoT8AB/VNdTixvhfVDTbs7lsqe5RokcrU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sxV0+WNDpEM1ppiMfgjskCS8Z3AtBmMOAoPmv5YG7hzhdYs/SsOECVrtAsjnP2zO+
	 O7GT2T04flURqgDe5TdxQl+aSvdShG36sPyGREp4QjlhTvbYeM5l0shhS8a27icXWu
	 37JGpWXbdSpSdF95Yr2gCEpLUQqXv4AJtqUu1DHSf7l4kmQmnPWi52SgEGAjX7PvNw
	 4RHhHaBKE3UtS3dnSRIDuqX9Rz/ORg13P+EjPLCOJfn5rliMsoIKh/g03OmlJaOT8z
	 yfOrtULrGXTr/30IsLeL1bh/7G8dprtT7gTuxK+MEqWGd2CeJqFn4fY8EupH7BKrrN
	 DoxZ2osUTpHDg==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, 
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org
In-Reply-To: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
References: <20240202140619.1068560-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: cs42l43: Add clear of stashed pointer on
 component remove
Message-Id: <170721226503.850647.13196584350173036688.b4-ty@kernel.org>
Date: Tue, 06 Feb 2024 09:37:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 02 Feb 2024 14:06:17 +0000, Charles Keepax wrote:
> If the component is removed the stashed component pointer in the
> CODECs private struct should also be cleared to prevent use of a stale
> pointer.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: cs42l43: Add clear of stashed pointer on component remove
      commit: cd2a2388614fcf2b9b626332c0da53a2c6cbf2ee
[2/3] ASoC: cs42l43: Sync the hp ilimit works when removing the component
      commit: 7fa1a01ba6cb64bc24e7ba0dbee589f3f09f3cf7
[3/3] ASoC: cs42l43: Shut down jack detection on component remove
      commit: 3ef9f445ddb1e061ce497f54ca75bbaec52a3a46

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

