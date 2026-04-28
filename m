Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5C53890FC;
	Wed, 29 Apr 2026 04:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436423; cv=none; b=DctUndLBdc3mK1WKBplAvCNA2z+4HsDtEnqoyjvocuzH2NEMdCos08FO68XIfWnXWC3qKUFpz8LCHSYMl2NcZ14bndeMwVs0rUt4Wu/0Vwn4PlIz2oKXgyXcvke0xwo3+If//SPjKRvWClwd1rT9z72rWklgMaBtJpB7sIlccFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436423; c=relaxed/simple;
	bh=JWBZNBsKs4T8x8KHeqTCDTZdBQGd4ulpbQX0mM3ZqFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jm+iK0ErJpuvd45ewi48hnXzmFD82LDufJ/xa6lBXVjFr38oV6g0J8kuZZgtVhvtJHd3CXGEOD+Hy/NcguY2QedKLBUKNWABcT9NdfWc+/hU2+/gK6Y2VmlUfqo4E25xEz6seoD12e+NazNJrWwSLSX/ecjrET6pzoOXSdjz9ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Na8pQQnT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Na8pQQnT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F7BC19425;
	Wed, 29 Apr 2026 04:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777436423;
	bh=JWBZNBsKs4T8x8KHeqTCDTZdBQGd4ulpbQX0mM3ZqFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Na8pQQnTwBLMbk5XGKTMkp+Kr+yM80iTIQ8GYIldy+dLTzmgWWk1ik9J5swOnJ0io
	 pIpUO5wc/wRoCfVLEnxbjrZS40gk6HHllioG6bTiiBVQ5y7zM6IHGm1c6HKGx2S9Vt
	 1qKl5MKpsLlnK4pXffN8f0lTyfohG/j40o70l4os876BLpUkO4aDgZuT+t/zzYhTgX
	 HZqmQ8np/aGH9tjubmk18izGsovIkMfdrDIDHR98YLJlUZVFFVQrC/p/bPsrCvW7Ih
	 M71tzvI/+YmolQEWC3mF4PHVHILxobyao5QwFh2JeKEF+EmST+ms4xzV4MgcN/sqW9
	 FAReQHIZKwBfg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
References: <20260428074758.3087437-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL
 checks
Message-Id: <177741827851.363516.33934947282643519.b4-ty@b4>
Date: Wed, 29 Apr 2026 08:17:58 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JWBZNBsKs4T8x8KHeqTCDTZdBQGd4ulpbQX0mM3ZqFw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8YcDqT6TrZZ2Ay0R5lcPzmdYUb+6ylVQzAJKJ
 EMvchclBk2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafGHAwAKCRAk1otyXVSH
 0BUVB/0fGcYCDYOqn/KnsoIu3gWWhuihfvh9GNP3FNHR/4W3GoljPejF0C73QoHMnSs+wjoNIqT
 63sCmCiv7bVFtFKIO6EjXOHOIem141Xf1nMzeV5kkTATmvhiT8yAqw8We0hC3epNxZY6aO5iKFg
 jO7lm+rsv3bFu5rsIZoFe33TkFF5jT1rqjqqAn7sPb99uLzLoPrilKKpyUfImE+DShQZRdJgQiS
 Q7yPGrBOQew0VtR/26VPPppDNW5QO/RHnewxzqm/H7b8JnbJ1cImHsSiiLSSBJ5YqTrv3eK1xy0
 FV+oatfemJQ9OftJT9Mt1UkztQIv/xuKXy9hh7vVcu+h3/Zz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 28 Apr 2026 09:47:58 +0200, Andy Shevchenko wrote:
> ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL checks

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: Intel: cht_bsw_rt5672: Drop unneeded NULL checks
      https://git.kernel.org/broonie/sound/c/ee26bad1b52c

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

