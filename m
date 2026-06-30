Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677C4657F3;
	Tue, 30 Jun 2026 15:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834532; cv=none; b=F9eMY8rog/iPHGsRpbe4YUUCtr7gq2Tz8DELqy3hDJprGuHMmaR8XbRIwAi6iu74ptUKWXR+40Wgyj557L+st0axsS5El42hSZ0yOvmyElE66Pq4qZ15qFKSdZVurkrv33DuxdCNp2BUymFihsouxH1lL8lVjASMhNFusksEunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834532; c=relaxed/simple;
	bh=IWqhPea3UMTYe3I+5Bq6FEhVf4OuPvALvQkF61Fula8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Olha/GcL/sOekHhkfaa1LSbyxKRt/7F9vMKfraCtycYqRl05LT8PIfRjyOrf0vpNzLoUKToy5WBnijSJc0eVZwzHf9GAsLBe1CbUCC0Iu7UuCH1tosve3W0eY+ufPjtswwqdCSmlt/tBqLkGfLHVVAvJkWCPMYgd5GlLTbC1fu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwK3XWMY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwK3XWMY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8331F000E9;
	Tue, 30 Jun 2026 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834531;
	bh=JFQ+S+VQ3pTNW1Rk+9SmzLYX1Sof8hEqHS2Gyysnv6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OwK3XWMY+Eq1ynA4rTHqxR2WVi8cMsGarXIZD3JkuI5FmnWui4lOJj8B+UcbT/7W9
	 zlHPHPvIzKq3bihu3XWdVak5nP4m0hb0XcfS4+Od59cMQ6XYuoXDeCPG15+zcO0Nyc
	 WMp3Fy/X/R+hAfANAUTZ4Jm3ErXqS994SgigjC4DysHD+nee/5/XWuBjX4zNPQ72yN
	 7iEnYCrJyZ+4mLfyFKwVYzqDewtban5k8wFDgBnbkM/qOiaGIjpE5wMsDSQf1ZYG2k
	 NyJpyhMVx1cLiG4pD7c1snHBvMV5hcEIzDL3Zjz8sHolou+ei/eSbvjhuMfykIDtc5
	 gMcgDKkSrQ67Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260626082904.32344-1-phucduc.bui@gmail.com>
References: <20260626082904.32344-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 0/5] ASoC: Intel: Convert locking to
 guard()/scoped_guard()
Message-Id: <178281879221.79320.2260955693617638938.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:26:32 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1796; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IWqhPea3UMTYe3I+5Bq6FEhVf4OuPvALvQkF61Fula8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+Vg9Jhiwi7RCjI3b1Ox/ayUBeEN8U9e/McBx
 vjOph3nQ36JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlYAAKCRAk1otyXVSH
 0IHFCACCI9AfTmC4yQ6hp0T+l7m75hVvMrTkdEGaKzJ6Vz6uQkXz0bOCHmMc7GcGRSi68vWFKGO
 MUS6R/S5TUHhHQ8k5MFv4zeesiUr/kUcc5a/kiJbAASnOoKxCcfrZgQsIg0iKARuPqcCoMGb0F+
 CYfr89pn4VQ8nSZE3001M1e5qQdhu75t9oNmAmM91gsq5PiVI5j6PapaMgMGT8IMx2ikCknM/9M
 OyphLvaSahIfqBRcrcGhKejvJ76oA1/0UtnOz3PBOJhIwlruDyq6AkKQMRPNGeY2xLxyzQDZ9oA
 p5tnXfE2AhWrrvRr3T3CCcGnxpa0FpZ4TJ1EUij+/0CH8yj7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 15:28:59 +0700, phucduc.bui@gmail.com wrote:
> ASoC: Intel: Convert locking to guard()/scoped_guard()
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in Intel ASoC drivers
> to use guard()/scoped_guard() helpers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/5] ASoC: Intel: avs: Use guard() for locking
      https://git.kernel.org/broonie/sound/c/f16513ffa944
[2/5] ASoC: Intel: avs: Use scoped_guard() for scoped locking
      https://git.kernel.org/broonie/sound/c/6aaac9f6baa5
[3/5] ASoC: intel: atom: Use __free(kfree) for stream pointer
      https://git.kernel.org/broonie/sound/c/4889a8a73f65
[4/5] ASoC: Intel: atom: Use guard() for locking
      https://git.kernel.org/broonie/sound/c/71c0f725d35d
[5/5] ASoC: Intel: atom: Use scoped_guard() for scoped locking
      https://git.kernel.org/broonie/sound/c/08d2d5e683e8

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

