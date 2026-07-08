Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6717239B97B;
	Thu,  9 Jul 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599523; cv=none; b=aqPYBP4us4EEPR/QbEiEmBbofZ1k3Yl17WX9B5/McZanl+FR4s3qyv1urZq4w7FKb1iAivZF6PDSnzCR84+tbddifAaObQJ8Pk/R9+ODlrUdrLhth7Wj9MdAr9KeB1QYEaEZetiHk9BAGM5NySUl2D97I2v8ilXVTwUphlUuyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599523; c=relaxed/simple;
	bh=YCN7RDvq+g3DuDC+CM92YzXjADQ4sJAADhOD2npcpQ8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nfj3bvEfsP6+AtioKHsASs5eD+2dR0kT9JL686GoiWCbGoG5VeXEpInLXmxsFuDVKPaX0rgD0CycE7bIu4T6Re0zr8GJnf6ZLUmaCNIpg5aUsz0T5fZnh1mrDk+CbrjWfNTgNRzDDIBFot8zYpHRmKgEP3xBEZRW5/7PeNcvHlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiEMFM6f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiEMFM6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973161F000E9;
	Thu,  9 Jul 2026 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599522;
	bh=gJCN8TJPMreFgYXZBPxdSjAqSQBS6l3DVmNy3jYObnY=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=SiEMFM6fV5i0l0r4AdGZCfWXfEVa8mM2PpnGRiRwlwq+jXNg6xE85mgnwJdaSKtkg
	 Ij4c553xGS+s8P+5XLr82Fp73aDQ+S4F35YRKot7OuAIx1FVQkOoqEMpSh7xrmtLVH
	 PHHc+VxnWHJNqsGmo9CBXj7xa/GZ2vB0K+AhcW/IO2GmawxIRnuAWV7pmxJ9YcrDgU
	 AjfucAMueREzUlzByM+Vcs+nOuQsdfqKk2UUPdGyI7CT6u4uhcFsrPVCgOM8+fExQ8
	 e9Osc2xWmOp6r/IpwDzUMGx5BFsylPfnRaQY1r2IJQTH3MA1KrjGU5DPflj51s5tku
	 +nm9sHZMQvkiA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260704074000.42578-1-pengpeng@iscas.ac.cn>
References: <20260704074000.42578-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: codecs: max98363: Propagate regcache_sync()
 errors
Message-Id: <178353379147.26140.12098382279669822169.b4-ty@b4>
Date: Wed, 08 Jul 2026 19:03:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YCN7RDvq+g3DuDC+CM92YzXjADQ4sJAADhOD2npcpQ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5Gfc3k+Apq+NfoG4ZU/OuTXXkZh05vwWMHkU
 C7JPzraohyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RnwAKCRAk1otyXVSH
 0NRBB/sFENb81NMPUBBbn7k2Z6lsi7vEk+zzoyAy3QCJjmKATKKGP93QDCBbK1RZ5KamDinDEEH
 /eWw2yuN0Sh+uZ7MYfHAaVwBdTxtiEeWbuT9IjxaYInc06M21Wx1+I8WBXGbbQ182EqZpMCyn1/
 6dEyB9QteXtLkPgYhg+Wrib1jjyb+LXzmt211nR4wzCJ44bUIwe30YVRQw4JbTyRXIbRqrVEUS6
 GDmF7okPt4nmE3PzTr6EqIngoxNAYzGd9AVdAOi/2jjcVa7+2HPzp3JpvpenPa8F1CDMZ+ncDGr
 UTz3JOAEhThg7oQ8UdfIr5ouHGqfyvdf9QqxUDmX/3NmmnVs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 04 Jul 2026 15:40:00 +0800, Pengpeng Hou wrote:
> ASoC: codecs: max98363: Propagate regcache_sync() errors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/1] ASoC: codecs: max98363: Propagate regcache_sync() errors
      https://git.kernel.org/broonie/sound/c/b2a06f7c9514

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

