Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E233D51A;
	Thu,  6 Aug 2026 13:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022897; cv=none; b=oys/XeEI00W0sGK1Yt0Y8yTE4uCjPU27WBhnoc8Z5Q/J5uoBstvzAMoRXFD6Bw2iqMqElYHGs/re/fW2ecnQv4e7OYkjpcZxOmieFfBaQZAKlyarvh9Aex3b41x5Gd7kjkV/wYDDmJgHKaiQJymlRX2QLaex2uhozkSkRBdcT40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022897; c=relaxed/simple;
	bh=bHoLgRIX4uJMgNXZakvmrgcI3UlPg6IAuGgCxOK5ulE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Jxk4zG+D1pn1Tt3ovTCpf13P4AOnog4fq3R0FozMXheKQwdOBKyxBxgcrOhIm1VilStW6J9iXOg1hdcLwOs7jo90bziAkp5wpFZ6z2H+wgfSzvf9ICCErbCewMjxKlfPi4DLs0MofLj+FkWJR5lNt5eZNINXsRTK493NnzemDtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oq4vxNJp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oq4vxNJp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A721F000E9;
	Thu,  6 Aug 2026 13:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022893;
	bh=BzC7RBvLpJs4LgfD1aZEsYgRk1243hTH7xXhTASd7Lc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Oq4vxNJpyZGVFRQHbr/HUFzSJZ1L50kXT6orn+PdUppxcGRbLStlioxWcXmyn2WjH
	 uTZGOKSzcJwgaP2iYAZnzKx+MvB+A9/lH57AhtIQgujUDG2J4bRLpGAIRwiRtETr3u
	 tB2hGnTXouzQQNYten/5kRJfrQuwZwEjjNDBuNZd7uQ3A3uXQ1AqloyVipeKhaUZM+
	 cKU0LLXvKz9W1BsXKPrAJD6V/SeJ9aQVbj9v4yCwunmMs100xujwn4iPDUnZucBUp+
	 y5qHVL4CtQ7cKMObMfG+0ObCWOHBZ0PUFgCYVif0TCKnv9VWsw3JEChKRkHVllWwo4
	 FhSWdYIJo4dVA==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20260805131942.45729-1-ckeepax@opensource.cirrus.com>
References: <20260805131942.45729-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RESEND] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44
 variant
Message-Id: <178601959048.110757.885964324537782155.b4-ty@b4>
Date: Thu, 06 Aug 2026 13:33:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1128; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bHoLgRIX4uJMgNXZakvmrgcI3UlPg6IAuGgCxOK5ulE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqdIvrcDq64/8otPORSVPjvOdjEAeJQhJoS05jI
 PJxOmE06wqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanSL6wAKCRAk1otyXVSH
 0GSHB/wNFO5VaTu8w1OAP+2WtXECEpTYUUY7qA/5j3RB5inwC+EVNSk2fwKg/edbUuSBxCKq5yW
 rMQRPnRWn6K/Mivol9e2n7fF5+BGUI227R/AJHlJGjuPDO34S7JaU87xbvBPJyuCEB/stEr0NtU
 mHRtb+aJSDWt7MddY6f9X1+qXQA1TW2tKiegA45RJDYFXkejBu9KKSzf85vGFI9aprEbFqVVQHl
 n+ag1ETUoeYR1N7Z1J/TkqcCqdgfkvUtKDBX9avjF6/05fzDy/zJMco2tJ00WN0x4/0MkGudWGv
 IU5DlBfrDA3GkTIpfFtmGPtlh94xU6KEqKvVnqURQlXEucyy
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 05 Aug 2026 14:19:42 +0100, Charles Keepax wrote:
> ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44 variant

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: dt-bindings: cirrus,cs42l43: Add CS42L44 variant
      https://git.kernel.org/broonie/sound/c/d4c669890ed0

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

