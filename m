Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743C0337B9D;
	Mon,  9 Mar 2026 22:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095807; cv=none; b=lQoiVldVzXHEXHgFdYtVyX694L1V7akZiIQ1aY2CWlmeoLzHRLHo4kVRKkVEJbl+31SlfYYDYQDK8zs98wQAxL4MSxcco5d/fmGO974XUcuR2e2lQJPXHksyijgiMTpsrB6ekB9z7N8ZRZJBqLOxvIw5O7tMojr+NIVEI6YiIf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095807; c=relaxed/simple;
	bh=nZw2SKJlpS0bMSslqEvm9u3jcxr0HdtsBcDMJ2Rs5No=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dwZlsOR1EDJatrr3XFDwUgm252mYMfeNjJ4dGrxMAT+89FOh80Rvx3ayl0dQmVDo4oJWiBN4u3tteggUH7PHA5wPBYP1XuAi1fIduPBKTATkTkN13vmmCVb5z0QjwAvAzfQBLkEqWiZSyE86DtLKgA41eempcKer+Iqk2LdmzL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtIPd89O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtIPd89O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43FB3C4CEF7;
	Mon,  9 Mar 2026 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773095807;
	bh=nZw2SKJlpS0bMSslqEvm9u3jcxr0HdtsBcDMJ2Rs5No=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TtIPd89OfENJEG517aSHBaoZWYZHUIImeTXKyP90nb+w2uVvumPUWdKykrIamCM1I
	 FeAcXNdhVSjAWHCxwJMj85Eir4vYhVN8jhxVnM6RrNVcG8njJ4txJy6rN9Ak1o/1DP
	 9mzYwXbvSxk54NTDG5JDkHwZ/iuY6CxIrHqIwa+mOigSxKZGERfvfTzmGSoQp6+xj4
	 F8FvcdCN/3EEqwj/epgnhGZF8qNuiaBBnGYFwJ/W0cCJJwbyO9vBSnQPZGjatAzucq
	 o9RtmSyRpOROHRGc2dPUBbIxhoazqDRdIeeMkKnxpPkBccP+dx223n853vBt0sNyUA
	 ReaY6yjniVrOQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260309145310.1199583-1-rf@opensource.cirrus.com>
References: <20260309145310.1199583-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Make wm_adsp_fw_text[] const
Message-Id: <177309580599.320574.12876439832571167346.b4-ty@kernel.org>
Date: Mon, 09 Mar 2026 22:36:45 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-83dbb

On Mon, 09 Mar 2026 14:53:10 +0000, Richard Fitzgerald wrote:
> Add the extra const to wm_adsp_fw_text[] to make the array data
> const.
> 
> This array should have been const data but was missing the second
> const that is needed when declaring a const array of const pointers.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Make wm_adsp_fw_text[] const
      commit: 87e49eb0918154f64f736d5271e9e3fe566f82b1

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

