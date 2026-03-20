Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF633A7587;
	Fri, 20 Mar 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017456; cv=none; b=BV+U4EvhMoO80G7LH/5t8XDFyel8+mhvk6rozlTMGYEQDe8dr6zSDFaPAZ+hTk2hLM2aSSRHQywrb2oHKBEgFBSqWdFLB6mTlzGLHZlawPQRBz9vOeplf2DPgOyoma2jK5UQGXj3iVBHjXkwMXm+dT+esyJspPzRJl1+8IKlKco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017456; c=relaxed/simple;
	bh=oT4fos0PfA+OsldLa9d8Xjt5nqFVr4Pt67wiOqXpXsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mPxJYARTjsI8d9LXnsSdLzWYCIrccx3wPj11MG6qRGIf74O4QRXqfdLmdHol9c/l90VHuXkINtFOn3wfDcN+H1lhrO38KGvoV8KZUqZtMJTj8c9LndONUTu7lfyxE4Lm3hcTmZCxT/mLzJCHeE50/WsJMFLJ31ATr2XYXaSR/EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LKyvoqKA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LKyvoqKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38CCCC4CEF7;
	Fri, 20 Mar 2026 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774017455;
	bh=oT4fos0PfA+OsldLa9d8Xjt5nqFVr4Pt67wiOqXpXsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LKyvoqKAoG4HySogtc7qWrrznH1X48d42RCh5pFolNINHmSuN3Ei4tmwSwnWghWf3
	 D8Lsdt2nyA1DkdJZXcLE2c/pJVomDq2AdcWm7KrmTOhtiqk6gDm9mvjqehpaaz2HoW
	 M8YESLo4N6WmLpzaCGQ5DByHG1aVXRnlwWv1X6Qsw1DWtU+j1QBgDIF0BJ0CiO2km3
	 OQkX/MZNO+dXn/OmjZAfx+3p7qLLkMV5NZswVShg1sP+s1I2C4U2QX2ePMzakaaHeC
	 xq9CwcRvr/gu4JEIII9jSoPzMQ7qNr8n3WE7mzvwydI7/2q2uk+0zJALxcX3Htlz9n
	 6eoZIl4QrWVEg==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Hasun Park <hasunpark@gmail.com>
Cc: vijendar.mukunda@amd.com, lgirdwood@gmail.com, perex@perex.cz, 
 tiwai@suse.de, linux-kernel@vger.kernel.org
In-Reply-To: <20260319163321.30326-1-hasunpark@gmail.com>
References: <20260319163321.30326-1-hasunpark@gmail.com>
Subject: Re: [PATCH v2] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
Message-Id: <177401122764.58356.11946917327831494419.b4-ty@b4>
Date: Fri, 20 Mar 2026 12:53:47 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-db13a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oT4fos0PfA+OsldLa9d8Xjt5nqFVr4Pt67wiOqXpXsk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpvVutn3G5ZfySLSPHFo0+D5jSl2q/85HYeHmSD
 g1EtvTFZL2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCab1brQAKCRAk1otyXVSH
 0KEzB/kBmOAJqJEmsBfR6ww7a3JLH0Uqsmn2jPi/shA6BpnKT+eUuli3OyO7muJgOD1wSOHra8h
 p+xbQKL01RsmRZ16hoE8Ixh2KNFTgk79BCUa6EWz3/baEKtROPyAez38KRNdxdGtOtFfAg0/JZ8
 fAC5j526C5rP89XLs4JiG3Md8GzsPBYTBWz5BKn39IzfvW77AsBTTmECnQZmDkPlpniUIa84kYX
 hGzi89nnY3V9xTxkCOTRsyN7u9WHZzDmaN/XTjljjQVKPj0HPTFv+kG2lKxeSMpLbvYZSBauvw+
 5dfQjTjlQtqHc63CBpvWicfOF0780nlwWTyAjATF03zrIVDP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Mar 2026 01:33:21 +0900, Hasun Park wrote:
> ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy SDW machine
      https://git.kernel.org/broonie/sound/c/2594196f4e3b

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

