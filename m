Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220F232F764;
	Tue,  3 Feb 2026 12:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120333; cv=none; b=Aas0UOfZQZI5tZClsTRvh+rVBLXH1W3Q9AptW/YxFOKeXSxttZNwp9WUdORxTKp7gstbghkudy8JgyKQb4ZcGxL57HH1Y88uT9uN7vMFthZRDB786v7taaTms2/DzgYb1zvEnbpHbKB/yyZse9W7KWuDRuLdbqJcjJ9mT4gv4r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120333; c=relaxed/simple;
	bh=Y0Ttb3vN65V0eC7IIVdnDP2gliprkPsplSrO0LkvGVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ixAX/R+oIBaFh5T7XvDwPvD/2ClpfvjwsecErjpwBkHRey6vghbyZBhyHUnKNv/viSuRJxF65lnuxuNOtvyt7wEX6T14VjgGr/NZHhW83FdtMoGygqsgKIcxFi925H3QFucFVTGzzgZlzvZsnXLIumjM+M/09h4VAHPG4K0nZP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCWeLVl9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCWeLVl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E7AC19425;
	Tue,  3 Feb 2026 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770120332;
	bh=Y0Ttb3vN65V0eC7IIVdnDP2gliprkPsplSrO0LkvGVw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KCWeLVl9DiRHDMWVxCNlge/6i/XmehNDtYhTb6Y2j7TzF8rIHYIl0EkhmWd2zjXxs
	 pmJ4ck84/pJaWLSvzREw6CgPrD7U1tIQCYftoYXPui0t6oXr2PWUPiTH6tQ5MJqDHP
	 RFj2/Q7C9R3WQlN5rgq061JI+j4yr7vpWgJ6utyGisnjHi3q3TPDz3iPdJbSSfYv5s
	 l4wNyo9OE51eX+fmAtyM5JFPPaJl4OwAFbMuTc4gytg6fwobUqf4t4AFJuj2LEr2Rq
	 kXjHS1Ghf8CzKk5Y9t3QDBRTJHebbbFa5Qr5XbFYn/+QrccfTIU4ASnfHZ0sX+Mlwe
	 b2EyY3PC4+z7A==
From: Mark Brown <broonie@kernel.org>
To: Dirk Su <dirk.su@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lane Odenbach <laodenbach@gmail.com>, 
 Oliver Schramm <oliver.schramm97@gmail.com>, Adam Queler <queler@gmail.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Gabriel Santese <santesegabriel@gmail.com>, 
 Raven Black <ravenblack@gmail.com>, Radhi Bajahaw <bajahawradhi@gmail.com>, 
 Alexandru Andries <alex.andries.aa@gmail.com>, 
 Talhah Peerbhai <talhah.peerbhai@gmail.com>, 
 meowmeowbeanz <meowmeowbeanz@gmx.com>, Yuzuru10 <yuzuru_10@proton.me>, 
 keenplify <keenplify@gmail.com>, Syed Saba kareem <syed.sabakareem@amd.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260129065038.39349-1-dirk.su@canonical.com>
References: <20260129065038.39349-1-dirk.su@canonical.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add quirk for HP 200 G2a 16
Message-Id: <177012032894.85387.17295204152918099803.b4-ty@kernel.org>
Date: Tue, 03 Feb 2026 12:05:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Thu, 29 Jan 2026 14:50:19 +0800, Dirk Su wrote:
> Fix the missing mic on HP 200 G2a 16 by adding quirk with the
> board ID 8EE4
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: yc: Add quirk for HP 200 G2a 16
      commit: 611c7d2262d5645118e0b3a9a88475d35a8366f2

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

