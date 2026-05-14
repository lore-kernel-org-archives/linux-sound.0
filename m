Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6D3321A2;
	Fri, 15 May 2026 16:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863172; cv=none; b=UduWF4UK73PKZbafTQrBL0/wmwd70jYU73W1qUUuNrVaxFbSp3NEeC9ZDhjxn56wV+vtueRqs+nsC3fgxx7W3fBEuZ6iw+vYXZeJ9DKiwk8j3DlQK/TLuURdUsiyVLgnZud5OT2xsoN7RnvqRaJoLC574YBPN3K7x+VlhccW3yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863172; c=relaxed/simple;
	bh=vBs/Zsbn+YUDJMmXvZsaHrICG0+825XJY6PET75bnJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ur2i/L7i+1ARWXzZabarlgiO0zmS5xuoY9hYGSm4GrIODDZ5Nh37djmnf4RO+LxJQRp8vYMk56lFoCvkRA6XKRxTSKJLmKVPwxzdFCXzkbbbXuGkyAG6Ay4AXMv8JSjvEpbQfmBjHRO078IaaOLE3BTsHTM4/0kZemNVG1j9V58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bMEKt/mq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bMEKt/mq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57681C2BCB3;
	Fri, 15 May 2026 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778863172;
	bh=vBs/Zsbn+YUDJMmXvZsaHrICG0+825XJY6PET75bnJg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bMEKt/mq8OKxN1oAndmsZ1V529w73rMwN+0DB2MlpSXmvi+iISIigqy8egvG1JzYP
	 1saExKryPwRRaKLhsQ7IYaUSzV5y1Rfcfkvw1em6mC9VuBwjzdbY8cw3aQBtLpu6z8
	 /CnCUlYyDaISKsXikFWiT80nMe2AN3aQtx7eUJALS22FyDCUtF+l1qIWR1W3HQdXlZ
	 xa+zdaiLyw8hnbLNR7TqHCirBVBN3wo01Uy+24At/VEpnqj2q34tBw2JuYFCLvSaDC
	 oEomsm8QM47moA2wSXQcb55922HWJCQYQ6iWqZoDDu2gyyqZLFz33AognHzxxwgxH6
	 Br7SeR3AecigQ==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 cezary.rojewski@intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com, 
 pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com, 
 sandeepk@ti.com, v-hampiholi@ti.com, Dan Carpenter <error27@gmail.com>
In-Reply-To: <20260513015542.2420-1-niranjan.hy@ti.com>
References: <20260513015542.2420-1-niranjan.hy@ti.com>
Subject: Re: [PATCH v2] ASoC: sdw_utils: Remove dead code in
 asoc_sdw_ti_add_tac5xx2_routes()
Message-Id: <177871988047.1043532.1734750360107709713.b4-ty@b4>
Date: Thu, 14 May 2026 09:51:20 +0900
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
 h=from:subject:message-id; bh=vBs/Zsbn+YUDJMmXvZsaHrICG0+825XJY6PET75bnJg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqB0w/7S8zdZNmn0PHQVQzACpHDxdaP4gd2OSj+
 rfhwkIjWXiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCagdMPwAKCRAk1otyXVSH
 0DcXB/0RYzbGYhJWRCcQHZih7xvAqWs7XDzA9uVSq8RA7wDbqRg5iJCWGy6aAfkqnahzli8Ds3c
 z+kvYXa3HbVAEPdzYeMFzAvXCrjqcs9dpQD5GgroA/GjY1JdPcfRX3fuTXvaZmG1Mfupt46axcc
 a22IyB0Ue4hmtZttB6Pb2LN/fm2GoGyQjbmfWhjxHjVgaMjmQseACfuXg5bS49cFrdb7lNIcHTo
 OGihwR43tV7NuxT6S8jg7m1lE+mddywEt2TPctLhJFgjGhHOqVdNfg696nvZkluACPXNDLFJZR0
 U5XysYFg6ojdO+y4mQVx7eJElvwf/6Sa6KpOVG6yoN7+UpGz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 13 May 2026 07:25:42 +0530, Niranjan H Y wrote:
> ASoC: sdw_utils: Remove dead code in asoc_sdw_ti_add_tac5xx2_routes()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: sdw_utils: Remove dead code in asoc_sdw_ti_add_tac5xx2_routes()
      https://git.kernel.org/broonie/sound/c/c157f03b4864

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

