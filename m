Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB241D88D7;
	Sat, 18 Jul 2026 00:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784334225; cv=none; b=KRlo1Bmw+S1FwGqImsXA5GIYEbG2CNDWNR4qBQy3lTkLpi65mSaN2B57e7/mBrUzHp0G7hdwOSnVwLT9W11daRujV1SFfPWRGsSaTXXsWgacCQntsXDJDmPuGA0BRKs+TzwX5PlYsLQDyD8cb1/5wz4lh6HeT3/hETTzv+gXfYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784334225; c=relaxed/simple;
	bh=vNNMXAsXcJLMSHVEULNIOQwIaByfR+xsu9d6Byjj+2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cVYkCCCzVRJz6EgoeLKQNvvxX97d5YCMdn3UPXBk5fmBnlj9rfBNBfCTi9JhszIt/R47GwTuW1C4+hbYHAbPOCROu16OfB5130TFuDbeNeawoLOXN2kSt8PwjgXC76qrZbefoJ93Oe04645+LIm87Yu8RmFrgzeh3MXuUHl6YcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3ZlR8ij; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3ZlR8ij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF871F000E9;
	Sat, 18 Jul 2026 00:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784334224;
	bh=OUbPl09DNGpLi5NyhkHQr+e55CLr9Phi8a6ZtwbQYHM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=G3ZlR8ijctZhkiiC2B0Z78ZesM/qgeWQD4xgH10z8IQE6hRidxu1E2+eu+k86lJXl
	 r9Ib4YrzWbiDZkJYoGOoBjFnlnuy8wJ+MxXcuAhczGCoqV0qHOW0Kj4gRsfA3Oye/Y
	 CkvSlnK68hCiVe9NA7JFhfpBexTDxB4hIRmYjPjNie9Tn3wjjToEh5SjEBWhKq16K+
	 MPiBH9iRXMjWsAEckJ1ozm2CUcZSSp3NEm4ceJfTMWrWCop9tAidPqETRkq4cIHrB8
	 3YNmxucUtK5yZOBz6rS2j69Mc0ZmChTDz+IXfj8HpbAqEWRva7b5ir+ePGzwitBsWZ
	 u8RJDW5d/3Pkw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20260716144209.2411523-1-ckeepax@opensource.cirrus.com>
References: <20260716144209.2411523-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: Intel: sof_sdw: Add quirks for new Dell laptops
Message-Id: <178421923026.63368.8173314455736250484.b4-ty@b4>
Date: Thu, 16 Jul 2026 17:27:10 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vNNMXAsXcJLMSHVEULNIOQwIaByfR+xsu9d6Byjj+2I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqWseNG6B/EnsSsxliDrUmuGj9GLTd/TdFFOFl3
 qFmVSpHcxKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalrHjQAKCRAk1otyXVSH
 0NOgB/9Fh0M3lrOYWNBVeSN1rJB00PXB/FxG+eM7BNvjfx6VpNaqqv3RAHnCOMLueZAj2tJJPE/
 9YNRmQCsP8W05RKjyA3UKgMLCMNdPw+EKWBOPvFj7LHblcPlYGWY6W6uBA1kArF0IzNjGCOsC9+
 AMpiJms5dmK5doQ0cwosUTo3/vHcoS7llflMaDL/KeezeqlFEWkKfzRwe8mJ5SM35yratlelG6/
 hXj8J3Vjl/TRhU6knDI1jpSq/iEZeSj5XysB9dvviCulkgTWwtGJ5aydGXdRgRIL4wGg6Q4pB7G
 1Hznknmju7P/8/TKp1/neyzHkScJj8DUBvsMJNKYMPd9QCJb
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 16 Jul 2026 15:42:09 +0100, Charles Keepax wrote:
> ASoC: Intel: sof_sdw: Add quirks for new Dell laptops

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: Intel: sof_sdw: Add quirks for new Dell laptops
      https://git.kernel.org/broonie/spi/c/efd80de2de9d

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

