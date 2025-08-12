Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E452EE5F8
	for <linux-sound@vger.kernel.org>; Tue, 12 Aug 2025 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996721; cv=none; b=lnVKoPUWEn422zGMYTYuNTP8Hxz6NyrK/mQkT5lD/Li0BvAsCSBk/NgQQf1lCOQWk4L/AYXSbyhwqfx3rqAuDMVe/QWvr7UG1SF2NwzXbhZ7fkkfl381X8Sen33JPUO7wKBBoME5Rp1H3TmGimLEmy//JQU+yw0GI7uV1W/NhQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996721; c=relaxed/simple;
	bh=QHHIqZi2A7zlguvJx/eL7LNTyKnN9VyyR0pCoh6qAP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RaEnYdoGVi1KOW1vFgWw4urUt7OL+gPCcIXenS3ECsIm2iJSFZyqoeiuQ09MF3b71D1gmKdMfBdGF31hL9n2vWmpLx94O3ydggeBVpxA1OgzUUanynEBJlg4QNzo7RJ/fm+jdIxbkZAngSJEm3x0+nig9pesBVP6z+TK/ik8pPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBq1i0SQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBq1i0SQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B27EC4CEF8;
	Tue, 12 Aug 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754996720;
	bh=QHHIqZi2A7zlguvJx/eL7LNTyKnN9VyyR0pCoh6qAP8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hBq1i0SQ01UGCyJGOe66ayi4x4CoWaXDTV6NNlOBO7i/dj+tcEvlfNaeP/N8lPnM6
	 qEBcf2c1slOTIncXiR0CNN79YedkADq9r85aWX9SnxBvhk/ZW46gPincAvKErgrrO4
	 dJV/zH3EFvUWecLx/bWxV8Xc8UD1F8grW0hN0Cqi8RoXCvQyOIADyNx/oYrrAigwH4
	 4czx+QDq7c5Y6mdK1Dr9NAJz+4HU0d52iKw+gjH0Lir1g9/zP0Ck0Ur79nKmf0uPGX
	 zbD2Y7H3sa9srmMdhLbPT9sPeXo318Cy8btM0HgDD16TGFWNSZV25sHVCkI2OLSp7x
	 ymXa9ypSj0WfQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: linux-sound@vger.kernel.org, lars@metafoo.de, flove@realtek.com, 
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20250808055706.1110766-1-shumingf@realtek.com>
References: <20250808055706.1110766-1-shumingf@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt721: fix FU33 Boost Volume control not
 working
Message-Id: <175499671918.16031.1147605711819545877.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 12:05:19 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 08 Aug 2025 13:57:06 +0800, shumingf@realtek.com wrote:
> This patch fixed FU33 Boost Volume control not working.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt721: fix FU33 Boost Volume control not working
      commit: 633e391d45bda3fc848d26bee6bbe57ef2935713

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

