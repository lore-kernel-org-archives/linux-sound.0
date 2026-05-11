Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5529437A481;
	Mon, 11 May 2026 12:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500989; cv=none; b=XXpHoT/N6rPnAvFnXErRvVof5bSZ8Q0sfFZzmiTykIWOeZb3u7Sbp1PFXOvPR3LNevciJPQpjr1zwlooFuEm9AssQeY3d/yQda09J+JRSSn8pRRCOjmDaV8RRoa/4b0JwnNU2kMr3AQv2RdEZkVOEd6oigtYcQwlSXcWdSKB6zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500989; c=relaxed/simple;
	bh=W/DUuqwAIUSN1pr/bEsWE0X/T0jwEXAT4jGNdQIDahY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CTSgIkf3tfPPe5CQgGaEvzrnMffbWQEklJPiaCw46mq880SV/4lkKVLO0wywVypAj/3pDgDPV/H3ol3G64Ttat2XtwKcBzZjCUsiCyr8EnmnNB2ENfJRTQOfjY2PKrgBCQckYn9ppsB4nIc4oWEVHFohSB6jaFcfe8x/ZijyR3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wu2V7mxt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wu2V7mxt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9EAC2BCC9;
	Mon, 11 May 2026 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778500989;
	bh=W/DUuqwAIUSN1pr/bEsWE0X/T0jwEXAT4jGNdQIDahY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wu2V7mxtNyNk5X4jvfVwVr+qgsJEDBCqi9ocCnw5xYbOrNVBcV6HnvwDd4XV+obQZ
	 Y9vhNMgc6fXK+6fsXGFigDyrGN2dyvDJHQp/GAB8ZGHpW1bofRlqVur1cogOkEXTJ5
	 T3X/kooue7e3Pc2sLyHN7dc9yFp3iUlmWces6ULAZmX04JMpYoDx1jWuS6OC8nSMgp
	 4LcfQRa/MregtGGxJAe8ntOiVHDmJmxXJki7/3Mirid3FFnzjJXsNkUt5fcc3+Z/C8
	 8pfNBOMQ3vyTHym/DyFf/YfVtMRqMmPlZOp0xIhZSWe/AnnX9ndNcEOdFW2VtNFRIc
	 GRKsRv/d6qKkw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Jang Pyohwan <vhgksl@daum.net>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260509175317.DnhjxHczQay7kkp5z6t4lg@vhgksl.daum.net>
References: <20260509175317.DnhjxHczQay7kkp5z6t4lg@vhgksl.daum.net>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: add LG Gram 16Z90U RT713 +
 single RT1320 quirk
Message-Id: <177846138664.988959.1699136183770895583.b4-ty@b4>
Date: Mon, 11 May 2026 10:03:06 +0900
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156; i=broonie@kernel.org;
 h=from:subject:message-id; bh=W/DUuqwAIUSN1pr/bEsWE0X/T0jwEXAT4jGNdQIDahY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqAcV5EaopP5f7BHXeBEt/lRwM5X5HdaLJKViKx
 /eMLfsaZcaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagHFeQAKCRAk1otyXVSH
 0MzbB/wNmmJLlaOXFCrDiBSLSIF5jD6ettEe8ER1BquX4K2RJhe3M4bF+CeDVzbcNbMd90ff1oW
 u/EH9ZOCAJ9zx/+pXX1Y+6l7AEGSiukxruTN5O9AfaO/4x4YGFMCAF4hQc1amCMAPaXNzL49Ycq
 9sp+9B5oF1vOScIqcYFDxxIwmO2p46sJpKZDtSx8RhwDgZEyyjgx6UPNygbxHXbtsxnkUZGeO8O
 QWpUvlV41WU0eGH2XLPfA3opBcaoCeXdJkZ7GnOHIrz0w0ivF6mBrweg3163cqi3vZ1l3JZrl5K
 +N7n8CL1UW8v6ckcVsYF4sH/7qIE+00jsxN+QS+dkzLla2Tl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 09 May 2026 17:53:10 +0900, Jang Pyohwan wrote:
> ASoC: Intel: soc-acpi: add LG Gram 16Z90U RT713 + single RT1320 quirk

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: Intel: soc-acpi: add LG Gram 16Z90U RT713 + single RT1320 quirk
      https://git.kernel.org/broonie/sound/c/d714913b61d5

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

