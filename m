Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C403EE1CB;
	Mon, 30 Mar 2026 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910579; cv=none; b=AT88MZKDRefASFOYfnukf34uWFtJrScIVCCbqKZWSPkRuzvd848wcwSHsPkpWFyZBt/eZ1KlLRls5uexjh111zpN7Qxg2Zm0MOZBc7BwoODoKWDG5gP8z8VPgxgmYU3LH4xsyU3QFmWQ2TSIW4D+yPsdjrZqC+LP3zz/75VDtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910579; c=relaxed/simple;
	bh=ZS4QQvmrhpaLHjTOXNrwAxbe47yEYtOaFuR5PFUdbA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=m1ZtYNyCKZD9lavicPpgHQE6JLgaNsW0FQE+zwdvvBWNVYkWeoWqQFy1/BMvPMvOCF+I29A6qpAgjNNgNlNu4gZGTQs/ZtBe4O6tB9JP0Gpb9zDr5ac5N+wdsfBv4Hcs7AOsc7WKqK9LscvnuB1fgzY8Gn5FjS1KHqf4u1VOMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmjYZpZD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmjYZpZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7A5C2BCB0;
	Mon, 30 Mar 2026 22:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910578;
	bh=ZS4QQvmrhpaLHjTOXNrwAxbe47yEYtOaFuR5PFUdbA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FmjYZpZDs3x8SBixN9f/pnR+droB5SblPnRrcgHmQDZAGXWxjRIp1lbV/jfojp2f/
	 S+7nRIbB2u2SZvsCvfgNXBhUq/4kd4Egl54JlUCW74cNT2xBvRgT3NfvxoPw7RgSKM
	 Ts7sbSbBwVFMfg9wZbhOm0rCCkNh1z9H6LIvg8hy2xix1EB/KmukCGO3E3igwr2jXP
	 xCuHnOH1a4opJINyE19oQaKOaCdKcGUhMwyET631MTXBx1axjd+sJzHtn+Alh7AB16
	 v+9uz7C4kpjqun+9qeIVhtdzjB0i7BzDcemeS+brhI+SdOk0I2M0sorsoAeMohXSDN
	 u4qUl11HVMXww==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Vijendar.Mukunda@amd.com, venkataprasad.potturu@amd.com, 
 lgirdwood@gmail.com, tiwai@suse.com, Zhang Heng <zhangheng@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260330095133.81786-1-zhangheng@kylinos.cn>
References: <20260330095133.81786-1-zhangheng@kylinos.cn>
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 16X
 OLED M7601RM
Message-Id: <177487838980.127573.11548097171303634739.b4-ty@b4>
Date: Mon, 30 Mar 2026 14:46:29 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZS4QQvmrhpaLHjTOXNrwAxbe47yEYtOaFuR5PFUdbA4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvxw/DGQpKvazlxTB79EdzZsBtGQ/jaJnv9kT
 fFT5vP7CP+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8cAAKCRAk1otyXVSH
 0BjkB/4ppUbT/mCawSRrG8Vtn/P1e/4NsbozfrvS//WxsowXyWpmHwb0xT6HteCVCptO34bPVBD
 wZuAYkeDlHxCcsujan95myZBKDX5wsa6qG2xE85JJ+xV/IIO+Gle7Bnc5mCYTrCs0hiYaJ2X+TW
 VmgPHHqFBqyhhr6BKJcvpl++m9j9/JBdEIXFIH4byqZ2k7fnVsesPDECcqEioXYx/TmUyJX04QB
 R4N8nPwW8lUmwhAACYAEAQbfo+dgC5Su0HO4LEqYHlr4/8+3VgBDnDjZEI5dCZQgBEhOWSxxuuE
 j9bJ021Ls5o0QE3PVqXK8L3JoGS3K2FtFBBrG1WONprHEwj3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 30 Mar 2026 17:51:33 +0800, Zhang Heng wrote:
> ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 16X OLED M7601RM

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.0

Thanks!

[1/1] ASoC: amd: yc: Add DMI quirk for ASUS Vivobook Pro 16X OLED M7601RM
      https://git.kernel.org/broonie/sound/c/27c299698464

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

