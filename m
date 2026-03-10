Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE8B22423A;
	Tue, 10 Mar 2026 18:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773166617; cv=none; b=CAA0qWHz2EUrC7KpsTBoup6SZ3+pPTi1WUwql0XIi4F8MoAscNetm25/t17r0nK6Ri59osHGkKUmMFmmbNtkkviEBJCSFruo0zTvLxtUptAPgcXVk+f5jdR9jnehW7AFv9q6SLT1QxQ2LWowYfYB0XlPD90PyVhbfyvVz9Nh4GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773166617; c=relaxed/simple;
	bh=nDUKJKSS14X97yWKsZK3DCKxXmNEbO6twQSAQHC3gpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Qn6DNstT1KIGlWOgXWhyABCxyqG6RDaNstcHrOm9KDNUTXDkVdNReAnVppaooLqZJK0A2+1/etiaeAkVBfOkUu2dBSakTjY+F24+izcTsK4YV6kXggA1Qy5kl2DvUtXoSPt+uEgz7CqcfI3HPp41NdEjOzpgSFlh3r3kRkLvV/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOS0gekY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOS0gekY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E768DC19423;
	Tue, 10 Mar 2026 18:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773166617;
	bh=nDUKJKSS14X97yWKsZK3DCKxXmNEbO6twQSAQHC3gpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DOS0gekYmZvZ95KYxGsM+ZRfVSuX61h95EnM0KHckg9+PVmu5/JIj4tTxKanzGStA
	 0WMZO9XouLi5GKS97WdKO352xsIEncOsnEvVKeqNieU3icSQDusUxLRQZIpcWQXvJj
	 HzUMlMEFqpX7DHRmHiGx97apcj3iO29ur5d4F7nDvzTQg43GWYkg9UKzxQI9e0Nq10
	 i6aCoy8qxnrjHIxJwLJ8RN483MUIc5BKBDgOtEbHfl2bTTaDIC8BmLvs+UDjbsgTLZ
	 m+KBW2kI5ZpkJMTDzAYxOpI0DvS9d48feGXVwB8g6sNf8akBhxFc0J/CusLAkKxg5n
	 3tvzjw8nwZaWw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, lgirdwood@gmail.com, 
 pierre-louis.bossart@linux.dev, ranjani.sridharan@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 sound-open-firmware@alsa-project.org, Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
 kai.vehmanen@linux.intel.com
In-Reply-To: <20260310125106.178944-1-ben.dooks@codethink.co.uk>
References: <20260310125106.178944-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v3] ASoC: SOF: sof-audio: pcm_id is __le32
Message-Id: <177316661468.442708.8595142825025446475.b4-ty@kernel.org>
Date: Tue, 10 Mar 2026 18:16:54 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9189f

On Tue, 10 Mar 2026 12:51:06 +0000, Ben Dooks wrote:
> The pcm_id value is __le32 so convert it before passing to the dev_dbg
> function to be printed. Also fixup some other uses of __le32 data and
> a couple of places where %u should have been used instead of %d
> 
> Picked up by sparse prototype for variadic and printf
> function checking. Fixes a large number of sparse warnings, such as:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: pcm_id is __le32
      commit: 207fd1f4d84b7f073eaab556623bf4ad3a161f3f

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

