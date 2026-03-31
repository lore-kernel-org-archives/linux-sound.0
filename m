Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B2379990
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 18:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980942; cv=none; b=KFVMRWbwCb3z8G9zZlWGmc5gARZdsDfiL3w+4eJpC4zvNWMld02rt41oSXqihvr14SYQFj3z+vId+Sc4Ppb3PF0+Dk6PlZtH8P4DqUYhDna1IXeyGqdmM7P5wvYvyza1zPDs2wkKEggCCgyRMH64TjCfxnyOTltTtQbV7ex0HZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980942; c=relaxed/simple;
	bh=1On3tkfHtuUqZ42tiX/Gjl/3ZJcPlfdKDseI5KMbl/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sRYOtOaUdLSAGNq3+coGFGyI2i4v9EIDyHDBRwlPZ3zLTtl9tgSbRTENCXq5c0hsRm17dlebx4hrzyW6yEOBvxoYcv+5gLza9vUJpNAQhaLN96fgOHljq1shzr0CR1XXGmshH75rmU5bd5XEsQ2QASmerDzYxfNHFHUUWzlvoqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UadG3Cj6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UadG3Cj6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A575C19424;
	Tue, 31 Mar 2026 18:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774980942;
	bh=1On3tkfHtuUqZ42tiX/Gjl/3ZJcPlfdKDseI5KMbl/U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UadG3Cj6L4Z5uqIWsomnsYZ0S03hIxnhuABS1zQZg/lsFQUSc4rdFd6ZzWwWoMQAI
	 gIX0uzBVhj2Nm8cNHtlFsoF9pFxTmFZLU6Rgpsg1Nn6FTosIKs9WQT7mioLuq0ErSo
	 Uul1o0JweqXEkJ8lqr1fPQkvM/aYYrwRlbhCt6L56xIk8kSVJp2epvD70EVrTyESOA
	 n8POqGs4OjPXC/dxLIC3scKUatVlZ/F5AomIUU9FjMcNx0Lh5sWvsjnLJvVmy35Nx5
	 +MyTNMYu1SZvNKRbJ/eD9zUj4gJBbHBcmwJOVH6jDZA1urIsC6I5RallKPuAvK+kPc
	 XHCwvlLXlQYAQ==
From: Mark Brown <broonie@kernel.org>
To: Sachin Mokashi <sachin.mokashi@intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, 
 tiwai@suse.com, pierre-louis.bossart@linux.dev, cezary.rojewski@intel.com
In-Reply-To: <20260327131439.1330373-1-sachin.mokashi@intel.com>
References: <20260327131439.1330373-1-sachin.mokashi@intel.com>
Subject: Re: [PATCH] ASoC: Intel: ehl_rt5660: Use the correct rtd->dev
 device in hw_params
Message-Id: <177495703872.39905.15311038962779078112.b4-ty@b4>
Date: Tue, 31 Mar 2026 12:37:18 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1158; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1On3tkfHtuUqZ42tiX/Gjl/3ZJcPlfdKDseI5KMbl/U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpzA9MzIesCcqy5Q2j6NfNOjKKNT73PpIzYa+ln
 wU40Kya1tqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacwPTAAKCRAk1otyXVSH
 0B9eB/oD4qGFG6k63uo6Fiffbo59pSZwlBunB0QGGImyonglp7YOBjiyQH0hqCDQM4nLDvyUVYd
 4kOejhfMeKmgyPT5/3GmeEi1ez6yQeP2DJqPF8KDaNcRFjenyW3HjrrJnjBQe0Fkdi64IxoRtfq
 PD9s/nwWGfO9GQzTNSK3Zfb+94BY5L6vqNqWM8RVbsV7LRqxjT6etMleE1GXwfDkP/drCNrsose
 X6GIk3UTr22z3Ua6iEaKcMESzpFSXXCVVQv2r5DfKHf8cp2KbFUmc9VAgwe1IGm5KprOS7Dtt4b
 8ywjU4x1VjPz4yU4oLFlh+dKadoPFhky8t2g2+D8WCS+oJ7I
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 27 Mar 2026 09:14:39 -0400, Sachin Mokashi wrote:
> ASoC: Intel: ehl_rt5660: Use the correct rtd->dev device in hw_params

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: Intel: ehl_rt5660: Use the correct rtd->dev device in hw_params
      https://git.kernel.org/broonie/sound/c/51e3eb3d074a

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

