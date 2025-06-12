Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2101B2BCF54
	for <linux-sound@vger.kernel.org>; Thu, 12 Jun 2025 15:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741686; cv=none; b=I99hzZS46ECYUrA4PPU9sSCpmv6DdUfG9+gs7q5ZPGfLpm9SMMD5YMIgEJy2M01KN6MdMZM/G85VDqclZBEwTQzy8WJBVNTomweNCfwEEo9VKOZOhtA/N+RNGci8cEFtLNVlDTmuHzH/HDaz7sERH4TKOpEaK5X+AAgrWsVi4bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741686; c=relaxed/simple;
	bh=h7iv08XPsF5dgHHSRvoNL7EXywLALYhaUOoBznYzqOo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oOgH8D002GZyHz53/MUlEQJ0ZKHTqu9IGv36q0jSs/OBzEncSSt00QOwVuiVTfQXUuyWpCrcLdamhg+3o8kPZEzFBTUCdnGRvuLiG4GsY+bEDjotG3G5oMF8RyhVKHP6S/ZFJMuGUvYWx2XDr1eW4Tuigq+Fhm4831k+Q4C2JsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCB3QlP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCB3QlP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A26C4CEF1;
	Thu, 12 Jun 2025 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749741686;
	bh=h7iv08XPsF5dgHHSRvoNL7EXywLALYhaUOoBznYzqOo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jCB3QlP1tQGmb8QG4hP3Seyj1NIaYjLqhmmUk4wdhHAtdeQh/J2c5TqNHKpH32xyC
	 CiYx/6nUmyEIb5thRITmcjstV0p8twNmo6zKKUKbDJU8MSAAEZrfRAzp+nVt8RYk5i
	 VwxRwR1u76xD5weobs6RA285zUO3V+HJD955PmK5BAPMcmprzMLKxuYVI3auZw4PFH
	 uAEQs4eJnX73rmrD19vc4g870lymgiECwcws2Rrt7AdhyycQY9rkb4ze3+FEggGiaR
	 OHawRUlK3cLreX05ZWJA8Rua2CwuUNC83JNMHnEcAyzN8if0QcHDlg/h+//5fxCLLq
	 ZZ4GoUv+g1htA==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Gabriel Santese <santesegabriel@gmail.com>
In-Reply-To: <20250530005444.23398-1-santesegabriel@gmail.com>
References: <2bca9eea-d75e-4e2b-a32c-25b2e7fcaa2e@sirena.org.uk>
 <20250530005444.23398-1-santesegabriel@gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF
 internal mic
Message-Id: <174974168509.74515.9387675271771811241.b4-ty@kernel.org>
Date: Thu, 12 Jun 2025 16:21:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Fri, 30 May 2025 02:52:32 +0200, Gabriel Santese wrote:
> MSI Bravo 17 (D7VF), like other laptops from the family,
> has broken ACPI tables and needs a quirk for internal mic
> to work properly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk for MSI Bravo 17 D7VF internal mic
      commit: ba06528ad5a31923efc24324706116ccd17e12d8

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

