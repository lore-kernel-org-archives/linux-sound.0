Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ADC2475C7
	for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761834720; cv=none; b=UFjMm9dmlZu18v5orZkzwhlEF23OsEf+AbSIwu0pfCSsPFMcnR3odrj8QYuNMvaF/vzTyW+Ej2gtA1zaHhxXb+d8gHPlljlTVTx/dcRXSwYBtXzOZjt9yBgfs0wgZP446h4456/PAZiJJhpVIPpjr02Ips+zSAH0qIt7DC42pPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761834720; c=relaxed/simple;
	bh=fFJBqM48X7S8Udvft7zUNjoHLa8VwylY9K7G95Lleic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=btQ6Gqy+31wJBMaodnnfpbYV9vWZ8rUY2xdFwnZZ/OYPwX9km5d4wY+YyBkPXb/+Fw+lVep7p7YwwPUNfCULvtYda59VeSV88783qWqMzLIHU1GIs9ZOpDlwDPcq2YHHmEuPFVb38FM9y6rt9xxI+SPSFFuKYlq76fedCgT9s8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VlP8NDhs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VlP8NDhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252C4C4CEF8;
	Thu, 30 Oct 2025 14:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761834719;
	bh=fFJBqM48X7S8Udvft7zUNjoHLa8VwylY9K7G95Lleic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VlP8NDhstu3xauPDIPfSbzFMDu4MVAOGfbbVJeKq1gOog6LiINMVkXGuQ9ZIETU7i
	 6tpk3ckFs5faeaa+KNsKdyFCry6duAt/gGbe0XkITRYrkZ+LpRmWMoXiFu161347hG
	 ZDzCukPFCcHJw15W9dvO3b+B9rCx2I61DKpPKY2tNWVYdwOJhfwDh5WDnwushYjL/f
	 YIFO3C+lFNLFVVCKUOqu/Yf+jvdGqOqXwArEjN3Sv+Mh36RAY16OFDNtWyQZib5hvD
	 /Xs2OZtkWjWPQf2rsezMjKLG8eu+fraYYNDwXCnoNeI7LApizuqMJ2Tu0opn82P+1Y
	 ueusS+vVO+H6g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: linux-sound@vger.kernel.org, bard.liao@intel.com
In-Reply-To: <20251030065503.1216419-1-yung-chuan.liao@linux.intel.com>
References: <20251030065503.1216419-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: remove hyphen from AMP<index>
 name_prexix
Message-Id: <176183471890.63092.18246699861274776507.b4-ty@kernel.org>
Date: Thu, 30 Oct 2025 14:31:58 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78

On Thu, 30 Oct 2025 14:55:03 +0800, Bard Liao wrote:
> For those amp with "AMP" name_prefix in the codec_info_list[], use the
> AMP<index> format to meet the UCM expectation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: remove hyphen from AMP<index> name_prexix
      commit: ef37146360385282b5f6a5b4bf695db30d609887

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

