Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B411C985A
	for <linux-sound@vger.kernel.org>; Tue,  3 Sep 2024 11:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363407; cv=none; b=ntjSerLXxsPQ2ONu1EPFWRzfEMbDtBBNvOCLtMo6He1/cASev+jiWdpzFNJq89q9IShAxysHb9/nmDMnR6t6d5BZ/Kt40JUyYCYByBBjmEMNPhoSrgKFcQV9AJ45JcQs2+P30e64hVBLok3dkI5YSrB3HS7pM/GCuL9gSl+Jm2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363407; c=relaxed/simple;
	bh=Udh1ovhcaAJMwLFRMFk3n4I8D1xlvkss3CLoQXQ1MWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HWdzHz/19X/J4nEvWZ7Xmcsi09T3lqeV8YhZbDGTPOsbFWzpL21on6I3d6UICfIRReP+ocxjUFcCORmEEovmizNcSq9GeuTi0pCOk7KshGihE0J5JQZPIINiwiu09wrYJNMIJ2hMELxpZltYNrp55tRG0XmeXRzi/sVbHQovvTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezePbz5H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezePbz5H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180CDC4CEC4;
	Tue,  3 Sep 2024 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725363407;
	bh=Udh1ovhcaAJMwLFRMFk3n4I8D1xlvkss3CLoQXQ1MWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ezePbz5HQw+KZW4oUGcvIOTQVqS9eySq7JyyQfE8Dgf8zEI+VpKap/uFDQ+vX8ja5
	 dqvkz1uF4cfZD9RBzvZl32sakorLSXY0u4d8JiDGKziRNQMVBlB6I5slNmy/djGily
	 W+W7FjMO9DB6DVpJU3O+zi3doDBSqV1xRTPSS4QNXUOk3K5COVxt9Zk1tZX6gzK/Xn
	 UB7mLdiRaWySiZQ0wO/WvQ6gu4TjN1h2PD5pomt5KuSKOEiiRqKJEWuhjsQhrqykSU
	 75gkJDzlvOG6BQCJKM3A1Ciq8j4iKbq1ImwyVWhjRR7tdAdEbZ/dDOcRQoaOBAn5Gp
	 D/YYO3BkLG1iw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 Hongbo Li <lihongbo22@huawei.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20240831095149.4161729-1-lihongbo22@huawei.com>
References: <20240831095149.4161729-1-lihongbo22@huawei.com>
Subject: Re: [PATCH -next] ASoC: adi: Use str_enabled_disabled() helper
Message-Id: <172536340582.28433.1863015049776154940.b4-ty@kernel.org>
Date: Tue, 03 Sep 2024 12:36:45 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811

On Sat, 31 Aug 2024 17:51:49 +0800, Hongbo Li wrote:
> Use str_enabled_disabled() helper instead of open
> coding the same.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adi: Use str_enabled_disabled() helper
      commit: dc70fd02404398388f3471a57b9f4e26c0eeba5e

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

